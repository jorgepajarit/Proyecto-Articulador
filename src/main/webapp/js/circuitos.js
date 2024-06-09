document.addEventListener('DOMContentLoaded', function () {
    const circuitos = document.querySelectorAll('#circuitos .circuitos-lista li');
    circuitos.forEach((circuito, index) => {
        circuito.addEventListener('click', () => {
            document.querySelectorAll('.circuitos-info').forEach(info => {
                info.style.display = 'none';
            });
            const info = circuito.querySelector('.circuitos-info');

            if (info) {
                info.style.display = 'block';
            }
        });
    });

    // Agregar evento de clic para cerrar dentro del ciclo de circuitos
    const cerrarBotones = document.querySelectorAll('#cerrar');
    cerrarBotones.forEach((cerrar) => {
        cerrar.addEventListener('click', () => {
            cerrar.stopPropagation();
            pausarYReiniciarVideo();
            const circuitoInfo = cerrar.closest('.circuitos-info');
            circuitoInfo.style.display = 'none';
        });
    });
});

function pausarYReiniciarVideo() {
    // Obtener el elemento de video dentro del iframe
    var video = document.querySelector('.video-circuito iframe').contentDocument.querySelector('video');

    // Verificar si se encontró el elemento de video
    if (video) {
        // Pausar el video
        video.pause();
        // Reiniciar el video al principio
        video.currentTime = 0;
    }
}

window.addEventListener("load", () => {
    const currentDate = new Date();
    document.getElementById("year").innerText = currentDate.getFullYear();
});
