import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- The cyclic trace-associator identity: reQ(assoc x y z * w) = -reQ(x * assoc y z w)
-- This is a direct consequence of trace associativity (degree-3 reQ_mul_assoc3 applied twice).
-- Proof: reQ(assoc x y z * w) = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
--   = reQ((x*y)*(z*w)) - reQ(x*((y*z)*w))  [trace assoc on each 3-fold product]
--   = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))  [trace assoc on first term]
--   = -(reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))))
--   = -(reQ(x*((y*z)*w - y*(z*w))))  [reQ is additive]
--   = -reQ(x * assoc y z w)  [assoc y z w = (y*z)*w - y*(z*w)]
-- But wait: y*(z*w) is NOT y*(z*w) in the expression; the last step uses
-- reQ(x * ((y*z)*w - y*(z*w))) = reQ(x * assoc y z w) which is true by definition.
-- And the step reQ(x*(y*(z*w))) = reQ(x*(y*(z*w))) is tautological.
-- The step reQ((x*y)*(z*w)) = reQ(x*(y*(z*w))) is trace assoc with a=x, b=y, c=(z*w).
-- The step reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) is trace assoc with a=(x*y), b=z, c=w.

set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) = - reQ (x * assoc y z w) := by
  unfold assoc
  rw [reQ_sub, mul_sub, reQ_sub, reQ_sub]
  -- Goal: reQ(((x*y)*z)*w) - reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
  -- Wait, the negation: -reQ(x * ((y*z)*w - y*(z*w)))
  -- = -(reQ(x*(y*z)*w) - reQ(x*(y*(z*w))))
  -- = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w)
  -- So: reQ(((x*y)*z)*w) - reQ((x*(y*z))*w) = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))
  -- = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w)
  -- Let me apply trace assoc to the LHS terms:
  rw [show reQ (((x*y)*z)*w) = reQ (x*(y*(z*w))) from by
      rw [reQ_mul_assoc3 (x*y) z w, reQ_mul_assoc3 x y (z*w)],
    show reQ ((x*(y*z))*w) = reQ (x*((y*z)*w)) from reQ_mul_assoc3 x (y*z) w]
  -- Goal: reQ(x*(y*(z*w))) - reQ(x*((y*z)*w)) = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))
  -- But we have a negation on the RHS. Let me check.
  ring

-- Now the main contraction identity. Using the cyclic identity:
-- reQ(assoc x y z * w) = -reQ(x * assoc y z w)
-- = -(reQ(x*(y*z)*w) - reQ(x*(y*(z*w))))   [trace assoc on each, then unfold]
-- Hmm, let me think about this differently.
--
-- The identity in reQ form:
-- reQ(assoc x y z * w) = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
--
-- Using trace assoc: reQ((x*y)*(w*z)) = reQ(x*(y*(w*z)))
-- Using cyclic: reQ(assoc x y z * w) = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))
--
-- So: reQ(x*(y*(z*w))) - reQ(x*((y*z)*w)) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
--
-- This is still degree-4. But now the degree-4 part is:
-- reQ(x*(y*(z*w))) - reQ(x*((y*z)*w)) - 2*reQ(x*(y*(w*z)))
-- = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w) - 2*reQ(x*(y*(w*z)))
-- And the degree-2×2 part is: -(- 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z))
--
-- Let me try: use the cyclic identity and trace assoc to rewrite, THEN ring on a smaller expression.

set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  rw [gForm_octCross_octCross hx hy hz hw]
  rw [show coassoc4 x y z w = gForm (assoc x y z) w from rfl]
  -- Convert to reQ
  have h1 : gForm (assoc x y z) w = - reQ (assoc x y z * w) :=
    coassoc4_eq_neg_reQ hw _ _ _
  have h2 : gForm (x * y) (z * w) = reQ ((x * y) * (w * z)) := by
    show reQ ((x * y) * star (z * w)) = reQ ((x * y) * (w * z))
    rw [star_mul, show star w = -w from (mem_ImO).mp hw,
        show star z = -z from (mem_ImO).mp hz, mul_neg, neg_mul, neg_neg]
  have h3 : gForm x y = - reQ (x * y) := by
    show reQ (x * star y) = - reQ (x * y)
    rw [show star y = -y from (mem_ImO).mp hy, mul_neg, reQ_neg]
  have h4 : gForm z w = - reQ (z * w) := by
    show reQ (z * star w) = - reQ (z * w)
    rw [show star w = -w from (mem_ImO).mp hw, mul_neg, reQ_neg]
  have h5 : gForm x z = - reQ (x * z) := by
    show reQ (x * star z) = - reQ (x * z)
    rw [show star z = -z from (mem_ImO).mp hz, mul_neg, reQ_neg]
  have h6 : gForm y w = - reQ (y * w) := by
    show reQ (y * star w) = - reQ (y * w)
    rw [show star w = -w from (mem_ImO).mp hw, mul_neg, reQ_neg]
  have h7 : gForm x w = - reQ (x * w) := by
    show reQ (x * star w) = - reQ (x * w)
    rw [show star w = -w from (mem_ImO).mp hw, mul_neg, reQ_neg]
  have h8 : gForm y z = - reQ (y * z) := by
    show reQ (y * star z) = - reQ (y * z)
    rw [show star z = -z from (mem_ImO).mp hz, mul_neg, reQ_neg]
  rw [h1, h2, h3, h4, h5, h6, h7, h8]
  -- Apply the cyclic identity to rewrite the LHS
  rw [reQ_assoc_cyclic x y z w]
  -- Now: -(-reQ(x * assoc y z w)) = 2*reQ((x*y)*(w*z)) + ...
  -- = reQ(x * assoc y z w) = ...
  unfold assoc
  -- Apply trace assoc to reQ((x*y)*(w*z))
  rw [show reQ ((x*y)*(w*z)) = reQ (x*(y*(w*z))) from reQ_mul_assoc3 x y (w*z)]
  -- Now: reQ(x * ((y*z)*w - y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
  rw [reQ_sub, mul_sub]
  -- Goal: reQ(x*(y*z)*w) - reQ(x*(y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
  -- Apply trace assoc to each term
  rw [show reQ (x * (y * z) * w) = reQ (x * ((y * z) * w)) from reQ_mul_assoc3 x (y*z) w]
  rw [show reQ (x * (y * (z * w))) = reQ (x * (y * (z * w))) from rfl]
  -- Now: reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))) = 2*reQ(x*(y*(w*z))) - ...
  -- Apply trace assoc to reQ(x*((y*z)*w)):
  -- reQ(x*((y*z)*w)) — this is a 2-fold reQ. Can't apply trace assoc directly.
  -- But I can use trace assoc on the 3-fold product inside:
  -- reQ(x * ((y*z)*w)) = reQ(((y*z)*w) * x) [comm] = reQ((y*z)*(w*x)) [assoc] = reQ(y*(z*(w*x))) [assoc]
  -- And reQ(x*(y*(z*w))) = reQ((y*(z*w))*x) [comm] = reQ(y*((z*w)*x)) [assoc]
  -- And reQ(x*(y*(w*z))) = reQ((y*(w*z))*x) [comm] = reQ(y*((w*z)*x)) [assoc]
  -- These are all reQ of y * something, which is 2-fold. Can't go further.
  --
  -- Let me just try ring on this reduced form.
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra