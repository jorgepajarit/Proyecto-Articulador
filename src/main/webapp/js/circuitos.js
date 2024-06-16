function pausarYReiniciarVideo() {
    // Obtener el iframe del video
    var videoIframe = document.getElementById("videocir");
    
    if (videoIframe) {
        // Pausar el video
        videoIframe.contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
        
        // Reiniciar el video al principio
        videoIframe.contentWindow.postMessage('{"event":"command","func":"seekTo","args":[0,true]}', '*');
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const circuitos = document.querySelectorAll('#circuitos .circuitos-lista li');
    
    circuitos.forEach((circuito) => {
        circuito.addEventListener('click', () => {
            // Ocultar todas las .circuitos-info
            document.querySelectorAll('.circuitos-info').forEach(info => {
                info.style.display = 'none';
            });
            
            // Mostrar la información del circuito actual
            const info = circuito.querySelector('.circuitos-info');
            
            if (info) {
                info.style.display = 'block';
                
                // Botón cerrar
                const cerrar = info.querySelector('.cerrar');
                if (cerrar) {
                    cerrar.addEventListener('click', (event) => {
                        event.stopPropagation(); // Evitar la propagación del evento
                        pausarYReiniciarVideo();
                        info.style.display = 'none';
                    }, { once: true }); // Asegura que el listener se adjunte una sola vez
                }
            }
        });
    });
});


