var express = require('express');
var mysql = require('mysql2');
var ejs = require('ejs');
var bodyParser = require('body-parser');
var expressLayouts = require('express-ejs-layouts');

var app = express();
var port = 3333;

//Datenbank Connection
var con = mysql.createConnection({
  host: "mysql",
  user: "root",
  password: "l3v3lup",
  database: "levelup"
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected to MySQL database");
});

app.use('/js', express.static(__dirname + '/js', { debug: true, 'Content-Type': 'application/javascript' })); //allow access to js files
app.use('/css', express.static(__dirname + '/css')); //allow access to css files
app.use('/assets', express.static(__dirname + '/assets')); //allow access to assets files


app.set('view engine', 'ejs');
app.use(expressLayouts); //Set layout

////Authentication implementation MVC -- made changes to the struckture. The rest of the code will be refactored at a later date.
const session = require('express-session');
const flash = require('express-flash');
const auth = require('./middleware/auth-middleware');

app.use(session({
  secret: 'AbCdEf',
  resave: false,
  saveUninitialized: true,
}));

// Parse JSON request body
app.use(express.json());
app.use(flash());

const authRoutes = require('./routes/auth-routes');
app.use('/', authRoutes);

const signupRoutes = require('./routes/signup-routes');
app.use('/', signupRoutes);

//Get Index Page before authentication and authorization
app.get('/', auth.isAuthenticated, (req, res, next) => {
  res.render('index', {pageTitle: 'Home'});
});

app.get('/signup', (req, res) => {
  res.render('signup', {pageTitle: 'Registrieren'});
})

//Get Kurse Page
app.get('/kurse', auth.isAuthenticated, (req, res, next) => {
  res.render('kurse', {pageTitle: "Kurse"});
});

//Get Profil Page
app.get('/profil', auth.isAuthenticated, (req, res, next) => {
  res.render('profil', {pageTitle: "Profil"});
});

app.get('/postsignup', (req, res) => {
  res.render('postsignup', {pageTitle: 'Registrierung bestätigen'});
});

////Authentication implementation end

//Get Highscore Page
app.get('/highscore', function (req, res) {
  var selectedKurs = req.query.sort || 'Alle'; // Get the selected Kurs from the form
  if(selectedKurs === 'Alle'){
  var userQuery = "SELECT user_id, vorname, name, COALESCE(SUM(exp), 0) AS exp " +
                "FROM levelup.benutzer " +
                "LEFT JOIN levelup.benutzer_kurs USING (user_id)" +
                "GROUP BY user_id ORDER BY exp DESC";
    }else{
      var userQuery = "SELECT user_id, vorname, name, COALESCE(SUM(exp), 0) AS exp " +
                "FROM levelup.benutzer " +
                "LEFT JOIN levelup.benutzer_kurs USING (user_id)" +
                "LEFT JOIN levelup.kurs USING (kurs_id)" +
                "WHERE bezeichnung = '" + selectedKurs +
                "' GROUP BY user_id ORDER BY exp DESC";
    }
      
      var kursQuery = "SELECT bezeichnung FROM levelup.kurs";
  
      con.query(userQuery, function (errUser, userRows) { // Datenbankabfrage Userscores
          if (errUser) throw errUser;
      
          con.query(kursQuery, function (errKurs, kursRows) { // Datenbankabfrage Kurse für Kursselect
            if (errKurs) throw errKurs;
            
            // Render the 'highscore.ejs' template with both sets of data
            res.render('highscore', { userData: userRows, kursData: kursRows, selectedKurs: selectedKurs, pageTitle: "Highscore-Board", sort: selectedKurs, loggedInUserId: req.session.user.user_id });
          });
        });
  
  });
  
  //Get Lootbox Page
  app.get('/lootbox', function(req, res) {
    //console.log(req.query.type);
    if(req.query.type){
    var itemsQuery = "SELECT * FROM item WHERE seltenheit = '" + req.query.type + "';";
    con.query(itemsQuery, function(err, items) {
      if (err) throw err;
      //console.log(items);
      res.json(items);
    });}else{
      // Access user information from the session
      const user_id = req.session.user.user_id;

      var lootboxQuery = "SELECT anzahl, seltenheit FROM lootbox_benutzer JOIN lootbox USING (lootbox_id) WHERE user_id = '" + user_id + "';";
      con.query(lootboxQuery, function(err, lootboxData) {
        if (err) throw err;
        res.render('lootbox', {pageTitle: "Lootbox", lootboxData: lootboxData});
      });

      
    }
    
    
  });

  app.get('/lootbox/open', function(req, res){
    const user_id = req.session.user.user_id;
    console.log("Open");
    var itemsQuery = "SELECT * FROM item WHERE seltenheit = '" + req.query.lootboxType + "';";
    con.query(itemsQuery, function(err, items) {
      if (err) throw err;
      var randomNumber = Math.floor(Math.random() * items.length);
      console.log(items[randomNumber].item_id);
      var removeOneLootbox = "UPDATE lootbox_benutzer JOIN lootbox USING(lootbox_id) SET anzahl = anzahl - 1 WHERE seltenheit = '" + req.query.lootboxType + "' AND user_id = '" + user_id + "'";
      con.query(removeOneLootbox, function(err, result) {if (err) throw err; console.log(result);});
      var addItem = "INSERT INTO benutzer_item (user_id, item_id, anzahl) VALUES ('" + user_id + "' ,'"+ items[randomNumber].item_id+"' , 1) ON DUPLICATE KEY UPDATE anzahl = anzahl + 1;"
      con.query(addItem, function(err, result) { if (err) throw err; console.log(result);});
      res.json(items[randomNumber]);
    });
  });
  
  //Get Inventar Page
  app.get('/inventar', function(req, res) {


    // Access user information from the session
    const user_id = req.session.user.user_id;

    const sortParam = req.query.sort || "Älteste - Neuste";
    if(sortParam == 'Seltenheit') {
      var itemQuery = "SELECT bezeichnung, beschreibung, seltenheit, anzahl " +
                      "FROM levelup.benutzer_item JOIN item USING(item_id) WHERE user_id = '"+ user_id + "' ORDER BY seltenheit;";
    }else if(sortParam == 'Name') {
      var itemQuery = "SELECT bezeichnung, beschreibung, seltenheit, anzahl " +
                      "FROM levelup.benutzer_item JOIN item USING(item_id) WHERE user_id = '"+ user_id + "' ORDER BY bezeichnung;";
    }
    else{
      var itemQuery = "SELECT bezeichnung, beschreibung, seltenheit, anzahl " +
                      "FROM levelup.benutzer_item JOIN item USING(item_id) WHERE user_id = '"+ user_id + "'";
    }
    
    con.query(itemQuery, function(err, result){
      if(err) throw err;
      res.render('inventar', {items: result, pageTitle: "Inventar", sort: sortParam});
    });
    
  });

app.listen(port, function () {
  console.log("Server is running on port " + port);
});