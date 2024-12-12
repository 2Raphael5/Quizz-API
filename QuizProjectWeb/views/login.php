<?php
$servername = "localhost";
$username = "root";
$password = "Super";

try {
  $conn = new PDO("mysql:host=$servername;dbname=quiz", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

$email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
$password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$erreur = false;
$erreurMDP = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($email);
    $password = trim($password);
    
    if (empty($email) || empty($password)) {
        $erreur = true;
    } else {
        $sql = "SELECT * FROM users WHERE email = :email";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();
        
        if ($stmt->rowCount() > 0) {
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if (password_verify($password, $user['password'])) {
                header('Location: ../index.php');
                exit();
            } else {
                $erreurMDP = true;
            }
        } else {
            header('Location: register.php'); 
            exit();
        }
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