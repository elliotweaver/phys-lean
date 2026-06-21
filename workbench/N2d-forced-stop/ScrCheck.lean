import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

-- Verify the banked pieces have the signatures I think:
#check @CD.assoc_of_scaling   -- (Scal : ∀ x y, x*(star x*y)=iota(Nrm x)*y) → ∀ a b c, assoc
#check @not_associative       -- ¬ ∀ x y z : O ℚ, (x*y)*z = x*(y*z)
#check @CD.Nrm_mul_of_doubled_base  -- forward half
#check @genNrm_not_mul_at_S

-- The abstract assembly: for A = CD(CD B) with [CommRing B], we have:
--   forward (banked): A associative ⟹ Nrm mult on CD A   ... actually Nrm_mul_of_doubled_base
--     gives Nrm mult on CD(CD B) directly (no assoc hyp; it's the doubled-base structure).
-- For the BACKWARD (the new content): H (Nrm mult on CD A) + aniso ⟹ scaling law ⟹ A assoc.
-- The iff is: over the doubled-base home + anisotropy, Nrm mult on CD A ⟺ A associative.

-- Need: assoc_of_scaling wants instances on A (NonAssocRing A, StarRing A) matching the
-- scaling law's CD A. With local narCD/srCD they must line up.

end Phys.Cascade
