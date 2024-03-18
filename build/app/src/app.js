var express = require('express');
var mysql = require('mysql2');
var ejs = require('ejs');
var bodyParser = require('body-parser');
var expressLayouts = require('express-ejs-layouts');
var app = express();
var port = 3333;

//Datenbank Connection
var con = mysql.createConnection({
  host: "localhost",
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

const profileRoutes = require('./routes/profile-routes');
app.use('/', auth.isAuthenticated, profileRoutes);

<<<<<<< HEAD
const coursesRoutes = require('./routes/courses-routes');
app.use('/', auth.isAuthenticated , coursesRoutes);

const singleCourseRoutes = require('./routes/single-course-routes');
app.use('/', auth.isAuthenticated , singleCourseRoutes);

=======
const homeRoutes = require('./routes/home-routes');
app.use('/', auth.isAuthenticated, homeRoutes);
>>>>>>> c9a307c (Zwischenstand: added homepage :: added welcome sec and course sec)

//Get Index Page before authentication and authorization
app.get('/', auth.isAuthenticated, (req, res, next) => {
  res.render('index', {pageTitle: 'Home'});
});

//Get Highscore Page
app.get('/highscore', auth.isAuthenticated, function (req, res) {
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
            
            res.render('highscore', { userData: userRows, kursData: kursRows, selectedKurs: selectedKurs, pageTitle: "Highscore-Board", sort: selectedKurs, loggedInUserId: req.session.user.user_id });
          });
        });
  
  });
  
  //Get Lootbox Page
  app.get('/lootbox', function(req, res) {
    if(req.query.type){
    var itemsQuery = "SELECT * FROM item JOIN lootbox USING(lootbox_id) WHERE seltenheit = '" + req.query.type + "';";
    con.query(itemsQuery, function(err, items) { //Select all items which can appear in selected lootbox
      if (err) throw err;
      res.json(items); //Send received data
    });}else{

      //Get user_id to only show lootboxes that the user owns
      const user_id = req.session.user.user_id;

      var lootboxQuery = "SELECT anzahl, seltenheit FROM lootbox_benutzer JOIN lootbox USING (lootbox_id) WHERE user_id = '" + user_id + "';";
      con.query(lootboxQuery, function(err, lootboxData) { //Get all lootboxes the user owns
        if (err) throw err;
        res.render('lootbox', {pageTitle: "Lootbox", lootboxData: lootboxData});
      });

      
    }
    
    
  });

  app.get('/lootbox/open', function(req, res){
    const user_id = req.session.user.user_id;
    var itemsQuery = "SELECT * FROM item JOIN lootbox USING(lootbox_id) WHERE seltenheit = '" + req.query.lootboxType + "';";
    con.query(itemsQuery, function(err, items) { //Get all items which can appear in the opened lootbox
      if (err) throw err;
      var randomNumber = Math.floor(Math.random() * items.length); //Get a random number to randomly select an item
      var removeOneLootbox = "UPDATE lootbox_benutzer JOIN lootbox USING(lootbox_id) SET anzahl = anzahl - 1 WHERE seltenheit = '" + req.query.lootboxType + "' AND user_id = '" + user_id + "'";
      con.query(removeOneLootbox, function(err, result) {if (err) throw err; console.log(result);}); // decrease the number of lootboxes by one
      var addItem = "INSERT INTO benutzer_item (user_id, item_id, anzahl) VALUES ('" + user_id + "' ,'"+ items[randomNumber].item_id+"' , 1) ON DUPLICATE KEY UPDATE anzahl = anzahl + 1;"
      con.query(addItem, function(err, result) { if (err) throw err; console.log(result);}); //Insert the item the user got in the db
      res.json(items[randomNumber]); //return the item the user got
    });
  });
  
 //Get Inventar Page
 app.get('/inventar', auth.isAuthenticated, function(req, res) {
  // Access user information from the session
  const user_id = req.session.user.user_id;

  const sortParam = req.query.sort || "Älteste - Neuste";
  if(sortParam == 'Seltenheit') { //change query depending on the sortParam
    var itemQuery = "SELECT bezeichnung, beschreibung, seltenheit, anzahl " +
                    "FROM benutzer_item RIGHT JOIN item USING(item_id) LEFT JOIN lootbox USING(lootbox_id) WHERE user_id = '"+ user_id + "' ORDER BY seltenheit;";
  }else if(sortParam == 'Name') {
    var itemQuery = "SELECT bezeichnung, beschreibung, seltenheit, anzahl " +
                    "FROM benutzer_item RIGHT JOIN item USING(item_id) LEFT JOIN lootbox USING(lootbox_id) WHERE user_id = '"+ user_id + "' ORDER BY bezeichnung;";
  }
  else{
    var itemQuery = "SELECT bezeichnung, beschreibung, seltenheit, anzahl " +
                    "FROM benutzer_item RIGHT JOIN item USING(item_id) LEFT JOIN lootbox USING(lootbox_id) WHERE user_id = '"+ user_id + "'";
  }
  
  con.query(itemQuery, function(err, result){ //Get all items the user owns from the database
    if(err) throw err;
    res.render('inventar', {items: result, pageTitle: "Inventar", sort: sortParam});
  });
  
});

  app.listen(port, function () {
    console.log("Server is running on port " + port);
  });

module.exports = con;