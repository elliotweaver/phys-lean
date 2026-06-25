import Mathlib
open Finset
example : Finset.antidiagonal (1:ℕ) = {(0,1),(1,0)} := by decide
example (M : Type) [AddCommMonoid M] (f : ℕ × ℕ → M) :
    ∑ kl ∈ Finset.antidiagonal (1:ℕ), f kl = f (0,1) + f (1,0) := by
  rw [show Finset.antidiagonal (1:ℕ) = {(0,1),(1,0)} from by decide]
  rw [Finset.sum_insert (by decide), Finset.sum_singleton]
