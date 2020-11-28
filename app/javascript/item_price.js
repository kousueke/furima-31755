window.addEventListener('load', () => {
  console.log("OK");

const priceInput = document.getElementById("item-price");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;


  const addTaxDom = document.getElementById("add-tax-price");
const fee = (inputValue * 0.1);
addTaxDom.innerHTML = Math.floor(fee);


const afterPrice = document.getElementById("profit");
const price = (inputValue - fee);
afterPrice.innerHTML = Math.floor(price);

});
});