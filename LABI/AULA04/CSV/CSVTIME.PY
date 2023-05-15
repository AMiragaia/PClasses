#Construa um programa que registe o tempo em segundos 
#o numero de octetos enviados e recebidos para o processador.
#o programa deve executar apenas 60 segundos capturando os valores por segundo
import time
import psutil
import csv
def main():
    fout = open("csvtime.csv", "w")
    writer = csv.DictWriter(fout, fieldnames=["time", "value", "unit"])
    writer.writeheader()
    for i in range(60):
        writer.writerow({"time": i, "value" : psutil.net_io_counters().bytes_sent, "unit" : psutil.cpu_percent(interval=1)})
        time.sleep(1)

    fout.close()
main()
