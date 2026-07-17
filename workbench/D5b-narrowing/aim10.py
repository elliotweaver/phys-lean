from fractions import Fraction as F
import math

# EXISTING banked cutCos(2/9) bounds (no new series work):
head = F(19199,19683)
tail = F(56,334512585)
pLo_raw = head - tail
pHi_raw = head + tail
print("raw p bounds:", float(pLo_raw), float(pHi_raw), "width", float(pHi_raw-pLo_raw))

# Clean rational p bracket nested inside raw, containing true p
pLo = F(97541008,10**8)
pHi = F(97541043,10**8)
print("pLo<=raw?", pLo<=pLo_raw, " pHi>=raw?", pHi>=pHi_raw, " p width", float(pHi-pLo))

# sqrt2 tighten
wLo = F(141421356,10**8)
wHi = F(141421357,10**8)
print("wLo^2<=2?", wLo*wLo<=2, " wHi^2>=2?", wHi*wHi>=2, " w width", float(wHi-wLo))

# r = sqrt(3-3p^2)
c_lo = 3 - 3*pHi*pHi
c_hi = 3 - 3*pLo*pLo
print("3-3p^2 in", float(c_lo), float(c_hi))
print("r true in", math.sqrt(float(c_lo)), math.sqrt(float(c_hi)))
rLo = F(38173990,10**8)
rHi = F(38174030,10**8)
print("rLo^2<=c_lo?", rLo*rLo<=c_lo, " rHi^2>=c_hi?", rHi*rHi>=c_hi, " r width", float(rHi-rLo))

# products
wp_lo = wLo*pLo; wp_hi = wHi*pHi
wr_lo = wLo*rLo; wr_hi = wHi*rHi
print("wp in", float(wp_lo), float(wp_hi), "w", float(wp_hi-wp_lo))
print("wr in", float(wr_lo), float(wr_hi), "w", float(wr_hi-wr_lo))

# amplitudes
b0_lo = 1+wp_lo; b0_hi = 1+wp_hi
b1_lo = 1-(wp_hi+wr_hi)/2; b1_hi = 1-(wp_lo+wr_lo)/2
b2_lo = 1-(wp_hi-wr_lo)/2; b2_hi = 1-(wp_lo-wr_hi)/2
print("b0 in", float(b0_lo), float(b0_hi), "w", float(b0_hi-b0_lo))
print("b1 in", float(b1_lo), float(b1_hi), "w", float(b1_hi-b1_lo), "rel", float((b1_hi-b1_lo)/b1_lo))
print("b2 in", float(b2_lo), float(b2_hi), "w", float(b2_hi-b2_lo))

# masses
m0_lo=b0_lo*b0_lo; m0_hi=b0_hi*b0_hi
m1_lo=b1_lo*b1_lo; m1_hi=b1_hi*b1_hi
print("m0 in", float(m0_lo), float(m0_hi))
print("m1 in", float(m1_lo), float(m1_hi))
m01_lo = m0_lo/m1_hi; m01_hi = m0_hi/m1_lo
print("m01 in", float(m01_lo), float(m01_hi), "width", float(m01_hi-m01_lo), "rel", float((m01_hi-m01_lo)/m01_lo))

# cutLog target
print("cutLog(m01) true =", math.log(3477.4728371045985))
print("cutLog width ~ m01 rel-width =", float((m01_hi-m01_lo)/m01_lo))
