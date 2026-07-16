import Phys.Quantum.ComplexStructure
import Mathlib.Tactic

open Phys.Foundation Phys.Cascade Phys.Quantum

noncomputable section

-- (a) generic well-founded collapse
theorem distinguished_empty {α : Type*} {r : α → α → Prop} (hwf : WellFounded r)
    {D : α → Prop} (hstep : ∀ x, D x → ∃ y, D y ∧ r y x) (x : α) : ¬ D x := by
  refine hwf.induction (C := fun z => ¬ D z) x ?_
  intro z IH hDz
  obtain ⟨y, hDy, hyz⟩ := hstep z hDz
  exact IH y hyz hDy

-- W8 non-vacuity: on ℕ with <, no nonempty regress-closed class
theorem no_completed_tower :
    ¬ ∃ D : ℕ → Prop, (∃ n, D n) ∧ (∀ n, D n → ∃ m, D m ∧ m < n) := by
  rintro ⟨D, ⟨x, hx⟩, hstep⟩
  exact distinguished_empty wellFounded_lt hstep x hx

-- (b) the cover: J∘J = look-back for any fold
theorem foldComplex_sq_is_fold {look : StateFibre → StateFibre} (h : IsFold look) (p : StateFibre) :
    foldComplex (foldComplex p) = look p := by
  rw [foldComplex_sq, fold_eq_neg h]

-- (b) weld: cover ∧ fixed-point-free on live states
theorem cover_not_completion {look : StateFibre → StateFibre} (h : IsFold look) :
    (∀ p, foldComplex (foldComplex p) = look p) ∧ (∀ p : StateFibre, p ≠ 0 → foldComplex p ≠ p) := by
  refine ⟨fun p => foldComplex_sq_is_fold h p, fun p hp hfix => hp (foldComplex_self_blind p hfix)⟩

-- capstone weld
theorem tower_termination {look : StateFibre → StateFibre} (h : IsFold look) :
    (¬ ∃ D : ℕ → Prop, (∃ n, D n) ∧ (∀ n, D n → ∃ m, D m ∧ m < n))
    ∧ (∀ p, foldComplex (foldComplex p) = look p)
    ∧ (∀ p : StateFibre, p ≠ 0 → foldComplex p ≠ p) :=
  ⟨no_completed_tower, fun p => foldComplex_sq_is_fold h p,
    fun p hp hfix => hp (foldComplex_self_blind p hfix)⟩

-- non-vacuity that the fold on the fibre exists
theorem fibre_neg_isFold : IsFold (fun p : StateFibre => -p) := neg_isFold

#print axioms distinguished_empty
#print axioms no_completed_tower
#print axioms foldComplex_sq_is_fold
#print axioms cover_not_completion
#print axioms tower_termination

end
