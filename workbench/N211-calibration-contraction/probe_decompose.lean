import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ============================================================
-- N211: THE CALIBRATION CONTRACTION IDENTITY
-- coassoc4 x y z w = 2*gForm(octCross x y)(octCross z w) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- for imaginary x,y,z,w
-- ============================================================

-- Sub-lemma A: gForm(x*y)(1) = -gForm(x,y) for imaginary y
theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

-- Sub-lemma B: gForm(1)(z*w) = -gForm(z,w) for imaginary w
theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

-- Sub-lemma C: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)
-- for imaginary x,y,z,w (uses gForm bilinearity + orthogonality)
theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (_hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- Sub-lemma D: the cyclic trace-associator identity reQ(assoc x y z * w) = -reQ(x * assoc y z w)
-- via reQ_mul_assoc3 applied to 3-fold pieces.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) = - reQ (x * assoc y z w) := by
  unfold assoc
  rw [sub_mul, sub_eq_add_neg, reQ_add, reQ_neg]
  rw [reQ_mul_assoc3 (x * y) z w, reQ_mul_assoc3 x y (z * w),
      reQ_mul_assoc3 x (y * z) w]
  ring

-- Sub-lemma E: reQ(x * ((y*z)*w)) = reQ(x * (y*(z*w)))
-- This is reQ_mul_assoc3 applied "inside" the outer x*.
-- reQ((y*z)*w) = reQ(y*(z*w)), but reQ(x * a) ≠ reQ(x * b) doesn't follow from reQ(a) = reQ(b).
-- However: reQ_mul_comm gives reQ(x * a) = reQ(a * x).
-- And reQ_mul_assoc3 gives reQ((a*b)*c) = reQ(a*(b*c)).
-- So reQ(x * ((y*z)*w)) = reQ(((y*z)*w) * x)  [reQ_mul_comm]
--                       = reQ((y*z)*(w*x))    [reQ_mul_assoc3]
--                       = reQ(y*(z*(w*x)))    [reQ_mul_assoc3]
-- And reQ(x * (y*(z*w))) = reQ((y*(z*w)) * x)  [reQ_mul_comm]
--                        = reQ(y*((z*w)*x))    [reQ_mul_assoc3]
--                        = reQ(y*(z*(w*x)))    [reQ_mul_assoc3 ... wait, (z*w)*x needs trace assoc]
-- This is getting complicated. Let me just prove it directly.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_four_assoc (x y z w : O ℚ) :
    reQ (x * ((y * z) * w)) = reQ (x * (y * (z * w))) := by
  rw [reQ_mul_comm x ((y * z) * w), reQ_mul_assoc3 y z (w * x), reQ_mul_comm (z * (w * x)) y,
      reQ_mul_comm x (y * (z * w)), reQ_mul_assoc3 y (z * w) x,
      reQ_mul_comm (z * w) (x * y), reQ_mul_assoc3 z w (x * y),
      reQ_mul_comm (w * (x * y)) z, reQ_mul_comm (z * w) y,
      reQ_mul_assoc3 z w y, reQ_mul_comm (w * y) z]
  ring

-- Now the degree-4 coordinate identity, broken into two halves.
-- After all structural rewrites, the identity reduces to:
-- reQ(x * ((y*z)*w)) - reQ(x * (y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w)
--                                          - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- Using reQ_four_assoc: reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))
-- So LHS = 0, and we need: 0 = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- That means: reQ(x*(y*(w*z))) = reQ(x*y)*reQ(z*w) + reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z)

-- Wait, if LHS = 0 via trace assoc, then the identity says:
-- 0 = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- i.e. reQ(x*(y*(w*z))) = reQ(x*y)*reQ(z*w) + reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z)

-- But that can't be right for ALL imaginary x,y,z,w! For x=u1, y=u2, z=u1, w=u2:
-- LHS = reQ(u1*(u2*(u2*u1)))
-- u2*u1 = -u1*u2 (antisymmetric cross product, but the PRODUCT is not antisymmetric).
-- Actually octCross u2 u1 = -octCross u1 u2, but u2*u1 ≠ -(u1*u2).
-- reQ(u1*u2) = -gForm(u1,u2) = 0, reQ(u2*u1) = -gForm(u2,u1) = 0.
-- u2*u1 = octCross u2 u1 - gForm(u2,u1)*1 = octCross u2 u1 = -octCross u1 u2.
-- u1*(u2*u1) = u1*(-octCross u1 u2) = -u1*(octCross u1 u2)
-- octCross u1 u2 = u1*u2 (since gForm u1 u2 = 0)
-- So u1*(u2*u1) = -u1*(u1*u2) = -(u1*u1)*u2 (by left alt) = -(-gForm u1 u1)*1 * u2 (hmm, u1*u1 = ?)
-- For imaginary u1: u1*u1 = u1*u1. octCross u1 u1 = 0, so u1*u1 + gForm(u1,u1)*1 = 0, u1*u1 = -gForm(u1,u1)*1 = -1*1 = -1.
-- Wait, gForm u1 u1 = 1 (banked). So u1*u1 = -1.
-- u1*(u2*u1) = -u1*(u1*u2) = -(u1*u1)*u2 (left alt) = -(-1)*u2 = u2.
-- reQ(u2) = 0 (imaginary). So reQ(u1*(u2*(u2*u1))) = reQ(u1*(u2*u1))... wait I'm confusing myself.
-- x=u1, y=u2, z=u1, w=u2: reQ(x*(y*(w*z))) = reQ(u1*(u2*(u2*u1)))
-- u2*u1 = -1*1 (wait no, u1*u1 = -1, but u2*u1 is different)
-- u2*u1 = octCross u2 u1 - gForm(u2,u1)*1 = -octCross u1 u2 - 0 = -octCross u1 u2 = -(u1*u2 + 0) = -(u1*u2)
-- u2*(u2*u1) = u2*(-(u1*u2)) = -u2*(u1*u2) = -(u2*u1)*u2 (left alt) = -(-u1*u2)*u2 = (u1*u2)*u2
-- (u1*u2)*u2 = u1*(u2*u2) (right alt) = u1*(-1) = -u1
-- u1*(u2*(u2*u1)) = u1*(-u1) = -(u1*u1) = -(-1) = 1
-- reQ(1) = 1
-- RHS: reQ(u1*u2)*reQ(u1*u2) + reQ(u1*u1)*reQ(u2*u2) - reQ(u1*u2)*reQ(u2*u1)
-- = 0*0 + (-1)*(-1) - 0*0 = 1
-- So LHS = 1, RHS = 1. ✓ The identity holds on this witness!

