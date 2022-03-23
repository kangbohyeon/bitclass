aa = []
bb = []
value = 0

for i in range(0, 100) :
    aa.append(value)
    value += 2

for i in range(0, 100) :
    bb.append(aa[99 - i])

print("bb[0]에는 %d이, bb[99]에는 %d이 입력됩니다." % (bb[0], bb[99]))
