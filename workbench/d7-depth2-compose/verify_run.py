from fractions import Fraction as F
Lm01_lo = F(815406111272,10**11); Lm01_hi = F(815406111273,10**11)
Lmb_lo = F(-40893067,10**7); Lmb_hi = F(-40893066,10**7)
Lb0_lo = F(17337287,10**7); Lb0_hi = F(17337288,10**7)
Lb2_lo = F(-10887238,10**7); Lb2_hi = F(-10887236,10**7)
k_lo = F(1250000000,3926990817)/3
k_hi = F(50000000000,157079632679)/3
base = F(2425,18)

inner_lo = 3*Lm01_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
inner_hi = 3*Lm01_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
print("inner exact:", float(inner_lo), float(inner_hi), "width", float(inner_hi-inner_lo))

INNER_LO = F(23092012,10**6); INNER_HI = F(23092014,10**6)
assert INNER_LO <= inner_lo and inner_hi <= INNER_HI
print("inner bracket [23092012/1e6, 23092014/1e6] OK")

ep_lo = base + k_lo*INNER_LO
ep_hi = base + k_hi*INNER_HI
print("endpoint from core:", float(ep_lo), float(ep_hi), "width", float(ep_hi-ep_lo))

EP_LO = F(1371723607,10**7); EP_HI = F(1371723611,10**7)   # 137.1723607 .. 137.1723611
assert EP_LO <= ep_lo, (float(EP_LO), float(ep_lo))
assert ep_hi <= EP_HI, (float(ep_hi), float(EP_HI))
print("endpoint bracket [1371723607/1e7, 1371723611/1e7] = [137.1723607, 137.1723611] OK")

# core norm_num facts
print("k_lo*INNER_LO >= EP_LO-base :", k_lo*INNER_LO >= EP_LO-base, float(k_lo*INNER_LO), float(EP_LO-base))
print("k_hi*INNER_HI <= EP_HI-base :", k_hi*INNER_HI <= EP_HI-base, float(k_hi*INNER_HI), float(EP_HI-base))
print("EP_LO > 137 :", EP_LO>137)
print()
print("7179/54 + 16/9 == 2425/18 :", F(7179,54)+F(16,9)==F(2425,18))
print("recomposedEndpointRun - recomposedEndpoint = 1/2*leptonTailScreen = 1/2*k*2*L_m01 = k*L_m01")
print("  numeric add:", float(k_lo*Lm01_lo), "..", float(k_hi*Lm01_hi))
