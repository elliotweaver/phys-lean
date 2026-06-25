import Phys.Algebra.Derivation
import Mathlib.Algebra.BigOperators.NatAntidiagonal
import Mathlib.Data.Nat.Choose.Sum

open Phys.Algebra Phys.Cascade Finset
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD
variable {B : Type*} [CommRing B] [StarRing B]
section
variable (D : Module.End ℤ (CD (CD B)))

-- antidiagonal form, mirroring banked expTerm_antidiagonal shape
theorem iter_leibniz_antidiag (hD : IsDeriv D) (x y : CD (CD B)) (n : ℕ) :
    (D ^ n) (x * y)
      = ∑ kl ∈ Finset.antidiagonal n, (n.choose kl.1) • ((D ^ kl.1) x * (D ^ kl.2) y) := by
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ
        (fun k l => (n.choose k) • ((D ^ k) x * (D ^ l) y)) n]
  sorry
end
