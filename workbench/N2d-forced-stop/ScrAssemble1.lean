import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {B : Type*} [CommRing B] [StarRing B]

-- abbreviations for the doubled-base structure
-- A := CD (CD B), carrier CD A = CD (CD (CD B))

-- structural lemmas (proved this run, in scratch):
theorem Nrm_star_d (z : CD (CD (CD B))) : Nrm (star z) = Nrm z := by
  unfold Nrm
  ext <;> simp only [star_star, mul_re, mul_im, star_re, star_im, add_re, add_im,
    neg_re, neg_im, star_add, star_neg, star_mul', neg_mul, mul_neg, neg_neg] <;> ring

set_option maxHeartbeats 8000000 in
theorem adjoint_d (u v w : CD (CD (CD B))) : bilin (u * v) w = bilin v (star u * w) := by
  unfold bilin
  ext <;> simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add] <;> ring

set_option maxHeartbeats 8000000 in
theorem bilin_iota_Nrm_left_d (x y w : CD (CD (CD B))) :
    bilin (iota (Nrm x) * y) w = Nrm x * bilin y w := by
  unfold bilin Nrm
  ext <;> simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    zero_re, zero_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
    add_mul, mul_add, zero_mul, mul_zero, zero_add, add_zero, star_zero, neg_zero, sub_zero] <;> ring

-- P2 over the doubled base (banked P2 needs [Ring A]; CD(CD B) IS a Ring since CD B... no,
-- CD B is Ring only if B CommRing -> CD B is Ring -> need CommRing(CD B)? CD B comm iff B... )
-- Check: is CD(CD B) an instance of Ring? base of outer CD is CD(CD B)? No: carrier is
-- CD (CD (CD B)); for the banked Ring (CD X) we need CommRing X with X = CD(CD B).
-- CD(CD B) is a Ring (B CommRing => CD B Ring? NO, CD B Ring needs CommRing B -> yes CD B is Ring;
-- but CD(CD B) Ring needs CommRing(CD B) which is FALSE). So P2 (over [Ring A]) applies with
-- A = CD(CD B) only if CD(CD B) is a Ring. It is NOT (CD B noncomm). Use P2'' over NonAssocRing.
#check @P2
#check @bilin_diag
end Phys.Cascade.CD
