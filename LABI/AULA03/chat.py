#implemente um client de chat usando sockets para dialogar com outros clientes
from select import select
import socket
import sys
udp_s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
def main():
   while 1:
        rsocks = select([udp_s, sys.stdin,], [], [])[0]
        for r in rsocks:
            if r == udp_s:
               data, addr = udp_s.recvfrom(1024)
               print(data.decode('utf-8'))
            elif r == sys.stdin:
               data = sys.stdin.readline()
               udp_s.sendto(data.encode('utf-8'), ('localhost', 1024))
if __name__ == '__main__':
    main()
    