<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Escuderias</title>
    <link rel="icon" href="assets/logos.png" type="image/x-icon">
    <link rel="stylesheet" href="styles/escuderias.css">
</head>
<body>
    <%@ include file ="header.jsp"  %>
<div class="escuderias__container">
    <div class="escuderias">
        <div class="escuderia">
            <div class="escuderia" onclick="playSound('../assets/audio.mp4')" id="sound">
            <a href="https://www.formula1.com/en/teams/Red-Bull-Racing.html"  target="_blank"><img src="./assets/red-bull.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Toro Rojo</h2>
                <p class="escuderia__description">Fue fundada en 2005 como una escudería "B" de la escudería Jaguar, pero al año siguiente fue comprada por la empresa de bebidas energéticas Red Bull, que le dio su nombre actual.</p>
            </div>
        </div>
    </div>

        <div class="escuderia">
        <div class="escuderia" onclick="playSound('../assets/audio.mp4')">
            <a href="https://www.formula1.com/en/teams/Mercedes.html"  target="_blank"><img src="assets/vmercedes.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Mercedes</h2>
                <p class="escuderia__description">La empresa alemana Mercedes-Benz participó inicialmente como constructor en F1 en 1954 y 1955   y volvió a hacerlo desde 2010 hasta la actualidad.</p>
            </div>
        </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/Ferrari.html"  target="_blank"><img src="./assets/ferrari.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Ferrari</h2>
                <p class="escuderia__description">Fundada en 1947 por el piloto italiano Enzo Ferrari, la escudería ha estado presente desde su primera temporada en 1950 y ha ganado numerosos títulos de constructores y pilotos a lo largo de los años</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/McLaren.html"  target="_blank"><img src="assets/claren.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">McLaren</h2>
                <p class="escuderia__description">El equipo ha ganado un total de 8 campeonatos de constructores y 12 campeonatos de pilotos, así como también 182 Grandes Premios en la máxima categoría del automovilismo.</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/Aston-Martin.html"  target="_blank"><img src="./assets/aston.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Aston Martin</h2>
                <p class="escuderia__description">Este equipo de F1 no es ajeno al éxito, ya que ganó con su forma original de Jordan y más recientemente como Racing Point en 2020.</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/Alpine.html"  target="_blank"><img src="./assets/alpine.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Alpine</h2>
                <p class="escuderia__description">Se especializa en la fabricación de autos deportivos, fue adquirida por el grupo Renault en 1973 y desde entonces ha estado vinculada a la Fórmula 1</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/Williams.html"  target="_blank"><img src="./assets/Williams.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Williams</h2>
                <p class="escuderia__description">La escudería británica ha participado en más de 700 Grandes Premios, ganando 9 campeonatos de constructores y 7 campeonatos de pilotos.</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/RB.html"  target="_blank"><img src="./assets/red-bull.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">RB</h2>
                <p class="escuderia__description">Establecido en 2006 como un equipo en el que los jóvenes pilotos del prodigioso grupo de talentos de Red Bull podían iniciarse en la F1, RB (originalmente llamado Toro Rosso y luego AlphaTauri) se formó a partir de las cenizas del valiente equipo Minardi.</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/Kick-Sauber.html"  target="_blank"><img src="assets/stake.jpg" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Patada Sauber</h2>
                <p class="escuderia__description">Después de haber disfrutado de un éxito considerable en el mundo de los autos deportivos, donde ayudó a nutrir los talentos emergentes de las futuras estrellas de la F1 Michael Schumacher y Heinz-Harald Frentzen, Peter Sauber guió a su equipo homónimo a la F1 en 1993.</p>
            </div>
        </div>

        <div class="escuderia">
            <a href="https://www.formula1.com/en/teams/Haas-F1-Team.html"  target="_blank"><img src="./assets/Haas.webp" class="escuderia__img"></a>
            <div class="escuderia__info">
                <h2 class="escuderia__name">Hass</h2>
                <p class="escuderia__description">Propiedad del empresario estadounidense Gene Haas, el equipo pretende promover la tecnología y la ingeniería estadounidenses en la Fórmula 1 de la mano del piloto danés Kevin Magnussen y su compañero Nico Hülkenberg.</p>
            </div>
        </div>

    </div>
</div>
<%@ include file ="footer.jsp"  %>
    <script src="js/escuderias.js"></script>

</body>
</html>
