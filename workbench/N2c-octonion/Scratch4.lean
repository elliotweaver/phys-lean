import Phys.Cascade.Quaternion
import Mathlib.Tactic

namespace Phys.Cascade

abbrev Oct (R : Type*) [CommRing R] := CD (H R)   -- 𝕆, doubling 4 → 8

-- the non-associating triple's base pair is the rung-2 non-commuting pair (ιJ, e₂) in H
theorem oct_assoc_triple_iff {R : Type*} [CommRing R] :
    (CD.iota (ιJ R) * CD.iota (CD.e2 : H R)) * (CD.e2 : Oct R)
      = CD.iota (ιJ R) * (CD.iota (CD.e2 : H R) * (CD.e2 : Oct R))
    ↔ (ιJ R) * (CD.e2 : H R) = (CD.e2 : H R) * (ιJ R) :=
  CD.iota_iota_e2_assoc_iff (ιJ R) (CD.e2 : H R)

theorem oct_not_associative_witness :
    (CD.iota (ιJ ℚ) * CD.iota (CD.e2 : H ℚ)) * (CD.e2 : Oct ℚ)
      ≠ CD.iota (ιJ ℚ) * (CD.iota (CD.e2 : H ℚ) * (CD.e2 : Oct ℚ)) := by
  intro h; rw [oct_assoc_triple_iff] at h; exact not_commutative_witness h

theorem oct_not_associative : ¬ ∀ x y z : Oct ℚ, (x * y) * z = x * (y * z) := by
  intro h; exact oct_not_associative_witness (h _ _ _)

theorem oct_associativity_cause {R : Type*} [CommRing R] :
    ((CD.iota (ιJ R) * CD.iota (CD.e2 : H R)) * (CD.e2 : Oct R)
      = CD.iota (ιJ R) * (CD.iota (CD.e2 : H R) * (CD.e2 : Oct R)))
    ↔ (Dbl.J : Dbl R) = star Dbl.J := by
  rw [oct_assoc_triple_iff]; exact commutativity_cause

end Phys.Cascade
