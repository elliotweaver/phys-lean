import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE 4: use coassoc4_eq_neg_reQ and the banked identities
-- The key insight: use the banked bridge coassoc4_eq_neg_reQ to convert to reQ,
-- then use assoc_reQ_skew + trace associativity

set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Convert LHS to reQ form
  rw [coassoc4_eq_neg_reQ hw]
  -- For imaginary w: star w = -w
  have hsw : star w = -w := (mem_ImO).mp hw
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsx : star x = -x := (mem_ImO).mp hx
  -- Expand RHS gForm(octCross x y)(octCross z w)
  -- octCross x y = x*y + gForm(x,y)*1, octCross z w = z*w + gForm(z,w)*1
  -- For imaginary elements, gForm(u)(1) = reQ(u) and gForm(1)(v) = reQ(v) etc.
  -- gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)  [computed above]
  -- But we need to prove this. Let's use the structural approach.
  -- Actually, let's try a direct coordinate proof with controlled rewrites.
  -- First, let's expand the gForm on the RHS.
  -- gForm a b = reQ(a * star b)
  -- For imaginary b: star b = -b, so gForm a b = -reQ(a * b)
  -- So: gForm x z = -reQ(x*z), gForm y w = -reQ(y*w), etc.
  -- gForm x y = -reQ(x*y), gForm z w = -reQ(z*w)
  -- gForm(octCross x y)(octCross z w) = gForm(x*y + g(x,y)*1)(z*w + g(z,w)*1)
  -- For the RHS octCross terms, we need gForm with star.
  -- Let me just go to coordinates directly.
  unfold coassoc4 octCross assoc gForm at *
  -- Replace star of imaginary with neg
  rw [hsw, hsz, hsy, hsx]
  -- Now expand star of composite expressions manually
  -- star(a + b) = star a + star b
  -- star(c * a) = star a * star c  (but c = gForm which is a scalar, star is identity on scalars... wait)
  -- Actually star (c • a) = c • star a for c : Q (scalar)
  -- star(a * b) = star b * star a
  -- star 1 = 1
  -- star 0 = 0
  simp only [star_add, star_smul, star_mul, star_one, star_zero, neg_neg,
    mul_neg, neg_mul, mul_one, one_mul, add_zero, zero_add, neg_zero,
    smul_neg, smul_add, add_smul, mul_smul, smul_mul_assoc,
    neg_add_cancel, neg_add_cancel_left, add_neg_cancel, add_neg_cancel_self]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
