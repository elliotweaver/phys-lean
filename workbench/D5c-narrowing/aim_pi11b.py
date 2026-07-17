from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 90
# --- LOWER endpoint 1e11 grid ---
Nlo = 157079632679
print("Nlo =", Nlo)
print("Nlo^2 =", Nlo*Nlo)
# y_max = Nlo/4e11 ; y_max^2 = Nlo^2 / (4e11)^2 = Nlo^2/1.6e23
den_ymax_sq = (4*10**11)**2   # 1.6e23
print("(4e11)^2 =", den_ymax_sq)
Bsq = F(Nlo*Nlo, den_ymax_sq)
print("B_sq = Nlo^2 / 1.6e23 =", Bsq.numerator, "/", Bsq.denominator, " ~", float(Bsq))
# reduce
print("B_sq reduced =", Bsq)
# --- threshold C ---
C = F(9238795325115, 10**13)
print()
print("C =", C, "=", float(C))
Csq = C*C
print("C^2 =", Csq.numerator,"/",Csq.denominator, " ~", float(Csq))
Cu = 2*Csq - 1   # = 2C^2 - 1
print("Cu = 2C^2-1 =", Cu.numerator,"/",Cu.denominator, " ~", float(Cu))
closure = 2*Cu*Cu - 1
print("closure 2Cu^2-1 =", float(closure), " >0 ?", closure>0)
print("closure exact num/den =", closure.numerator,"/",closure.denominator)
print()
# sanity: cos(pi/8) < C < cos(y_max)
pi = mp.pi
cpi8 = mp.cos(pi/8); cym = mp.cos(mp.mpf(Nlo)/(4*mp.mpf(10)**11))
print("cos(pi/8) < C ?", cpi8 < float(C), "  C < cos(ymax) ?", float(C) < cym)
print("near-pi8 room cos(ymax)-C =", mp.nstr(cym-float(C),6))
print()
# For hu step: parent writes Cu as num/den with den=2e22 style. Let's give Cu in lowest terms.
# Also produce the '2*c*c-1' comparison literal. Cu as fraction over its own denominator:
print("Cu numerator (lowest):", Cu.numerator)
print("Cu denominator (lowest):", Cu.denominator)
# Also the husq literal Cu*Cu:
Cu2 = Cu*Cu
print("Cu^2 =", Cu2.numerator,"/",Cu2.denominator)
