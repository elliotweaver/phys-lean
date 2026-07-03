# PREREG — N275: THE COMPLETE INNER-MULTIPLICATION A₂ TRIANGLE + THE FAMILY-ORBIT CEILING

## TARGET (selected S1–S5, comments 160–162)
Complete N274's partial inner-multiplication object into the full derived A₂ structure and PROVE
the family-orbit ceiling (RUNBOOK repeated-deferral discipline for ★2/★5, deferred ≥9×).

File: `Phys/Algebra/OctonionJordanInnerMultiplicationTriangle.lean`, namespace `Phys.Algebra.HJ`.
Imports: `Phys.Algebra.OctonionJordanInnerMultiplication` (N274) +
`Phys.Algebra.OctonionJordanFamilySymmetry` (N273).

## THE OBJECTS (all probe-verified EXIT 0 — probe6, probe7)
- `jb_Dg_slotC` — N213 weight action at slotC, weight `d1+d2` (the missing 3rd weight).
- `slotA_sub`, `slotB_sub` — slot subtraction-additivity (twins of banked `slotC_sub`).
- `innerMul_slot_diagBC` : `innerMul (slotB b)(slotC c)(Dg d0 d1 d2) = slotA ((d1-d0)•(b*star c))` [leg 2]
- `innerMul_slot_diagCA` : `innerMul (slotC c)(slotA a)(Dg d0 d1 d2) = slotB ((d0-d2)•(a*c))` [leg 3]
- `innerMul_root_sum_zero` : `(d2-d1)+(d1-d0)+(d0-d2) = 0` — A₂ trace-zero root closure.
- `cyc` := `swap 0 1 * swap 1 2`; `cyc_slotA/B/C` (A→B→C→A with the correct star pattern),
  `cyc_Dg` (`Dg d0 d1 d2 ↦ Dg d1 d2 d0`).
- `framePerm_sub` — framePerm distributes over subtraction (submatrix linear).
- ★★ `framePerm_innerMul` : `framePerm σ (innerMul A B M) = innerMul (framePerm σ A)(framePerm σ B)(framePerm σ M)`
  — THE CEILING KEY: innerMul intertwines with the family symmetry (built from jb, framePerm a jb-automorphism).
- `innerMul_family_orbit` — the three legs form ONE S₃-orbit (framePerm cyc carries leg1→leg2, transitivity).
- W8 non-vacuity: no root is fixed (S₃-standard-rep has no nonzero fixed trace-zero vector) — realized concretely.
- CAPSTONE `inner_multiplication_triangle_structure` — 3-leg triangle ∧ root-sum-zero ∧ family-orbit ∧ cap.

## HEADLINE / MOAT
The three derived inner-multiplication couplings form a family-symmetric A₂ root system with NO fixed
root — the fold's self-blindness (no nonzero fixed point) reappearing at the family level. The SM
POSITS a distinguished flavour direction (Yukawa texture); the theory PROVES no such direction is
derived here. NAMES the ceiling: a family-symmetry-BREAKING derived object is the precise missing
structure — childed as a route-finder.

## SCOPE (honesty clause)
Complete triangle + A₂ root closure + family-orbit transitivity + proved ceiling ONLY. NOT the ★5
texture / mass ratios / CKM-PMNS, NOT the ★2 mixing angle, NOT full f₄=Der(J₃(O)), NOT
innerMul-is-a-derivation, NOT parity.

## W9 COST BUDGET / KILL
KILL = 60s per obligation. All probe theorems are structural rewrites through banked lemmas
(`jb_comm`/`jb_Dg_slot*`/`jb_slot*_slot*`/`framePerm_jb`/`slot*_sub`) + `ring`/`fin_cases;simp`.
probe6 (legs + roots + cyc_Dg) EXIT 0; probe7 (all cyc slot maps + framePerm_innerMul) EXIT 0.
NO coordinate bash, NO maxHeartbeats raise beyond N274's inherited 800000 on the leg proofs (if
needed — probes closed WITHOUT it), NO decide/native_decide. If any obligation exceeds 60s → STOP,
measure/decompose (it won't; probes are ~clean).

## FREE-FLOATING RAIL
Every headline TYPE mentions the banked derived objects: `innerMul`/`slotA/B/C`/`Dg`/`framePerm`/
`O ℚ`/`star`. The capstone carries `jordan_cap_pinned_at_three` (octonion-specific, NOT
carrier-agnostic — over a commutative rung the couplings `star a*b`/`b*star c`/`a*c` degenerate and
the A₂ triangle collapses). NOT generic over an arbitrary algebra.

## PHYSICS-WORDS-REMOVABLE
Delete flavour/generation/family/texture/root: over ℚ and `O ℚ = CD (H ℚ)`, the inner-derivation
commutator `innerMul` of the order-3 Hermitian Jordan matrix algebra, applied to the three
off-diagonal slot-pairs against a diagonal `Dg`, yields three values whose ℚ-coefficients are the
three trace-zero functionals `(d2-d1),(d1-d0),(d0-d2)` (sum zero), cyclically permuted by the
submatrix-relabelling S₃; `σ ↦ framePerm σ` intertwines `innerMul`. No theorem statement needs a
physics word.

## COSTUME C306
Anchor a TRUE concrete value from a NEW leg (leg 2 or 3, not N274's leg 1). E.g. leg3 at
`c=1, a=u1, Dg 1 0 0` (root `d0-d2 = 1`, value `u1*1 = u1`): `((innerMul (slotC 1)(slotA u1)(Dg 1 0 0)) 0 2).re.re.im = 1`.
Package `min 306 (…) = 1`; BOGUS claims `= 306`; bites `1 = 306`. Pair (306,1) — RHS 306 fresh.

## COLLISION CHECK (done, all 0 hits)
innerMul_slot_diagBC/CA, innerMul_root_sum_zero, framePerm_innerMul, cyc_slotA/B/C, cyc_Dg,
slotA_sub, slotB_sub, jb_Dg_slotC, innerMul_family_orbit, inner_multiplication_triangle_structure,
OctonionJordanInnerMultiplicationTriangle — all free across Phys/ Counterexamples/ Audits/ Phys.lean.
