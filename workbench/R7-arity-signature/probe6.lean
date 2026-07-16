import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

theorem assoc_add_right' (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel
theorem assoc_smul_right' (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]

-- swaps in module form
theorem assoc_swap12' (x y z : O ℚ) : assoc x y z = - assoc y x z :=
  eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
theorem assoc_swap23' (x y z : O ℚ) : assoc x y z = - assoc x z y :=
  eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)

-- KEY generated witness [a,b,ab]=0
theorem obash_ab (a b : O ℚ) : assoc a b (a*b) = 0 := by
  unfold assoc; rw [sub_eq_zero]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;> ring

-- ★ THE arity-2-generated span-4 vanishing:
-- associator vanishes when all THREE args lie in span{1,a,b,ab}
theorem assoc_span4_vanishes (a b : O ℚ) {x y z : O ℚ}
    (hx : x ∈ Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ)))
    (hy : y ∈ Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ)))
    (hz : z ∈ Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ))) :
    assoc x y z = 0 := by
  sorry

end Phys.Algebra
