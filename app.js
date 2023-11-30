var express = require('express');
var mysql = require('mysql');
var ejs = require('ejs');
var bodyParser = require('body-parser');
var expressLayouts = require('express-ejs-layouts')

var app = express();
var port = 3000;

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "test"
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected to MySQL database");
});

app.use(bodyParser.urlencoded({ extended: true }));
app.use('/js', express.static(__dirname + '/js'));
app.use('/css', express.static(__dirname + '/css'));
app.use('/assets', express.static(__dirname + '/assets'));


app.set('view engine', 'ejs');
app.use(expressLayouts);

//Get Index Page
app.get('/', function(req, res) {
  res.render('index', {pageTitle: "Home"});
});



//Get Kurse Page
app.get('/kurse', function(req, res) {
  res.render('kurse', {pageTitle: "Kurse"});
});

//Get Highscore Page
app.get('/highscore', function (req, res) {
  
  var selectedKurs = req.query.selectedKurs || 'Alle'; // Get the selected Kurs from the form
  if(selectedKurs === 'Alle'){
    var userQuery = "SELECT vorname, name, COALESCE(SUM(exp), 0) AS exp " +
              "FROM test.user " +
              "LEFT JOIN test.user_kurs USING (user_id)" +
              "GROUP BY user_id ORDER BY exp DESC";
  }else{
    var userQuery = "SELECT vorname, name, COALESCE(SUM(exp), 0) AS exp " +
              "FROM test.user " +
              "LEFT JOIN test.user_kurs USING (user_id)" +
              "LEFT JOIN test.kurs USING (kurs_id)" +
              "WHERE bezeichnung = '" + selectedKurs +
              "' GROUP BY user_id ORDER BY exp DESC";
  }
  

    
    var kursQuery = "SELECT bezeichnung FROM test.kurs";

    con.query(userQuery, function (errUser, userRows) { // Datenbankabfrage Userscores
        if (errUser) throw errUser;
    
        con.query(kursQuery, function (errKurs, kursRows) { // Datenbankabfrage Kurse für Kursselect
          if (errKurs) throw errKurs;
          
          // Render the 'highscore.ejs' template with both sets of data
          res.render('highscore', { userData: userRows, kursData: kursRows, selectedKurs: selectedKurs, pageTitle: "Highscore-Board"});
        });
      });

});

//Get Lootbox Page
app.get('/lootbox', function(req, res) {
  res.render('lootbox', {pageTitle: "Lootbox"});
});

//Get Inventar Page
app.get('/inventar', function(req, res) {
  res.render('inventar', {pageTitle: "Inventar"});
});

//Get Profil Page
app.get('/profil', function(req, res) {
  res.render('profil', {pageTitle: "Profil"});
});

app.listen(port, function () {
  console.log("Server is running on port " + port);
});

