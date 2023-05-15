import time
import psutil
import json
def main():
    data = []
    for i in range(3):
        time.sleep(1)
        data.append({"time": i, "name": "cpu", "value": psutil.cpu_percent(interval=1), "value2": psutil.net_io_counters().bytes_sent, "value3": psutil.net_io_counters().bytes_recv})
        
    with open('data.json', 'w') as f:
        json.dump(data, f, indent=4)

main()

