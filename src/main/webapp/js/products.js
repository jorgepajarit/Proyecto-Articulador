const btnCart = document.querySelector('.container-icon');
const containerCartProducts = document.querySelector('.container-cart-products');

btnCart.addEventListener('click', ()=>{
    containerCartProducts.classList.toggle('hidden-cart');
})

window.addEventListener("load", () => {
    const currentDate = new Date();
    document.getElementById("year").innerText = currentDate.getFullYear();
  })