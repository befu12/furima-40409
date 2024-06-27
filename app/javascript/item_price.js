window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    addTaxDom.textContent = addTax;

    const saleProfit = document.getElementById("profit");
    saleProfit.innerHTML = Math.floor(inputValue * 0.9);
    saleProfit.textContent = sale;
  });
});

window.addEventListener("turbo:render", price);