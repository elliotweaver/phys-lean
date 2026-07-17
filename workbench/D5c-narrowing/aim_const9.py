import mpmath as mp
from fractions import Fraction as F
mp.mp.dps = 80
pi = mp.pi
cpi8 = mp.cos(pi/8)

def show(name, fr):
    print("%-22s = %s/%s  (~%s)" % (name, fr.numerator, fr.denominator, mp.nstr(mp.mpf(fr.numerator)/fr.denominator, 30)))

print("### LOWER-tick candidate 1570796326 ###")
ymax = F(1570796326,4*10**9)   # = 785398163/2e9
print("ymax = 1570796326/4e9 =", ymax, "=", mp.nstr(mp.mpf(ymax.numerator)/ymax.denominator,20))
print("ymax^2 =", mp.nstr(mp.mpf((ymax*ymax).numerator)/(ymax*ymax).denominator,20))
# hy2 bound B slightly above ymax^2
ymax2 = ymax*ymax
# pick B = round up to a clean rational above ymax2
B = F(1542127449, 10**10)   # 0.1542127449
print("B(hy2) =", B, "=", mp.nstr(mp.mpf(B.numerator)/B.denominator,20), " >= ymax^2?", B > ymax2, " gap=", mp.nstr(mp.mpf((B-ymax2).numerator)/(B-ymax2).denominator,6))

C = F(92387953255, 10**11)
print("C =", C, "=", mp.nstr(mp.mpf(C.numerator)/C.denominator,20))
print("  C - cos(pi/8) =", mp.nstr(mp.mpf(C.numerator)/C.denominator - cpi8, 6), " (final closure margin driver)")
cym = mp.cos(mp.mpf(ymax.numerator)/ymax.denominator)
print("  cos(ymax) - C =", mp.nstr(cym - mp.mpf(C.numerator)/C.denominator, 6), " (cert margin)")
u = 2*C*C - 1
show("u = 2C^2-1", u)
print("  u - cos(pi/4) =", mp.nstr(mp.mpf(u.numerator)/u.denominator - mp.cos(pi/4),6))
fin = 2*u*u - 1
show("2u^2-1 (final)", fin)
print("  final > 0 ?", fin>0, "  value ~", mp.nstr(mp.mpf(fin.numerator)/fin.denominator,6))
print()

print("### LOWER-tick fallback 1570796325 ###")
ymaxb = F(1570796325,4*10**9)
ymaxb2 = ymaxb*ymaxb
cymb = mp.cos(mp.mpf(ymaxb.numerator)/ymaxb.denominator)
Cb = F(9238795325, 10**10)  # 0.9238795325 -- check window
print("ymaxb =", ymaxb, " cos(ymaxb)=", mp.nstr(cymb,30))
print("window (cos pi/8, cos ymaxb) width =", mp.nstr(cymb-cpi8,6))
print("Cb candidate 0.9238795325 : > cos pi/8?", mp.mpf(Cb.numerator)/Cb.denominator > cpi8, " < cos ymaxb?", mp.mpf(Cb.numerator)/Cb.denominator < cymb)
# better Cb in the wider window: pick 92387953255/1e11 too? cos ymaxb bigger
Cb2 = F(92387953257, 10**11)
print("Cb2=0.92387953257: >cospi8?", mp.mpf(Cb2.numerator)/Cb2.denominator>cpi8," margin", mp.nstr(mp.mpf(Cb2.numerator)/Cb2.denominator-cpi8,6)," <cosymaxb?", mp.mpf(Cb2.numerator)/Cb2.denominator<cymb, " certmargin", mp.nstr(cymb-mp.mpf(Cb2.numerator)/Cb2.denominator,6))
print()

print("### UPPER sign 1570796327/1e9 at N=8 ###")
xhi = F(1570796327,10**9)
chi = mp.cos(mp.mpf(xhi.numerator)/xhi.denominator)
print("cos(xhi) =", mp.nstr(chi,6))
# partialCos_eight and cosRemBound(xhi,8)
def cosRemBound(xf, N):
    x = mp.mpf(xf.numerator)/xf.denominator
    return (x**(2*N)/mp.factorial(2*N))*(1/(1 - x**2/((2*N+1)*(2*N+2))))
print("cosRemBound(xhi,8) ~", mp.nstr(cosRemBound(xhi,8),6))
# partialCos_eight numeric (sum_{i<8} (-1)^i x^{2i}/(2i)!)
x = mp.mpf(xhi.numerator)/xhi.denominator
pc8 = sum(((-1)**i)*x**(2*i)/mp.factorial(2*i) for i in range(8))
print("partialCos(xhi,8) ~", mp.nstr(pc8,10))
print("pc8 + rem ~", mp.nstr(pc8 + cosRemBound(xhi,8),10), " (<0 ?)")
# need a clean rational upper for pc8+rem
print()
print("### CUTPI + 1/CUTPI 1e9 brackets ###")
# leastCosZero in [1570796326/1e9, 1570796327/1e9]
# cutPi = 2*leastCosZero -> [3141592652/1e9, 3141592654/1e9]
lo_pi = F(2*1570796326,10**9); hi_pi = F(2*1570796327,10**9)
show("cutPi_lo", lo_pi); show("cutPi_hi", hi_pi)
# 1/cutPi in [1/hi_pi, 1/lo_pi]
inv_lo = F(1)/hi_pi; inv_hi = F(1)/lo_pi
show("1/cutPi lo (=1/cutPi_hi)", inv_lo)
show("1/cutPi hi (=1/cutPi_lo)", inv_hi)
print("1/cutPi width ~", mp.nstr(mp.mpf((inv_hi-inv_lo).numerator)/(inv_hi-inv_lo).denominator,6))
