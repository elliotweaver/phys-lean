from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=40
# new 1/cutPi 1e9 bracket
nlo=F(500000000,1570796327); nhi=F(250000000,785398163)
# parent 1/cutPi bracket (D5-next-8)
plo=F(25000000,78539817); phi=F(3125000,9817477)
print("1/cutPi nested lower (new_lo >= parent_lo):", nlo>=plo)
print("1/cutPi nested upper (new_hi <= parent_hi):", nhi<=phi)
print("1/cutPi strict:", nlo<nhi, " width", mp.nstr(mp.mpf((nhi-nlo).numerator)/(nhi-nlo).denominator,6))
# cutPi new bracket
cnlo=F(785398163,250000000); cnhi=F(1570796327,500000000)
# parent cutPi bracket [39269908/12500000, 78539817/25000000]
cplo=F(39269908,12500000); cphi=F(78539817,25000000)
print("cutPi nested lower:", cnlo>=cplo, " upper:", cnhi<=cphi)
print("cutPi = 2*lo/1e9 check: 2*1570796326/1e9 =", F(2*1570796326,10**9), "== 785398163/250000000?", F(2*1570796326,10**9)==cnlo)
print("cutPi hi 2*1570796327/1e9 =", F(2*1570796327,10**9), "== 1570796327/500000000?", F(2*1570796327,10**9)==cnhi)
# verify 1/cnhi = nlo, 1/cnlo = nhi
print("1/cutPi_hi == new_lo?", F(1)/cnhi==nlo, "  1/cutPi_lo == new_hi?", F(1)/cnlo==nhi)
