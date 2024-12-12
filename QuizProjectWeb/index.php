<?php
$connecterYes = filter_input(INPUT_POST, "connecter", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$connecterYes = $connecterYes ? 'true' : 'false';
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
        <a href="./views/profile.html"><img id="imgProfile" src="./img/User.png" alt="ImageUser"></a>
        <h1>JER Quiz</h1>
        <button class="btnDeconnexion">Se Deconnecter</button>
    </header>

    <div id="divAccueil">
        <h2>Bienvenue sur notre Quiz</h2>
        <p>Veuillez choisir un theme</p>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="#divInformatique">Informatique</a></li>
                <li><a href="#divMusique">Musique</a></li>
                <li><a href="#divCultureG">Culture General</a></li>
                <li><a href="#divLoisir">Loisir</a></li>
            </ul>
        </nav>        
        <img src="./views/img/Bienvenue.gif" id="imageAccueil">
    </div>

    <div id="divInformatique">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="#divMusique">Musique</a></li>
                <li><a href="#divCultureG">Culture General</a></li>
                <li><a href="#divLoisir">Loisir</a></li>
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
    
    
    <div id="divMusique">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="#divInformatique">Informatique</a></li>
                <li><a href="#divCultureG">Culture General</a></li>
                <li><a href="#divLoisir">Loisir</a></li>
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
    
    <div id="divCultureG">
        <h2 class="question">Question : Sous quel autre nom est aussi connue des spécialistes la crypto-monnaie Peercoin ?</h2>
        <nav class="burger-menu">
            <div class="burger-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="menu">
                <li><a href="#divInformatique">Informatique</a></li>
                <li><a href="#divMusique">Musique</a></li>
                <li><a href="#divLoisir">Loisir</a></li>
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
    <div class="choixConnection">
        <a href="./views/login.php"><button class="btnInscriptionMain">Se Connecter</button></a>
        <a href="./views/register.php"><button class="btnInscriptionMain">S'Inscire</button></a>
    </div>

    <footer>
        <p>Made By : Julien, Rafael et Evan</p>
    </footer>
    <script src="./JS/scriptIndex.js"></script>
    <script>
        let connecter = <?php echo $connecterYes; ?>;
    </script>
</body>
</html>
