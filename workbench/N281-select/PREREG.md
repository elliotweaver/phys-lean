# N281 PREREG — THE FOLD-ROOT'S TWO-FACED NEUTRAL TORUS

## TARGET (rewritten node headline)
THE FLEXIBILITY-PROTECTED RANK-2 NEUTRAL CARTAN TORUS OF THE MATTER SPINOR — the two regular
faces {L_{u1}, R_{u1}} of the fold-root u1 COMMUTE on ALL of O ℚ (via flexibility `mul_flex`, the
LAST identity surviving the cascade stop), forming a rank-2 abelian subalgebra of End(O ℚ) that
SURVIVES the cascade stop that breaks N280's full two-handed so(4) off H; its eigen-split isolates
the fold's ℂ-core (span{1,u1}, N266) from the charged sector, and the sum-face's ImO→ImO
restriction VANISHES (rank-2 → rank-1 collapse under the adjoint/vector-7 rep) — supplying the
SECOND independent neutral generator that the vector-7 STRUCTURALLY could not hold (the exact cause
N257 named for the ≥11×-deferred ★2 ceiling).

## FOLD-CAUSAL / MOAT (see comment 185 S4). ONE CAUSE, GRADED TERMINATIONS:
associativity fails at O ⇒ N280's full so(4) breaks off H; FLEXIBILITY survives ⇒ the same-unit
Cartan torus lives on ALL O. The single fact "which identity survives the cascade stop" grades
which part of the two-handed structure dies and which lives.

## PRODUCTION OBJECTS (file Phys/Algebra/TowerWorldMapFoldRootNeutralTorus.lean, ns Phys.Algebra)
Reuse banked: leftReg/rightReg (N261/N264), lregI = leftReg u1M (N279), rregI = rightReg u1M (N280),
leftReg_sq/rightReg_sq (−gForm•id), mul_flex (Alternative.lean), gForm_u1M (=1), u1M, JO (N201),
comm_deriv_JO / commutes_JO_iff (N201), colourCentralizer.

1. `flex_reg_commute` (★★★, GENERIC coordinate-free): for all a x : O ℚ,
   `a * (x * a) - (a * x) * a = 0` i.e. `(leftReg? )` — but a is O, use raw: `L_a R_a = R_a L_a`
   as endomorphisms. STATE: `(leftRegO a).comp (rightRegO a) = (rightRegO a).comp (leftRegO a)`?
   Simpler at the ImO level: `lregI.comp rregI = rregI.comp lregI` via mul_flex on u1. Proof:
   ext x; show u1*(x*u1) = (u1*x)*u1; exact mul_flex u1 x  (orientation!). VERIFY orientation.
2. `foldReg_torus_rank_two` (★★ non-vacuity): lregI ≠ rregI (distinct — differ at e2O: lregI e2O
   = u1*e2O = e3O, rregI e2O = e2O*u1 = -e3O). W8.
3. `lregI_sq` / `rregI_sq` = -id (from leftReg_sq/rightReg_sq + gForm_u1M = 1). Both complex
   structures.
4. `foldVec := lregI + rregI`, `foldAx := lregI - rregI`. 
   - `foldVec_on_core` : foldVec 1 = 2•u1, foldVec u1 = -2•(1)  (support = span{1,u1}).
   - `foldVec_kills_charged` : foldVec e2O = 0 (and the charged units) — bounded coord `decide`/`ring`.
   - `foldAx_kills_core` : foldAx 1 = 0, foldAx u1 = 0.  (foldAx = 2•lregI-ish on charged only)
   - Actually foldAx = lregI - rregI = innerDeriv-like; on ImO foldAx = 2•chargeOp (N279/N240 tie).
5. `foldVec_restrict_ImO_eq_zero` (★★★ THE RANK COLLAPSE): the map ImO → O ℚ, x ↦ foldVec x, lands
   in span{1} ⊄ ImO for x ∈ ImO except at u1... precise: for x : ImO, foldVec x ∈ ImO ⟺ x has no
   u1-component; the ImO→ImO co-restriction is 0 on the charged part. Cleanest STATE:
   `∀ x : ImO, x ⟂ span{u1} → foldVec x = 0` (foldVec kills the charged imaginary units) AND
   `foldVec u1M ∉ ImO` (= -2•1). So foldVec carries NO ImO→ImO content beyond the u1 axis, which the
   adjoint rep (imRep) discards → rank-2 collapses to rank-1 on the vector-7. This is the ★2-ceiling
   dissolution content.
6. `colour_centralizes_both_faces` (★★): every colour derivation D (D u1 = 0, Leibniz) commutes
   with BOTH lregI and rregI: `[D, L_u1] = L_{D u1} = 0` (comm_deriv_JO = N201, JO = L_u1) and the
   RIGHT twin `[D, R_u1] = R_{D u1} = 0` (new right-Leibniz lemma). So colour centralizes the WHOLE
   neutral torus, not just the JO=L_u1 it was defined by. (Extends N201 to the right face.)
7. CAPSTONE `foldRoot_neutral_torus_structure` : bundles commute-on-O ∧ both -id ∧ distinct ∧
   support split ∧ foldVec kills charged ∧ (moat) `cap_forces_nonassoc` (NOT carrier-agnostic).

## SCOPE (do NOT overclaim)
Banks the flexibility-protected rank-2 neutral torus + its survival on O + eigen-split + the
rank-2→rank-1 collapse under the adjoint rep + colour centralizing both faces ONLY. NOT the mixing
angle / hypercharge NORMALIZATION VALUE (★2 — the VALUE ceiling STANDS; CHILD a route-finding node),
NOT parity (a symmetric torus is parity-conserving; the L/R hands are star-conjugate = a SYMMETRY,
measured), NOT masses/mixings (★5), NOT "= a specific SM neutral generator" (removable prose).

## W9 COST PLAN + KILL
- Every lever coordinate-free or bounded-8-coord: mul_flex (banked, its own maxHeartbeats already
  paid in Alternative.lean — we only APPLY it), leftReg_sq/rightReg_sq (banked), the support/kills
  facts are single-vector `decide`/`ring` on 8 coords (N279/N280 precedent, ~light).
- NO native_decide. NO proof-kernel maxHeartbeats raise (synthInstance bump OK, N280 precedent).
- KILL: if any single obligation's bounded probe exceeds ~60s or needs a maxHeartbeats raise → STOP,
  decompose (W9). Expect whole-module olean ~10-15s (coordinate-free core + a few bounded witnesses).
- MEASURE-FIRST: de-risk lemmas 1,2,3,4,5,6 in a bounded scratch probe (EXIT 0) BEFORE production.

## COSTUME C312: ⊢ 2 = 312 bites at the TORUS RANK (rank of {lregI, rregI} = 2), or ⊢ 1 = 312 at
the rank of the ImO-restriction (collapse to 1). Pick the rank-2 witness (finrank span {lregI,rregI}
in End(O ℚ) = 2) as the non-vacuity the costume defends. Decide RHS at costume time (next id C312).
