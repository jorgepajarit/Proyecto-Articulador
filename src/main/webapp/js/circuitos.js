//Evento el cual comienza ejecucion cuando carga el contenido
document.addEventListener('DOMContentLoaded', function () {
    const circuitos = document.querySelectorAll('#circuitos .circuitos-lista li');       
       const players = {};
       
      
    // Función que se llama cuando la API de YouTube esta lista
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
                       
        
    };

    
    
    //Ciclo para la ejecucion de cada evento ya que hay multiples li o circuitos
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
				//Muestra el overlay y la info del circuito y le quita el estilo hover a los circuitos
                info.classList.add('visible');
                fondo.classList.add('visible');
                circuito.classList.add('no-hover');
                
               //Evento click del botón cerrar
                const cerrar = info.querySelector('.cerrar');
                if (cerrar) {
                    cerrar.addEventListener('click', (event) => {
                        event.stopPropagation(); // Evitar la propagación del evento
                        
                        //Pausa los videos de Youtube usando la API de Youtube
                            const iframe = info.querySelector('iframe');
                        if (iframe && players[iframe.id] && typeof players[iframe.id].pauseVideo === 'function') {
                            players[iframe.id].pauseVideo();
                            
                        }
                         
                        //Oculta el info del circuito y el overlay
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
    
    //instancias y evento para el form de score cuando se da click en el boton stop
    const formScore = document.querySelector('.formScore');
     const fondo = document.querySelector('.overlay');
    document.getElementById('stop').addEventListener('click', () => {
        // Mostrar el formulario y el fondo oscuro
        formScore.style.display = 'block';
         fondo.classList.add('visible');
    });


if (formScore) {
        formScore.addEventListener('click', (event) => {
            event.stopPropagation();
        }, { once: true });

        // Manejador para el botón de cerrar dentro del formulario
        const cerrar = formScore.querySelector('.cerrar');
        if (cerrar) {
            cerrar.addEventListener('click', (event) => {
                event.stopPropagation(); // Evitar la propagación del evento
                
                // Ocultar el fondo oscuro y el formulario
                formScore.style.display = 'none';
                
                fondo.classList.remove('visible');
                
            });
        }
    }


     
    
});

//Función para mostrar los puntajes mas altos llamando al servlet Scores
function abrirScores() {
            
            const url = 'Scores';         
            const nombreVentana = 'Scores';
            const especificaciones = 'width=800,height=550,resizable=no,scrollbars=yes';                    
            window.open(url, nombreVentana, especificaciones);
        }
        
        
//instanciamiento de variables para el minijuego
           var segundos = 0; 
            var miliseg = 0;
            var cronometro;
      //funcion que actua comocronometro - integra al html los valores de las variables      
            function iniciarCronometro(){
                cronometro = setInterval(function(){
                    miliseg++;
                    if(miliseg >= 1000){
                        segundos++;
                    }
                    document.getElementById('cronometro').innerHTML = segundos + "." + miliseg;        
                    document.getElementById('id_score').value  = segundos + "." + miliseg; 
                }, 1);
                
            }
//Funcion para detener el cronometro
            function detenerCrono(){
                clearInterval(cronometro);
            }


