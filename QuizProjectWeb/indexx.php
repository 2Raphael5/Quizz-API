<?php
session_start(); // Démarrer la session pour récupérer les informations de l'utilisateur
$connecter = isset($_SESSION['id']) ? true : false; // Vérifier si l'utilisateur est connecté
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
        <?php if ($connecter): ?>
            <!-- Si l'utilisateur est connecté -->
            <a href="./views/profile.php"><img id="imgProfile" src="./img/User.png" alt="ImageUser"></a>
            <h1>JER Quiz</h1>
            <button class="btnDeconnexion" id="btnDeconnexion">Se Déconnecter</button>
        <?php else: ?>
            <!-- Si l'utilisateur n'est pas connecté -->
            <h1>JER Quiz</h1>
            <a href="./views/login.php"><button class="btnConnexion">Se Connecter</button></a>
        <?php endif; ?>
    </header>

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
                <li><a href="#theme1">Informatique</a></li>
                <li><a href="#theme2">Musique</a></li>
                <li><a href="#theme3">Culture Générale</a></li>
                <li><a href="#theme4">Loisir</a></li>
            </ul>
        </nav>

        <img src="./views/img/Bienvenue.gif" id="imageAccueil" alt="Image de bienvenue">
    </div>

    <!-- Section Informatique -->
    <div id="divInformatique" class="question-section" style="display: none;">
        <h2 class="question">Question : Sous quel autre nom est aussi connue la crypto-monnaie Peercoin ?</h2>
        <div class="proposition">
            <div class="proposition1"><p>A. PPCoin</p></div>
            <div class="proposition2"><p>B. RipCoin</p></div>
            <div class="proposition3"><p>C. ConnectCoin</p></div>
            <div class="proposition4"><p>D. DualCoin</p></div>
        </div>
    </div>

    <!-- Section Musique -->
    <div id="divMusique" class="question-section" style="display: none;">
        <h2 class="question">Question : Quelle est la chanson la plus écoutée sur Spotify en 2023 ?</h2>
        <div class="proposition">
            <div class="proposition1"><p>A. Blinding Lights</p></div>
            <div class="proposition2"><p>B. Shape of You</p></div>
            <div class="proposition3"><p>C. Levitating</p></div>
            <div class="proposition4"><p>D. As It Was</p></div>
        </div>
    </div>

    <!-- Section Culture Générale -->
    <div id="divCultureG" class="question-section" style="display: none;">
        <h2 class="question">Question : Quel est le plus grand océan du monde ?</h2>
        <div class="proposition">
            <div class="proposition1"><p>A. Océan Atlantique</p></div>
            <div class="proposition2"><p>B. Océan Pacifique</p></div>
            <div class="proposition3"><p>C. Océan Indien</p></div>
            <div class="proposition4"><p>D. Océan Arctique</p></div>
        </div>
    </div>

    <!-- Section Loisir -->
    <div id="divLoisir" class="question-section" style="display: none;">
        <h2 class="question">Question : Quel sport est pratiqué lors des Jeux Olympiques d'hiver ?</h2>
        <div class="proposition">
            <div class="proposition1"><p>A. Football</p></div>
            <div class="proposition2"><p>B. Ski alpin</p></div>
            <div class="proposition3"><p>C. Rugby</p></div>
            <div class="proposition4"><p>D. Tennis</p></div>
        </div>
    </div>

    <footer>
        <p>Made By : Julien, Rafael et Evan</p>
    </footer>

    <script src="./JS/scriptIndex.js"></script>
    <script>
        // Si l'utilisateur n'est pas connecté, on cache les sections de quiz et on affiche les boutons de connexion
        if (!<?php echo json_encode($connecter); ?>) {
            document.querySelectorAll('.question-section').forEach(function(section) {
                section.style.display = 'none'; // Cacher toutes les sections de quiz
            });
        }

        // Fonction pour afficher les sections de quiz en fonction du menu
        document.querySelectorAll(".menu a").forEach(function(link) {
            link.addEventListener('click', function(e) {
                e.preventDefault(); // Empêcher le comportement par défaut de l'ancre

                // Cacher toutes les sections de quiz
                document.querySelectorAll('.question-section').forEach(function(section) {
                    section.style.display = 'none';
                });

                // Afficher la section cible
                const targetId = link.getAttribute('href').substring(1); // Récupère l'id du lien (ex. "theme1")
                const targetDiv = document.getElementById('div' + targetId);
                if (targetDiv) {
                    targetDiv.style.display = 'block';
                }
            });
        });

        // Gérer la déconnexion
        document.getElementById('btnDeconnexion')?.addEventListener('click', function() {
            // Détruire la session pour déconnecter l'utilisateur
            <?php
            session_unset();
            session_destroy();
            ?>
            // Rediriger vers la page d'accueil après la déconnexion
            window.location.href = './index.php';
        });
    </script>
</body>
</html>
