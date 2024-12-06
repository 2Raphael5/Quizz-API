<?php
$email = filter_input(INPUT_POST,"email",FILTER_SANITIZE_EMAIL);
$password = filter_input(INPUT_POST,"password",FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$erreur = false;
$erreurMDP = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($email);
    $password = trim($password);
    
    if (empty($email) || empty($password)) {
        $erreur = true;
    }
    /*else if(regarder si le mdp et lemail correspondes a ceux dans la base de donnee){
        $erreurMDP = true;
    }*/
    else{
        header('Location: ../index.php');    
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
        if($erreurMDP){
            echo "<p class='error'>Le mot de passe ou l'email n'existe pas</p>";
        }
        ?>
        <input type="email" name="email" id="email" placeholder="Email" required>
        <input type="password" name="password" id="password" placeholder="Mot de passe" required>
        <input type="submit" name="submit" id="submit" value="Confirmer">
    </form>
    <br>
    <a href="register.php">Vous n'avez pas de compte ?</a>
    </div>

</body>
</html>