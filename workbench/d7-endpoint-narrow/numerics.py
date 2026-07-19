"""
Node 4: compute achievable DEEPER brackets for L_b0, L_mb, L_b2 and the reassembled endpoint.
High-precision reference values via mpmath, matching the DERIVED definitions:
  q  = cos(pi/4) = 1/sqrt(2)
  w  = sqrt(2)
  p  = cos(2/9)                (cutCos(2/9))
  r  = sqrt(3 - 3 p^2)
  b0 = 1 + w*p/2 - ...  actually b0 = 1 + (w*p)/... let's read defs:
       from NB4: b0 = 1 - ??  Actually b0_lo_sharp = 2.379..., and wp~1.379 => b0 = 1 + wp/... 
       b0 ~ 2.3794 and wp ~ 1.3794 => b0 = 1 + wp. Hmm 1+1.3794=2.3794. YES b0 = 1 + wB*pB? 
       Wait b0_lo=237943816/1e8=2.37943816, wp_lo=137943816/1e8=1.37943816 => b0 = 1 + wp exactly.
  b1 = 1 - (wp + wr)/2   (b1_lo ~0.0403)
  b2 = 1 - (wp - wr)/2   (b2 ~0.5802)
  mass0 = b0^2, mass1=b1^2, mass2=b2^2
  mbRatioDerived = (1-q)^2/(3(1+q))
  kappa = (1/pi)/3
Endpoint = 2425/18 + kappa*(2*L_m01 + 7/3 L_mb + 11/3 L_b0 - 5/3 L_b2)
  L_m01 = cutLog(mass0/mass1), L_mb=cutLog mbRatio, L_b0=cutLog mass0, L_b2=cutLog mass2
"""
import mpmath as mp
mp.mp.dps = 60

q  = mp.cos(mp.pi/4)      # 1/sqrt2
w  = mp.sqrt(2)
p  = mp.cos(mp.mpf(2)/9)
r  = mp.sqrt(3 - 3*p*p)
wp = w*p
wr = w*r
b0 = 1 + wp
b1 = 1 - (wp + wr)/2
b2 = 1 - (wp - wr)/2
mass0 = b0*b0
mass1 = b1*b1
mass2 = b2*b2
mbR   = (1-q)**2 / (3*(1+q))
kappa = (1/mp.pi)/3

L_m01 = mp.log(mass0/mass1)
L_mb  = mp.log(mbR)
L_b0  = mp.log(mass0)
L_b2  = mp.log(mass2)

print("REFERENCE VALUES (60 dps):")
print("  wp    =", mp.nstr(wp, 40))
print("  wr    =", mp.nstr(wr, 40))
print("  b0    =", mp.nstr(b0, 40))
print("  b2    =", mp.nstr(b2, 40))
print("  mass0 =", mp.nstr(mass0, 40))
print("  mass2 =", mp.nstr(mass2, 40))
print("  mbR   =", mp.nstr(mbR, 40))
print("  kappa =", mp.nstr(kappa, 40))
print()
print("  L_b0  =", mp.nstr(L_b0, 30))
print("  L_b2  =", mp.nstr(L_b2, 30))
print("  L_mb  =", mp.nstr(L_mb, 30))
print("  L_m01 =", mp.nstr(L_m01, 30))
print()
cInner = 2*L_m01 + mp.mpf(7)/3*L_mb + mp.mpf(11)/3*L_b0 - mp.mpf(5)/3*L_b2
endpoint = mp.mpf(2425)/18 + kappa*cInner
print("  cInner   =", mp.nstr(cInner, 30))
print("  endpoint =", mp.nstr(endpoint, 30))
print()

# cutCos(2/9) remainder bounds at various split indices to pick the depth for pB
x = mp.mpf(2)/9
print("cutCos(2/9) partial-sum remainder bound (x^(2N)/(2N)!) at split index N:")
for N in range(4, 9):
    rem = x**(2*N)/mp.factorial(2*N)
    print(f"  N={N}: rem ~ {mp.nstr(rem, 4)}")
print()
# rB sensitivity: dr = -3p/r dp
dr_dp = 3*p/r
print("dr/dp =", mp.nstr(dr_dp,6), " so pB width u -> rB width ~", mp.nstr(dr_dp,4),"*u")
print("b2 = 1-(wp-wr)/2, db2 = -(w/2)(dp - dr) ~ (w/2)*dr_dp*dp dominant =", mp.nstr(w/2*dr_dp,5),"*dp")
print()
# target: edge logs to ~1e-12 (below kappa floor). b2 needs width ~1.6e-11 => dp ~ 1.6e-11/(w/2*dr_dp)
need_b2 = mp.mpf('1.6e-11')
need_dp = need_b2/(w/2*dr_dp)
print("need b2 width ~", mp.nstr(need_b2,3), "=> need pB width ~", mp.nstr(need_dp,3))
for N in range(4,9):
    rem = x**(2*N)/mp.factorial(2*N)
    ok = "OK" if 2*rem < need_dp else ""
    print(f"  cutCos split N={N}: 2*rem={mp.nstr(2*rem,3)} {ok}")
