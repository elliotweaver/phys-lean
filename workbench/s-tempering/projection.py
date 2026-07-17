from fractions import Fraction as F
# ===== THE CASIMIR-RATIO PROJECTION (owner DECISION 4, theory-native, no fit) =====
# BANKED EXACT:
adjCas = 8   # |casimirOp eigenvalue| on the adjoint triplet TL/TR (N277 casimirOp_u1I = -8*id)
funCas = 3   # |leftReg Casimir eigenvalue| on the fundamental doublet (N279 = -3*id)
gatherIsoSpinCensus = F(4)   # cross-normalized gather adjoint census (IsospinAntiScreeningCrossNorm)
isoDepth = F(2)              # matter doublet running census (N342)
chargeTraceDepth = F(16, 3)  # Tr(Q^2) (X6)

# THE FRACTION the fundamental doublet sees of the gather's ADJOINT census = the Casimir ratio:
casimirRatio = F(funCas, adjCas)   # 3/8
print(f"Casimir ratio funCas:adjCas = {funCas}:{adjCas} = {casimirRatio}")

# The projected s = fraction * (cross-census 2*isoDepth = gatherIsoSpinCensus):
projectedS = gatherIsoSpinCensus * casimirRatio
print(f"projectedS = gatherIsoSpinCensus * (funCas/adjCas) = {gatherIsoSpinCensus} * {casimirRatio} = {projectedS}")
print(f"  = (2*isoDepth) * casimirRatio = {2*isoDepth} * {casimirRatio} = {2*isoDepth*casimirRatio}")
print()

# TEETH:
print(f"interior to (0, isoDepth={isoDepth})?  0 < {projectedS} < {isoDepth} : {0 < projectedS < isoDepth}")
print(f"strictly below cross-census gatherIsoSpinCensus={gatherIsoSpinCensus}? {projectedS < gatherIsoSpinCensus}")
print(f"netIsoDepth = isoDepth - projectedS = {isoDepth - projectedS} > 0 : {isoDepth - projectedS > 0}")
print()

# THE SELECTION (resolves the ceiling): projection picks 3/2 (ratioTempered), rejects 1 (doublingTempered/Dynkin)
ratioTempered = gatherIsoSpinCensus * (isoDepth/chargeTraceDepth)   # 4*(3/8)=3/2 (ceiling, via charge:iso depth ratio)
doublingTempered = gatherIsoSpinCensus / 4                          # 4/4=1     (ceiling, via doubling-sq/Dynkin)
print(f"ceiling ratioTempered (3:8 depth ratio)     = {ratioTempered}")
print(f"ceiling doublingTempered (doubling-sq/Dynkin)= {doublingTempered}")
print(f"projectedS == ratioTempered? {projectedS == ratioTempered}   projectedS != doublingTempered? {projectedS != doublingTempered}")
print()

# THE ONE-CAUSE CROSS-CHECK: the Casimir ratio EQUALS the charge:isospin depth ratio (two independent banked routes agree on 3/8)
depthRatio = isoDepth / chargeTraceDepth   # 2/(16/3) = 3/8
print(f"Casimir ratio funCas/adjCas = {casimirRatio}")
print(f"charge:isospin depth ratio isoDepth/chargeTraceDepth = {depthRatio}")
print(f"AGREE (one cause)? {casimirRatio == depthRatio}  -> the projection is corroborated by two independent banked structures; only the Dynkin reading (1/4) dissents")
