<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "quiz";

if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

$stmt = $conn->prepare("SELECT score FROM Score INNER JOIN User ON Score.user_id = User.id WHERE User.id = :id");
$stmt->bindParam(':id', $_SESSION['id']); 
$stmt->execute();

$score = $stmt->fetch(PDO::FETCH_ASSOC)['score'] ?? 'Not available'; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styleProfile.css">
    <title>Profile Card Flip</title>
</head>
<body>
    <div class="card-container" oncontextmenu="flipCard()">
        <div class="card">
            <div class="card-front">
                <img id="imgProfileUser" src="./img/bassem.jpg" alt="Profile Picture">
                <h1><?= "@" . $_SESSION['pseudo'] ?></h1>
                <p><?= "Email: " . $_SESSION['email'] ?></p>
                <p>Langue: Français</p>
                <p><?= "Score : " . $score ?></p>

                <form action="profile.php" method="post">
                    <label for="newEmail">Changer l'email</label>
                    <input type="text" id="newEmail" name="newEmail" placeholder="Nouvel Email">

                    <label for="newMdp">Changer Mot de Passe</label>
                    <input type="password" id="newMdp" name="newMdp" placeholder="Nouveau Mot de Passe">

                    <select name="selectLangue" id="selectLangue">
                        <option value="FR">Français</option>
                        <option value="EN">English</option>
                        <option value="DE">Deutsch</option>
                        <option value="ES">Espagnol</option>
                        <option value="IT">Italien</option>
                        <option value="NL">Néerlandais</option>
                    </select>
                    <input type="submit" value="Confirmer les changements">
                </form>
            </div>
            
            <div class="card-back">
                <img src="./img/arriereCarte.png" alt="Background Image" id="backImage">
            </div>
        </div>
    </div>

    <script src="../JS/scriptProfile.js"></script>
</body>
</html>
