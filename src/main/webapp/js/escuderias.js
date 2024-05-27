const audio = document.getElementById('sound');

audio.addEventListener('canplaythrough', function() {
    console.log('El audio se ha cargado correctamente.');
});

audio.addEventListener('error', function() {
    console.error('Error al cargar el audio.');
});

audio.addEventListener('ended', function() {
    console.log('El audio ha terminado de reproducirse.');
});

document.querySelectorAll('.escuderia__img').forEach(img => {
    img.addEventListener('click', function() {
        audio.play();
    });
});
window.addEventListener("load", () => {
    const currentDate = new Date();
    document.getElementById("year").innerText = currentDate.getFullYear();
  })