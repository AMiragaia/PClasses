//Escreve e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 4 LED ligados aos portos RE5 a RE2, o valor de um contador crescente módulo 10 (valor inicial : 0).
//A frequência de atualização do contador deve depender do estado lógico do "switch" DS3 (ligado ao porto RB2):
//DS3 OFF,f=2.3Hz;DS3 ON,f=5.2Hz. 0 valor fa frequência deve ser obtido com o menor erro possível.

#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);-
}

int main() {
    TRISE = TRISE & 0xFFC3; // Configura RE5 a RE2 como saída (0s nos bits 5 a 2)  xxxx xxxx xxxx xxx and 1111 111 1100 0011 = xxxx xxxx xx 00 00xx 
    TRISB = (TRISB & 0xFFFB) | 0x0004; // Configura RB2 como entrada 

    int contador = 0; // Valor inicial do contador
    double freq;
    while(1) {
        LATE = (LATE & 0xFFC3) | (contador << 2); // Atualiza os LEDs com o valor do contador
	
        // Verifica o estado do switch DS3
        int ds3 = PORTBbits.RB2; 

        // Ajusta a frequência com base no estado do DS3
        if (ds3 == 1){
		freq = 5.2;
	}
	else{
		freq = 2.3;
	}
        double ms = 1000 / freq; // Calcula o delay necessário para a frequência

        delay((int)ms);

        contador = (contador + 1) % 10; // Incrementa o contador módulo 10
    }
}
