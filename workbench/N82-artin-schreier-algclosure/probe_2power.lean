import Phys.Algebra.LorentzContinuumAlgClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.GroupTheory.Sylow

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The 2-power-degree step: every finite GALOIS extension `M/Cut` has degree a power of 2. -/
theorem cut_galois_finrank_two_power (M : Type) [Field M] [Algebra Cut M]
    [FiniteDimensional Cut M] [IsGalois Cut M] :
    ∃ n : ℕ, Module.finrank Cut M = 2 ^ n := by
  haveI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  -- the Galois group
  set G := M ≃ₐ[Cut] M with hG
  haveI : Finite G := by
    have := IsGalois.card_aut_eq_finrank Cut M
    exact AlgEquiv.fintype Cut M |>.finite
  -- a 2-Sylow subgroup
  obtain ⟨P⟩ : Nonempty (Sylow 2 G) := Sylow.nonempty
  haveI : Finite P := Subtype.finite
  -- fixed field of P has finrank over Cut equal to the index of P
  have hcard : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) *
      Module.finrank (IntermediateField.fixedField (P : Subgroup G)) M = Module.finrank Cut M :=
    Module.finrank_mul_finrank Cut _ M
  have hfixcard : Module.finrank (IntermediateField.fixedField (P : Subgroup G)) M =
      Nat.card (P : Subgroup G) := IntermediateField.finrank_fixedField_eq_card _
  have hGcard : Nat.card G = Module.finrank Cut M := IsGalois.card_aut_eq_finrank Cut M
  have hPidx : Nat.card (P : Subgroup G) * (P : Subgroup G).index = Nat.card G :=
    Subgroup.card_mul_index _
  -- finrank Cut (fixedField P) = index P
  have hcardP_pos : 0 < Nat.card (P : Subgroup G) := Nat.card_pos
  have hidx_eq : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) =
      (P : Subgroup G).index := by
    have h1 : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) *
        Nat.card (P : Subgroup G) = (P : Subgroup G).index * Nat.card (P : Subgroup G) := by
      rw [hfixcard] at hcard
      rw [hcard, ← hGcard, ← hPidx]; ring
    exact Nat.eq_of_mul_eq_mul_right hcardP_pos h1
  -- index of a 2-Sylow is odd
  have hodd_idx : Odd (P : Subgroup G).index := by
    rw [← Nat.not_even_iff_odd, even_iff_two_dvd]
    exact P.not_dvd_index
  -- so fixedField P has odd finrank, hence = 1 by cut_no_odd_ext, hence index = 1
  have hfinrank1 : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) = 1 :=
    cut_no_odd_ext _ (hidx_eq ▸ hodd_idx)
  have hidx1 : (P : Subgroup G).index = 1 := by rw [← hidx_eq]; exact hfinrank1
  -- so card G = card P, a 2-power
  have hGeqP : Nat.card G = Nat.card (P : Subgroup G) := by
    rw [← hPidx, hidx1, mul_one]
  obtain ⟨n, hn⟩ := (IsPGroup.iff_card.mp P.2)
  exact ⟨n, by rw [← hGcard, hGeqP, hn]⟩

end
end Phys.Algebra
