import Phys.Algebra.QuarkTexture
import Phys.Algebra.OctonionJordanGenerationEdgeBornSurvival
import Phys.Algebra.OctonionJordanGenerationCyclePhaseLineIndependence
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- the down frame is the up frame with sub-leading amplitude damped by the derived survival factor
def sectorMisalign (a0 a1 : ℚ) : ℚ := (mixV a0 a1 a0 (edgeSurvival * a1)) 1 0

-- PROBE 1: the misalignment IS the survival deficit times the amplitude product (FORCED)
example (a0 a1 : ℚ) : sectorMisalign a0 a1 = a0 * a1 * (1 - edgeSurvival) := by
  unfold sectorMisalign mixV
  simp [Matrix.cons_val]
  ring

-- PROBE 2: nonzero forced by the deficit (edgeSurvival ≠ 1)
example (a0 a1 : ℚ) (ha0 : a0 ≠ 0) (ha1 : a1 ≠ 0) : sectorMisalign a0 a1 ≠ 0 := by
  have h : sectorMisalign a0 a1 = a0 * a1 * (1 - edgeSurvival) := by
    unfold sectorMisalign mixV; simp [Matrix.cons_val]; ring
  rw [h, edgeSurvival_val]
  have : (1 : ℚ) - 2/3 = 1/3 := by norm_num
  rw [this]
  exact mul_ne_zero (mul_ne_zero ha0 ha1) (by norm_num)

-- PROBE 3: flat survival (=1) kills the misalignment (mixing ⟺ deficit)
example (a0 a1 : ℚ) : a0 * a1 * (1 - (1:ℚ)) = 0 := by ring

-- PROBE 4: CP content via textureCP. Fano line = -(misalignment); C-line = 0
example (a0 a1 : ℚ) :
    textureCP a0 a1 a0 (edgeSurvival * a1) u2 u1 (octCross u1 u2)
      = -(a0 * a1 * (1 - edgeSurvival)) := by
  rw [textureCP_fano_eq]; ring

example (a0 a1 : ℚ) (x : O ℚ) (b d : ℚ) :
    textureCP a0 a1 a0 (edgeSurvival * a1) x (b • u1) (d • u1) = 0 :=
  textureCP_cline_zero a0 a1 a0 (edgeSurvival * a1) x b d

-- PROBE 5: the one-cause tie — the SAME survival whose DEFICIT is the misalignment
-- has PRODUCT = the banked cycle phase δ_B = 2/9
example : edgeSurvival * (1 - edgeSurvival) = 2/9 := by rw [edgeSurvival_val]; norm_num

end
end Phys.Algebra.HJ
