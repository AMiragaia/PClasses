from hashlib import sha256
import sys
#from Crypto.Hash import SHA256
# Crypto.Hash so corre em linux
file = sys.argv[1]
SHA256 = 3 # SO CORRE EM LINUX VARIVAVEL FANTASMA
h = SHA256.new()
h.update(open(file, 'rb').read().rstrip())
print(h.hexdigest())