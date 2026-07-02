import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Minpoly
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.Analysis.SpecialFunctions.Polynomials
open Polynomial

-- name search for nontrivial from finrank
open Module in
#check @Module.nontrivial
example (V : Type) [AddCommGroup V] [Module ℚ V] (h : Module.finrank ℚ V = 6) : Nontrivial V := by
  have : 0 < Module.finrank ℚ V := by rw [h]; norm_num
  exact Module.nontrivial_of_finrank_pos this

-- cyclotomic 4 = X^2+1 by computation
example : (cyclotomic 4 ℚ) = X^2 + 1 := by decide +kernel
