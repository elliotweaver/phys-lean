import Mathlib.Algebra.Group.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Int.Basic

/-
  N1 scratch — THE FOLD as self-look-back, and self-blindness DERIVED.
  HONEST formalization: the fold is the self-map whose look-back ANNIHILATES the state.
  No physics. No ℂ/ℍ/𝕆. look² = id (NOT -id) — J²=-1 is N2's to derive, not posited here.
-/

namespace ScratchFold

variable {V : Type*} [AddGroup V]

/-- The look-back law (the ONE posit, as a definition): a self-map `look` is a *fold* on `V`
    if looking back at a state and the state itself annihilate to the void `0`. -/
def IsFold (look : V → V) : Prop := ∀ x, look x + x = 0

/-- (1) FORCED: the look-back law forces `look` to be the unique annihilating reflection. -/
theorem fold_eq_neg {look : V → V} (h : IsFold look) (x : V) : look x = -x :=
  add_eq_zero_iff_eq_neg.mp (h x)

/-- (1') UNIQUE: any two folds coincide — the fold is not arbitrary. -/
theorem fold_unique {l₁ l₂ : V → V} (h₁ : IsFold l₁) (h₂ : IsFold l₂) : l₁ = l₂ := by
  funext x; rw [fold_eq_neg h₁ x, fold_eq_neg h₂ x]

/-- (2) VOID sees itself: the neutral state is fixed. -/
theorem fold_zero {look : V → V} (h : IsFold look) : look 0 = 0 := by
  rw [fold_eq_neg h 0, neg_zero]

/-- (3) THE FOLD CLOSES: looking back twice returns — `look² = id`, NOT `-id`. -/
theorem fold_involutive {look : V → V} (h : IsFold look) (x : V) : look (look x) = x := by
  rw [fold_eq_neg h (look x), fold_eq_neg h x, neg_neg]

/-- (4) SELF-BLINDNESS (the forced first property): on a 2-torsion-free carrier the look-back
    has NO nonzero fixed point. The torsion-free hypothesis is load-bearing (see costume). -/
theorem fold_self_blind {look : V → V} (h : IsFold look)
    (tf : ∀ y : V, y + y = 0 → y = 0) (x : V) (hx : look x = x) : x = 0 := by
  have hneg : -x = x := by rw [← fold_eq_neg h x]; exact hx
  exact tf x (add_eq_zero_iff_eq_neg.mpr hneg.symm)

/-- (5) The canonical fold exists: negation is a fold (structure is inhabited). -/
theorem neg_isFold : IsFold (fun x : V => -x) := fun x => neg_add_cancel x

end ScratchFold

/-- Tightness A — the 2-torsion-free hypothesis is ESSENTIAL: on ZMod 2 the fold has a
    NONZERO fixed point, so self-blindness FAILS there. (logical complement of the costume) -/
theorem zmod2_fold_has_nonzero_fixed :
    ∃ x : ZMod 2, (fun y : ZMod 2 => -y) x = x ∧ x ≠ 0 := by
  exact ⟨1, by decide, by decide⟩

/-- Tightness B / non-vacuity — over ℤ the fold genuinely moves a nonzero state, so
    "no nonzero fixed point" is non-vacuous and the carrier is inhabited by such states. -/
theorem int_fold_nonzero_not_fixed :
    ∃ x : ℤ, x ≠ 0 ∧ (fun y : ℤ => -y) x ≠ x := by
  refine ⟨1, by decide, by decide⟩
