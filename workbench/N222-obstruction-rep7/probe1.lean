import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.TowerGatherObstructionInvariant
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra.ProbeN222

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- MEASURE 1: the only possibly-heavy obligation — reQ(assoc x y z) = 0 (coordinate identity,
-- same shape as banked assoc_reQ_skew N210).
theorem reQ_assoc_zero (x y z : O ℚ) : reQ (assoc x y z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- MEASURE 2: bridge reQ = 0 → mem_ImO (converse of banked reQ_ImO_zero).
theorem mem_ImO_of_reQ_zero {x : O ℚ} (hx : reQ x = 0) : x ∈ ImO := by
  rw [mem_ImO]
  have ht := trace_id x
  rw [hx] at ht
  simp only [mul_zero, zero_smul] at ht
  -- ht : x + star x = 0
  exact eq_neg_of_add_eq_zero_right ht

-- MEASURE 3: THE HEADLINE — the associator (= obstruction) is ImO-valued (lands in the 7).
theorem assoc_mem_ImO (x y z : O ℚ) : assoc x y z ∈ ImO :=
  mem_ImO_of_reQ_zero (reQ_assoc_zero x y z)

-- MEASURE 4: the associator kills the trivial rep (unit) in each slot.
theorem assoc_one_left (y z : O ℚ) : assoc (1 : O ℚ) y z = 0 := by
  unfold assoc; simp [one_mul]
theorem assoc_one_mid (x z : O ℚ) : assoc x (1 : O ℚ) z = 0 := by
  unfold assoc; simp [one_mul, mul_one]
theorem assoc_one_right (x y : O ℚ) : assoc x y (1 : O ℚ) = 0 := by
  unfold assoc; simp [mul_one]

end Phys.Algebra.ProbeN222
