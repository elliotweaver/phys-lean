import Phys.Cascade.ForcedStop
import Mathlib.Tactic
-- assumes the Core block + Nrm_mul_iff_base_assoc + aniso_S2 are available; here we
-- re-state the iff signature as an axiom-free hypothesis to TEST the concrete assembly shape.
namespace Phys.Cascade
open CD

-- Stub mirrors of the proven results (signatures only) to test the concrete composition:
section StubTest
variable
  (Nrm_mul_iff_base_assoc :
    (∀ z : S ℚ, Nrm z + Nrm z = 0 → z = 0) →
    ((∀ x y : S ℚ, Nrm (x * y) = Nrm x * Nrm y)
      ↔ (∀ a b c : O ℚ, (a * b) * c = a * (b * c))))
  (aniso_S2 : ∀ z : S ℚ, Nrm z + Nrm z = 0 → z = 0)

-- THE FORCED LAW: Nrm is NOT multiplicative on S ℚ (because O ℚ is non-associative).
example : ¬ (∀ x y : S ℚ, Nrm (x * y) = Nrm x * Nrm y) := by
  intro H
  have hassoc : ∀ a b c : O ℚ, (a * b) * c = a * (b * c) :=
    (Nrm_mul_iff_base_assoc aniso_S2).mp H
  exact not_associative hassoc

end StubTest
end Phys.Cascade
