import numpy as np
import matplotlib.pyplot as plt

plt.figure(1)

t = np.arange(0.0, 5.0, 0.1)  # try printing t

plt.subplot(1, 2, 1)
y1 = np.exp(-t)
plt.plot(t, y1, 'g')  # try 'g' or 'bo' or 'k+'

plt.subplot(1, 1, 1)
y2 = np.cos(2 * np.pi * t)
plt.plot(t, y2, 'ro-')

plt.subplot(2, 1, 1)
y3 = y2 * y1
plt.plot(t, y3, 'go-')

plt.show()

