import Phys.Algebra.Derivation
import Phys.Foundation.ContinuumComplete
import Mathlib.Algebra.BigOperators.NatAntidiagonal

open Phys.Algebra Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

-- PROBE A: the iterated Leibniz binomial identity over CD (CD B), pure algebra.
-- Statement type-checks?
example (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) (x y : CD (CD B)) (n : ℕ) :
    (D ^ n) (x * y)
      = ∑ kl ∈ Finset.antidiagonal n, (n.choose kl.1) • ((D ^ kl.1) x * (D ^ kl.2) y) := by
  sorry

-- power apply sanity
example (D : Module.End ℤ (CD (CD B))) (x : CD (CD B)) :
    (D ^ (0:ℕ)) x = x := by simp

example (D : Module.End ℤ (CD (CD B))) (x : CD (CD B)) (n : ℕ) :
    (D ^ (n+1)) x = D ((D ^ n) x) := by
  rw [pow_succ']
  rfl

-- O Cut fits the CD (CD B) shape with B = Dbl Cut
example (D : Module.End ℤ (Phys.Cascade.O Cut)) (hD : IsDeriv (B := Dbl Cut) D) : True := trivial
