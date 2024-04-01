//contador crescente de módulo 10 atualizadoa a 1 frequencia de 4

#include <detpic32.h>
void delay(int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < ms*20000);
}
int main(void)
{
    unsigned char segmento;
    // Configurar as portas como outputs
    TRISB = (TRISB & 0x80FF); // 1000 0000 1111 1111
    TRISD = (TRISD & 0xFF9F); // 1111 1111 1001 1111

    // RD5 = 1, CNTL_DISP_L = 1, RD6= 0
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;
    

    while (1)
    {
        //ler um caracter do teclado que seja digitada entre 'a' e 'g'
        char c = getChar();
        if (c >= 'a' && c <= 'g')
        {
            //converter o caracter para o valor correspondente
            segmento = c - 'a';
            //enviar o valor para o display
            LATB = (LATB & 0x80FF) | (segmento << 8);
        }
    
    }
    
return 0;
}

