import mpmath as mp
mp.mp.dps = 80
pi = mp.pi
E11 = mp.mpf(10)**11
half = pi/2
print("pi/2*1e11 =", mp.nstr(half*E11, 30))
print("  floor=157079632679, ceil=157079632680")
print("157079632679/1e11 =", mp.nstr(mp.mpf(157079632679)/E11,25), " < pi/2 ?", mp.mpf(157079632679)/E11 < half)
print("157079632680/1e11 =", mp.nstr(mp.mpf(157079632680)/E11,25), " > pi/2 ?", mp.mpf(157079632680)/E11 > half)
print()
# KEY OBSERVATION: is the 1e11 ceiling the same rational as the 1e10 ceiling?
from fractions import Fraction as F
c11 = F(157079632680,10**11); c10 = F(15707963268,10**10)
print("157079632680/1e11 == 15707963268/1e10 ?", c11==c10, "  (both =", float(c11),")")
print("  => UPPER endpoint UNCHANGED; reuse parent leastCosZero_le_15707963268")
print()
# LOWER: y_max = 157079632679/4e11
ymax = mp.mpf(157079632679)/(4*E11)
pi8 = pi/8
print("=== LOWER: near-pi/8 window at 1e11 ===")
print("y_max = 157079632679/4e11 =", mp.nstr(ymax,25))
print("pi/8                      =", mp.nstr(pi8,25))
print("y_max < pi/8 ?", ymax < pi8, " gap(pi/8-y_max)=", mp.nstr(pi8-ymax,6))
cpi8 = mp.cos(pi8)
cym  = mp.cos(ymax)
print("cos(pi/8)  =", mp.nstr(cpi8,30))
print("cos(y_max) =", mp.nstr(cym,30))
print("WINDOW [cos(pi/8), cos(y_max)] width =", mp.nstr(cym-cpi8,6))
print()
# candidate thresholds C in (cos(pi/8), cos(y_max)); need C>cos(pi/8) AND C<cos(y_max)
print("=== candidate C thresholds ===")
for Cnum,Cden in [(9238795325115,10**13),(9238795325114,10**13),(9238795325116,10**13),(92387953251145,10**14),(92387953251150,10**14)]:
    C = mp.mpf(Cnum)/Cden
    inwin = (C>cpi8) and (C<cym)
    Cu = 2*C*C-1
    closure = 2*Cu*Cu-1     # must be > 0
    win = cym - C           # near-pi/8 certification room (must be >0)
    print("C=%d/%d = %s" % (Cnum,Cden,mp.nstr(C,20)))
    print("   C>cos(pi/8):%s  C<cos(ymax):%s  in-window:%s" % (C>cpi8, C<cym, inwin))
    print("   near-pi8 room cos(ymax)-C = %s" % mp.nstr(win,6))
    print("   Cu=2C^2-1 = %s   closure 2Cu^2-1 = %s (>0 needed)" % (mp.nstr(Cu,22), mp.nstr(closure,6)))
    print()
