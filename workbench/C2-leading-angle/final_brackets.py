import mpmath as mp
mp.mp.dps = 50

# banked (from GenerationMassRatiosNumeric): b0 in [237943/1e5,237944/1e5], b2 in [5802/1e4,58022/1e5]
b0lo=mp.mpf(237943)/100000; b0hi=mp.mpf(237944)/100000
b2lo=mp.mpf(5802)/10000;    b2hi=mp.mpf(58022)/100000
b0t=mp.mpf('2.37943817163'); b2t=mp.mpf('0.580211920148')

# object: cabMix2 = (b0*b2/3)^2 / ((b0^2+b2^2)*(b0^2+(4/9)b2^2))
#   cross2 = b0^2 b2^2 /9 ; nu=b0^2+b2^2 ; nd=b0^2+(4/9)b2^2
def cm(b0,b2):
    return (b0*b2)**2/9/((b0**2+b2**2)*(b0**2+mp.mpf(4)/9*b2**2))
print("true cabMix2 =", mp.nstr(cm(b0t,b2t),14))

# intermediate brackets to bank as separate lemmas:
# cross2 = b0^2 b2^2/9
cross2_lo=(b0lo*b2lo)**2/9; cross2_hi=(b0hi*b2hi)**2/9
print("\ncross2 in [%s, %s]  (true %s)"%(mp.nstr(cross2_lo,14),mp.nstr(cross2_hi,14),mp.nstr((b0t*b2t)**2/9,14)))
# b0^2 bracket
b02lo=b0lo**2; b02hi=b0hi**2
print("b0^2 in [%s, %s]"%(mp.nstr(b02lo,12),mp.nstr(b02hi,12)))
# b2^2 bracket
b22lo=b2lo**2; b22hi=b2hi**2
print("b2^2 in [%s, %s]"%(mp.nstr(b22lo,12),mp.nstr(b22hi,12)))
# nu=b0^2+b2^2
nulo=b02lo+b22lo; nuhi=b02hi+b22hi
print("nu in [%s, %s]"%(mp.nstr(nulo,12),mp.nstr(nuhi,12)))
# nd=b0^2+(4/9)b2^2
ndlo=b02lo+mp.mpf(4)/9*b22lo; ndhi=b02hi+mp.mpf(4)/9*b22hi
print("nd in [%s, %s]"%(mp.nstr(ndlo,12),mp.nstr(ndhi,12)))
# denom = nu*nd
denlo=nulo*ndlo; denhi=nuhi*ndhi
print("den=nu*nd in [%s, %s]"%(mp.nstr(denlo,12),mp.nstr(denhi,12)))
# cabMix2 bracket
cm_lo=cross2_lo/denhi; cm_hi=cross2_hi/denlo
print("\ncabMix2 in [%s, %s]"%(mp.nstr(cm_lo,14),mp.nstr(cm_hi,14)))

# declare a clean rational two-sided bracket enclosing [cm_lo,cm_hi]
lo=mp.mpf(607499)/100000000   # 0.00607499
hi=mp.mpf(607561)/100000000   # 0.00607561
print("\nDECLARE cabMix2 in [607499/1e8, 607561/1e8] = [%s, %s]"%(mp.nstr(lo,10),mp.nstr(hi,10)))
print("  cm_lo=%s >= lo=%s ? %s"%(mp.nstr(cm_lo,12),mp.nstr(lo,10),cm_lo>=lo))
print("  cm_hi=%s <= hi=%s ? %s"%(mp.nstr(cm_hi,12),mp.nstr(hi,10),cm_hi<=hi))

# |Vmix| = sqrt(cabMix2) -- optional sin bracket; the FORCED object is cabMix2 (arctan-free)
print("\n|Vmix|=sqrt=", mp.nstr(mp.sqrt(cm(b0t,b2t)),10), " (derived leading-order Cabibbo mixing)")
print("measured sinTheta_C ~ 0.2252 -> sin^2 ~ 0.0507 (REMOVABLE PROSE; leading-order residual, arc-C LIVE fight; NEVER fitted)")

# The free tooth: unitarity cabMix2 + cabAln2 = 1 EXACTLY (Brahmagupta-Fibonacci)
# cabAln2 = aligned^2/(nu*nd), aligned = b0^2 + (2/3)b2^2
def caln(b0,b2):
    return (b0**2+mp.mpf(2)/3*b2**2)**2/((b0**2+b2**2)*(b0**2+mp.mpf(4)/9*b2**2))
print("\ncabMix2+cabAln2 =", mp.nstr(cm(b0t,b2t)+caln(b0t,b2t),20), "(EXACT 1, arctan-free unitarity tooth)")

# ALSO tie to C1: sectorMisalign(b0,b2) over Q -> cast to Cut = b0*b2*(1/3). cross = that.
print("\ncross = b0*b2*(1/3) =", mp.nstr(b0t*b2t/3,12), " = sectorMisalign(b0,b2) cast (C1 keystone)")
