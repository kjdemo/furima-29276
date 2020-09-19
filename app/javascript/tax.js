 function price(){
   const item_price = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
   item_price.addEventListener('input', () => {
         const value = item_price.value;
         
       if (value >= 300 && value <= 9999999){
         let fee = value * 0.1
         let final_profit= value - fee
         add_tax.textContent = fee;
         profit.textContent = final_profit;
     } else {
       let fee = '-';
       let final_profit = '-';
       add_tax.textContent = fee;
       profit.textContent = final_profit;
     }
   });
  
  }
  window.addEventListener('load', price);
   //ページ読み込んだ時にpriceを発動。上に戻る。