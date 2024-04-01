#include <detpic32.h>
void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < ms*20000);
}
int main(void)
{
// Configure port RC14 as output
TRISCbits.TRISC14 = 0;
while(1)
{
// Wait 0.5s
// Toggle RC14 port value

delay(500);
LATCbits.LATC14 = !LATCbits.LATC14;
//LATC = LATC ^ 0x4000; //outra forma de fazer

}
return 0;
}
