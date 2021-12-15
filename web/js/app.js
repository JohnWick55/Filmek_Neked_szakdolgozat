const navSlide = () => {
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
    const navLinks = document.querySelectorAll('.nav-links li');
    //Toggle Nav
    burger.addEventListener('click', () => {
        nav.classList.toggle('nav-active');
        //Link Animation
        navLinks.forEach((linkk, index) => {
            if (linkk.style.animation) {
                linkk.style.animation = '';
            }
            else {
                linkk.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
            }
        });
        //Burger Animation
        burger.classList.toggle('toggle');
        //Block scrolling
        if (document.body.style.overflowY != 'hidden') {
            document.body.style.overflowY = 'hidden';
        }
        else {
            document.body.style.overflowY = 'initial';
        }
    });

}
navSlide();