from fractions import Fraction as F

# Banked exact objects
isoDepth = F(2)          # Tr(T3^2) doublet running census (N342)
chargeDepth = F(16,3)    # Tr(Q^2) (X6)
gatherCensus = F(4)      # |traceSq Imat|/4 = 16/4 (PROVEN = 2*isoDepth, IsospinAntiScreeningCrossNorm)
adjCas = F(8)            # |casimirOp| on fund-7 triplet TL/TR (N277)
funCas = F(3)            # |leftReg casimir| on matter doublet (N279)

print("=== overshoot (banked) ===")
print("gatherCensus =", gatherCensus, " = 2*isoDepth =", 2*isoDepth, " overshoots isoDepth =", isoDepth)
print()

# The TWO canonical su(2) adjoint->fundamental normalizations of the overshooting census:
s_casimir = gatherCensus * (funCas/adjCas)                 # Casimir-magnitude ratio C2f/C2a = 3/8
dim_trip, dim_doub, dim_adj = 3,2,3
T_adj  = adjCas*dim_trip/dim_adj                           # Dynkin index T(R)=C2(R)dim(R)/dim(adj)
T_fund = funCas*dim_doub/dim_adj
s_dynkin = gatherCensus * (T_fund/T_adj)
print("=== the two canonical temperings (both from banked Casimirs, SAME doubling norm) ===")
print("Casimir-ratio C2f/C2a = 3/8 -> s_Casimir = 4*3/8 =", s_casimir, " admissible(0,2):", 0<s_casimir<isoDepth)
print("Dynkin  T_adj,T_fund =", T_adj, T_fund, " Tf/Ta =", T_fund/T_adj, "-> s_Dynkin =", s_dynkin, " admissible:", 0<s_dynkin<isoDepth)
print("DISTINCT:", s_casimir != s_dynkin, "  (neither the raw 4, neither the boundary 2)")
print()

# Composed landing at each clean s
invAlphaZero_lo = F(12007329939722,176714586765)          # D7 theNumeral_bracket.1
totalScreening = invAlphaZero_lo - 42                       # invAlphaHigh = 42
T = totalScreening / chargeDepth                            # totalScreeningWith 1
w = F(1,3)                                                  # depthWeight (D3)
def composed(s): return 112 + ((chargeDepth - s)*T)/(1-w)  # dressedInvAlphaEM w s
print("=== composed dressedInvAlphaEM (recombined, w=1/3) at clean census s (totalScreening lower-bnd ~%.4f) ==="%float(totalScreening))
for name,s in [("s=0 no anti-screen",F(0)),("s=1 Dynkin",s_dynkin),("s=3/2 Casimir",s_casimir),("s=2 boundary",isoDepth)]:
    print(f"  {name:22} s={str(s):4} -> 1/alpha(0) ~ {float(composed(s)):.4f}")
target = F(137036,1000)
s_fit = chargeDepth - (target-112)*(1-w)/T
print("  s that lands ON 137.036 (the FIT, G2-forbidden):", float(s_fit))
print()
print("=== undressed recombined endpoint (w=0,s=0) ===")
print("  dressedInvAlphaEM 0 0 = 112 + totalScreening ~", float(112+totalScreening))
print()
print("CONCLUSION: comparing an ADJOINT census (4) to a FUNDAMENTAL census (2) has NO canonical")
print("normalization -- Casimir and Dynkin (both standard, both banked) DISAGREE. No adjoint->fund")
print("intertwiner exists (Schur: distinct irreps). s is a genuine 1-parameter family in (0,2);")
print("pinning it to a POINT needs an absolute scale rep-theory cannot supply. Pinning to hit 137.036")
print("would be fitting (G2). The census-arithmetic class of temperings is RULED OUT as a POINT route.")
