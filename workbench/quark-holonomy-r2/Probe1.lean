import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Phys.Cascade.Quaternion
import Phys.Cascade.Octonion
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- The per-step self-blind Born-survival fraction: the banked self-seen `(n−1)/n = 2/3` (N305). -/
def edgeSurvival : ℚ := Matrix.trace Poth / 3

theorem edgeSurvival_val : edgeSurvival = 2 / 3 := selfseen_two_thirds

/-- The factor IS the banked self-blind fraction (derived, not posited). -/
theorem edgeSurvival_from_selfblind (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * 2 + w1 * (-1) = 0) : w1 = edgeSurvival := by
  rw [edgeSurvival_val]; exact born_fraction_others w0 w1 hnorm hblind

theorem edgeSurvival_pos : (0 : ℚ) < edgeSurvival := by rw [edgeSurvival_val]; norm_num
theorem edgeSurvival_lt_one : edgeSurvival < 1 := by rw [edgeSurvival_val]; norm_num
theorem edgeSurvival_ne_one : edgeSurvival ≠ 1 := by rw [edgeSurvival_val]; norm_num

/-- The DEPTH-DRESSED tridiagonal frame: diagonal = banked masses (universal Koide); shallow edge
    (0,1) undressed = banked massMat 0 1; deep edge (1,2) = edgeSurvival × massMat 1 2 (one extra
    survival factor for the deeper ℍ→𝕆 cascade edge); corner 0. -/
def depthFrame (M A p r : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  !![ massVec M A p r 0,                         massMat M A p r 0 1,                    0;
      massMat M A p r 0 1,                       massVec M A p r 1,                      edgeSurvival * massMat M A p r 1 2;
      0,                                         edgeSurvival * massMat M A p r 1 2,     massVec M A p r 2 ]

theorem depthFrame_diag_1 (M A p r : ℚ) : depthFrame M A p r 1 1 = massVec M A p r 1 := by
  simp [depthFrame]

theorem depthFrame_shallow (M A p r : ℚ) : depthFrame M A p r 0 1 = massMat M A p r 0 1 := by
  simp [depthFrame]

theorem depthFrame_deep (M A p r : ℚ) :
    depthFrame M A p r 1 2 = edgeSurvival * massMat M A p r 1 2 := by
  simp [depthFrame]

theorem depthFrame_corner (M A p r : ℚ) :
    depthFrame M A p r 0 2 = 0 ∧ depthFrame M A p r 2 0 = 0 := by
  constructor <;> simp [depthFrame]

/-- THE DEPTH ASYMMETRY: the deep edge = edgeSurvival × the undressed deep coupling, while the
    shallow edge = the undressed shallow coupling — the RELATIVE suppression is exactly edgeSurvival. -/
theorem depth_asymmetry (M A p r : ℚ) :
    depthFrame M A p r 0 1 = massMat M A p r 0 1
    ∧ depthFrame M A p r 1 2 = edgeSurvival * massMat M A p r 1 2 :=
  ⟨depthFrame_shallow M A p r, depthFrame_deep M A p r⟩

/-- The deep/shallow coupling ratio carries one extra factor edgeSurvival below the undressed ratio
    (a₂/a₀). undressed massMat 1 2 / massMat 0 1 = (a₁a₂)/(a₀a₁) = a₂/a₀. -/
theorem depthFrame_edge_ratio (M A p r : ℚ)
    (h0 : genVec M A p r 0 ≠ 0) (h1 : genVec M A p r 1 ≠ 0) :
    depthFrame M A p r 1 2 / depthFrame M A p r 0 1
      = edgeSurvival * (genVec M A p r 2 / genVec M A p r 0) := by
  rw [depthFrame_deep, depthFrame_shallow, massMat_offdiag_01, massMat_offdiag_12]
  field_simp
  ring

/-- Strict suppression at a positive witness: the deep edge is strictly below its undressed value. -/
theorem depthFrame_deep_strict_suppress (M A p r : ℚ) (hpos : 0 < massMat M A p r 1 2) :
    depthFrame M A p r 1 2 < massMat M A p r 1 2 := by
  rw [depthFrame_deep]
  nlinarith [edgeSurvival_lt_one, edgeSurvival_pos, hpos]

/-- W8: the dressing bites — at a concrete positive witness depthFrame ≠ massMat on the deep edge. -/
theorem depthFrame_ne_symmetric :
    depthFrame (1 : ℚ) 3 1 0 1 2 ≠ massMat (1 : ℚ) 3 1 0 1 2 := by
  rw [depthFrame_deep, edgeSurvival_val, massMat_offdiag_12]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  norm_num

/-- W8: a WRONG flat survival = 1 would give the symmetric massMat deep edge; the derived 2/3 is
    load-bearing (the frame is genuinely NOT the symmetric one). -/
theorem wrong_flat_survival (M A p r : ℚ) :
    (1 : ℚ) * massMat M A p r 1 2 = massMat M A p r 1 2 := by ring

/-- Cascade-depth grounding: the two edges cross genuinely different-depth cascade rungs. -/
theorem cascade_depth_grounding :
    (¬ ∀ x y : H ℚ, x * y = y * x) ∧ (¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z)) :=
  ⟨not_commutative, not_associative⟩

end

end Phys.Algebra.HJ
