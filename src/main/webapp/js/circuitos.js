function pausarYReiniciarVideo() {
    // Pausar el video
    var videoIframe = document.querySelector('.video-circuito iframe');
    videoIframe.contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
    
    // Reiniciar el video al principio
    videoIframe.contentWindow.postMessage('{"event":"command","func":"seekTo","args":[0,true]}', '*');
}


document.addEventListener('DOMContentLoaded', function () {
    const circuitos = document.querySelectorAll('#circuitos .circuitos-lista li');
    circuitos.forEach((circuito, index) => {
      circuito.addEventListener('click', () => {
        document.querySelectorAll('.circuitos-info').forEach(info => {
          info.style.display = 'none';
        });
        const info = circuito.querySelector('.circuitos-info');
        const cerrar = info.querySelector('.cerrar');

        if (info) {
          info.style.display = 'block';
        }
        cerrar.addEventListener('click', (event) => {
          event.stopPropagation(); // Evitar que se cierre al hacer clic en el botón de cerrar
          pausarYReiniciarVideo();
          info.style.display = 'none';
          
        
        });
      });
    });
  });


  window.addEventListener("load", () => {
    const currentDate = new Date();
    document.getElementById("year").innerText = currentDate.getFullYear();
  })