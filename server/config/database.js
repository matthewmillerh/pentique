import mysql from "mysql2";

const userName = 'pentique_admin'
const password = 'X:5BVLamzWD9Qd7'
const database = 'pentique_pentiquedb'

const db = mysql.createConnection({
     host:"localhost",
     user: "root",
     password: "",
     database: "pentiquedb"
 });

export default db;