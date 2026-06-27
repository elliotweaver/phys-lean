# N108 MEASUREMENTS (run 289) — all GREEN, light node like N107

Clean git tree, fresh node (NOT a crime scene). Warm oleans, `lake build Phys` cached 7.4s.

## Instrument note (W9): the whnf-200000 wall on rfl
probeA: `doubleBlockLin_apply` proved by raw `rfl` on the nested Module.End coercion → whnf-200000
timeout (24s, SAME wall N107 saw). DISSOLVED (THE ONE LAW, structural route): use
`Module.End.mul_apply` for the product-apply, and `map_mul` + `endToFunEnd_genTwoPlaneLin` for the
bridge-apply. NO inflated maxHeartbeats. The structural route compiles instantly.

## Measured-clean obligations (each ~7-9s = import-load dominated, ~instant body)
STRUCTURAL (general u,w,a,b):
- doubleBlockLin def + doubleBlockLin_apply (Module.End.mul_apply)          [probeA2 OK]
- doubleBlockLin_mem_genLin (mul_mem of two genTwoPlaneLin_mem_genLin)       [probeA2 OK]
- doubleBlockLin_isQvIsomC (composition of two genTwoPlaneLin_isQvIsomC)     [probeA2 OK]
- doubleBlockLin_mem_gen2 (endToFunEnd_genIsomMonoidLin_mem_gen2 transport)  [probeA2 OK]
- doubleBlock_bridge_eq (map_mul), doubleBlock_bridge_apply (nested 4-factor)[probeH2 OK]

CONCRETE units (kU := e2 * je2, a THIRD octonion unit):
- kU_sq : kU*kU = -1                                                          [probeI OK]
- kU_imag : star kU = -kU                                                     [probeI OK]
- kU_gFormC_self : gFormC kU kU = 1 (je2_gFormC_self pattern)                 [probeI OK]
- block1_fixes_kU: genTwoPlaneLin e2 je2 FIXES kU (biMulComp_fixes_common)    [probeF OK]
- block2_negates_kU: genTwoPlaneLin kU e2 NEGATES kU (biMulComp_negates_u)    [probeF OK]
- (-kU).im.im.re = 1 ; kU.im.im.re = -1                                       [probeG OK]

## W8 TEETH design (the higher-rank witness)
doubleBlockLin e2 je2 kU e2 = genTwoPlaneLin kU e2 * genTwoPlaneLin e2 je2.
Applied to (0,0,kU): the FIRST block genTwoPlaneLin e2 je2 FIXES kU; the DOUBLE block NEGATES it.
→ the composite reaches a rotation in a plane the first block alone does NOT touch — strictly
higher rank (the SO(8) analogue of N107's ninth composition). Teeth coordinate: the composite
moves (0,0,kU) so the 2.2.im.im.re reads 1 (from -kU), NOT -1 (the single-block fixed value).

## COSTUME C140
A WRONG multi-block-factorization coordinate claim: assert the double-block coordinate = 71 (a
false numeric, DISTINCT from C137 3/5=59, C138 5/13=61, C139 7/25=67). True value is 1.
