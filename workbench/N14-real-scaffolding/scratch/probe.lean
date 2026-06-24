import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Foundation.ContinuumFieldInverse

namespace Phys.Cascade.Probe

open Phys.Foundation Module

variable {V : Type*} [AddGroup V]

def IsFoldRoot (J : V → V) : Prop := IsFold (fun x => J (J x))

theorem isFoldRoot_iff {J : V → V} : IsFoldRoot J ↔ ∀ x, J (J x) = -x := by
  constructor
  · intro h x; exact fold_eq_neg h x
  · intro h x; show J (J x) + x = 0; rw [h x]; exact neg_add_cancel x

/-! ## ABSTRACT over any linearly ordered field K — ℝ never mentioned. -/

theorem isFoldRoot_linearMap_iff {K : Type*} [Field K] {W : Type*} [AddCommGroup W] [Module K W]
    (J : W →ₗ[K] W) : IsFoldRoot (fun x => J x) ↔ J.comp J = -LinearMap.id := by
  rw [isFoldRoot_iff]
  constructor
  · intro h; ext x; simpa using h x
  · intro h x; have := LinearMap.congr_fun h x; simpa using this

theorem foldRoot_forces_even_dim
    {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]
    {W : Type*} [AddCommGroup W] [Module K W] [Module.Finite K W]
    (J : W →ₗ[K] W) (h : IsFoldRoot (fun x => J x)) :
    Even (finrank K W) := by
  rw [isFoldRoot_linearMap_iff] at h
  have hdet : (LinearMap.det J) ^ 2 = (-1 : K) ^ (finrank K W) := by
    have e1 : LinearMap.det (J.comp J) = LinearMap.det J * LinearMap.det J :=
      LinearMap.det_comp J J
    have e2 : (-LinearMap.id : W →ₗ[K] W) = (-1 : K) • LinearMap.id := by
      ext x; simp
    rw [h, e2, LinearMap.det_smul, LinearMap.det_id, mul_one] at e1
    rw [sq]; exact e1.symm
  have hnn : (0 : K) ≤ (-1 : K) ^ (finrank K W) := by
    rw [← hdet]; exact sq_nonneg _
  by_contra hodd
  rw [Nat.not_even_iff_odd] at hodd
  rw [hodd.neg_one_pow] at hnn
  linarith

/-! ## INSTANTIATE the dim-1 obstruction at the DERIVED ℝ `Cut`. -/

theorem no_foldRoot_dim1_Cut :
    ¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x) := by
  rintro ⟨J, hJ⟩
  have heven : Even (finrank ContinuumQ.Cut ContinuumQ.Cut) := foldRoot_forces_even_dim J hJ
  rw [finrank_self] at heven
  exact (Nat.not_even_iff_odd.mpr odd_one) heven

/-! ## INSTANTIATE the dim-2 witness at the DERIVED ℝ `Cut`. -/

noncomputable def J₂ : (ContinuumQ.Cut × ContinuumQ.Cut) →ₗ[ContinuumQ.Cut] (ContinuumQ.Cut × ContinuumQ.Cut) where
  toFun p := (-p.2, p.1)
  map_add' p q := Prod.ext (by simp; ring) (by simp)
  map_smul' r p := Prod.ext (by simp) (by simp)

theorem J₂_isFoldRoot : IsFoldRoot (fun p => J₂ p) := by
  rw [isFoldRoot_iff]; intro p; simp [J₂, Prod.ext_iff]

theorem J₂_self_blind (p : ContinuumQ.Cut × ContinuumQ.Cut) (hp : J₂ p = p) : p = 0 := by
  refine fold_self_blind J₂_isFoldRoot ?_ p ?_
  · intro y hy
    have : (2 : ContinuumQ.Cut) • y = 0 := by rw [two_smul]; exact hy
    simpa using this
  · show J₂ (J₂ p) = p; rw [hp, hp]

/-! ## non-vacuity over the DERIVED ℚ `Q` and DERIVED ℝ `Cut`. -/

theorem obstruction_nonvacuous_Q : ∀ j : Phys.Foundation.Q, j * j ≠ -1 := by
  intro j h
  have hpos : (0 : Phys.Foundation.Q) ≤ j * j := mul_self_nonneg j
  rw [h] at hpos
  have hle : (1 : Phys.Foundation.Q) ≤ 0 := neg_nonneg.mp hpos
  exact absurd (lt_of_lt_of_le zero_lt_one hle) (lt_irrefl 0)

theorem obstruction_nonvacuous_Cut : ∀ j : ContinuumQ.Cut, j * j ≠ -1 := by
  intro j h
  have hpos : (0 : ContinuumQ.Cut) ≤ j * j := mul_self_nonneg j
  rw [h] at hpos
  have hle : (1 : ContinuumQ.Cut) ≤ 0 := neg_nonneg.mp hpos
  exact absurd (lt_of_lt_of_le zero_lt_one hle) (lt_irrefl 0)

end Phys.Cascade.Probe

