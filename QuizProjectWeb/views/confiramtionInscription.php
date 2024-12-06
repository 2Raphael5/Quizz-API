<?php
$pseudo = filter_input(INPUT_POST,"pseudo",FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$email = filter_input(INPUT_POST,"email",FILTER_SANITIZE_EMAIL);
$password = filter_input(INPUT_POST,"password",FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$confPassword = filter_input(INPUT_POST,"confPassword",FILTER_SANITIZE_FULL_SPECIAL_CHARS);



//Mettre l'integration des donnees dans la base de donnes 

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
        <h1>Confirmer</h1>
        <p>Merci de votre Inscription</p><br>
        <form action="../index.html">
            <input type="hidden" value="connecterYes" name="connecter">
            <input type="submit" name="submit" id="submit" value="Jouer">
        </form>
    </div>
</body>
</html>
