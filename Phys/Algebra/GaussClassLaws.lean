/-
  # THE CLASS COMPOSITION RELATION AND ITS LAWS (GQ R2)

  ## What this file proves (GQ campaign, production node)

  Class-level composition enters the trunk RELATIONALLY — `CompRel f g h`
  holds when a concordant presentation of f and g gathers to h — and every
  group law is proved at this level, presentation-explicit, entirely on the
  derived integers:

  * `CompRel` — the composition relation (concordant presentation + gather).
  * `compRel_functional` — ★★ ANY two composition results are chain-equivalent
    (direct from `compose_well_defined`): composition is a FUNCTION on classes.
  * `compRel_congr` — CompRel respects Chain in all three slots.
  * `compRel_comm` — commutativity (the gather does not order its branches).
  * `compRel_id'` / `unit_gather_is_branch` — ★ the identity law ON THE NOSE:
    the unit-branch gather IS the second branch.
  * `compRel_inv_even/odd` — ★ the inverse law, both parities: f gathers with
    its conjugate branch to THE principal form, every chain move explicit.
  * `conj_branch_class` — the conjugate branch is one move from conj.
  * `triple_split` / `compRel_assoc_presented` — ★ associativity: with one
    triple record, both bracketings land on the SAME triple-gather form.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCompose

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Class composition, relational form: some concordant presentation of the
    two inputs gathers to the output. -/
def CompRel (f g h : BQF) : Prop :=
  ∃ a1 a2 B t al be : Z,
    al * a1 + be * a2 = 1 ∧ a1 * a2 ≠ 0 ∧
    Chain f ⟨a1, B, a2 * t⟩ ∧ Chain g ⟨a2, B, a1 * t⟩ ∧
    Chain (gatherForm a1 a2 B t) h

/-- ★★ FUNCTIONALITY: any two composition results are chain-equivalent. -/
theorem compRel_functional {f g h1 h2 : BQF}
    (hc1 : CompRel f g h1) (hc2 : CompRel f g h2) : Chain h1 h2 := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hf1, hg1, hh1⟩ := hc1
  obtain ⟨a1', a2', B', t', al', be', hbez', hne', hf2, hg2, hh2⟩ := hc2
  have hch1 : Chain (⟨a1, B, a2 * t⟩ : BQF) ⟨a1', B', a2' * t'⟩ :=
    chainTrans (chainSymm hf1) hf2
  have hch2 : Chain (⟨a2, B, a1 * t⟩ : BQF) ⟨a2', B', a1' * t'⟩ :=
    chainTrans (chainSymm hg1) hg2
  have hdisc : disc (gatherForm a1 a2 B t) = disc (gatherForm a1' a2' B' t') := by
    have h1d : disc (gatherForm a1 a2 B t) = disc (⟨a1, B, a2 * t⟩ : BQF) := by
      unfold disc gatherForm
      ring
    have h2d : disc (gatherForm a1' a2' B' t') = disc (⟨a1', B', a2' * t'⟩ : BQF) := by
      unfold disc gatherForm
      ring
    rw [h1d, h2d]
    exact disc_eq hch1
  have hWD := compose_well_defined hbez hne hdisc hch1 hch2
  exact chainTrans (chainSymm hh1) (chainTrans hWD hh2)

