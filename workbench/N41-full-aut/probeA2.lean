import Phys.Algebra.Derivation
import Mathlib.Algebra.BigOperators.NatAntidiagonal
import Mathlib.Data.Nat.Choose.Sum

open Phys.Algebra Phys.Cascade
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

-- The two single-step Leibniz facts on powers we'll need.
-- D^(n+1) x = D (D^n x)
example (D : Module.End ℤ (CD (CD B))) (x : CD (CD B)) (n : ℕ) :
    (D ^ (n+1)) x = D ((D ^ n) x) := by rw [pow_succ']; rfl

-- PROBE A2: the full iterated Leibniz binomial, direct induction.
theorem iter_leibniz (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) (x y : CD (CD B)) :
    ∀ n : ℕ, (D ^ n) (x * y)
      = ∑ kl ∈ Finset.antidiagonal n, (n.choose kl.1) • ((D ^ kl.1) x * (D ^ kl.2) y) := by
  intro n
  induction n with
  | zero => simp
  | succ n ih =>
      -- D^(n+1)(xy) = D (D^n (xy)) = D (∑ ...) = ∑ D(...)
      rw [pow_succ']
      show D ((D ^ n) (x * y)) = _
      rw [ih]
      rw [map_sum]
      -- D applied to each term: D ( c • (D^k x * D^l y) ) = c • D(D^k x * D^l y)
      --   = c • ( D(D^k x) * D^l y + D^k x * D(D^l y) )   [Leibniz]
      --   = c • ( D^(k+1) x * D^l y + D^k x * D^(l+1) y )
      sorry
