from fractions import Fraction as F
# Banked exact objects (Z1, N342, X6):
hs_Imat = 16          # hsCensus Imat  = raw fund-7 gather isospin count (Z1 gatherIsospin_hsCensus)
hs_Cmat = 6           # hsCensus Cmat  = raw fund-7 gather charge count
isoDepth = F(2)       # doublet running census Tr(T3^2) (N342 isoDepth_eq)
chargeDepth = F(16,3) # Tr(Q^2) (X6)
hyperDepth = F(10,3)  # Tr(Y^2)
# KEY STRUCTURAL FACT (N253 Imat def, N318 fund2Weight): imRep DI = 2*T3 on fund-7 (Imat entries +/-2)
# The DOUBLET census counts T3 in units of 1/2 (fund2Weight = +/-1/2), so per-doublet Tr(T3^2)=1/2.
# The GATHER census counts imRep DI = 2*T3, i.e. entries twice the T3 scale.
doubling = 2
# The T3-normalized gather isospin census on the fund-7 = hsCensus(Imat/2) = hs_Imat / doubling^2
unit_census = F(hs_Imat, doubling**2)
print('raw gather iso census hsCensus Imat     =', hs_Imat)
print('doubling (imRep DI = 2*T3)              =', doubling)
print('T3-normalized gather iso census 16/4    =', unit_census)
print('isoDepth (doublet running census)       =', isoDepth)
print('ratio unit_census/isoDepth              =', unit_census/isoDepth)
print()
print('--- candidate reductions s and admissibility 0<s<isoDepth=2 (open interval) ---')
cands = [('T3-normalized fund-7 gather census 16/4', unit_census),
         ('half of that (count over 2 triplets->1)', unit_census/2),
         ('raw/8', F(hs_Imat,8)),
         ('raw/16 (=1)', F(hs_Imat,16))]
for name,s in cands:
    net = isoDepth - s; adm = (0 < s < isoDepth)
    print(f'  s={str(s):6} netIsoDepth={str(net):6} interior={adm}  [{name}]')
print()
print('boundary check: chargeDepth - isoDepth =', chargeDepth-isoDepth, '= hyperDepth?', chargeDepth-isoDepth==hyperDepth)
