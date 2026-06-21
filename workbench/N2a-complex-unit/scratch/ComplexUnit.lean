/-
  SCRATCH — N2a complex unit. Not imported by Phys.lean. One rung at a time.
-/
import Mathlib.Algebra.Group.Basic
import Mathlib.LinearAlgebra.Prod
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Phys.Foundation.Fold

namespace Phys.Cascade.Scratch

open Phys.Foundation

variable {V : Type*} [AddGroup V]

/-- A *fold-root*: a self-map whose square IS the fold (N1). Reuses `IsFold` directly:
    `J ∘ J` annihilates each state, i.e. `J (J x) + x = 0`. -/
def IsFoldRoot (J : V → V) : Prop := IsFold (fun x => J (J x))

/-- Unfolded form: a fold-root squares to `-id`. -/
theorem isFoldRoot_iff {J : V → V} : IsFoldRoot J ↔ ∀ x, J (J x) = -x := by
  constructor
  · intro h x; exact fold_eq_neg h x
  · intro h x; show J (J x) + x = 0; rw [h x]; exact neg_add_cancel x

-- ===========================================================================
-- RUNG 1 — OBSTRUCTION at the base carrier ℝ (dim 1): no LINEAR fold-root.
-- ===========================================================================
theorem no_foldRoot_dim1 : ¬ ∃ J : ℝ →ₗ[ℝ] ℝ, IsFoldRoot (fun x => J x) := by
  rintro ⟨J, hJ⟩
  -- A linear endo of ℝ is multiplication by c := J 1.
  set c : ℝ := J 1 with hc
  have hlin : ∀ x : ℝ, J x = x * c := by
    intro x
    have : J x = x • J 1 := by
      rw [← LinearMap.map_smul]; congr 1; simp [smul_eq_mul]
    rw [this, hc, smul_eq_mul]
  -- fold-root at x = 1 ⇒ c² = -1.
  have hroot : (fun x => J x) ((fun x => J x) 1) = -(1 : ℝ) := (isFoldRoot_iff.mp hJ) 1
  simp only at hroot
  have hsq : c * c = -1 := by
    have h1 : J 1 = c := hc.symm
    rw [hlin (J 1), h1] at hroot
    -- hroot : c * c = -1
    simpa using hroot
  -- but c*c ≥ 0 over ℝ.
  have : (0:ℝ) ≤ c * c := mul_self_nonneg c
  rw [hsq] at this
  linarith

-- ===========================================================================
-- RUNG 2 — RESOLUTION by doubling (dim 2): the complex unit on ℝ × ℝ.
-- J₂(a,b) = (-b, a), built as a genuine ℝ-linear map on the DOUBLED carrier.
-- ===========================================================================

/-- The complex unit, constructed on the doubled real carrier `ℝ × ℝ`:
    `J₂(a,b) = (-b, a)`. (No `Complex.I` imported — this IS the complex unit, derived.) -/
def J₂ : (ℝ × ℝ) →ₗ[ℝ] (ℝ × ℝ) where
  toFun p := (-p.2, p.1)
  map_add' p q := Prod.ext (by simp; ring) (by simp)
  map_smul' r p := Prod.ext (by simp) (by simp)

@[simp] theorem J₂_apply (p : ℝ × ℝ) : J₂ p = (-p.2, p.1) := rfl

/-- RESOLUTION: `J₂` is a fold-root — `J₂² = -id`, the complex unit law. -/
theorem J₂_isFoldRoot : IsFoldRoot (fun p => J₂ p) := by
  rw [isFoldRoot_iff]
  intro p
  simp [Prod.ext_iff]

/-- SELF-BLIND: the complex unit inherits the fold's self-blindness — its only
    fixed point is the void. Derived via N1's `fold_self_blind` (the chain is
    unbroken: `J₂∘J₂` IS the fold, `ℝ×ℝ` is 2-torsion-free). -/
theorem J₂_self_blind (p : ℝ × ℝ) (hp : J₂ p = p) : p = 0 := by
  refine fold_self_blind J₂_isFoldRoot ?_ p ?_
  · intro y hy
    -- ℝ × ℝ is 2-torsion-free
    have : (2 : ℝ) • y = 0 := by rw [two_smul]; exact hy
    simpa using this
  · show J₂ (J₂ p) = p
    rw [hp, hp]

/-- NEW operator: the complex unit is neither the identity nor the fold itself. -/
theorem J₂_ne_id : (fun p => J₂ p) ≠ (fun p : ℝ × ℝ => p) := by
  intro h
  have := congrFun h (1, 0)
  simp [Prod.ext_iff] at this

theorem J₂_ne_fold : (fun p => J₂ p) ≠ (fun p : ℝ × ℝ => -p) := by
  intro h
  have := congrFun h (1, 0)
  simp [Prod.ext_iff] at this

end Phys.Cascade.Scratch
