import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE 11: don't unfold octCross (which brings gForm back). Instead substitute octCross = x*y + c*1.
set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Convert LHS
  rw [coassoc4_eq_neg_reQ hw]
  -- Set up abbreviations
  set cxy := gForm x y
  set czw := gForm z w
  set cxz := gForm x z
  set cyw := gForm y w
  set cxw := gForm x w
  set cyz := gForm y z
  -- octCross x y = x * y + cxy * 1
  -- octCross z w = z * w + czw * 1
  -- gForm (octCross x y) (octCross z w) = gForm (x*y + cxy*1)(z*w + czw*1)
  -- = gForm(x*y)(z*w) + czw*gForm(x*y)(1) + cxy*gForm(1)(z*w) + cxy*czw*gForm(1)(1)
  -- For imaginary: gForm(u)(1) = reQ(u), gForm(1)(v) = reQ(v), gForm(1)(1) = 1
  -- reQ(x*y) = -cxy (since gForm x y = -reQ(x*y) for imaginary y)
  -- reQ(z*w) = -czw
  -- So: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) + czw*(-cxy) + cxy*(-czw) + cxy*czw*1
  --   = gForm(x*y)(z*w) - 2*cxy*czw + cxy*czw = gForm(x*y)(z*w) - cxy*czw
  -- And gForm(x*y)(z*w) = -reQ((x*y)*(z*w)) for imaginary (z*w is NOT imaginary, but star(z*w) = w*z)
  -- Actually: for the fourth arg of gForm, star is applied. star(z*w) = star(w)*star(z) = w*z (imaginary)
  -- So gForm(x*y)(z*w) = reQ((x*y)*star(z*w)) = reQ((x*y)*(w*z))
  -- But I need to handle this carefully. Let me just go to coordinates.

  -- Actually, let me try a different approach: expand EVERYTHING to coordinates including gForm,
  -- and handle the imaginary conditions via simp only [star x = -x] BEFORE the coordinate simp.

  -- Strategy: unfold gForm, octCross, assoc, coassoc4. Then rewrite star(x)=-x etc.
  -- Then simp to coordinates + ring.

  -- Start fresh
  unfold coassoc4 gForm octCross assoc at *
  -- Now rewrite star of individual variables
  have hsx : star x = -x := (mem_ImO).mp hx
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  -- Rewrite star of individual vars (these should match)
  rw [hsx, hsy, hsz, hsw]
  -- Now there should be star of composite expressions left (star(x*y), star(z*w), star(1), star(0))
  -- Break these apart
  simp only [star_add, star_mul, star_one, star_zero, neg_neg,
    mul_neg, neg_mul, mul_one, one_mul, add_zero, zero_add, neg_zero]
  -- Now expand to coordinates
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
