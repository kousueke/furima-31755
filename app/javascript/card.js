const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = user_settlement.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = user_settlement.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy[number]"),
      exp_month: formData.get("buy[exp_month]"),
      exp_year: `20${formData.get("buy[exp_year]")}`,
      cvc: formData.get("buy[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = user_settlement.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      user_settlement.getElementById("buy_number").removeAttribute("name");
      user_settlement.getElementById("buy_exp_month").removeAttribute("name");
      user_settlement.getElementById("buy_exp_year").removeAttribute("name");
      user_settlement.getElementById("buy_cvc").removeAttribute("name");

      user_settlement.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);