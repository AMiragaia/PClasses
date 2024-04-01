#include <detpic32.h>

void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer()<20000* ms);
}

int main()
{
    TRISE=TRISE & 0xFFE0;
    TRISB=(TRISB & 0xFFFB) | 0x0004;

    static double freq=7;

    unsigned int padrao=0b000001;

    while(1)
    {
        LATE=(LATE & 0xFFE0) | padrao;
        padrao=padrao<<1;

        if(padrao==0b100000)
        {
            padrao=0b000001;
        }

        int ds3=PORTBbits.RB2;

        if (ds3==1){
            freq=7;
        }else{
            freq=3;
        }

        double ms = (1000 / freq);

        delay((int)ms);
    }


}
