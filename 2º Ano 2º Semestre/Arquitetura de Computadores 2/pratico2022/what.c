#include <detpic32.h>

volatile int temp = 0;

void configADC(){
    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4= 0; 
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1; 
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 1; 
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;
}

void configTimerT2(){
    T2CONbits.TCKPS = 2; 
    PR2 = 41665;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2;
    IEC0bits.T2IE = 1; 
    IFS0bits.T2IF = 0;
}

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer()< 20000 * ms);
}

void send2displays(unsigned char value){
    static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 
                                          0x66, 0x6D, 0x7D, 0x07, 
                                          0x7F, 0x6F, 0x77, 0x7C, 
                                          0x39, 0x5E, 0x79, 0x71};

    int flag = 0;
    int valueLow = value % 10;
    int valueHigh = value / 10;

    if(flag == 0){
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | display7Scodes[valueLow] << 8;
        flag = 0;
    }else{
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | display7Scodes[valueHigh] << 8;
        flag = 1;
    }
}

int main(void){
    configADC(); //Guiao 6

    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    
    configTimerT2(); //Guiao 8
    EnableInterrupts();

    while(1){
        AD1CON1bits.ASAM = 1; 
        while( IFS1bits.AD1IF == 0 ); 
        int i, media = 0;
        int *buf = (int *)(&ADC1BUF0);
        for (i = 0; i < 2; i++) {
            media += buf[i * 4];
        }
        media = media / 2;
        temp = ((media * 50 + 511) / 1023) + 15;
        IFS1bits.AD1IF = 0;
        delay(100);
    }

    return 0;
}

// Interrupt service routine (interrupt handler)
void _int_(8) isr_T2(void) { //8 porque?  
    send2displays(temp);
    IFS0bits.T2IF = 0;  // Reset AD1IF flag
}

// 0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
//  0     1    2    3    4    5    6    7    8   9    A    B    C     D    E    F

