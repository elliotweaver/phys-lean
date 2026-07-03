# N262 PREREG — THE SPIN GENERATORS

## TARGET
The antisymmetric part of the gather worldMap composition `spinGen a b := L_a·L_b − L_b·L_a`
(= the gather gluing obstruction, N219) acts on the Clifford generators (the fundamental 7)
as the elementary so(7) rotation: `[spinGen a b, L_c] = 4 gForm(a,c) L_b − 4 gForm(b,c) L_a`.

## STAR / ARC
Advances ★3 (one generation of matter). Forward deepening of N261 (O as spinor): N261 mined the
SYMMETRIC half of `L_a·L_b`; this mines the ANTISYMMETRIC half. The so(7) here = the SAME so(7)
of the gather gauge tear (N225–N260) — one so(7), two faces (gauge tear ↔ spinor rotation).

## DE-RISK STATUS (workbench/N262-select/probe_witness.lean, exit 0, foundations-only)
- cliff_mul (bridge N261 leftReg_clifford to `*`/`1`) — CLEAN
- spinGen, spinGen_antisymm, spinGen_self — CLEAN (abel)
- spinGen_act (THE CROWN) — CLEAN (noncomm_ring + cliff_mul + module)
- leftReg_frame_ne_zero, spinGen_frame_ne_zero (W8) — CLEAN

## STRETCH (no-block)
so(7) closure `[S_ab,S_cd] = Σ ±2 gForm • S`. If the 4-factor coefficients fight the
noncomm_ring/module closer within a bounded probe, SHIP core + CHILD the closure. THE ONE LAW:
do not grind.

## W9 COST BUDGET / KILL
Every obligation is a short algebraic rewrite over the End-of-O ring via banked N261 anticommutators
+ noncomm_ring + module. NO octonion coordinate bash, NO decide, NO native_decide, NO proof-kernel
maxHeartbeats raise (synthInstance 400000 = instance-search only, banked precedent). KILL: if any
single obligation needs coordinate expansion or exceeds ~60s in a bounded probe, it is an instrument
signal → decompose or child. The core is already exit-0; only the STRETCH carries risk, and it is
explicitly no-block.

## COSTUME C293
Anchor the crown rotation coefficient `4`: at c=a, `[S_ab,L_a] = 4 gForm(a,a) L_b`; on the
orthonormal frame gForm(imBasis i)(imBasis i)=1 so the coefficient is exactly `4`. BOGUS: claims
`min 293 (4 * gForm (imBasis 0) (imBasis 0)) = 293`; genuinely = 4; reduces to false `4 = 293`.
Pair (293,4): RHS 293 fresh. (LHS anchor `4` = the so(7) rotation scale — distinct meaning from
C289's electroweak dim 4.)

## STANDARD
Unbroken (leftReg/gForm/imBasis all banked, N261/N257); complete (foundations-only); words-removable
(delete spin/rotation/bivector/Dirac/matter/gauge → pure statement about the antisymmetric part of
leftReg composition acting on generators). FREE-FLOATING: every TYPE mentions banked leftReg/gForm/
imBasis on derived O ℚ — concrete, not carrier-agnostic.
