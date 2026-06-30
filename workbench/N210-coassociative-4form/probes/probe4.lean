import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.Alternative
import Phys.Algebra.OctonionCrossProduct

namespace Phys.Algebra.N210Probe4

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def coassoc4 (x y z w : O ℚ) : ℚ := gForm (assoc x y z) w

abbrev wa : O ℚ := (CD.iota (ιJ ℚ) : O ℚ)
abbrev wb : O ℚ := (CD.iota (CD.e2 : H ℚ) : O ℚ)
abbrev wc : O ℚ := (CD.e2 : O ℚ)

theorem coassoc4_witness_ne_zero : coassoc4 wa wb wc (assoc wa wb wc) ≠ 0 := by
  unfold coassoc4
  exact fun h => assoc_nonvanishing (gForm_self_eq_zero.mp h)

set_option maxHeartbeats 1000000 in
theorem coassoc4_witness_coord_val : coassoc4 wa wb wc (assoc wa wb wc) = 4 := by
  unfold coassoc4 gForm assoc wa wb wc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, CD.iota, CD.e2, ιJ, Dbl.J,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im, Dbl.one_re, Dbl.one_im,
    CD.one_re, CD.zero_im, star_zero, star_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  norm_num

end

#print axioms coassoc4_witness_ne_zero
#print axioms coassoc4_witness_coord_val

end Phys.Algebra.N210Probe4
