from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log
import mpmath
mp.dps = 100
d=F(16,3)
parent_w=F(4802931662,70685829)-F(19211728054,282743343)
print("parent 1/a(0) width = %.4e"%float(parent_w))
print("parent bracket [%.9f, %.9f]"%(float(F(19211728054,282743343)),float(F(4802931662,70685829))))

# cutLog (split@5 m01), safe idx 27 lower / 30 upper: [815406110/1e8, 815406115/1e8]
la=F(815406110,10**8); lb=F(815406115,10**8)
# leastCosZero lower 628 (safe), upper options 635(safe)/634(tight)
def block(lznum_lo,lznum_hi,tag):
    pa=F(50000000,lznum_hi)   # 1/cutPi lower = 1/(2*lz_hi)=5e7/lznum_hi
    pb=F(50000000,lznum_lo)   # 1/cutPi upper
    lo=F(190,3)+d/3*la*pa
    hi=F(190,3)+d/3*lb*pb
    w=hi-lo
    print("\n[%s] lz[%d,%d]/1e8  cutLog[815406110,815406115]/1e8"%(tag,lznum_lo,lznum_hi))
    print("  1/cutPi_lo=50000000/%d  1/cutPi_hi=50000000/%d  (w %.3e)"%(lznum_hi,lznum_lo,float(pb-pa)))
    print("  1/a(0) bracket:")
    print("    lo = %s = %.10f"%(lo,float(lo)))
    print("    hi = %s = %.10f"%(hi,float(hi)))
    print("  width = %.4e   (%.1fx narrower than parent)"%(float(w),float(parent_w/w)))
    print("  nested in parent? lo>=%.9f: %s ; hi<=%.9f: %s"%(
        float(F(19211728054,282743343)), lo>=F(19211728054,282743343),
        float(F(4802931662,70685829)), hi<=F(4802931662,70685829)))
    # dressed (w=1/3): 74 + d/2*cutLog*invPi
    dlo=F(74,1)+d/2*la*pa
    dhi=F(74,1)+d/2*lb*pb
    print("  dressed lo=%s=%.9f  hi=%s=%.9f"%(dlo,float(dlo),dhi,float(dhi)))
    return lo,hi,dlo,dhi

block(157079628,157079635,"safe-both")
block(157079628,157079634,"push-upper-634")
