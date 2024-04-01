    setInterval(function (){
      const seila1 = document.getElementById('minimazorcheckpoit1');
      const seilaaa1 = seila1.getBoundingClientRect();
      const visivelounao1 = seilaaa1.top >= 0;
      localStorage.setItem("caixa1",visivelounao1);
    }, 1000);
