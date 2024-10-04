import mysql from "mysql2";

//create connectiont to database
const db = mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "pentiquedb"
});

export default db;