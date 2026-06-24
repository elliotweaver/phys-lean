/-
  Phys.Algebra.DerivationSimpleStructure — N30: the irreducible-faithful-module ⟹
  simple STRUCTURE THEOREM levers (the atom → two-commuting-ideals reduction), toward
  `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `LieAlgebra.IsSimple ℚ derivationLieQ`.
  ===========================================================================
  N29 banked the simplicity-reduction levers (`lieIdeal_nontrivial`,
  `eq_bot_of_lie_ImLie_bot`, `lie_ImLie_ne_bot_of_ne_bot`). N28 banked FULL
  IRREDUCIBILITY (`ImLie_isIrreducible`). N25 banked SEMISIMPLICITY
  (`derivationLieQ_semisimple`), which makes the lattice of Lie ideals a Boolean
  algebra, atomistic, with `sSup{atoms} = ⊤` (Mathlib `IsSemisimple.instBooleanAlgebra`).

  ★ WHAT THIS FILE BANKS (FORWARD, route-independent, foundations-only, NO posited G₂):
    exists_atom_ne_top — if the ideal lattice is NOT a simple order, there is an atom
                         `I ≠ ⊤` (≥ 2 atoms). The entry point of the structure theorem.
    atom_compl_decomp  — the Boolean complement `J = Iᶜ` of such an atom gives TWO
                         nonzero ideals with `I ⊓ J = ⊥`, `I ⊔ J = ⊤`, and `⁅I, J⁆ = ⊥`
                         (commuting) — the `L = I ⊕ J` direct-sum-of-commuting-ideals
                         split the prime-7 / isotypic-Schur argument runs on.

  These are the trunk-native reduction of `IsSimpleOrder` to a contradiction from a
  faithful irreducible 7-rep of a product of two nonzero commuting ideals — exactly the
  hypothesis the prime-dimension-7 argument refutes (`7` PRIME forbids the `so(4)`-type
  even split that makes faithful+irreducible insufficient on its own).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). NO `LieAlgebra.g₂`/`G₂` imported to
  assert anything. These are STRUCTURAL FACTS about the banked `derivationLieQ`, proved
  from its own banked semisimplicity; `LieIdeal`/`IsAtom`/`IsSimpleOrder`/`Booleanᶜ` are
  MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / compact / simple":
  what remains is the pure statement that, for the 14-dim Lie algebra of
  Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ, if the
  ideal lattice is not a simple order then it splits as two complementary nonzero
  commuting ideals.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationSimple

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

/-! ## The atom → two-commuting-ideals reduction (FORWARD, NO posited G₂). -/

/-- ★ If the Lie-ideal lattice of `derivationLieQ` is NOT a simple order, then there is
    an ATOM `I ≠ ⊤` (so there are at least two atoms). Semisimplicity makes the lattice
    atomistic (`sSup{atoms} = ⊤`); if every atom were `⊤` the supremum would be `⊤` only
    if `⊤` itself is an atom, i.e. the order is simple — contradiction. -/
theorem exists_atom_ne_top (h : ¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ)) :
    ∃ I : LieIdeal ℚ derivationLieQ, IsAtom I ∧ I ≠ ⊤ := by
  by_contra hc
  push Not at hc
  apply h
  rw [isSimpleOrder_iff_isAtom_top]
  have hsup : sSup {I : LieIdeal ℚ derivationLieQ | IsAtom I} = ⊤ :=
    LieAlgebra.IsSemisimple.sSup_atoms_eq_top
  have hne : {I : LieIdeal ℚ derivationLieQ | IsAtom I}.Nonempty := by
    rw [Set.nonempty_iff_ne_empty]
    intro hempty
    rw [hempty, sSup_empty] at hsup
    haveI := lieIdeal_nontrivial
    exact (bot_ne_top : (⊥ : LieIdeal ℚ derivationLieQ) ≠ ⊤) hsup
  obtain ⟨I₀, hI₀⟩ := hne
  have heq : I₀ = ⊤ := hc I₀ hI₀
  rw [heq] at hI₀; exact hI₀

/-- ★ THE `L = I ⊕ J` SPLIT. The Boolean complement `J = Iᶜ` of an atom `I ≠ ⊤` gives two
    NONZERO Lie ideals that are COMPLEMENTARY (`I ⊓ J = ⊥`, `I ⊔ J = ⊤`) and COMMUTE
    (`⁅I, J⁆ = ⊥`, because `⁅I, J⁆ ≤ I ⊓ J = ⊥`). This is the direct-sum-of-commuting-ideals
    hypothesis the prime-dimension-7 / isotypic-Schur structure theorem refutes. -/
theorem atom_compl_decomp (I : LieIdeal ℚ derivationLieQ) (hI : IsAtom I) (hIne : I ≠ ⊤) :
    I ≠ ⊥ ∧ (Iᶜ : LieIdeal ℚ derivationLieQ) ≠ ⊥ ∧ I ⊔ Iᶜ = ⊤ ∧ I ⊓ Iᶜ = ⊥ ∧
    (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) = ⊥ := by
  refine ⟨hI.1, ?_, sup_compl_eq_top, inf_compl_eq_bot, ?_⟩
  · rw [Ne, compl_eq_bot]; exact hIne
  · rw [eq_bot_iff]
    calc (⁅I, Iᶜ⁆ : LieIdeal ℚ derivationLieQ) ≤ I ⊓ Iᶜ :=
          le_inf (LieSubmodule.lie_le_left I Iᶜ) (LieSubmodule.lie_le_right Iᶜ I)
      _ = ⊥ := inf_compl_eq_bot

end

end Phys.Algebra
