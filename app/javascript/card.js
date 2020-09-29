const pay = ()=> {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", () => {
    console.log("イベント発火");
}

window.addEventListener("load", pay);
