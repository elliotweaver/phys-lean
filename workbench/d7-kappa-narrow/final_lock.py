"""
FINAL LOCK: compute the exact assembled endpoint brackets for N581 (ext7 kappa + s7 L_m01 +
N580 deepened edge logs) and choose clean rational D7 endpoints for the restatement.
Mirror endpoint_core_r2: endpoint = 2425/18 + k*(cL*L + cLmb*Lmb + cLb0*Lb0 + cLb2*Lb2).
"""
from fractions import Fraction as F

# ext7 kappa bounds: kappaLeading = (1/cutPi)/3
inv_lo = F(100000000000, 314159265359)
inv_hi = F(250000000000, 785398163397)
klo = inv_lo/3
khi = inv_hi/3

# deepened / s7 edge-log brackets (lo, hi)
L    = (F(815406111272599,10**14), F(815406111272603,10**14))   # s7 L_m01
Lmb  = (F(-40893066400068,10**13), F(-40893066400067,10**13))   # N580 deepened
Lb0  = (F(17337287949546,10**13),  F(17337287949547,10**13))    # N580 deepened
Lb2  = (F(-10887237252238,10**13), F(-10887237252235,10**13))   # N580 deepened

def inner_bracket(cL, cLmb, cLb0, cLb2):
    lo = hi = F(0)
    for c,(a,b) in [(cL,L),(cLmb,Lmb),(cLb0,Lb0),(cLb2,Lb2)]:
        if c>0: lo += c*a; hi += c*b
        else:   lo += c*b; hi += c*a
    return lo, hi

def endpoint_bracket(coeffs):
    il, ih = inner_bracket(*coeffs)
    base = F(2425,18)
    elo = base + klo*il
    ehi = base + khi*ih
    return il, ih, elo, ehi

print("kappa ext7: klo =", klo, " khi =", khi)
print("  klo=%.18f khi=%.18f"%(float(klo),float(khi)))
print()

# ----- BARE (2, 7/3, 11/3, -5/3) -----
il,ih,elo,ehi = endpoint_bracket((F(2),F(7,3),F(11,3),F(-5,3)))
print("=== BARE ===")
print("inner  [%.15f, %.15f] w=%.2e"%(float(il),float(ih),float(ih-il)))
print("endpt  [%.15f, %.15f] w=%.2e"%(float(elo),float(ehi),float(ehi-elo)))
# choose clean 13-digit-grid endpoints: floor(elo*1e13), ceil(ehi*1e13)
import math
for gp in [13]:
    g=10**gp
    lo_i = math.floor(elo*g)      # need chosen_lo <= elo
    hi_i = math.ceil(ehi*g)       # need chosen_hi >= ehi
    clo=F(lo_i,g); chi=F(hi_i,g)
    print("  D7 bracket @1e%d: [%d/1e%d, %d/1e%d] = [%.13f, %.13f]"%(gp,lo_i,gp,hi_i,gp,float(clo),float(chi)))
    print("    clo<=elo? %s  chi>=ehi? %s  width=%.2e"%(clo<=elo, chi>=ehi, float(chi-clo)))
    # inner bracket choice for the core: need inner_lo_choice <= il and inner_hi_choice >= ih
    ilo_i=math.floor(il*g); ihi_i=math.ceil(ih*g)
    print("    inner @1e%d: [%d/1e%d, %d/1e%d] ilo<=il? %s ihi>=ih? %s"%(gp,ilo_i,gp,ihi_i,gp,F(ilo_i,g)<=il,F(ihi_i,g)>=ih))
    # verify: base + klo*inner_lo_choice? No — core uses mul_le_mul with klo*inner_lo. We need
    # base + klo*(chosen inner lo) >= chosen endpoint lo. Let's verify the actual core inequalities:
    inner_lo_c = F(ilo_i,g); inner_hi_c = F(ihi_i,g)
    # core lower: k*C >= klo*inner_lo_c (since k>=klo, C>=inner_lo_c>0); endpoint >= base+klo*inner_lo_c
    lhs_lo = F(2425,18)+klo*inner_lo_c
    lhs_hi = F(2425,18)+khi*inner_hi_c
    print("    base+klo*inner_lo_c = %.15f  >= clo(%.13f)? %s"%(float(lhs_lo),float(clo), lhs_lo>=clo))
    print("    base+khi*inner_hi_c = %.15f  <= chi(%.13f)? %s"%(float(lhs_hi),float(chi), lhs_hi<=chi))
    # nested in N580 [1363071881405/1e10, 1363071881406/1e10]?
    print("    nested in N580 [136.3071881405,136.3071881406]? lo:%s hi:%s"%(clo>=F(1363071881405,10**10), chi<=F(1363071881406,10**10)))
print()

# ----- DRESSED (3, 7/2, 11/2, -5/2) -----
il,ih,elo,ehi = endpoint_bracket((F(3),F(7,2),F(11,2),F(-5,2)))
print("=== DRESSED ===")
print("inner  [%.15f, %.15f] w=%.2e"%(float(il),float(ih),float(ih-il)))
print("endpt  [%.15f, %.15f] w=%.2e"%(float(elo),float(ehi),float(ehi-elo)))
for gp in [13]:
    g=10**gp
    lo_i=math.floor(elo*g); hi_i=math.ceil(ehi*g)
    clo=F(lo_i,g); chi=F(hi_i,g)
    ilo_i=math.floor(il*g); ihi_i=math.ceil(ih*g)
    inner_lo_c=F(ilo_i,g); inner_hi_c=F(ihi_i,g)
    lhs_lo=F(2425,18)+klo*inner_lo_c; lhs_hi=F(2425,18)+khi*inner_hi_c
    print("  D7 @1e%d: [%d/1e%d, %d/1e%d]=[%.13f,%.13f] w=%.2e"%(gp,lo_i,gp,hi_i,gp,float(clo),float(chi),float(chi-clo)))
    print("    inner @1e%d [%d,%d] ilo<=il?%s ihi>=ih?%s"%(gp,ilo_i,ihi_i,inner_lo_c<=il,inner_hi_c>=ih))
    print("    base+klo*ilo=%.15f >=clo?%s ; base+khi*ihi=%.15f <=chi?%s"%(float(lhs_lo),lhs_lo>=clo,float(lhs_hi),lhs_hi<=chi))
    print("    nested in N580 [137.0996710997,137.0996710998]? lo:%s hi:%s"%(clo>=F(1370996710997,10**10),chi<=F(1370996710998,10**10)))
    print("    >137? %s"%(clo>137))
