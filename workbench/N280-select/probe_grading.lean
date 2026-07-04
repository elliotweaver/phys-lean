import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapChirality

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- KEY STRUCTURAL FACT: the mixed commutator [L_a, R_b] x = a(xb) - (ax)b = -assoc(a,x,b) (N264).
-- At a = b, flexibility (alt_flex: assoc x y x = 0) gives [L_a, R_a] = 0 STRUCTURALLY on ALL of O.
-- So the LEFT and RIGHT complex structures of the SAME imaginary unit COMMUTE on the whole spinor.

/-- The two hand-operators of the fold √-1 u1 COMMUTE on the full spinor O ℚ, coordinate-free,
    from FLEXIBILITY (alt_flex). This is the structural fact the coordinate bash could not close. -/
theorem Lu1_Ru1_commute (y : O ℚ) :
    (leftReg u1M) ((rightReg u1M) y) - (rightReg u1M) ((leftReg u1M) y) = 0 := by
  -- (L_a R_a - R_a L_a) y = a*(y*a) - (a*y)*a = -(assoc a y a)
  have hmix := chir_mixed_apply u1M u1M y
  -- hmix : leftReg u1M (rightReg u1M y) - rightReg u1M (leftReg u1M y) = u1*(y*u1) - (u1*y)*u1
  rw [hmix]
  -- u1*(y*u1) - (u1*y)*u1 = -(assoc u1 y u1) = -0 = 0
  have hflex : assoc (u1M : O ℚ) y (u1M : O ℚ) = 0 := alt_flex (u1M : O ℚ) y
  show (u1M : O ℚ) * (y * (u1M : O ℚ)) - ((u1M : O ℚ) * y) * (u1M : O ℚ) = 0
  have : assoc (u1M : O ℚ) y (u1M : O ℚ)
       = ((u1M : O ℚ) * y) * (u1M : O ℚ) - (u1M : O ℚ) * (y * (u1M : O ℚ)) := rfl
  rw [this] at hflex
  linear_combination (norm := module) -hflex

/-- L_u1 squared = -id on the spinor (banked leftReg_sq + gForm_u1 = 1). -/
theorem Lu1_sq : (leftReg u1M).comp (leftReg u1M) = (-1 : ℚ) • LinearMap.id := by
  rw [leftReg_sq u1M, show gForm (u1M : O ℚ) (u1M : O ℚ) = 1 from gForm_u1]

/-- R_u1 squared = -id on the spinor (banked rightReg_sq + gForm_u1 = 1). -/
theorem Ru1_sq : (rightReg u1M).comp (rightReg u1M) = (-1 : ℚ) • LinearMap.id := by
  rw [rightReg_sq u1M, show gForm (u1M : O ℚ) (u1M : O ℚ) = 1 from gForm_u1]

-- So on the 8-dim spinor O ℚ we have TWO COMMUTING complex structures L_u1, R_u1, each squaring
-- to -1 → the pair (L_u1, R_u1) gives a joint ℤ/2 × ℤ/2 = 4-fold grading (the ±i,±i joint
-- eigenspaces over the derived complex line). This is the CHIRAL x CHARGE grading of matter,
-- read off the two hands of the ONE fold √-1. NEW (not N191/derivations, not N279/left-only).

-- Non-vacuity: L_u1 ≠ R_u1 (the two hands are genuinely distinct — probe_indep already showed this).
-- And the joint operator L_u1 ∘ R_u1 also squares to +id (product of two commuting sqrt(-1)):
theorem LRu1_sq : ((leftReg u1M).comp (rightReg u1M)).comp ((leftReg u1M).comp (rightReg u1M))
      = (1 : ℚ) • LinearMap.id := by
  have hcomm : (rightReg u1M).comp (leftReg u1M) = (leftReg u1M).comp (rightReg u1M) := by
    apply LinearMap.ext; intro y
    have h := Lu1_Ru1_commute y
    simp only [LinearMap.comp_apply] at h ⊢
    rw [sub_eq_zero] at h
    exact h.symm
  -- (L∘R)∘(L∘R) = L∘(R∘L)∘R = L∘(L∘R)∘R = (L∘L)∘(R∘R)
  have hexp : ((leftReg u1M).comp (rightReg u1M)).comp ((leftReg u1M).comp (rightReg u1M))
      = ((leftReg u1M).comp (leftReg u1M)).comp ((rightReg u1M).comp (rightReg u1M)) := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.comp_apply]
    have := congrArg (fun f => f ((rightReg u1M) y)) hcomm
    simp only [LinearMap.comp_apply] at this
    rw [this]
  rw [hexp, Lu1_sq, Ru1_sq]
  apply LinearMap.ext; intro y
  simp only [LinearMap.comp_apply, LinearMap.smul_apply, LinearMap.id_apply, smul_smul]
  norm_num

end
end Phys.Algebra
