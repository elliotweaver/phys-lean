import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

theorem map_incl_le_ImO (N : LieSubmodule ℚ derivationLieQ ↥ImLie) :
    (N.map ImLie.incl).toSubmodule ≤ ImO := by
  refine le_trans (Submodule.map_mono le_top) ?_
  rw [Submodule.map_top]
  intro x hx
  obtain ⟨y, rfl⟩ := hx
  exact y.2

theorem finrank_map_incl (N : LieSubmodule ℚ derivationLieQ ↥ImLie) :
    Module.finrank ℚ ↥((N.map ImLie.incl).toSubmodule) = Module.finrank ℚ ↥N.toSubmodule :=
  (Submodule.equivMapOfInjective (ImLie.incl).toLinearMap (Subtype.val_injective)
    N.toSubmodule).finrank_eq.symm

theorem ImLie_isIrreducible : LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie := by
  rw [LieModule.IsIrreducible]
  constructor
  intro N
  by_contra hcon
  rw [not_or] at hcon
  obtain ⟨hbot, htop⟩ := hcon
  set W := (N.map ImLie.incl).toSubmodule with hWdef
  have hWle : W ≤ ImO := map_incl_le_ImO N
  have hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W :=
    fun D x hx => (N.map ImLie.incl).lie_mem hx
  have hdimW : Module.finrank ℚ W = Module.finrank ℚ ↥N.toSubmodule := finrank_map_incl N
  have hd0 : 0 < Module.finrank ℚ W := by
    rw [hdimW]
    have hne : N.toSubmodule ≠ ⊥ := fun hh => hbot (by rwa [LieSubmodule.toSubmodule_eq_bot] at hh)
    have := (Submodule.one_le_finrank_iff (S := N.toSubmodule)).mpr hne
    omega
  have hd7 : Module.finrank ℚ W < 7 := by
    rw [hdimW]
    have hne : N.toSubmodule ≠ ⊤ := fun hh => htop (by rwa [LieSubmodule.toSubmodule_eq_top] at hh)
    have hlt := Submodule.finrank_lt (s := N.toSubmodule) hne
    rwa [finrank_ImLie] at hlt
  exact no_proper_invariant_ImO W hWle hWinv hd0 hd7

#print axioms ImLie_isIrreducible
end
end Phys.Algebra
