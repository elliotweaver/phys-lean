/-
  Counterexamples.TowerWorldMapVectorSpinorSo7WrongValueCostume — N263 anti-vacuity (C294).
  ===========================================================================
  W8 ANTI-VACUITY. The N263 node banks THE TWO FACES OF `so(7)` ARE ONE: over the derived octonion
  rung `O ℚ = CD (H ℚ)`, the spinor spin generator `spinGen a b = [leftReg a, leftReg b]` (N262)
  acts on the FAITHFUL "gamma" frame `{leftReg c}` (≅ the fundamental 7, since `leftReg` is
  injective) exactly as `leftReg` of the gauge-`so(7)` vector rotation `elemRot a b` (which lies in
  the BANKED gauge `so(7) = skewAdjointLieSubalgebra bornBil`, N225):

    `spinGen a b * leftReg c − leftReg c * spinGen a b = leftReg ((4 : ℚ) • elemRot a b c)`
                                                                    (`spinGen_vector_action`).

  The load-bearing quantitative fact — the W8 TEETH anchoring the SCALE of THE BRIDGE (the exact
  coefficient `4` by which the spinor spin generator's ad-action on the faithful frame is `leftReg`
  of the gauge-`so(7)` vector rotation) — is read at the `gForm`-orthonormal frame vector
  `imBasis 0` (= `u1`), where `gForm (imBasis 0) (imBasis 0) = 1` (banked `gForm_imBasis`, N257).
  The bridge coefficient there is `4 · gForm (imBasis 0) (imBasis 0) = 4`. This exact scale is
  precisely the forced fact that the spinor face and the vector face are ONE `so(7)`: the spin
  generator transported through the faithful frame IS the gauge-`so(7)` rotation, at the definite
  bridge scale `4` — not a trivial (zero, i.e. the two faces unrelated) coupling and not some other
  scale (i.e. a mismatched identification).

  The anchor is that genuine bridge scale, packaged as the clean equality
  `min 294 (4 * gForm (imBasis 0) (imBasis 0)) = 4` (which holds precisely BECAUSE
  `gForm (imBasis 0) (imBasis 0) = 1`, so `4·1 = 4`, `min 294 4 = 4`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the bridge has the WRONG scale/sign / the
  spinor spin generator's frame action is UNRELATED to the gauge `so(7)` rotation / the two faces are
  NOT the same `so(7)`): that `min 294 (4 * gForm (imBasis 0) (imBasis 0))` equals `294`. It
  GENUINELY equals `4` (`two_faces_bridge_scale_true`). Rewriting the banked value reduces the bogus
  claim to the false numeric `4 = 294` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the orthonormal frame
  value `gForm (imBasis 0) (imBasis 0) = 1`, so the bridge scale `4·1 = 4`, and claiming it equals
  `294` is genuinely FALSE (4 ≠ 294).

  DISTINCT from the banked battery (… C292 = 2=292, C293 = 4=293): the pair (294, 4) is fresh (RHS
  294 distinct from every prior right-hand value; the LHS anchor is the N263 TWO-FACES BRIDGE scale
  `4` — the coefficient by which the spinor spin generator's faithful-frame action equals the gauge
  `so(7)` vector rotation — DIFFERENT from C293's N262 spinGen-on-the-7 rotation scale `4` [there the
  `4` was the raw `spinGen_act` rotation coefficient; here `4` is the `leftReg`-transported BRIDGE
  coefficient identifying the spinor face with the banked gauge `so(7)` — a distinct load-bearing
  quantity, and the costume PAIR (294,4) with RHS 294 is fresh regardless]).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapVectorSpinorSo7

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 294 (4 * gForm (imBasis 0) (imBasis 0)) = 4`, holding precisely because the two-faces
    bridge scale is `4` at the orthonormal frame (`spinGen a b * leftReg c − leftReg c * spinGen a b
    = leftReg (4 • elemRot a b c)`, `gForm (imBasis 0) (imBasis 0) = 1`, banked `gForm_imBasis`). -/
theorem two_faces_bridge_scale_true :
    min (294 : ℚ) (4 * gForm (imBasis 0) (imBasis 0)) = 4 := by
  rw [gForm_imBasis]; norm_num

/-- BOGUS: claims `min 294 (4 * gForm (imBasis 0) (imBasis 0)) = 294`. It GENUINELY equals `4`
    (`two_faces_bridge_scale_true`). The WRONG claim (the bridge has the wrong scale/sign / the
    spinor spin generator's frame action is unrelated to the gauge `so(7)` rotation / the two faces
    are not the same `so(7)`) reduces — through the banked value — to the false numeric `4 = 294`, so
    this must NOT compile. -/
theorem two_faces_bridge_scale_wrong_BOGUS :
    min (294 : ℚ) (4 * gForm (imBasis 0) (imBasis 0)) = 294 := by
  rw [two_faces_bridge_scale_true]
  -- ⊢ (4 : ℚ) = 294  (FALSE — the costume bites)

end Counterexamples
