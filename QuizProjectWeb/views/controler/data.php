<?php
const DBHOST = "localhost";
const DBNAME = "Quiz";
const DBUSER = "root";
const DBPASS = "";
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

function InsertUser($pseudo, $email, $hashedPassword)
{
    $stmt = db()->prepare("INSERT INTO User (username, email, password, createdAt) VALUES (:pseudo, :email, :password, NOW())");
    $stmt->bindParam(':pseudo', $pseudo);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $hashedPassword);
    $stmt->execute();
}

function SelectUser($email) {
    $stmt = db()->prepare("SELECT * FROM User WHERE email = :email");
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt;
}

function SelectQuizz($theme,$id){
    $stmt = db()->prepare("
    SELECT q.id as question_id, q.name as question_name, q.reponse_id 
    FROM Question q 
    JOIN Quiz quiz ON quiz.id = q.quiz_id 
    JOIN Theme t ON t.id = quiz.theme_id
    WHERE t.name = :theme
    AND quiz.id = :quizId;
    ");
    $stmt->execute(['theme' => $theme , 'quizId' => $id]);
    $question = $stmt->fetch(PDO::FETCH_ASSOC);

    return $question;
}

function SelectQuestion($question){
    $stmt_answers = db()->prepare("SELECT p.id, p.name FROM Proposition p WHERE p.question_id = :question_id");
    $stmt_answers->execute(['question_id' => $question['question_id']]);
    $reponses = $stmt_answers->fetchAll(PDO::FETCH_ASSOC);
    return $reponses;
}