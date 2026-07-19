from mpmath import mp, mpf
from math import factorial
from fractions import Fraction as F
mp.dps = 90
def pE(a,N): return sum(a**i/factorial(i) for i in range(N))
def rem(a,N): return a**N/factorial(N)*(N+1)/((N+1)-a)
def f(x): return float(mp.mpf(x.numerator)/mp.mpf(x.denominator)) if isinstance(x,F) else float(x)

print("========== mass0 clean brackets (from NB11 mass0_lo_s6/hi_s6) ==========")
m0lo_s6=F(1189719085816627,500000000000000)**2
m0hi_s6=F(1189719085816629,500000000000000)**2
c0lo=F(5661726012625402,10**15); c0hi=F(5661726012625422,10**15)
print("c0lo<=m0lo_s6:", c0lo<=m0lo_s6, " m0hi_s6<=c0hi:", m0hi_s6<=c0hi)
al=F(17337287,10**7); ah=F(17337288,10**7)
print("L_b0 target [1.7337287,1.7337288]")
for N in [21,22]:
    print(f"  N={N}: lower(pE(al)+rem<=c0lo)={pE(al,N)+rem(al,N)<=c0lo}  upper(c0hi<=pE(ah))={c0hi<=pE(ah,N)}")

print("\n========== b2/mass2 sharp (from NB4 wp/wr sharp) ==========")
# wp in [137943816/1e8,137943818/1e8], wr in [53986200/1e8,53986203/1e8]
# b2 = 1 - (wp - wr)/2
b2lo=1-(F(137943818,10**8)-F(53986200,10**8))/2   # = 58021191/1e8
b2hi=1-(F(137943816,10**8)-F(53986203,10**8))/2   # = 580211935/1e9
print("b2lo =", b2lo, "=", f(b2lo), " b2hi =", b2hi, "=", f(b2hi))
m2lo=b2lo**2; m2hi=b2hi**2
print("mass2 [", f(m2lo), ",", f(m2hi), "]")
# clean mass2 brackets
c2lo=F(33664586,10**8); c2hi=F(3366459,10**7)
print("c2lo<=m2lo:", c2lo<=m2lo, " m2hi<=c2hi:", m2hi<=c2hi, " c2lo=",f(c2lo)," c2hi=",f(c2hi))
# 1/mass2 in [1/c2hi, 1/c2lo]
inv2lo=1/c2hi; inv2hi=1/c2lo
print("1/mass2 in [", f(inv2lo), ",", f(inv2hi), "]")
al2=F(10887236,10**7); ah2=F(10887238,10**7)
print("cutLog(1/mass2) target [1.0887236,1.0887238]")
for N in [14,15,16]:
    print(f"  N={N}: lower(pE(al2)+rem<=inv2lo)={pE(al2,N)+rem(al2,N)<=inv2lo}  upper(inv2hi<=pE(ah2))={inv2hi<=pE(ah2,N)}")

print("\n========== q + mbRatio sharp ==========")
qlo=F(707106781,10**9); qhi=F(707106782,10**9)
print("qlo^2<=1/2:", qlo*qlo<=F(1,2), " qhi^2>=1/2:", qhi*qhi>=F(1,2))
def mb(qq): return (1-qq)**2/(3*(1+qq))
mb_lo=mb(qhi); mb_hi=mb(qlo)
print("mbRatio [", f(mb_lo), ",", f(mb_hi), "]")
# clean mbRatio brackets
cmb_lo=F(1675084,10**8); cmb_hi=F(16750844,10**9)
print("cmb_lo<=mb_lo:", cmb_lo<=mb_lo, " mb_hi<=cmb_hi:", mb_hi<=cmb_hi, " cmb_lo=",f(cmb_lo)," cmb_hi=",f(cmb_hi))
invmb_lo=1/cmb_hi; invmb_hi=1/cmb_lo
print("1/mbRatio in [", f(invmb_lo), ",", f(invmb_hi), "]")
bl=F(40893066,10**7); bh=F(40893067,10**7)
print("cutLog(1/mbRatio) target [4.0893066,4.0893067]")
for N in [26,27,28]:
    print(f"  N={N}: lower(pE(bl)+rem<=invmb_lo)={pE(bl,N)+rem(bl,N)<=invmb_lo}  upper(invmb_hi<=pE(bh))={invmb_hi<=pE(bh,N)}")

print("\n========== ASSEMBLE ==========")
L_lo=F(815406111272,10**11); L_hi=F(815406111273,10**11)
Lmb_lo=F(-40893067,10**7); Lmb_hi=F(-40893066,10**7)
Lb0_lo=al; Lb0_hi=ah
Lb2_lo=F(-10887238,10**7); Lb2_hi=F(-10887236,10**7)
k_lo=F(1250000000,3926990817)/3; k_hi=F(50000000000,157079632679)/3
C_min=2*L_lo+F(7,3)*Lmb_lo+F(11,3)*Lb0_lo-F(5,3)*Lb2_hi
C_max=2*L_hi+F(7,3)*Lmb_hi+F(11,3)*Lb0_hi-F(5,3)*Lb2_lo
Cb_lo=F(14937951,10**6); Cb_hi=F(14937953,10**6)
print("Cb_lo<=C_min:", Cb_lo<=C_min, " C_max<=Cb_hi:", C_max<=Cb_hi)
base=F(2425,18)
ol=F(1363071880,10**7); oh=F(1363071883,10**7)
ep_lo=base+k_lo*Cb_lo; ep_hi=base+k_hi*Cb_hi
print("ep_lo=",f(ep_lo)," ep_hi=",f(ep_hi))
print("(ol-base)<=k_lo*Cb_lo:", (ol-base)<=k_lo*Cb_lo, " k_hi*Cb_hi<=(oh-base):", k_hi*Cb_hi<=(oh-base))
print("FINAL bracket [", f(ol), ",", f(oh), "] width", f(oh-ol), " oh<137:", oh<137)
