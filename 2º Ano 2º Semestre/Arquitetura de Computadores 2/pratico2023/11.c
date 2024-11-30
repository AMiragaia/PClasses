void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer()<20000*ms);
}

void setDutyCycle(unsigned int dc){
    OC3RS = ((PR3+1) * dc)/100;


    OC2CONbits.TCKPS = 2;
    PR3 =

}
int main(void){


}


//PRESCALER =  (20 000 000 / 65356) / 120 = 2,5
// 2,5 -> 4
//