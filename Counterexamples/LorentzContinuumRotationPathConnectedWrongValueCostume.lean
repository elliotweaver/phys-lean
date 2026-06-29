import Phys.Algebra.LorentzContinuumRotationPathConnected

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C185): A BOGUS COMPACT-FACTOR ROTATION-PATH / CAYLEY / CIRCLE / PATH-JOIN READ-OFF
-- — "THE CONTINUOUS ROTATION PATH DOES NOT GENUINELY ROTATE (so the compact factor is NOT
-- topologically path-joined to the identity through the circle, the rational Cayley parametrization
-- fails to steer a genuine rotation, the path is not continuous in the operator topology, the image
-- is not preconnected)".
-- N153 banks the rational (Cayley/stereographic) circle parametrization over the derived ℝ Cut
-- (cayleyC/cayleyS, stays EXACTLY on the circle cayley_on_circle, continuous WITHOUT a posited
-- cos/sin/exp), the rotation path rotPath m := planeRotLin (cayleyC m) (cayleyS m) CONTINUOUS in the
-- operator topology endOpC (rotPath_cont), every point a genuine QvC-isometry (rotPath_isQvIsomC),
-- starting at the identity (rotPath_zero) and reaching an arbitrary rotation (rotPath_reaches): the
-- compact factor is topologically path-joined to the identity (rotPath_joins_id_rotation). The
-- concrete W8 non-vacuity anchor is the quarter turn rotPath 1 = planeRotLin 0 1 GENUINELY rotating
-- the x-axis (0,1,0) into the real octonion axis: the new real octonion component reads
-- reQC ((rotPath 1 (0,1,0)).2.2) = 1 (rotPath_quarter_read). The path GENUINELY rotates, so the
-- connectedness construction is real, not vacuous.
--   THE BOGUS claim that this quarter-turn rotation read-off reads 153 (a stand-in for ANY wrong
-- rotation-path / Cayley / circle / path-join value: the path is not continuous in the operator
-- topology / does not begin at the identity / the image is not preconnected / the compact factor is
-- not path-joined to the identity / the rational parametrization does not stay on the circle) forces,
-- after rewriting by the genuine values (cayleyC 1 = 0, cayleyS 1 = 1, planeRotLin_apply, reQC of the
-- real octonion axis), the false numeric `(1 : Cut) = 153` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the continuous rotation path GENUINELY reads 1 on
-- the rotated real octonion axis at the quarter turn (a banked read-off over the derived field Cut),
-- so the claim of 153 is genuinely FALSE (1 ≠ 153 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 153` is DISTINCT from the banked battery (… C182 2=150, C183 1=151,
-- C184 1=152).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/compact/path/Cayley/circle/isometry/operator-
-- topology/continuity/connectedness/preconnected/identity-component/SO(9)/Spin(9)": over the derived
-- complete ordered field Cut, the rational map m ↦ planeRotLin ((1−m²)/(1+m²)) (2m/(1+m²)) at m = 1
-- sends (0,1,0) to a vector whose real octonion component reads 1; claiming it equals 153 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the continuous rotation path's quarter-turn read-off
    `reQC ((rotPath 1 (0,1,0)).2.2)` equals `153`. It GENUINELY equals `1` (the quarter turn
    `rotPath 1 = planeRotLin 0 1` rotates the `x`-axis into the real octonion axis). The WRONG claim
    that it is `153` (the rotation path is not continuous / does not begin at the identity / the image
    is not preconnected / the compact factor is not topologically path-joined to the identity / the
    rational parametrization does not stay on the circle) reduces, after rewriting by the genuine
    values, to the false numeric `(1 : Cut) = 153`, so this must NOT compile. -/
theorem rotation_path_wrong_value_BOGUS :
    reQC ((rotPath 1 ((0:Cut), (1:Cut), (0:O Cut))).2.2) = (153 : Cut) := by
  have hC : cayleyC 1 = 0 := cayleyC_one
  have hS : cayleyS 1 = 1 := by unfold cayleyS; norm_num
  rw [rotPath, hC, hS, planeRotLin_apply]
  show reQC ((0:O Cut) + (1 * 1 + (0 - 1) * reQC (0:O Cut)) • (1 : O Cut)) = 153
  rw [reQC_zero, zero_add]
  show reQC ((1 * 1 + (0 - 1) * 0) • (1 : O Cut)) = 153
  rw [reQC_smul, reQC_one]
  simp only [mul_one, mul_zero, add_zero]

end

end Counterexamples
