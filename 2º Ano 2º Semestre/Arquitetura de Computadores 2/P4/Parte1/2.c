//contador crescente de módulo 10 atualizadoa a 1 frequencia de 4

#include <detpic32.h>

void delay(int ms);

int main(void)
{
    
    // Configure ports
    TRISE = (TRISE & 0xFF87);
    int count = 0;
    
    while(1){
        // Toggle RE6-RE3 port value
        LATE = (LATE & 0xFF87) | count << 3;
        // Wait 0.5s
        delay(250);
        // counter
        count++;
        if (count == 10){
            count = 0;
        }
            
        
    } 
return 0;
}

//Funcao delay
void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer()<20000 * ms);
}