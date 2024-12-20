<?php
session_start();
require_once "./views/controler/data.php";
$connecterYes = isset($_SESSION['id']) ? true : false;
$theme = isset($_GET['theme']) ? $_GET['theme'] : null;
$id = filter_input(INPUT_POST,"txt",FILTER_VALIDATE_INT);
if ($id===null) {
    $id=1;
}
if ($id == 61) {
    header('Location: ./views/finquizz.php');
}

try {
    $pdo = new PDO('mysql:host=localhost;dbname=Quiz;charset=utf8', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Erreur de connexion : ' . $e->getMessage());
}

if (isset($_POST['go']) && $_POST['go'] == 'envoyer') {
    session_destroy();
    header("Location: index.php");
    exit;
}

if ($theme) {

    $question = SelectQuizz($theme,$id);
    if ($question) {

        $reponses = SelectQuestion($question);
    }
}
$theme = isset($_GET['theme']) ? $_GET['theme'] : null;

if ($theme) {

    $question = SelectQuizz($theme, $id);
    if ($question) {
        $reponses = SelectQuestion($question);
    } else {
        echo "Aucune question trouvée pour ce thème.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./views/css/styleIndex.css">
    <title>JER Quiz</title>
</head>
<body>
    <header>
        <?php if ($connecterYes): ?>
            <a href="./views/profile.php"><img id="imgProfile" src="./img/User.png" alt="ImageUser"></a>
            <h1>JER Quiz</h1>
            <form method="post">
                <button type="submit" class="btnDeconnexion" value="envoyer" name="go">Se Déconnecter</button>
            </form>
        <?php else: ?>
            <h1>JER Quiz</h1>
        <?php endif; ?>
    </header>

    <?php if ($theme == null): ?>
    <div id="divAccueil">
        <h2>Bienvenue sur notre Quiz</h2>
        <p>Veuillez choisir un thème</p>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="?theme=Microsoft">Informatique</a></li>
                <!--<li><a href="?theme=auto">Auto</a></li>-->
            </ul>
        </nav>
        <img src="./views/img/Bienvenue.gif" id="imageAccueil">
    </div>
    <?php endif; ?>

    <?php if ($connecterYes && $theme && $question): ?>
    <div id="divTheme">
        <h2 class="question"><?= $question['question_name'] ?></h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="?theme=informatique">Informatique</a></li>
                <!--<li><a href="?theme=auto">Auto</a></li>-->
            </ul>
        </nav>

        <div class="proposition">
        <div class="proposition">
        <div class="proposition">
    <?php 
    $letter = 'A';
    if ($id<=61){
    foreach ($reponses as $reponse): ?>
        <div class="proposition<?= $letter ?>" data-id="<?= $reponse['id'] ?>" data-correct="<?= $reponse['id'] == $question['reponse_id'] ? 'true' : 'false' ?>">
            <button class="answer-btn"><?= $letter ?>. <?= $reponse['name'] ?></button>
        </div>
    <?php
   
        $letter++;
    endforeach;
} 
    else{
        var_dump($id);
    }
    ?>
    <form action="" method="post">
    <input type="hidden" name="txt" id="txt" value="<?=$id?>">
            <button id="suivant">Suivant</button>
    </form>

</div>
    <?php endif; ?>

    <?php if (!$connecterYes): ?>
    <div class="choixConnection">
        <a href="./views/login.php"><button class="btnInscriptionMain">Se Connecter</button></a>
        <a href="./views/register.php"><button class="btnInscriptionMain">S'Inscrire</button></a>
    </div>
    <?php endif; ?>

    <footer>
        <p>Made By : Julien, Raphaël et Evan</p>
    </footer>
    <script src="./JS/scriptIndex.js"></script>
</body>
</html>
