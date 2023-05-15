function encolherMenu1() {
    document.getElementById("encolher11").style.fontSize = "40px";
    document.getElementById("encolher12").style.fontSize = "22px";
  }

function aumentarMenu1() {
  document.getElementById("encolher11").style.fontSize = "80px";
  document.getElementById("encolher12").style.fontSize = "38px";
  }

  function encolherMenu2() {
      document.getElementById("encolher21").style.fontSize = "40px";
      document.getElementById("encolher22").style.fontSize = "22px";
    }

  function aumentarMenu2() {
    document.getElementById("encolher21").style.fontSize = "80px";
    document.getElementById("encolher22").style.fontSize = "38px";
    }
    /*
    function encolherMenu3() {
        document.getElementById("encolher31").style.fontSize = "40px";
        document.getElementById("encolher32").style.fontSize = "22px";
      }

    function aumentarMenu3() {
      document.getElementById("encolher31").style.fontSize = "80px";
      document.getElementById("encolher32").style.fontSize = "38px";
      }
      */

setInterval(function (){
  var b1 = localStorage.getItem("caixa1");
  var b2 = localStorage.getItem("caixa2");
  /*
  var b3 = localStorage.getItem("caixa3");
  */
  if(b1 == "false"){
    encolherMenu1();
  } else{
    aumentarMenu1();
  }
  if(b2 == "false"){
    encolherMenu2();
  } else{
    aumentarMenu2();
  }
  /*
  if(b3 == "false"){
    encolherMenu3();

  } else{
    aumentarMenu3();
  }
  */
  }, 1000);
