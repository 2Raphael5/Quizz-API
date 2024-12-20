<?php
session_start();

$erreurMDP = false; 
$erreurEmail = false; 
$connecterYes = false;

$email = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
    $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    try {
        $conn = new PDO("mysql:host=localhost;dbname=Quiz", "root", "Super");
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


        $sql = "SELECT * FROM User WHERE email = :email";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if (password_verify($password, $user['password'])) {

                $_SESSION['id'] = $user['id'];
                $_SESSION['email'] = $user['email'];
                $connecterYes = true;
                header('Location: ../index.php');
                exit();
            } else {
                $erreurMDP = true; 
            }
        } else {
            $erreurEmail = true; 
        }
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styleRegister.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <h1>Connexion</h1>
        <form action="login.php" method="post">
            <?php
            if ($erreurMDP) {
                echo "<p class='error'>L'email ou le mot de passe est incorrect.</p>";
            }
            if ($erreurEmail) {
                echo "<p class='error'>L'email n'existe pas.</p>";
            }
            ?>
            <input type="email" name="email" id="email" placeholder="Email" value="<?php echo $email; ?>" required>
            <input type="password" name="password" id="password" placeholder="Mot de passe" required>
            <input type="submit" name="submit" id="submit" value="Se connecter">
        </form>
        <br>
        <a href="register.php">Vous n'avez pas de compte ? Inscrivez-vous ici.</a>
    </div>
</body>
</html>
