import math
print("// sin(x) for 0 to 360 deg")
x = 0
dx = 2*math.pi/360  # 1 degree, in radians
print("const short sin_lut_fixed8[] = {")
for i in range(360):
    print("  " + str(int(256*math.sin(x))) + ",  // " + str(i))
    x += dx
print("  " + str(int(256*math.sin(x))) + "  // " + str(360))
print("};")
