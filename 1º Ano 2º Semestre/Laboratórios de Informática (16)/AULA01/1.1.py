import hashlib
import sys

if len(sys.argv)<2:
    sys.exit(1)

f=open(sys.argv[1], "r")
h = hashlib.sha1()

for line in f:
    h.update(line.encode("utf-8"))
print(h.hexdigest())