/- PROBE (run 69): cleaned asw_star for production banking. Over CD (CD B):
   assoc x y z + star (assoc x y z) = 0  (the associator is pure-imaginary). -/
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe69ASW
open Phys.Cascade Phys.Cascade.CD Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
variable {B : Type*} [CommRing B] [StarRing B]

set_option maxHeartbeats 4000000 in
theorem asw_star (x y z : CD (CD B)) :
    assoc x y z + star (assoc x y z) = 0 := by
  unfold assoc
  simp only [sub_eq_add_neg, star_add, star_neg]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im] <;>
    ring

end Probe69ASW
