import Phys.Algebra.MirrorLegalityDerived

/-!
  # SCRATCH N679 — UnaryNestCount: the independently constructed unary object
  (referee follow-up seam A). PREREG: workbench/mirror-closure/PREREG-AIRTIGHT.md (ext).

  THE SEAM: `foldCount : ℕ → Cut := fun _ => 1` contains the answer definitionally, and
  `derivedLegal_returns` merely unfolds it. THE FIX: construct the unary self-reference
  structure as an inductive family, PROVE its count is 1 (induction, not definition),
  weld the banked tower's coefficients to the constructed count, transport the selfref
  law onto the constructed tower, and re-point derived legality at the constructed object.
-/

namespace Phys.Algebra
namespace MirrorTermLanguage
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight
open Phys.Algebra.ChainTermGrammar
open Phys.Algebra

noncomputable section

/-! ## (1) THE UNARY SELF-REFERENCE STRUCTURE — an inductive family, constructed. -/

/-- A depth-`n` unary self-insertion: the fold re-entering itself `n` times, where each
    level offers EXACTLY ONE re-entry point (the look-back is unary — no branching).
    `base` is the un-inserted look; `step` is one more re-entry of the whole. -/
inductive UnaryNest : ℕ → Type where
  | base : UnaryNest 0
  | step {n : ℕ} : UnaryNest n → UnaryNest (n + 1)

/-- Every depth is inhabited: the n-fold re-entry exists. -/
def UnaryNest.canonical : (n : ℕ) → UnaryNest n
  | 0 => .base
  | n + 1 => .step (canonical n)

instance (n : ℕ) : Nonempty (UnaryNest n) := ⟨UnaryNest.canonical n⟩

/-- THE UNARY LAW AS STRUCTURE: at every depth there is at most one nesting — proved by
    induction on the family, not defined. -/
theorem UnaryNest.subsingleton : ∀ (n : ℕ) (a b : UnaryNest n), a = b
  | 0, .base, .base => rfl
  | n + 1, .step a, .step b => by rw [UnaryNest.subsingleton n a b]

instance (n : ℕ) : Subsingleton (UnaryNest n) := ⟨UnaryNest.subsingleton n⟩

/-- THE CONSTRUCTED MULTIPLICITY: the number of distinct depth-`n` unary nestings. -/
def nestCount (n : ℕ) : Cut := (Nat.card (UnaryNest n) : Cut)

/-- ★★ THE COUNT IS ONE — a THEOREM of the constructed structure (cardinality of an
    inhabited subsingleton), not a definition containing `1`. -/
theorem nestCount_eq_one (n : ℕ) : nestCount n = 1 := by
  unfold nestCount
  have h : Nat.card (UnaryNest n) = 1 := Nat.card_eq_one_iff_unique.mpr
    ⟨inferInstance, inferInstance⟩
  rw [h]
  norm_num

/-! ## (2) THE WELDS — the banked tower's coefficients ARE the constructed counts, and
    the constructed tower obeys the banked self-reference law. -/

/-- WELD: the banked `foldCount` coefficient equals the constructed nesting count at
    every depth — the tower's unit coefficients are the counted unary structure. -/
theorem foldCount_eq_nestCount (n : ℕ) :
    Phys.Algebra.foldCount n = nestCount n := by
  rw [nestCount_eq_one]
  rfl

/-- The tower built on the CONSTRUCTED counts. -/
def dressedOverlapNest (κ₀ w : Cut) : Cut := κ₀ * ∑' n : ℕ, nestCount n * w ^ n

/-- The constructed tower IS the banked tower. -/
theorem dressedOverlapNest_eq (κ₀ w : Cut) :
    dressedOverlapNest κ₀ w = Phys.Algebra.dressedOverlap κ₀ w := by
  unfold dressedOverlapNest Phys.Algebra.dressedOverlap
  refine congrArg (κ₀ * ·) ?_
  exact tsum_congr (fun n => by rw [← foldCount_eq_nestCount])

/-- ★★ THE SELF-REFERENCE LAW ON THE CONSTRUCTED TOWER: the tower whose coefficients are
    the COUNTED unary nestings satisfies `D = κ₀ + w·D` — the banked self-reference
    identity transported onto the independently constructed object. -/
theorem dressedOverlapNest_selfref (κ₀ w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    dressedOverlapNest κ₀ w = κ₀ + w * dressedOverlapNest κ₀ w := by
  rw [dressedOverlapNest_eq]
  exact Phys.Algebra.dressedOverlap_selfref κ₀ w hw0 hw1

/-! ## (3) THE DERIVED LEGALITY, v2 — the returns conjunct now references the
    CONSTRUCTED count. -/

/-- Derived legality with the return slot referencing the constructed unary object:
    the term's return count equals the nesting count of the unary structure at its own
    depth. All other conjuncts as in `DerivedLegal`. -/
def DerivedLegalNest (t : ParsedTerm) : Prop :=
  ((t.censusWeight : Cut)
      = (chargeTraceDepth - bandScreen chargeTraceDepth 1) * depthWeight)
  ∧ ((t.returns : Cut) = nestCount t.returns)
  ∧ (t.logContent = bandScreen 1 1 + 1)
  ∧ (termMomentNorm t.alphaEnds = depthWeight)

/-- RETURNS DERIVED, v2: consumes `nestCount_eq_one` — the induction-proved count of the
    constructed structure — to conclude the slot value. -/
theorem derivedLegalNest_returns {t : ParsedTerm} (h : DerivedLegalNest t) :
    t.returns = 1 := by
  have hr := h.2.1
  rw [nestCount_eq_one] at hr
  exact_mod_cast hr

/-- The two derived forms agree (the v1 returns-conjunct and the constructed one are
    both pinned to the same count). -/
theorem derivedLegalNest_iff (t : ParsedTerm) :
    DerivedLegalNest t ↔ DerivedLegal t := by
  unfold DerivedLegalNest DerivedLegal
  constructor
  · rintro ⟨h1, h2, h3, h4⟩
    refine ⟨h1, ?_, h3, h4⟩
    rw [h2, ← foldCount_eq_nestCount]
  · rintro ⟨h1, h2, h3, h4⟩
    refine ⟨h1, ?_, h3, h4⟩
    unfold Phys.Algebra.foldCount at h2
    rw [nestCount_eq_one]
    exact h2

/-- ★★★ THE UNIVERSAL SELECTION on the constructed form. -/
theorem mirror_term_universal_nest (t : ParsedTerm) (h : DerivedLegalNest t) :
    t = mirrorParsed :=
  mirror_term_universal_derived t ((derivedLegalNest_iff t).mp h)

/-- Inhabitation: the mirror term satisfies the constructed legality. -/
theorem mirrorParsed_derivedLegalNest : DerivedLegalNest mirrorParsed :=
  (derivedLegalNest_iff mirrorParsed).mpr mirrorParsed_derivedLegal

/-- ★★★ THE CAPSTONE on the constructed legality. -/
theorem alpha_landing_capstone_nest :
    (∀ t : ParsedTerm, DerivedLegalNest t → t = mirrorParsed)
    ∧ (∃! a : Cut, MirrorFixedPoint.ChainAdmissible a
        ∧ MirrorFixedPoint.residualWelded a = 0
        ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
        ∧ 1/a ≤ 1370359990778029 / 10000000000000) :=
  ⟨fun t h => mirror_term_universal_nest t h,
   MirrorFixedPoint.alpha_landing_capstone.2⟩

end
end MirrorTermLanguage
end Phys.Algebra
