$include  <detpic32.h>

int main(void){
	//Configure Timer T3 (2 Hz with interrupts disabled)
	T2CONbits.TCKPS = 5; // 1:32 prescaler (i.e. fout_presc = 625 KHz)
	PR2 = 62499; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
	TMR2 = 0; // Clear timer T2 count register
	T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the
	// timer configuration sequence)	
	while(1){
		//Wait while T3IF = 0
		//Reset T3
		static int count=0;
		count=(count+1)%2;
		if(count=0){
			putChar('.');
		}
		IFSbits.T31F = 0;
	return 0;
}
