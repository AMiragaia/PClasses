from email.utils import localtime
from os import R_OK
import time

def hours(t):
    h = t / 3600
    
    return h

def days(h):
    d = hours(h / 24)
    return d
    

def minutes(t):
    m = t / (60)
    return m
    

def seconds(t):
    s = t 
    return s

 
def main():
    print("Desde o inicio passaram",days(time.time()), "dias")
    print("Desde o inicio passaram",hours(time.time()), "horas")
    print("Desde o inicio passaram",minutes(time.time()) , "minutos")
    print("Desde o inicio passaram",seconds(time.time()), "segundos")
    

main()

    
