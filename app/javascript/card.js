const pay = () => {
  // Payjp.setPublicKey('pk_test_52cc3638f85dd4c8d6091fe4');
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  console.log(Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY))
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy[credit]"),
      cvc: formData.get("buy[cvc]"),
      exp_month: formData.get("buy[exp_month]"),
      exp_year: `20${formData.get("buy[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};

window.addEventListener("load", pay);
