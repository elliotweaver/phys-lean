# N115 PREREG — THE x-MOVING → x-FIXING DEFLATION STEP (the SO(9)→SO(8) reduction)
*Frozen before compute. GO/NO-GO + KILL. This is the immediately-bankable structural piece of
ROADMAP §N115 priority (ii): "an x-MOVING isometry, post-composed with a suitable general-axis
ninth rotation, becomes x-FIXING (the deflation STEP of the SO(9)→SO(8) exhaustion)."*

## THE TARGET (MEASURE FIRST — priority (ii)'s named bankable piece)
The full GLOBAL EXHAUSTION (every compact QvC-isometry of x ⊕ 𝕆 is a finite enlarged-family word)
and the literal OPERATOR TOPOLOGY over Cut are the HEAVY group-manifold remainder. Per W1/W9
MEASURE FIRST + reframe through the trunk: do NOT grind the global surjectivity / build an operator
topology Mathlib lacks over Cut. Bank the concrete, light, immediately-bankable DEFLATION STEP that
the deflation induction is built on, and child the global remainder.

THE STRUCTURAL FACT (DERIVED from the trunk, NOT a posited Cartan/KAK decomposition):
Let T be ANY compact QvC-isometry with T(0,1,0) = (0, x', v') (the x-axis unit vector's image under
T). Isometry forces x'² + gFormC v' v' = 1 (the unit-sphere condition, from QvC preservation:
QvC(0,1,0) = −1 = QvC(0,x',v') = −(x'²+gFormC v' v')). If T MOVES x (v' ≠ 0), there is an EXPLICIT
general-axis ninth rotation `deflateNinth x' v'` (an `axisRotLin` member of the enlarged family
`genIsomMonoidLinFamily`, N113) that rotates the moved image (0,x',v') BACK to (0,1,0):

    deflateNinth x' v' := axisRotLin (r⁻¹ • v') x' (−r),   r := cutSqrt (gFormC v' v')

reading axis e = r⁻¹•v' (a UNIT axis: gFormC e e = gFormC v' v'/r² = 1) and circle point (x', −r)
(on the unit circle: x'² + r² = x'² + gFormC v' v' = 1). The computation (pure gFormC bilinearity +
cutSqrt_sq, r·r = gFormC v' v'):
  - x-slot:  x'·x' − (−r)·(gFormC v' e)= x'² + r·r = x'² + gFormC v' v' = 1.
  - v-block: v' + (−r·x' + (x'−1)·r)•e = r•e + (−r·x'+x'·r−r)•e = (r−r)•e = 0   (since v' = r•e).
So deflateNinth x' v' (0,x',v') = (0,1,0). Hence the composite `deflateNinth x' v' * T` FIXES the
x-axis unit vector: (deflateNinth x' v' * T)(0,1,0) = (0,1,0). The x-motion is PEELED OFF by a single
explicit general-axis ninth rotation — the deflation STEP that reduces SO(9) to the x-fixing
stabilizer (= the SO(8) octonion-block problem, the childed global remainder).

## WHAT GETS BANKED (≈9–11 production decls, foundations-only)
1. `deflateNinth e u w … ` def — the explicit deflating general-axis ninth rotation.
2. `deflateNinth_axis_unit` — v'≠0 ⇒ the normalized axis r⁻¹•v' is a UNIT (gFormC = 1).
3. `deflateNinth_axis_gFormC` — gFormC v' (r⁻¹•v') = r (the read component).
4. `deflateNinth_circle` — the norm condition ⇒ x'² + (−r)² = 1 (circle point).
5. `deflateNinth_mem` — SOUND ∈ genIsomMonoidLinFamily (axisRotLin_mem + unit + circle).
6. `deflateNinth_isQvIsomC` — a QvC-isometry (family soundness).
7. `deflateNinth_apply_image` — ★★ deflateNinth x' v' (0,x',v') = (0,1,0) (the rotate-back).
8. `isom_xaxis_image_norm` — IsQvIsomC T ⇒ T(0,1,0)=(0,x',v') ⇒ x'²+gFormC v' v' = 1.
9. `deflateNinth_step` — ★★ THE DEFLATION STEP: IsQvIsomC T, T(0,1,0)=(0,x',v'), v'≠0 ⇒
   (deflateNinth x' v' * T)(0,1,0) = (0,1,0). The x-moving→x-fixing reduction.
10. W8 teeth — a concrete x-moving image witness `(3/5, (4/5)•e₂)` (g = 16/25, r = 4/5, norm 1)
    deflated back to (0,1,0); the x-slot of the deflated image reads `1`. Costume C147 bites a
    WRONG deflation coordinate (false numeric DISTINCT from C145 4/5=97, C146 12/13=101).

## GO / NO-GO
GO if: all decls elaborate foundations-only [propext, Classical.choice, Quot.sound] over the derived
ℝ Cut + O Cut; the deflation map identity (0,x',v')↦(0,1,0) PROVES via gFormC bilinearity +
cutSqrt_sq (NO brute, NO native_decide, NO inflated maxHeartbeats); the costume bites; physics-words
removable (delete deflation/rotation/axis/isometry/SO(9)/SO(8)/sphere/circle/ninth → pure linear
algebra over Cut: for v'≠0, axisRotLin (r⁻¹•v') x' (−r) sends (0,x',v') to (0,1,0)).
NO-GO / DECOMPOSE if: the deflation map computation resists (it should not — it is N113-N114-style
coordinate algebra); then bank the lighter sub-pieces (unit/circle/sound) and child the apply-image.

## KILL (W9 — classify a fight as INSTRUMENT failure, not theory)
KILL = 90s per single obligation. Every coordinate goal here is a finite gFormC-bilinearity rewrite +
one cutSqrt_sq substitution + `ring`/`field_simp` — bounded, like N113/N114 (≤8s scratch, ≤7s cached
build). If ANY single obligation exceeds 90s: STOP, it is an instrument wall — the framing is wrong
(probably a missing `r ≠ 0` / `0 ≤ g` side-goal forcing nlinarith to thrash); MEASURE the smallest
sub-obligation, decompose, do NOT inflate heartbeats. NO monolithic brute on an expanded coordinate.

## ANTI-DRIFT
This DERIVES the deflation step from the banked trunk (axisRotLin N113, cutSqrt N57, gFormC
positivity N56) — it does NOT posit a Lorentz group, does NOT import Mathlib ℝ/ℂ as content (the
field IS the derived Cut), does NOT build an operator topology, does NOT bridge. The global
exhaustion / operator topology stays the honestly-childed W1 remainder (N116).