/-- CompRel respects Chain in all three slots. -/
theorem compRel_congr {f f' g g' h h' : BQF}
    (hf : Chain f f') (hg : Chain g g') (hh : Chain h h')
    (hc : CompRel f g h) : CompRel f' g' h' := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hc
  exact ⟨a1, a2, B, t, al, be, hbez, hne,
    chainTrans (chainSymm hf) hcf,
    chainTrans (chainSymm hg) hcg,
    chainTrans hch hh⟩

/-- ★ COMMUTATIVITY. -/
theorem compRel_comm {f g h : BQF} (hc : CompRel f g h) : CompRel g f h := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hc
  refine ⟨a2, a1, B, t, be, al, by linarith, ?_, hcg, hcf, ?_⟩
  · intro h0
    apply hne
    rw [show a1 * a2 = a2 * a1 by ring]
    exact h0
  · rw [gather_comm]
    exact hch

/-! ### The identity law. -/

/-- The unit gather IS the second branch, coefficientwise. -/
theorem unit_gather_is_branch (a2 B c2 : Z) :
    gatherForm 1 a2 B c2 = (⟨a2, B, 1 * c2⟩ : BQF) := by
  unfold gatherForm
  have h1 : (1 : Z) * a2 = a2 := one_mul a2
  have h2 : (1 : Z) * c2 = c2 := one_mul c2
  rw [h1, h2]

/-- ★ THE IDENTITY LAW: the unit-branch presentation of the principal class
    composes with any concordant g to g itself, ON THE NOSE. -/
theorem compRel_id' {a2 B c2 : Z} (ha2 : a2 ≠ 0) :
    CompRel (⟨1, B, a2 * c2⟩ : BQF) (⟨a2, B, 1 * c2⟩ : BQF)
      (⟨a2, B, 1 * c2⟩ : BQF) := by
  have h : CompRel (⟨1, B, a2 * c2⟩ : BQF) (⟨a2, B, 1 * c2⟩ : BQF)
      (gatherForm 1 a2 B c2) := by
    refine ⟨1, a2, B, c2, 1, 0, by ring, ?_, Chain.refl _, Chain.refl _, Chain.refl _⟩
    intro h0
    apply ha2
    rw [one_mul] at h0
    exact h0
  rw [unit_gather_is_branch] at h
  exact h

/-! ### The inverse law (both parities, all moves explicit). -/

/-- ★ EVEN record: (a, 2m, c) with its conjugate branch lands on the even
    principal form (1, 0, ac − m²). -/
theorem compRel_inv_even {a c m al be : Z}
    (hbez : al * a + be * c = 1) (hne : a * c ≠ 0) :
    CompRel (⟨a, 2 * m, c * 1⟩ : BQF) (⟨c, 2 * m, a * 1⟩ : BQF)
      (⟨1, 0, a * c - m * m⟩ : BQF) := by
  refine ⟨a, c, 2 * m, 1, al, be, hbez, hne, Chain.refl _, Chain.refl _, ?_⟩
  have hg : gatherForm a c (2 * m) 1 = (⟨a * c, 2 * m, 1⟩ : BQF) := rfl
  rw [hg]
  exact inverse_law_even (a * c) m

/-- ★ ODD record: lands on the odd principal form (1, 1, ac − m² − m). -/
theorem compRel_inv_odd {a c m al be : Z}
    (hbez : al * a + be * c = 1) (hne : a * c ≠ 0) :
    CompRel (⟨a, 2 * m + 1, c * 1⟩ : BQF) (⟨c, 2 * m + 1, a * 1⟩ : BQF)
      (⟨1, 1, a * c - m * m - m⟩ : BQF) := by
  refine ⟨a, c, 2 * m + 1, 1, al, be, hbez, hne, Chain.refl _, Chain.refl _, ?_⟩
  have hg : gatherForm a c (2 * m + 1) 1 = (⟨a * c, 2 * m + 1, 1⟩ : BQF) := rfl
  rw [hg]
  exact inverse_law_odd (a * c) m

/-- The conjugate branch is one move from conj: [(c, b, a)] = [conj f]. -/
theorem conj_branch_class (a b c : Z) :
    Chain (⟨a, -b, c⟩ : BQF) (⟨c, b, a⟩ : BQF) := by
  have h : swapF (⟨a, -b, c⟩ : BQF) = (⟨c, b, a⟩ : BQF) := by
    unfold swapF
    show (⟨c, -(-b), a⟩ : BQF) = ⟨c, b, a⟩
    rw [neg_neg]
  rw [← h]
  exact of_swap _

/-! ### Associativity. -/

/-- ★ TRIPLE SPLIT: one triple record presents both bracketings with
    matching cofactors. -/
theorem triple_split (a1 a2 a3 B t : Z) :
    gatherForm (a1 * a2) a3 B t = gatherForm a1 (a2 * a3) B t
    ∧ (∀ D : Z, B * B - D = 4 * (a1 * a2 * a3) * t →
        (B * B - D = 4 * (a1 * a2) * (a3 * t))
        ∧ (B * B - D = 4 * a1 * ((a2 * a3) * t))
        ∧ (B * B - D = 4 * a3 * ((a1 * a2) * t))
        ∧ (B * B - D = 4 * (a2 * a3) * (a1 * t))) := by
  constructor
  · exact triple_flat a1 a2 a3 B t
  · intro D h
    refine ⟨?_, ?_, ?_, ?_⟩ <;> (rw [h]; ring)

/-- ★ RELATION-LEVEL ASSOCIATIVITY: with one triple record, both bracketed
    compositions land on THE SAME form. -/
theorem compRel_assoc_presented {a1 a2 a3 B t al12 be12 al3 be3 : Z}
    (h12 : al12 * (a1 * a2) + be12 * a3 = 1)
    (h23 : al3 * a1 + be3 * (a2 * a3) = 1)
    (hne : a1 * a2 * a3 ≠ 0) :
    CompRel (⟨a1 * a2, B, a3 * t⟩ : BQF) (⟨a3, B, (a1 * a2) * t⟩ : BQF)
      (gatherForm (a1 * a2) a3 B t)
    ∧ CompRel (⟨a1, B, (a2 * a3) * t⟩ : BQF) (⟨a2 * a3, B, a1 * t⟩ : BQF)
      (gatherForm a1 (a2 * a3) B t)
    ∧ gatherForm (a1 * a2) a3 B t = gatherForm a1 (a2 * a3) B t := by
  refine ⟨?_, ?_, triple_flat a1 a2 a3 B t⟩
  · refine ⟨a1 * a2, a3, B, t, al12, be12, h12, ?_,
      Chain.refl _, Chain.refl _, Chain.refl _⟩
    intro h0
    apply hne
    exact h0
  · refine ⟨a1, a2 * a3, B, t, al3, be3, h23, ?_,
      Chain.refl _, Chain.refl _, Chain.refl _⟩
    intro h0
    apply hne
    rw [show a1 * a2 * a3 = a1 * (a2 * a3) by ring]
    exact h0

#print axioms compRel_functional
#print axioms compRel_comm
#print axioms compRel_id'
#print axioms compRel_inv_even
#print axioms compRel_inv_odd
#print axioms compRel_assoc_presented

end BQF
end GaussForms
end Phys.Foundation
