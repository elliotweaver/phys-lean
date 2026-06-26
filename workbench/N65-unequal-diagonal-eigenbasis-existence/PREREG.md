# N65 PREREG — THE FULL UNEQUAL-DIAGONAL EvC-ORTHONORMAL EIGENBASIS EXISTENCE (the discriminant radical)

FROZEN before compute. Build: `export LAKE=~/.elan/bin/lake && $LAKE build Phys.Algebra.<file>`.

## THE NODE
N64 banked the EQUAL-diagonal slice `txOp a b a = specOp (a+b)(a−b) uP uM` over the FIXED 45°
EvC-orthonormal eigenbasis (the discriminant `√((a−d)²+4b²)` vanishes there, eigenbasis
parameter-INDEPENDENT). N65 = the UNEQUAL-diagonal case (a ≠ d): the eigenvectors now ROTATE
with the parameters, the eigenvalues are the characteristic-polynomial roots
`λ± = (a+d)/2 ± √(((a−d)/2)²+b²)` via the trunk `cutSqrt` of the discriminant. The genuine
heavy core the ROADMAP §N65 (i) names.

## THE TRUNK REFRAME (THE ONE LAW)
The classical eigenproblem for `[[a,b],[b,d]]` needs the discriminant radical; the trunk supplies
it as the banked positive-definite scalar root `cutSqrt` (N57). Let `m=(a+d)/2`, `δ=(a−d)/2`,
`R = cutSqrt(δ²+b²)` (the discriminant radical). Eigenvalues `λ± = m ± R`. The two eigenvectors
`w₊ = (b, R−δ, 0)`, `w₋ = (R−δ, −b, 0)` are EvC-ORTHOGONAL (`EvC w₊ w₋ = b(R−δ)+(R−δ)(−b) = 0`)
with EQUAL squared norm `N = b²+(R−δ)² = 2R(R−δ)` (using `R² = δ²+b²`). For `b ≠ 0`, `N > 0`
(since `R > |δ| ≥ δ ⟹ R−δ > 0`), so normalizing by `cutSqrt N` gives the EvC-ORTHONORMAL
eigenbasis `u± = (1/cutSqrt N)•w±`, and `txOp a b d = specOp (m+R)(m−R) u₊ u₋` — N63
`specOp_op_sqrt` then delivers the operator square root for the positive-semidefinite slice.

## PLAN (bank-as-you-go, W9)
1. FORWARD rotation-pair decomposition (CERTAIN to bank — pure ring algebra, like N64):
   `rotA c s := (c,s,0)`, `rotB c s := (-s,c,0)`; for `c²+s²=1` EvC-orthonormal; and
   `specOp l₁ l₂ (rotA c s)(rotB c s) = txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)` — the WHOLE
   parametrized family of unequal-diagonal symmetric operators presented in their rotated
   eigenbasis (the forward map: rotation pair → unequal-diagonal txOp, escalating N64's fixed 45°).
   BANK THIS FIRST.
2. REVERSE general existence (the crown — attempt, the discriminant radical): for `b ≠ 0`,
   construct `u±` via `R = cutSqrt(δ²+b²)`, `nrm = cutSqrt N`, prove orthonormality and
   `txOp a b d = specOp (m+R)(m−R) u₊ u₋`. Key identities `R*R = δ²+b²`, `nrm*nrm = N = 2R(R−δ)`.
3. Concrete rational-rotation WITNESS (non-vacuity, MEASURE-FIRST (i)): a clean Pythagorean
   rotation (e.g. c=4/5, s=3/5) giving a concrete unequal-diagonal `txOp a b d` (a≠d) with its
   explicit operator square root via N63 `specOp_op_sqrt`.

## GO / NO-GO
- GO if the FORWARD decomposition + concrete witness bank foundations-only (guaranteed-tractable
  core). PLUS the REVERSE general existence if its cutSqrt algebra closes with `linear_combination`.
- If the REVERSE general existence FIGHTS the kernel (W9 signature) after measure: DECOMPOSE —
  bank forward + witness, child the reverse arbitrary-given existence + polar/KAK + connectedness
  + full Spin(9)→SO(9) exhaustion onto the chain tail (honest W1/W3, NOT a grind).

## KILL BUDGET (W9 — instrument-failure thresholds, frozen)
- Per obligation KILL = 30s. Any single `linear_combination`/`ring`/`simp` past 30s ⟹ INSTRUMENT
  failure (NOT theory): stop, measure smallest sub-obligation, decompose. NO inflated
  maxHeartbeats (default 200000), NO native_decide, NO brute monolith, NO sorry/axiom.
- If ≥2 probe iterations end with the reverse not closing ⟹ decompose (bank forward+witness,
  child reverse). Do not re-run a route already shown to blow up.
- Checkpoint at ~50% turns; finalize (commit + gate bg + child + complete) with turns to spare.

## ANTI-VACUITY (W8) — costume C96
C96 must bite a WRONG unequal-diagonal eigenvalue / eigendecomposition, reducing to a FALSE
numeric DISTINCT from the banked battery (…C94 16=15, C95 1=7). Plan: a concrete unequal-diagonal
witness's WRONG second eigenvalue read at the u₋ eigenblock via N63 `specOp_read₂`.

## STANDARD
Unbroken (every object from N57 cutSqrt / N58 EvC / N63 specOp,projC,specOp_op_sqrt / N64 txOp +
derived Cut + O Cut, NO new posit). Complete (foundations-only, verified vs olean). Words-removable
(delete Lorentz/boost/rotation/eigenbasis/eigenvalue/diagonal/orthonormal/discriminant/square-root
→ pure math about txOp/specOp/projC/EvC/cutSqrt over the derived ℝ Cut + O Cut). NO posited Lorentz
group, NO Mathlib ℝ/ℂ as content, NO bridge.
