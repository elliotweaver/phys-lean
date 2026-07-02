# N253 PREREG — THE CONVENTION-FREE CHARGE:ISOSPIN INVARIANT-LENGTH RATIO 3:8 in the ambient so(7)

FROZEN BEFORE PRODUCTION COMPUTE. (Selection reasoning is in the kanban comment thread S1–S4.)

## TARGET (one definitive node, selected via SELECT S1–S5, anti-bullshit gate passed)
Over the fundamental 7 = `ImO` of the derived octonion rung `O ℚ = CD (H ℚ)`, with the trace form
`B(A,B) := LinearMap.trace ℚ ImO (A ∘ B)` (Mathlib machinery on the DERIVED `ImO`):
  1. `B(chargeOp, chargeOp) = -6`   (chargeOp = crossOp u1, the forced gather charge op, N240)
  2. `B(imRep DI, imRep DI) = -16`   (DI = ⟨innerDerivQ hI⟩, the weak-isospin Cartan, N202)
  3. `B(chargeOp, imRep DI) = 0`     (charge ⊥ isospin Cartan; also DJ, DK → 0)
  4. THE HEADLINE RATIO: `8 * B(chargeOp,chargeOp) = 3 * B(imRep DI, imRep DI)` (both = -48),
     i.e. |Q|² : |T3|² = 3 : 8, convention-free (ImO g₂-irreducible N234 ⇒ Schur ⇒ form unique
     up to scale ⇒ ratio scale-invariant).
  5. W8 teeth: the ratio is genuinely 3:8 (not 1:1, not 0/0).

## SCOPE (honesty clause — do NOT overclaim; the node's own guardrail)
The theorem is PURELY the invariant-length ratio + orthogonality of two forced so(7) elements.
3:8 coincides with SU(5) tree-level sin²θ_W but this node does NOT claim to derive the physical
weak mixing angle (couplings/running/generation embedding = separate downstream node). Banks the
convention-free ANCHOR, not the normalization. No physics word is load-bearing.

## ROUTE (W9-LIGHT: integer 7×7 matrix arithmetic, NO coordinate bash of trace directly)
Banked machinery (TowerGatherIrreducible27, N234):
  - `qI : M7 → Module.End ℚ ImO`  (integer 7×7 matrix as endomorphism of ImO)
  - `qI_comp : qI M * qI N = qI (mul7 M N)`
  - `trace_qI : LinearMap.trace ℚ ImO (qI M) = (tr7 M : ℚ)`
  - `imRep_DL_k : imRep (DL k) = qI (dm k)`  (k = 0..13)
STEPS:
  (a) BRIDGE 1: `chargeOp = qI Cmat` for the explicit integer matrix Cmat (proof shape = imRep_DL_0:
      `LinearMap.ext; Subtype.ext; show crossOpO u1 (x) = qZ Cmat x; ext <;> simp[...] <;> ring`).
  (b) BRIDGE 2: `imRep DI = qI Imat` (DI = ⟨innerDerivQ hI,…⟩; same shape via innerDerivQ/innerDeriv).
  (c) Then B(qI A, qI B) = trace(qI A ∘ qI B) = trace(qI (mul7 A B)) = tr7(mul7 A B) — a `decide`/`rfl`
      integer computation. Each headline is `rw [bridge, bridge, trace form via qI_comp+trace_qI]`.
  (d) g₂-invariance of B is automatic (trace of a bracket = 0, Mathlib `LinearMap.trace_lie`), stated
      as a corollary if cheap; NOT load-bearing for the ratio.

## FROZEN MATRICES (qI convention: row i = output coord e_{i+1}, col j = input coord e_{j+1})
Cmat (chargeOp = crossOp u1):
  [0,0,0,0,0,0,0]/[0,0,-1,0,0,0,0]/[0,1,0,0,0,0,0]/[0,0,0,0,-1,0,0]/[0,0,0,1,0,0,0]/[0,0,0,0,0,0,1]/[0,0,0,0,0,-1,0]
Imat (imRep DI):
  [0,0,0,0,0,0,0]/[0,0,-2,0,0,0,0]/[0,2,0,0,0,0,0]/[0,0,0,0,0,0,0]/[0,0,0,0,0,0,0]/[0,0,0,0,0,0,-2]/[0,0,0,0,0,2,0]
Verified (freeze_matrices.py): tr7(Cmat·Cmat)=-6, tr7(Imat·Imat)=-16, tr7(Cmat·Imat)=0, 8·(-6)=3·(-16)=-48. ✓

## EXPECTED VALUES (must match or STOP — the theory is right, instrument is wrong)
B(Q,Q)=-6, B(DI,DI)=-16, B(Q,DI)=0, ratio 3:8. Any deviation ⇒ THE ONE LAW: re-examine the bridge
matrices/convention, NOT the theory. (Numeric model already confirmed these exactly.)

## GO / NO-GO
GO if: both bridge lemmas compile foundations-only, the three trace values come out exactly as frozen,
the ratio theorem closes, costume bites. 
NO-GO / DECOMPOSE (W3) if: a bridge lemma's `ext <;> simp <;> ring` blows up (W9) — then reduce via
the banked qZ coordinate lemmas; if still heavy, child a route-finding node (still gather-side).

## KILL BUDGET (W9)
- Any single obligation > 90s or > 200000 heartbeats ⇒ STOP, measure smallest sub-piece, decompose.
- Whole-module olean build target < 30s (comparable to N252 ~15s). If > 60s, decompose the bridges.
- NO maxHeartbeats raise. NO `native_decide`. NO monolithic ring on the trace directly.

## COSTUME (C284)
A WRONG ratio: claim `min 284 (something forcing 3:8) = 284` reduces through the banked trace values
to a false numeric. Concretely anchor on B(Q,Q): e.g. the true `(-8 * B(chargeOp chargeOp)).toNat`-style
or a clean `min 284 (…)`. FINAL form decided at costume-authoring; the bite is `1 = 284` (or `48 = 284`)
through the frozen ratio. Pair (284, RHS) fresh vs the banked battery (… C282 8=282, C283 1=283).

## NAMES (collision-checked, all 0 hits in Phys/ Counterexamples/ Audits/)
File: Phys/Algebra/TowerGatherChargeIsospinRatio.lean
Decls: Cmat, Imat, chargeOp_eq_qI, imRep_DI_eq_qI, traceForm7 (abbrev), B_chargeOp_chargeOp,
B_imRep_DI, B_chargeOp_imRep_DI, chargeOp_orthogonal_isospin, charge_isospin_ratio (headline),
charge_isospin_ratio_structure (capstone). Costume: TowerGatherChargeIsospinRatioWrongValueCostume.

## STANDARD / MOAT
UNBROKEN (chargeOp N240, imRep/DI N202, qI/trace_qI/imRep_DL N234, ImO N22, all banked; ground
derived ℚ; NO Mathlib ℝ/ℂ as content). COMPLETE (foundations-only, no sorry/axiom/native_decide).
WORDS-REMOVABLE (delete charge/isospin/hypercharge/weak-mixing: two banked skew endomorphisms of ImO
have fundamental-7 trace-form ratio 3:8 and are trace-orthogonal). FREE-FLOATING check: every headline
TYPE mentions the banked tower objects chargeOp/imRep/DI/ImO on the derived O ℚ — NOT carrier-agnostic.
LOCK: derives from the gather object (chargeOp = N240 tear; so(7) = N225 adjoint); NOT the parked
J₃(O) invariant-tower ASCENT (this trace is the g₂-rep trace on the fundamental 7, the N204 kind).