-- And the FULL identity (factor 2): coassoc4 u1 u2 u1 u2 = 0 (LHS), RHS = 2*1 - 2*(1-0) = 2-2 = 0. ✓

-- So the identity IS correct. The issue is just compile cost (W9).

-- Let me try proving the key sub-identity:
-- reQ(x*(y*(w*z))) = reQ(x*y)*reQ(z*w) + reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z) for imaginary x,y,z,w
-- This is a degree-4 identity, but maybe with a SMALLER coordinate expansion.

-- Actually, let me reconsider. Maybe the factor is NOT 2. Let me check the original PREREG claim.
-- The PREREG says: coassoc4 = 2*gForm(octCross xy)(octCross zw) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- With gForm_octCross_octCross: gForm(octCross xy)(octCross zw) = gForm(x*y)(z*w) - g(x,y)*g(z,w)
-- So RHS = 2*(gForm(x*y)(z*w) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- = 2*gForm(x*y)(z*w) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)

-- In reQ form (for imaginary):
-- LHS = -reQ(assoc x y z * w) = reQ(x * assoc y z w)  [via cyclic]
-- = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
-- = reQ(x*(y*(z*w))) - reQ(x*(y*(z*w))) = 0  [via reQ_four_assoc]
-- Wait, that gives LHS = 0! But the N210 witness says coassoc4 = 4 ≠ 0!

-- Let me recheck. reQ_assoc_cyclic: reQ(assoc x y z * w) = -reQ(x * assoc y z w)
-- And coassoc4 = -reQ(assoc x y z * w) (for imaginary w)
-- So coassoc4 = reQ(x * assoc y z w) = reQ(x * ((y*z)*w - y*(z*w)))
-- = reQ(x*(y*z)*w) - reQ(x*(y*(z*w)))
-- = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
-- Via reQ_four_assoc: reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))
-- So coassoc4 = reQ(x*(y*(z*w))) - reQ(x*(y*(z*w))) = 0!

-- But N210 says coassoc4 = 4 on the witness! CONTRADICTION!

-- Let me check: is reQ_four_assoc correct?
-- reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))
-- reQ_mul_assoc3 says reQ((a*b)*c) = reQ(a*(b*c)).
-- So reQ((y*z)*w) = reQ(y*(z*w)).
-- But reQ(x*((y*z)*w)) = reQ(x * something) and reQ(x*(y*(z*w))) = reQ(x * something_else).
-- reQ of x * a is NOT determined by reQ of a. reQ is the REAL PART of the product, not a linear functional.
-- So reQ_four_assoc is NOT a consequence of reQ_mul_assoc3 alone!

-- Let me check if reQ_four_assoc is actually TRUE by testing on witnesses.
-- reQ(u1*((u2*u1)*u2)) vs reQ(u1*(u2*(u1*u2)))
-- u2*u1 = -(u1*u2) (for g=0 case)
-- (u2*u1)*u2 = -(u1*u2)*u2 = -u1*(u2*u2) (right alt) = -u1*(-1) = u1
-- u1*((u2*u1)*u2) = u1*u1 = -1. reQ = -1.
-- u1*u2 = octCross u1 u2 (g=0)
-- u2*(u1*u2) = ... complex. Let me not try to compute by hand.
-- reQ_four_assoc might be FALSE!

-- This means my proof attempt is wrong. The reQ_four_assoc "identity" is not valid.
-- reQ_mul_assoc3 only applies to 3-fold products, NOT 4-fold.
-- reQ((a*b)*c) = reQ(a*(b*c)) — this is about the 3-fold product (a*b)*c vs a*(b*c).
-- But reQ(x * ((y*z)*w)) involves a 4-fold product x * ((y*z)*w) = x * (4-fold-thing).
-- reQ_mul_assoc3 with a=y, b=z, c=w gives reQ((y*z)*w) = reQ(y*(z*w)), which is about the 3-fold (y*z)*w.
-- But that's INSIDE reQ(x * ...), and reQ(x * a) ≠ reQ(x * b) just because reQ(a) = reQ(b).

-- So reQ_four_assoc is WRONG. My earlier "proof" using reQ_mul_comm must have a bug.
-- Let me check the proof of reQ_four_assoc.

-- The proof used many reQ_mul_comm and reQ_mul_assoc3 rewrites. Let me see if it actually compiled.
-- It used `ring` at the end, so if the rewrites were wrong, ring would fail. Let me test it.

end
end Phys.Algebra
