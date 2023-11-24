#!/usr/local/bin/python3
import numpy as np
from math import cos, sin, pi

centerX = -118.28544689575111
centerY = 34.02061482086466

R = 36
r = 9
a = 30
N = 30000
nRevs = 24

f = open("spiro.txt", 'w')
f.write("[\n")


for t in np.arange(0.0, pi * nRevs, 0.05):
    x = ((R + r) * cos((r / R) * t) - a * cos((1 + r / R) * t)) / N + centerX
    y = ((R + r) * sin((r / R) * t) - a * sin((1 + r / R) * t)) / N + centerY

    f.write("{\n")
    f.write("\"loc\": " + "[" + str(x) + "," + str(y) + "]\n")
    f.write("},\n")

f.write("]\n")
f.close()

