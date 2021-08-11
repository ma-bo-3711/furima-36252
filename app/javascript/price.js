window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    const profitPrice = document.getElementById("profit");
    const valueTax = inputValue/10
    profitPrice.innerHTML = Math.round(inputValue-valueTax);
  })
  
})
