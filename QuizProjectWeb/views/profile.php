<?php
session_start();
require_once("./controler/data.php");


if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}


$stmt = db()->prepare("SELECT score FROM Score INNER JOIN User ON Score.user_id = User.id WHERE User.id = :id");
$stmt->bindParam(':id', $_SESSION['id']); 
$stmt->execute();
$score = $stmt->fetch(PDO::FETCH_ASSOC)['score'] ?? 'Not available'; 


$stmt = db()->prepare("SELECT username FROM User WHERE email = :email");
$stmt->bindParam(':email', $_SESSION['email']); 
$stmt->execute();
$username = $stmt->fetch(PDO::FETCH_ASSOC)['username'] ?? 'Not available'; 


if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (!empty($_POST['newEmail'])) {
        $newEmail = filter_input(INPUT_POST, "newEmail", FILTER_SANITIZE_EMAIL);
        $updateEmail = db()->prepare("UPDATE User SET email = :email WHERE id = :id");
        $updateEmail->bindParam(':email', $newEmail);
        $updateEmail->bindParam(':id', $_SESSION['id']);
        $updateEmail->execute();
        $_SESSION['email'] = $newEmail;
    }

    if (!empty($_POST['newMdp'])) {
        $newMdp = password_hash($_POST['newMdp'], PASSWORD_DEFAULT);
        $updateMdp = db()->prepare("UPDATE User SET password = :password WHERE id = :id");
        $updateMdp->bindParam(':password', $newMdp);
        $updateMdp->bindParam(':id', $_SESSION['id']);
        $updateMdp->execute();
    }
}
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
                <h1><?= isset($username) ? "@" . $username : "Username not available" ?></h1>
                <p><?= "Email: " . $_SESSION['email'] ?></p>
                <p>Langue: Français</p>
                <p><?= "Score : " . $score ?></p>

                <form action="profile.php" method="post">
                    <label for="newEmail">Changer l'email</label>
                    <input type="email" id="newEmail" name="newEmail" placeholder="Nouvel Email">

                    <label for="newMdp">Changer Mot de Passe</label>
                    <input type="password" id="newMdp" name="newMdp" placeholder="Nouveau Mot de Passe">

                    <input type="submit" value="Confirmer les changements">
                </form>
    <br>
                <a href="../index.php"><button>Retour</button></a>
            </div>
            
            <div class="card-back">
                <img src="./img/arriereCarte.png" alt="Background Image" id="backImage">
            </div>
        </div>
    </div>

    <script src="../JS/scriptProfile.js"></script>
</body>
</html>
