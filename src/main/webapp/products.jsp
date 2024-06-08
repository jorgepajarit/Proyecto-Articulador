<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/styleProducts.css" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <title>Tienda</title>
  </head>

  <body>
 <%@ include file ="header.jsp"  %>

    <h1>Tienda de Productos</h1>

    <div class="container-list">
      <ul class="title-list">
        <li><a id="ferrari" href="">Ferrari</a></li>
        <li><a id="mercedes" href="">Mercedes-AMG</a></li>
        <li><a id="redbull" href="">RedBull Racing</a></li>
        <li><a id="williams" href="">Williams Racing</a></li>
        <li><a id="hass" href="">Haas F1</a></li>
        <li><a id="stake" href="">Stake</a></li>
      </ul>
    </div>

    <div class="container-icon">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        stroke-width="1.5"
        stroke="currentColor"
        class="icon-cart"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"
        />
      </svg>
      <!-- contador de productos -->
      <div class="count-products">
        <span id="cont-products">0</span>
      </div>

      <div class="container-cart-products hidden-cart">
        <div class="cart-product">
          <div class="info-cart-product">
            <span class="cant-prod-cart">1</span>
            <p class="title-product-cart">Prueba</p>
            <span class="price-product-cart">800</span>
          </div>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="icon-close"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </div>
      <div class="cart-total">
        <h3>Total</h3>
        <span class="total">$200</span>
      </div>
    </div>

    <div class="container-items">
      <div class="item">
        <figure>
          <img src="assets/img/buso-ferrari.png" alt="Buso ferrari" />
        </figure>
        <div class="info-product">
          <hr>
          <h2>Chaqueta escuderia ferrari</h2>
          <p class="price">Precio: 180 Cop</p>
          <button>Añadir al carro</button>
        </div>
      </div>
      <div class="item">
        <figure>
          <img src="assets/img/buso-ferrari2.jpg" alt="Buso ferrari" />
        </figure>
        <div class="info-product">
          <hr>
          <h2>Buso ferrari negro</h2>
          <p class="price">Precio: 120 Cop</p>
          <button>Añadir al carro</button>
        </div>
      </div>
      <div class="item">
        <figure>
          <img src="assets/img/gorra-ferrari.jpg" alt="Buso ferrari" />
        </figure>
        <div class="info-product">
          <hr>
          <h2>Gorra escuderia ferrari</h2>
          <p class="price">Precio: 90 Cop</p>
          <button>Añadir al carro</button>
        </div>
      </div>
      <div class="item">
        <figure>
          <img src="assets/img/reloj-ferrari.jpg" alt="Buso ferrari" />
        </figure>
        <div class="info-product">
          <hr>
          <h2>Reloj escuderia ferrari</h2>
          <p class="price">Precio: 500 Cop</p>
          <button>Añadir al carro</button>
        </div>
      </div>
      <div class="item">
        <figure>
          <img src="assets/img/reloj-hublot-ferrari.jpg" alt="Buso ferrari" />
        </figure>
        <div class="info-product">
          <hr>
          <h2>Reloj hublot ferrari</h2>
          <p class="price">Precio: 700 Cop</p>
          <button>Añadir al carro</button>
        </div>
      </div>
      <div class="item">
        <figure>
          <img src="assets/img/reloj-pilotta-ferrari.jpg" alt="Buso ferrari" />
        </figure>
        <div class="info-product">
          <hr>
          <h2>Reloj pilota ferrari</h2>
          <p class="price">Precio: 600 Cop</p>
          <button>Añadir al carro</button>
        </div>
      </div>
    </div>
  <%@ include file ="footer.jsp"  %>
  <script src="js/products.js"></script>
</body>
</html>
