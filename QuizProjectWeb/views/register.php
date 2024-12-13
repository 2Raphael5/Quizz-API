<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "Super";
$dbname = "Quiz";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

$pseudo = filter_input(INPUT_POST, "pseudo", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
$password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$confPassword = filter_input(INPUT_POST, "confPassword", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$erreur = false;
$erreurMDP = false;
$erreurEmail = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $pseudo = trim($pseudo);
    $email = trim($email);
    $password = trim($password);
    $confPassword = trim($confPassword);

    if (empty($pseudo) || empty($email) || empty($password) || empty($confPassword)) {
        $erreur = true;
    } 
    else if ($password != $confPassword) {
        $erreurMDP = true;
    } 
    else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $erreurEmail = true;
    } 
    else {
        $stmt = $conn->prepare("SELECT * FROM User WHERE email = :email"); 
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        
        if ($stmt->rowCount() > 0) {
            echo "<p class='error'>Cet email est déjà utilisé. Veuillez en choisir un autre.</p>";
        } else {
            $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

            $stmt = $conn->prepare("INSERT INTO User (username, email, password) VALUES (:pseudo, :email, :password)");
            $stmt->bindParam(':pseudo', $pseudo);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $hashedPassword);
            $stmt->execute();
            $_SESSION['pseudo'] = $pseudo;
            $_SESSION['email'] = $email;
            $_SESSION['id'] = $id;
            header('Location: ./confiramtionInscription.php');
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
    <title>Inscription</title>
</head>
<body>
    <div class="container">
        <h1>Inscription</h1>
        <form action="#" method="post">
            <?php
            if ($erreur) {
                echo "<p class='error'>Tous les champs doivent être remplis.</p>";
            }
            if ($erreurEmail) {
                echo "<p class='error'>L'email n'est pas valide.</p>";
            }
            ?>
            <input type="text" name="pseudo" id="pseudo" placeholder="Pseudo" value="<?php echo htmlspecialchars($pseudo); ?>" required>
            <input type="email" name="email" id="email" placeholder="Email" value="<?php echo htmlspecialchars($email); ?>" required>
            
            <?php
            if ($erreurMDP) {
                echo "<p class='error'>Les mots de passe doivent être identiques.</p>";
            }
            ?>
            
            <input type="password" name="password" id="password" placeholder="Mot de passe" required>
            <input type="password" name="confPassword" id="confPassword" placeholder="Confirmer le mot de passe" required>
            <input type="submit" name="submit" id="submit" value="Confirmer">
        </form>
    </div>
</body>
</html>
