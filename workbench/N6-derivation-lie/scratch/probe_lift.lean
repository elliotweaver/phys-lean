import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeLift

-- The componentwise LIFT of a base additive map to the double.
section Lift
variable {A : Type*}

-- We work abstractly first: A a NonAssocRing with star; lift δ : A →+ A to CD A.
-- Build it as a raw function and prove IsDeriv via the CD product formula.

-- For the witness we need A = H ℚ which is an associative Ring. Let's probe ad_q there.
end Lift

-- ===== concrete witness on H ℚ and O ℚ =====
-- H ℚ = CD (Dbl ℚ) has a genuine Ring instance (associative). O ℚ = CD (H ℚ), narCD.
attribute [local instance] CD.narCD CD.srCD

-- e2 in H ℚ is imaginary
example : star (CD.e2 : H ℚ) = -(CD.e2 : H ℚ) := by ext <;> simp [CD.e2]

-- ad_q on H ℚ (associative Ring) — is it a derivation?  q*(x*y) - (x*y)*q = (qx-xq)y + x(qy-yq)
example (q x y : H ℚ) :
    q * (x * y) - (x * y) * q = (q * x - x * q) * y + x * (q * y - y * q) := by
  noncomm_ring

-- star-commute for ad_q with q imaginary (star q = -q):
-- star(q*x - x*q) = star x * star q - star q * star x = star x*(-q) - (-q)*star x
--                = -(star x * q) + q * star x = q*star x - star x * q = ad_q (star x)? need q*starx - starx*q
-- ad_q(star x) = q*star x - star x*q ; star(ad_q x) = star(qx - xq) = star x star q - star q star x
--   = star x (-q) - (-q) star x = -(star x q) + q star x = q star x - star x q ✓
example (q x : H ℚ) (hq : star q = -q) :
    star (q * x - x * q) = q * star x - star x * q := by
  rw [star_sub, star_mul, star_mul, hq]
  noncomm_ring

end ProbeLift
