function diminuirVertical(elemento){
    var altura = parseInt(elemento.style.height,10);
    for( ; altura > 0; altura--){
    elemento.style.height = altura+"px";
    }
}
    function reporImagem(elemento){
        elemento.style.display = "block";
        elemento.style.height = "400px";
        elemento.style.width ="500px";
}