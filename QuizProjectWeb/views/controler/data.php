<?php
const DBHOST = "localhost";
const DBNAME = "Quiz";
const DBUSER = "root";
const DBPASS = "Super";
function db()
{
    static $db = null;

    if ($db === null) {
        $dsn = "mysql:host=".DBHOST.";dbname=".DBNAME.";charset=utf8";
        $db  = new PDO($dsn, DBUSER, DBPASS);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    }
    return $db;
}   

function InsertUser($pseudo,$email,$hashedPassword)
{
    $stmt = db()->prepare("INSERT INTO User (username, email, password) VALUES (:pseudo, :email, :password)");
    $stmt->bindParam(':pseudo', $pseudo);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $hashedPassword);
    $stmt->execute();
}

function SelectUser($email){
    $stmt = db()->prepare("SELECT * FROM User WHERE email = :email"); 
    $stmt->bindParam(':email', $email);
    $stmt->execute();
}