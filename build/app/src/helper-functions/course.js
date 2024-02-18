const mysql = require('mysql2');
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "l3v3lup",
  database: "levelup"
});


function get_current_course_ids(current_user_id) {
  let benutzer_kurs_query = `SELECT kurs_id FROM levelup.benutzer_kurs WHERE user_id = ${current_user_id};`;
  return new Promise((resolve, reject) => {
    con.query(benutzer_kurs_query, (err, result) => {
      if (err) {
        reject(err);
      }
      else {
        resolve(result);
      }
    });
  });
}
      
function get_current_courses(kurs_ids) {
    let ids_prepare_sql = [];
        kurs_ids.forEach(element => {
          ids_prepare_sql.push(element.kurs_id);
        });
    var kursQuery = mysql.format("SELECT * FROM levelup.kurs WHERE kurs_id IN (?)", [ids_prepare_sql]);
    return new Promise((resolve, reject) => {
      con.query(kursQuery, (err, result) => {
        if (err) {
          reject(err);
        }
        else {
          resolve(result);
        }
      });
    });
  }

module.exports = { get_current_course_ids, get_current_courses };