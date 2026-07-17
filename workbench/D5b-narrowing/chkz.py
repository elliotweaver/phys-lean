n=15707952
print('z_lo =', n, '/1e7')
print('z_lo^2 = %d / 1e14'%(n*n))
print('as float', (n*n)/1e14)
# The parent had z_lo=15707/10000, z_lo^2 = 246709849/1e8. That's 15707^2/1e8.
# Here z_lo=15707952/1e7, z_lo^2 = 15707952^2/1e14.
print('15707952^2 =', 15707952**2)
# The hx2 bound in my file was 246739656554304/1e14 -- check:
print('my bound num:', 246739656554304, ' actual z_lo^2 num:', n*n, ' equal?', 246739656554304==n*n)
