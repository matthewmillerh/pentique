import mysql from "mysql2";

//create connectiont to database
//  const db = mysql.createConnection({
//      host:"pentique.lovestoblog.com",
//      user: "if0_37444679",
//      password: "OoyV2ATMYHH2nP",
//      database: "fif0_37444679_pentique"
// });

 const db = mysql.createConnection({
     host:"localhost",
     user: "root",
     password: "",
     database: "pentiquedb"
 });

export default db;