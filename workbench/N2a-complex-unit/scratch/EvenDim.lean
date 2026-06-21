/- SCRATCH 2 — the general even-dimension law (the "why DOUBLE"). -/
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Analysis.SpecialFunctions.Pow.Real

open Module

/-- If a real-linear operator on a finite-dim space squares to `-id`, the
    dimension is EVEN. (det(J)² = (-1)^finrank ≥ 0 ⇒ finrank even.) This is the
    forced-doubling law: odd dimensions (the base, dim 1) admit no fold-root. -/
theorem foldRoot_forces_even_dim
    {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (J : V →ₗ[ℝ] V) (h : J.comp J = -LinearMap.id) :
    Even (finrank ℝ V) := by
  -- det(J)² = det(J∘J) = det(-id) = (-1)^finrank
  have hdet : (LinearMap.det J) ^ 2 = (-1 : ℝ) ^ (finrank ℝ V) := by
    have e1 : LinearMap.det (J.comp J) = LinearMap.det J * LinearMap.det J :=
      LinearMap.det_comp J J
    have e2 : (-LinearMap.id : V →ₗ[ℝ] V) = (-1 : ℝ) • LinearMap.id := by
      ext x; simp
    rw [h, e2, LinearMap.det_smul, LinearMap.det_id, mul_one] at e1
    rw [sq]; exact e1.symm
  -- det(J)² ≥ 0, so (-1)^finrank ≥ 0, forcing finrank even.
  have hnn : (0 : ℝ) ≤ (-1 : ℝ) ^ (finrank ℝ V) := by
    rw [← hdet]; exact sq_nonneg _
  by_contra hodd
  rw [Nat.not_even_iff_odd] at hodd
  rw [hodd.neg_one_pow] at hnn
  linarith
