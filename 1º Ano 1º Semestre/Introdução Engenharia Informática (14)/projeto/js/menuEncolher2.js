
    setInterval(function (){
      const seila2 = document.getElementById('minimazorcheckpoit2');
      const seilaaa2 = seila2.getBoundingClientRect();
      const visivelounao2 = seilaaa2.top >= 0;
      localStorage.setItem("caixa2",visivelounao2);
    }, 1000);
