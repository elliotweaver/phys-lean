from fractions import Fraction as F
# ===== THE ROUTE-FINDER RESULT (theory-native, no fit) =====
# BANKED EXACT (Z1 via decide; N253 Imat def; N342/X6; N277/N279 Casimirs):
hsImat = 16          # hsCensus Imat (Z1 gatherIsospin_hsCensus) -- fund-7 gather iso count, DOUBLING units
traceSqImat = -16    # traceSq Imat (Z1 gatherIsospin_traceSq) = -hsCensus
isoDepth = F(2)      # Tr(T3^2) matter DOUBLET running census (N342 isoDepth_eq)
chargeDepth = F(16,3)# Tr(Q^2) (X6)
Bcharge = -6         # traceForm7 chargeOp chargeOp (Z1)
Biso = -16           # traceForm7 (imRep DI)(imRep DI) (Z1)
adjCas = 8           # |casimirOp| on fund-7 triplet TL/TR (N277)   spin-1 adjoint
funCas = 3           # |leftReg casimir| on matter doublet (N279)   spin-1/2 fundamental
doubling = 2         # imRep DI = 2*T3 on fund-7 (Imat entries +/-2); leftReg = 2*t

print("STEP 1 - the natural cross-normalization (doubling -> physical T3 units), 'done elsewhere' /doubling^2:")
physGatherIsoCensus = F(hsImat, doubling**2)   # 16/4
print(f"  fund-7 gather iso census (physical) = hsCensus Imat / doubling^2 = {hsImat}/{doubling**2} = {physGatherIsoCensus}")
print(f"  isoDepth (matter doublet running census)                                        = {isoDepth}")
print(f"  RATIO physGatherIsoCensus : isoDepth = {physGatherIsoCensus/isoDepth}   => census = 2*isoDepth EXACTLY")
print()
print("STEP 2 - the OVERSHOOT (rules out the naive census-subtraction s := physGatherIsoCensus):")
s_naive = physGatherIsoCensus
net = isoDepth - s_naive
print(f"  netIsoDepth(s_naive={s_naive}) = isoDepth - s_naive = {isoDepth} - {s_naive} = {net}  (< 0!)")
print(f"  s_naive in banked admissible OPEN interval (0, isoDepth={isoDepth})? {0 < s_naive < isoDepth}")
print("  => the naive full-census reduction OVERSHOOTS; s is NOT the raw cross-normalized census.")
print()
print("STEP 3 - the FORCED structure that constrains s (all banked, convention-free):")
print(f"  N253 gather ratio |Bc|:|Bi| = {abs(Bcharge)}:{abs(Biso)} = {F(abs(Bcharge),abs(Biso))}  == matter iso:charge = isoDepth:chargeDepth = {isoDepth/chargeDepth}: {F(abs(Bcharge),abs(Biso))==isoDepth/chargeDepth}")
print(f"  Casimir adjoint:fundamental = {adjCas}:{funCas}  (su(2) C2(adj)/C2(fund) = 8/3)")
print(f"  channel-invariant K: |Bi|*isoDepth = {abs(Biso)*isoDepth} ; |Bc|*chargeDepth = {abs(Bcharge)*chargeDepth} ; equal={abs(Biso)*isoDepth==abs(Bcharge)*chargeDepth}")
print()
print("CONCLUSION: the cross-normalization is DERIVED (=2*isoDepth) and PROVEN to overshoot.")
print("The interior magnitude requires the fundamental-vs-adjoint projection (the matter doublet")
print("sees only a fraction of the gather's adjoint census) -- a specific named object NOT banked.")
print("NO value fitted; the measure-hitting s~1.9 is G2-forbidden. -> child ONE directed successor.")
