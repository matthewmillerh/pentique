import mysql from "mysql2";

const host = 'pentique.co.za'
const userName = 'pentique_admin'
const password = 'X:5BVLamzWD9Qd7'
const database = 'pentique_pentiquedb'

const localHost = 'localhost'
const localUserName = 'root'
const localPassword = ''
const localDatabase = 'pentiquedb'


const db = mysql.createConnection({
     host: localHost,
     user: localUserName,
     password: localPassword,
     database: localDatabase
 });

export default db;