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
            // Ocultar todas las .circuitos-info y eliminar la clase 'no-hover'
            document.querySelectorAll('.circuitos-info').forEach(info => {
                info.classList.remove('visible');
            });
            document.querySelectorAll('.circuitos-lista li').forEach(li => {
                li.classList.remove('no-hover');
            });
            // Ocultar el fondo oscuro
            document.querySelectorAll('.overlay').forEach(fondo => {
                fondo.classList.remove('visible');
            });

            // Mostrar la información del circuito actual
            const info = circuito.querySelector('.circuitos-info');
            const fondo = document.querySelector('.overlay');
            
            if (info && fondo) {
                info.classList.add('visible');
                fondo.classList.add('visible');
                
                // Añadir la clase 'no-hover' al li actual
                circuito.classList.add('no-hover');
                
                // Botón cerrar
                const cerrar = info.querySelector('.cerrar');
                if (cerrar) {
                    cerrar.addEventListener('click', (event) => {
                        event.stopPropagation(); // Evitar la propagación del evento
                        info.classList.remove('visible');
                        fondo.classList.remove('visible');
                        // Quitar la clase 'no-hover' al li actual
                        circuito.classList.remove('no-hover');
                        circuito.classList.add('hover');
                    }, { once: true }); // Asegura que el listener se adjunte una sola vez
                }
            }
        });
    });
});


