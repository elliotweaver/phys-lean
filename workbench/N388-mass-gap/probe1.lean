import Phys.Algebra.ConfinementAreaLaw
import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

/-!
  PROBE 1 (N388 arc-I I4). Measure sub-obligations before production (W9).
-/

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD

/-- integer-coordinate predicate (the fold's discrete lattice). -/
def IntLat (w : O ℚ) : Prop :=
  (∃ k : ℤ, c0 w = k) ∧ (∃ k : ℤ, c1 w = k) ∧ (∃ k : ℤ, c2 w = k) ∧
  (∃ k : ℤ, c3 w = k) ∧ (∃ k : ℤ, c4 w = k) ∧ (∃ k : ℤ, c5 w = k) ∧
  (∃ k : ℤ, c6 w = k) ∧ (∃ k : ℤ, c7 w = k)

/-- (a) THE LATTICE FLOOR: a nonzero integer-coordinate octonion has `gForm ≥ 1`.
    Quantization ⇒ gap: the Born self-overlap of a nonzero lattice vector cannot be
    arbitrarily small. -/
example (w : O ℚ) (hlat : IntLat w) (hne : w ≠ 0) : 1 ≤ gForm w w := by
  obtain ⟨⟨k0,h0⟩,⟨k1,h1⟩,⟨k2,h2⟩,⟨k3,h3⟩,⟨k4,h4⟩,⟨k5,h5⟩,⟨k6,h6⟩,⟨k7,h7⟩⟩ := hlat
  set S : ℤ := k0^2+k1^2+k2^2+k3^2+k4^2+k5^2+k6^2+k7^2 with hSdef
  have hgeq : gForm w w = (S : ℚ) := by
    rw [gForm_self_sum_sq, h0,h1,h2,h3,h4,h5,h6,h7, hSdef]; push_cast; ring
  have hSpos : (0:ℤ) ≤ S := by positivity
  have hSne : S ≠ 0 := by
    intro hS0
    apply hne
    have hall : k0 = 0 ∧ k1 = 0 ∧ k2 = 0 ∧ k3 = 0 ∧ k4 = 0 ∧ k5 = 0 ∧ k6 = 0 ∧ k7 = 0 := by
      refine ⟨?_,?_,?_,?_,?_,?_,?_,?_⟩ <;> nlinarith [sq_nonneg k0, sq_nonneg k1, sq_nonneg k2, sq_nonneg k3, sq_nonneg k4, sq_nonneg k5, sq_nonneg k6, sq_nonneg k7]
    obtain ⟨e0,e1,e2,e3,e4,e5,e6,e7⟩ := hall
    have : gForm w w = 0 := by
      rw [gForm_self_sum_sq, h0,h1,h2,h3,h4,h5,h6,h7, e0,e1,e2,e3,e4,e5,e6,e7]; ring
    exact gForm_self_eq_zero.mp this
  have hS1 : (1:ℤ) ≤ S := by omega
  rw [hgeq]; exact_mod_cast hS1

/-- (b) WITNESS FLOOR: the coloured-witness associator has `gForm ≥ 4` (via `c7 = 2`). -/
example :
    (4:ℚ) ≤ gForm (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))
        (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) := by
  rw [gForm_self_sum_sq]
  have h7 : c7 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = 2 := by
    unfold c7; exact assoc_witness_coord
  rw [h7]
  nlinarith [sq_nonneg (c0 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c1 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c2 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c3 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c4 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c5 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c6 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)))]

/-- (c) cast the floor into the derived ℝ Cut. -/
example (q : ℚ) (h : (1:ℚ) ≤ q) : (1:Cut) ≤ ((q:ℚ):Cut) := by
  exact_mod_cast h

end
end Phys.Algebra
