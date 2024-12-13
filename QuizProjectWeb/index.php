<?php
session_start();

$connecterYes = isset($_SESSION['id']) ? true : false;
$theme = isset($_GET['theme']) ? $_GET['theme'] : null;

var_dump($theme);
var_dump($connecterYes);

if(isset($_POST['go']) AND $_POST['go']=='envoyer'){
    $connecterYes = false;
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
            <a href="./views/profile.html"><img id="imgProfile" src="./img/User.png" alt="ImageUser"></a>
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
                <li><a href="?theme=informatique">Informatique</a></li>
                <li><a href="?theme=musique">Musique</a></li>
                <li><a href="?theme=cultureG">Culture Générale</a></li>
                <li><a href="?theme=loisir">Loisir</a></li>
            </ul>
        </nav>
        <img src="./views/img/Bienvenue.gif" id="imageAccueil">
    </div>
    <?php endif; ?>

    <?php if ($connecterYes && $theme == "informatique"): ?>
    <div id="divInformatique">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="?theme=informatique">Informatique</a></li>
                <li><a href="?theme=cultureG">Culture Générale</a></li>
                <li><a href="?theme=loisir">Loisir</a></li>
            </ul>
        </nav>

        <div class="proposition">
            <div class="proposition1">
                <p>A. PPCoin</p>
            </div>
            <div class="proposition2">
                <p>B. RipCoin</p>
            </div>
            <div class="proposition3">
                <p>C. ConnectCoin</p>
            </div>
            <div class="proposition4">
                <p>D. DualCoin</p>
            </div>
        </div>
    </div>
    <?php endif; ?>

    <?php if ($connecterYes && $theme == "musique"): ?>
    <div id="divMusique">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="?theme=informatique">Informatique</a></li>
                <li><a href="?theme=cultureG">Culture Générale</a></li>
                <li><a href="?theme=loisir">Loisir</a></li>
            </ul>
        </nav>

        <div class="proposition">
            <div class="proposition1">
                <p>A. PPCoin</p>
            </div>
            <div class="proposition2">
                <p>B. RipCoin</p>
            </div>
            <div class="proposition3">
                <p>C. ConnectCoin</p>
            </div>
            <div class="proposition4">
                <p>D. DualCoin</p>
            </div>
        </div>
    </div>
    <?php endif; ?>

    <?php if ($connecterYes && $theme == "cultureG"): ?>
    <div id="divCultureG">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="?theme=informatique">Informatique</a></li>
                <li><a href="?theme=cultureG">Culture Générale</a></li>
                <li><a href="?theme=loisir">Loisir</a></li>
            </ul>
        </nav>

        <div class="proposition">
            <div class="proposition1">
                <p>A. PPCoin</p>
            </div>
            <div class="proposition2">
                <p>B. RipCoin</p>
            </div>
            <div class="proposition3">
                <p>C. ConnectCoin</p>
            </div>
            <div class="proposition4">
                <p>D. DualCoin</p>
            </div>
        </div>
    </div>
    <?php endif; ?>

    <?php if ($connecterYes && $theme == "loisir"): ?>
    <div id="divLoisir">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="?theme=informatique">Informatique</a></li>
                <li><a href="?theme=cultureG">Culture Générale</a></li>
                <li><a href="?theme=loisir">Loisir</a></li>
            </ul>
        </nav>

        <div class="proposition">
            <div class="proposition1">
                <p>A. PPCoin</p>
            </div>
            <div class="proposition2">
                <p>B. RipCoin</p>
            </div>
            <div class="proposition3">
                <p>C. ConnectCoin</p>
            </div>
            <div class="proposition4">
                <p>D. DualCoin</p>
            </div>
        </div>
    </div>
    <?php endif; ?>

    <?php if (!$connecterYes): ?>
    <div class="choixConnection">
        <a href="./views/login.php"><button class="btnInscriptionMain">Se Connecter</button></a>
        <a href="./views/register.php"><button class="btnInscriptionMain">S'Inscrire</button></a>
    </div>
    <?php endif; ?>

    <footer>
        <p>Made By : Julien, Rafael et Evan</p>
    </footer>
    <script src="./JS/scriptIndex.js"></script>
</body>
</html>
