import Phys.Algebra.DerivationSimple
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

attribute [local instance] derivationLieQ_semisimple

-- LEVER 1: ¬IsSimpleOrder ⟹ ∃ atom I, I ≠ ⊤.
theorem exists_atom_ne_top (h : ¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ)) :
    ∃ I : LieIdeal ℚ derivationLieQ, IsAtom I ∧ I ≠ ⊤ := by
  by_contra hc
  push_neg at hc
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

-- LEVER 2: the Boolean complement J = Iᶜ gives two commuting nonzero ideals.
-- ⁅I,J⁆ ≤ I and ≤ J ⟹ ⁅I,J⁆ ≤ I ⊓ J = ⊥.
example (I : LieIdeal ℚ derivationLieQ) :
    (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) ≤ I :=
  LieSubmodule.lie_le_left I Iᶜ

example (I : LieIdeal ℚ derivationLieQ) :
    (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) ≤ Iᶜ :=
  LieSubmodule.lie_le_right Iᶜ I

example (I : LieIdeal ℚ derivationLieQ) (hI : IsAtom I) (hIne : I ≠ ⊤) :
    I ≠ ⊥ ∧ (Iᶜ : LieIdeal ℚ derivationLieQ) ≠ ⊥ ∧ I ⊔ Iᶜ = ⊤ ∧ I ⊓ Iᶜ = ⊥ ∧
    (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) = ⊥ := by
  refine ⟨hI.1, ?_, sup_compl_eq_top, inf_compl_eq_bot, ?_⟩
  · rw [Ne, compl_eq_bot]; exact hIne
  · rw [eq_bot_iff]
    calc (⁅I, Iᶜ⁆ : LieIdeal ℚ derivationLieQ) ≤ I ⊓ Iᶜ :=
          le_inf (LieSubmodule.lie_le_left I Iᶜ) (LieSubmodule.lie_le_right Iᶜ I)
      _ = ⊥ := inf_compl_eq_bot

-- LEVER 3: every nonzero ideal acts as ⊤ on ImLie (faithfulness + irreducibility).
example (K : LieIdeal ℚ derivationLieQ) (hK : K ≠ ⊥) :
    (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) = ⊤ := by
  rcases (ImLie_isIrreducible.eq_bot_or_eq_top ⁅K, ImLie⁆) with h | h
  · exact absurd h (lie_ImLie_ne_bot_of_ne_bot K hK)
  · exact h

end
end Phys.Algebra
