<?php
$pseudo = filter_input(INPUT_POST,"pseudo",FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$email = filter_input(INPUT_POST,"email",FILTER_SANITIZE_EMAIL);
$password = filter_input(INPUT_POST,"password",FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$confPassword = filter_input(INPUT_POST,"confPassword",FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$erreur = false;
$erreurMDP = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $pseudo = trim($pseudo);
    $email = trim($email);
    $password = trim($password);
    $confPassword = trim($confPassword);
    
    if (empty($pseudo) || empty($email) || empty($password) || empty($confPassword)) {
        $erreur = true;
    }
    else if($password != $confPassword){
        $erreurMDP = true;
    }
    else{
        header('Location: ./confiramtionInscription.php');    
        $erreur = false;
        $erreurMDP = false;
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styleRegister.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
    <h1>Inscription</h1>
    <form action="./register.php" method="post">
        <?php
        if($erreur){
            echo "<p class='error'>Tout les champs doivent etre remplie</p>";
        }
        ?>
        <input type="text" name="pseudo" id="pseudo" placeholder="Pseudo" required>
        <input type="email" name="email" id="email" placeholder="Email" required>
        <?php
        if($erreurMDP){
            echo "<p class='error'>Les mots de passe doivent etre identique</p>";
        }
        ?>
        <input type="password" name="password" id="password" placeholder="Mot de passe" required>
        <input type="password" name="confPassword" id="confPassword" placeholder="Confirmer le mot de passe" required>
        <input type="submit" name="submit" id="submit" value="Confirmer">
    </form>
    </div>
</body>
</html>