let btnsChoix = document.querySelectorAll(".proposition div");
let btnsConnexion = document.querySelectorAll(".choixConnection button");
let titreQuestion = document.querySelector(".question");
let imgProfile = document.querySelector("#imgProfile");
let btnDeconnexion = document.querySelector(".btnDeconnexion");
const burgerIcon = document.querySelector('.burger-icon');
const menu = document.querySelector('.menu');
let imgAccueil = document.querySelector('#imageAccueil');
let divAccueil = document.querySelector("#divAccueil");
let divInformatique = document.querySelector("#divInformatique");
let divMusique = document.querySelector("#divMusique");
let divCultureG = document.querySelector("#divCultureG");
let divLoisir = document.querySelector("#divLoisir");

divInformatique.style.display = "none";
divMusique.style.display = "none";
divCultureG.style.display = "none";
divLoisir.style.display = "none";

divAccueil.style.display = "block";

if (!connecter) {
    titreQuestion.style.display = "none";
    burgerIcon.style.display = "none";
    imgProfile.style.display = "none";
    btnDeconnexion.style.display = "none";

    btnsChoix.forEach(element => {
        element.style.display = "none";
    });

    btnsConnexion.forEach(element => {
        element.style.display = "block";
    });
} else {
    titreQuestion.style.display = "block";
    burgerIcon.style.display = "block";
    imgProfile.style.display = "block";
    btnDeconnexion.style.display = "block";

    btnsChoix.forEach(element => {
        element.style.display = "block";
    });

    btnsConnexion.forEach(element => {
        element.style.display = "none";
    }
)}

burgerIcon.addEventListener('click', () => {
    menu.classList.toggle('open');
    burgerIcon.classList.toggle('active');
});

btnDeconnexion.addEventListener('click', () => {
    connecter = false;
    console.log("connecter : " + connecter);

    titreQuestion.style.display = "none";
    burgerIcon.style.display = "none";
    imgProfile.style.display = "none";
    btnDeconnexion.style.display = "none";

    btnsChoix.forEach(element => {
        element.style.display = "none";
    });

    btnsConnexion.forEach(element => {
        element.style.display = "block";
    });

    divInformatique.style.display = "none";
    divMusique.style.display = "none";
    divCultureG.style.display = "none";
    divLoisir.style.display = "none";
    divAccueil.style.display = "block";
});

document.querySelectorAll(".menu a").forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();

       
        divInformatique.style.display = "none";
        divMusique.style.display = "none";
        divCultureG.style.display = "none";
        divLoisir.style.display = "none";
        divAccueil.style.display = "none"; 

        if (connecter) {
            const targetDiv = document.querySelector(link.getAttribute("href"));
            if (targetDiv) {
                targetDiv.style.display = "block"; 
            }
        }
    });
});
