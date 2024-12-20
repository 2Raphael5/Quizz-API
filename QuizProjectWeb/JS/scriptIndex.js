const burgerIcon = document.querySelector('.burger-icon');
const menu = document.querySelector('.menu');

burgerIcon.addEventListener('click', () => {
    menu.classList.toggle('open');
    burgerIcon.classList.toggle('active');
});

document.addEventListener('DOMContentLoaded', function() {

    const answerButtons = document.querySelectorAll('.answer-btn');

    answerButtons.forEach(button => {
        button.addEventListener('click', function() {

            const parentDiv = button.parentElement;

            const isCorrect = parentDiv.getAttribute('data-correct') === 'true';

            if (isCorrect) {
                button.style.backgroundColor = 'green';
                button.style.color = 'white'; 
                button.innerHTML += ' - Correct!';
            } else {
                button.style.backgroundColor = 'red'; 
                button.style.color = 'white';
                button.innerHTML += ' - Incorrect!';
            }
            answerButtons.forEach(btn => {
                btn.disabled = true;
            });
        });
    });
});
