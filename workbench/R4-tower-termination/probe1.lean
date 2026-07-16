import Phys.Quantum.ComplexStructure
import Mathlib.Tactic

open Phys.Foundation Phys.Cascade Phys.Quantum

noncomputable section

-- generic well-founded collapse tool
theorem distinguished_empty {α : Type*} {r : α → α → Prop} (hwf : WellFounded r)
    {D : α → Prop} (hstep : ∀ x, D x → ∃ y, D y ∧ r y x) (x : α) : ¬ D x := by
  refine hwf.induction (C := fun z => ¬ D z) x ?_
  intro z IH hDz
  obtain ⟨y, hDy, hyz⟩ := hstep z hDz
  exact IH y hyz hDy

-- ℕ instantiation, W8 non-vacuity witness
theorem no_completed_tower :
    ¬ ∃ D : ℕ → Prop, (∃ n, D n) ∧ (∀ n, D n → ∃ m, D m ∧ m < n) := by
  rintro ⟨D, ⟨x, hx⟩, hstep⟩
  exact distinguished_empty wellFounded_lt hstep x hx

-- fibre 2-torsion-free
theorem fibre_two_torsion_free : ∀ y : StateFibre, y + y = 0 → y = 0 := by
  intro y hy
  have : (2 : ContinuumQ.Cut) • y = 0 := by rw [two_smul]; exact hy
  simpa using this

-- the look-back has no live fixed point (no completed self-representation)
theorem lookback_no_live_fixed_point {look : StateFibre → StateFibre} (h : IsFold look)
    (p : StateFibre) (hp : look p = p) : p = 0 :=
  fold_self_blind h fibre_two_torsion_free p hp

-- (b) the cover: J∘J = look-back for any fold
theorem foldComplex_covers_fold {look : StateFibre → StateFibre} (h : IsFold look) (p : StateFibre) :
    foldComplex (foldComplex p) = look p := by
  rw [foldComplex_sq, fold_eq_neg h]

-- (b) J fixed-point-free on live states
theorem cover_fixed_point_free {p : StateFibre} (hp : p ≠ 0) : foldComplex p ≠ p :=
  fun hfix => hp (foldComplex_self_blind p hfix)

-- ★ THE WELD (per-live-p): the SAME J both covers the look-back and fixes nothing live
theorem cover_not_completion {look : StateFibre → StateFibre} (h : IsFold look)
    {p : StateFibre} (hp : p ≠ 0) :
    foldComplex (foldComplex p) = look p ∧ foldComplex p ≠ p :=
  ⟨foldComplex_covers_fold h p, cover_fixed_point_free hp⟩

-- capstone: one object read twice
theorem tower_termination {look : StateFibre → StateFibre} (h : IsFold look) :
    (¬ ∃ D : ℕ → Prop, (∃ n, D n) ∧ (∀ n, D n → ∃ m, D m ∧ m < n))
    ∧ (∀ p : StateFibre, look p = p → p = 0)
    ∧ (∀ p, foldComplex (foldComplex p) = look p)
    ∧ (∀ p : StateFibre, p ≠ 0 → foldComplex (foldComplex p) = look p ∧ foldComplex p ≠ p) :=
  ⟨no_completed_tower,
   fun p hp => lookback_no_live_fixed_point h p hp,
   fun p => foldComplex_covers_fold h p,
   fun _ hp => cover_not_completion h hp⟩

theorem fibre_neg_isFold : IsFold (fun p : StateFibre => -p) := neg_isFold

-- W8: the weld bites on a concrete live state under the negation fold
theorem cover_not_completion_bites :
    foldComplex (foldComplex eInward) = (fun p : StateFibre => -p) eInward ∧ foldComplex eInward ≠ eInward :=
  cover_not_completion fibre_neg_isFold (by
    intro h; have : (1 : ContinuumQ.Cut) = 0 := congrArg Prod.fst h; exact one_ne_zero this)

#print axioms distinguished_empty
#print axioms no_completed_tower
#print axioms fibre_two_torsion_free
#print axioms lookback_no_live_fixed_point
#print axioms foldComplex_covers_fold
#print axioms cover_fixed_point_free
#print axioms cover_not_completion
#print axioms tower_termination
#print axioms fibre_neg_isFold
#print axioms cover_not_completion_bites

end
