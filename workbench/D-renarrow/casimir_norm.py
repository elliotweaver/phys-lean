from fractions import Fraction as F
# BANKED, same doubling normalization (imRep DX = 2*T3, leftReg = 2*t):
adjC = 8    # |casimirOp| on each fund-7 triplet TL/TR (N277, -8)
funC = 3    # |leftReg casimir| on the matter doublet (N279, -3)
B_iso   = 16   # |traceForm7 (imRep DI)|  = hsCensus Imat (Z1)  fund-7 gather ISO self-census
B_charge= 6    # |traceForm7 chargeOp|    = hsCensus Cmat (Z1)  fund-7 gather CHARGE self-census
isoDepth   = F(2)     # Tr(T3^2) doublet running census (N342)
chargeDepth= F(16,3)  # Tr(Q^2)  (X6)
hyperDepth = F(10,3)

print("=== Casimir cross-normalization (both banked, SAME doubling norm) ===")
print("adjoint |C| (fund-7 triplet, N277) =", adjC)
print("fundamental |C| (doublet, N279)    =", funC)
print("ratio adj:fund =", F(adjC,funC), " (su(2) C2(adj)/C2(fund)=2/(3/4)=8/3) ->", F(adjC,funC)==F(8,3))
print()
print("=== N253 gather ratio & matter ratio both 3:8 ===")
print("8*B_charge == 3*B_iso :", 8*B_charge==3*B_iso)
print("8*isoDepth == 3*chargeDepth :", 8*isoDepth==3*chargeDepth)
print()
print("=== cross-normalization INVARIANT K ===")
print("B_iso*isoDepth   =", B_iso*isoDepth)
print("B_charge*chargeDepth =", B_charge*chargeDepth)
print("channel-independent K :", B_iso*isoDepth == B_charge*chargeDepth, " = 32")
print()
print("=== candidate reduction laws for s (each a DIFFERENT interior/boundary/out) ===")
cands = {
 "isoDepth*(funC/adjC) = 2*3/8": isoDepth*F(funC,adjC),
 "B_iso*(funC/adjC)    = 16*3/8": B_iso*F(funC,adjC),
 "isoDepth (project by own factor, boundary)": isoDepth,
 "B_iso/(adjC*... )": F(B_iso, adjC*2),
}
for k,v in cands.items():
    print(f"  s={str(v):8} interior(0,2): {0<v<2}   [{k}]")
print()
print("Firm finding: RATIO(3:8), SIGN(neg), Casimirs(-8,-3), invariant K=32 all FORCED;")
print("the reduction LAW (adjoint gather census -> fundamental running-census reduction) is NOT")
print("a banked theorem -> s constrained but not uniquely pinned. Not fittable to 137/0.231 (G2).")
