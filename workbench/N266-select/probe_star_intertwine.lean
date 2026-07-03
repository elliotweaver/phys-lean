import Phys.Algebra.TowerWorldMapChirality

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- THE CRUX (pointwise): star(a·x) = −(star x · a)  for a ∈ ImO
theorem star_leftMul_eq (a : ImO) (x : O ℚ) :
    star ((a : O ℚ) * x) = -(star x * (a : O ℚ)) := by
  have ha : star (a : O ℚ) = -(a : O ℚ) := by
    have := (mem_ImO).mp a.2; simpa using this
  rw [star_mul, ha, mul_neg]

-- THE CRUX (operator form): starL ∘ leftReg a = − rightReg a ∘ starL
theorem starL_leftReg_intertwine (a : ImO) :
    starL.comp (leftReg a) = - (rightReg a).comp starL := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply, starL_apply,
    LinearMap.neg_apply]
  exact star_leftMul_eq a x

-- star is an involution (banked star_star), as an endomorphism identity
theorem starL_involutive : starL.comp starL = LinearMap.id (R := ℚ) (M := O ℚ) := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, starL_apply, LinearMap.id_apply, star_star]

-- THE DERIVED EXCHANGE: rightReg a = − starL ∘ leftReg a ∘ starL
theorem rightReg_eq_star_conj (a : ImO) :
    rightReg a = - (starL.comp ((leftReg a).comp starL)) := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply, starL_apply,
    LinearMap.neg_apply]
  have ha : star (a : O ℚ) = -(a : O ℚ) := by
    have := (mem_ImO).mp a.2; simpa using this
  rw [star_mul, ha, star_star, mul_neg, neg_neg]


#print axioms star_leftMul_eq
#print axioms starL_leftReg_intertwine
#print axioms starL_involutive
#print axioms rightReg_eq_star_conj

end Phys.Algebra
