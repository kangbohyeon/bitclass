a = ord('A')
mask = 0x0F

print("%x & %x = %x" % (a, mask, a & mask))
print("%X & %X = %X" % (a, mask, a | mask))

mask = ord('a') - ord('A')

b = a ^ mask
print("%c ^ %d = %c" % (a, mask, b))
a = b ^ mask
print("%c ^ %d = %c" % (b, mask, a))
