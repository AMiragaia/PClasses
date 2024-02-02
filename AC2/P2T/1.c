void delay(int ms){
    resetCoreTimer();
    while(resetCoreTimer() < 20000 * ms);
}


main(){
    
    int cnt1 = 0,cnt5 = 0,cnt10 = 0;
    
    while(1){
        delay(1);
        putChar('\r');

        cnt1++;
        if(cnt1 * 5 % 5 == 0){
            cnt5++;
        }
        if(cnt5 * 10 % 10 == 0){
            cnt10++;
        }

        printInt(cnt10, 10 | 5 << 16);
        putChar(' ');
        printInt(cnt5, 10 | 5 << 16);
        putChar(' ');
        printInt(cnt1, 10 | 5 << 16);
        putChar(' ');
}
 return 0;
}