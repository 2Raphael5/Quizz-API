let btnsChoix = document.querySelectorAll(".proposition div");
let btnsConnexion = document.querySelectorAll(".choixConnection button");
let titreQuestion = document.querySelector(".question");
let imgProfile = document.querySelector("#imgProfile");
let btnDeconnexion = document.querySelector(".btnDeconnexion");
let connecter = false;
const burgerIcon = document.querySelector('.burger-icon');
const menu = document.querySelector('.menu');

burgerIcon.addEventListener('click', () => {
    menu.classList.toggle('open');
    burgerIcon.classList.toggle('active');
});

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
    });
}
