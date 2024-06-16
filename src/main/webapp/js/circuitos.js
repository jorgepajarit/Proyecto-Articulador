document.addEventListener('DOMContentLoaded', function () {
    const circuitos = document.querySelectorAll('#circuitos .circuitos-lista li');       
       const players = {};
      
    // Función que se llama cuando la API de YouTube está lista
  window.onYouTubeIframeAPIReady = function () {
        // Crear instancias de reproductores para cada iframe
        players['sakhir'] = new YT.Player('sakhir');
        players['jeddah'] = new YT.Player('jeddah');
        players['suzuka'] = new YT.Player('suzuka');
        players['shanghai'] = new YT.Player('shanghai');
        players['hard'] = new YT.Player('hard');
        players['imola'] = new YT.Player('imola');
        players['montecarlo'] = new YT.Player('montecarlo');
        players['barcelona'] = new YT.Player('barcelona');
        players['silverstone'] = new YT.Player('silverstone');
                       
        // Agrega más instancias según sea necesario para otros iframes
    };

    
    
    
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

            // Mostrar circuito actual
            const info = circuito.querySelector('.circuitos-info');
            const fondo = document.querySelector('.overlay');
            
            if (info && fondo) {
                info.classList.add('visible');
                fondo.classList.add('visible');
                circuito.classList.add('no-hover');
                
               
                const cerrar = info.querySelector('.cerrar');
                if (cerrar) {
                    cerrar.addEventListener('click', (event) => {
                        event.stopPropagation(); // Evitar la propagación del evento
                        
                                  const iframe = info.querySelector('iframe');
                        if (iframe && players[iframe.id] && typeof players[iframe.id].pauseVideo === 'function') {
                            players[iframe.id].pauseVideo();
                            
                        }
                                                 
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


