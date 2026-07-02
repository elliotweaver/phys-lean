import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Minpoly
import Mathlib.Algebra.Polynomial.Roots
open Polynomial

example (V : Type) [AddCommGroup V] [Module ℚ V] (h : Module.finrank ℚ V = 6) : Nontrivial V := by
  have : 0 < Module.finrank ℚ V := by rw [h]; norm_num
  exact Module.nontrivial_of_finrank_pos this

-- X²+1 has no rational root (fold positivity q²+1 ≥ 1 > 0)
example (q : ℚ) : ¬ IsRoot (X^2 + 1 : ℚ[X]) q := by
  simp only [IsRoot, eval_add, eval_pow, eval_X, eval_one]
  nlinarith [sq_nonneg q]

-- Degree-2 no-root → irreducible. Search for the lemma:
-- try Polynomial.Monic.irreducible via degree
example : Irreducible (X^2 + 1 : ℚ[X]) := by
  have hnr : ∀ q : ℚ, ¬ IsRoot (X^2 + 1 : ℚ[X]) q := by
    intro q; simp only [IsRoot, eval_add, eval_pow, eval_X, eval_one]; nlinarith [sq_nonneg q]
  have hdeg : (X^2 + 1 : ℚ[X]).natDegree = 2 := by compute_degree!
  -- use the standard: degree 2/3 irreducible iff no roots
  rw [Polynomial.Monic.irreducible_iff_roots_eq_zero_of_degree_le_three] <;> sorry
