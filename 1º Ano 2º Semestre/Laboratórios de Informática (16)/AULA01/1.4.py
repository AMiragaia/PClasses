import os.path
import sys
#from Crypto.Cipher import ARC4
#from Crypto.Cipher import SHA256
SHA256 = 1 #variavélfantasma
ARC4 = 1 #variavél fantasma
if len(sys.argv) < 3:
    print("Usage: " + sys.argv[0] + " file key")
    quit()

fname = sys.argv[1]
if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
    print(fname + " cannot be encrypted or decrypted", file=sys.stderr)
    quit()
    
if len(sys.argv[2]) < 5:
    h = SHA256.new()
    h.update( sys.argv[2].encode("utf-8"))
    key = h.digest()
else:
    key = sys.agrv[2][0:256]

cipher = ARC4.new(key)

f = open(fname, "rb")

block = f.read(1024)
while len(block) > 0:
    cryptogram = cipher.encrypt(block)
    os.write(1, cryptogram)
    block = f.read(1024)

f.close()