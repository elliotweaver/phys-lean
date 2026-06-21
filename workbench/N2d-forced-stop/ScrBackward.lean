import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

section Test
set_option maxHeartbeats 1000000
variable {B : Type*} [CommRing B] [StarRing B]

-- ⟸ route part 1: does CD(CD B) associative ⟹ CD B commutative?
-- iota_iota_e2_assoc_iff : (ιa·ιb)·e₂ = ιa·(ιb·e₂) ↔ a*b = b*a   over [Ring A][StarRing A].
-- Apply with A = CD B: associativity of CD(CD B) on the (ι a, ι b, e₂) triples gives a*b=b*a.
example (hassoc : ∀ x y z : CD (CD B), (x * y) * z = x * (y * z)) :
    ∀ a b : CD B, a * b = b * a := by
  intro a b
  have := hassoc (iota a) (iota b) (e2 : CD (CD B))
  exact (CD.iota_iota_e2_assoc_iff a b).mp this

-- ⟸ route part 2: CD B commutative ⟹ Nrm mult on CD(CD(CD B)).
-- Build CommRing (CD B) from Ring (CD B) + comm, then Nrm_mul_of_doubled_base with base = CD B.
@[reducible] noncomputable def commRingOfComm (hc : ∀ a b : CD B, a * b = b * a) : CommRing (CD B) :=
  { (inferInstance : Ring (CD B)) with mul_comm := hc }

example (hc : ∀ a b : CD B, a * b = b * a) (x y : CD (CD (CD B))) :
    Nrm (x * y) = Nrm x * Nrm y := by
  letI : CommRing (CD B) := commRingOfComm hc
  exact CD.Nrm_mul_of_doubled_base (B := CD B) x y

end Test
end Phys.Cascade
