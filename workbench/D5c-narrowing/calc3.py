from mpmath import mp, mpf
mp.dps = 50
# leastCosZero bracket (this node, double-angle route)
lz_lo = mpf(15707960)/mpf('1e7')
lz_hi = mpf(15707964)/mpf('1e7')
# cutPi = 2*leastCosZero
pi_lo = 2*lz_lo   # = 3141592/1e6
pi_hi = 2*lz_hi   # = 31415928/1e7
print('cutPi bracket:', mp.nstr(pi_lo,12), mp.nstr(pi_hi,12), 'as frac:', '3141592/1000000', '31415928/10000000')
# 1/cutPi in [1/pi_hi, 1/pi_lo]
ip_lo = 1/pi_hi
ip_hi = 1/pi_lo
print('1/cutPi bracket:', mp.nstr(ip_lo,12), mp.nstr(ip_hi,12))
print('  as fractions: 10000000/31415928 =', mp.nstr(mpf(10000000)/31415928,12), ', 1000000/3141592 =', mp.nstr(mpf(1000000)/3141592,12))
print('  1/cutPi width:', mp.nstr(ip_hi-ip_lo,4))
# parent 1/cutPi width for comparison
pip_lo=mpf(500000)/1570797; pip_hi=mpf(1000000)/3141541
print('  parent 1/cutPi width:', mp.nstr(pip_hi-pip_lo,4), 'ratio improvement:', mp.nstr((pip_hi-pip_lo)/(ip_hi-ip_lo),4))
print()
# cutLog parent bracket
cl_lo=mpf(815405)/mpf('1e5'); cl_hi=mpf(815411)/mpf('1e5')
print('cutLog parent:', mp.nstr(cl_lo,8), mp.nstr(cl_hi,8),'width',mp.nstr(cl_hi-cl_lo,3))
d3 = mpf(16)/9  # (d/3) with d=16/3
# assembled bracket = 190/3 + (16/9)*cutLog*(1/cutPi)
def assembled(cl_l,cl_h,ip_l,ip_h):
    lo = mpf(190)/3 + d3*cl_l*ip_l
    hi = mpf(190)/3 + d3*cl_h*ip_h
    return lo,hi
# case A: NEW 1/cutPi, parent cutLog
loA,hiA = assembled(cl_lo,cl_hi,ip_lo,ip_hi)
print('CASE A (new 1/cutPi, parent cutLog): width', mp.nstr(hiA-loA,4))
# parent full width:
loP,hiP = assembled(cl_lo,cl_hi,pip_lo,pip_hi)
print('parent assembled width (recomputed):', mp.nstr(hiP-loP,4))
print('improvement A vs parent:', mp.nstr((hiP-loP)/(hiA-loA),4))
print()
# decompose contributions in case A:
mid_cl=(cl_lo+cl_hi)/2; mid_ip=(ip_lo+ip_hi)/2
print('contribution from cutLog width:', mp.nstr(d3*(cl_hi-cl_lo)*mid_ip,4))
print('contribution from 1/cutPi width:', mp.nstr(d3*mid_cl*(ip_hi-ip_lo),4))
