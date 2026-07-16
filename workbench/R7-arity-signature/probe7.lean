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
theorem assoc_zero_left (y z : O ℚ) : assoc (0:O ℚ) y z = 0 := by
  simp only [assoc, zero_mul]; abel
theorem obash_ab (a b : O ℚ) : assoc a b (a*b) = 0 := by
  unfold assoc; rw [sub_eq_zero]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;> ring
theorem asw12 (x y z : O ℚ) : assoc x y z = - assoc y x z :=
  eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
theorem asw23 (x y z : O ℚ) : assoc x y z = - assoc x z y :=
  eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)

-- slot-1 span extension: if assoc vanishes on generators in slot 1, it vanishes on span
theorem assoc_slot1_span {S : Set (O ℚ)} {y z : O ℚ}
    (hgen : ∀ g ∈ S, assoc g y z = 0) {x : O ℚ} (hx : x ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hx using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_left y z
  | add p q _ _ hp hq => rw [assoc_add_left, hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_left, hp, smul_zero]

end Phys.Algebra
