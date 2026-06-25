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

example (x y : CD (CD B)) (N m : ℕ) (hm : m < N + 1) :
    (N.choose m) • ((D ^ (m+1)) x * (D ^ (N - m)) y)
      = (N.choose m) • ((fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) (m+1)) := by
  have : N + 1 - (m + 1) = N - m := by omega
  simp only [this]

example (x y : CD (CD B)) (N m : ℕ) (hm : m < N + 1) :
    (N.choose m) • ((D ^ m) x * (D ^ (N - m + 1)) y)
      = (N.choose m) • ((fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) m) := by
  have : N + 1 - m = N - m + 1 := by omega
  simp only [this]
end
