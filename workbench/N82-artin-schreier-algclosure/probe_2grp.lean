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

-- ISOLATE: a finite Galois extension M/Cuti whose Galois group is a 2-group must be trivial.
-- If |Gal(M/Cuti)| = 2^n with n ≥ 1, a 2-Sylow=whole-group has a subgroup K of order 2^(n-1)
-- (index 2); fixedField K is a degree-2 extension of Cuti -> contradicts brick C cuti_no_deg_two_ext.
theorem cuti_galois_two_group_trivial (M : Type) [Field M] [Algebra Cuti M]
    [FiniteDimensional Cuti M] [IsGalois Cuti M]
    (n : ℕ) (hn : Module.finrank Cuti M = 2 ^ n) : n = 0 := by
  haveI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  by_contra hne
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hne
  set G := M ≃ₐ[Cuti] M with hG
  haveI : Finite G := (AlgEquiv.fintype Cuti M).finite
  have hGcard : Nat.card G = 2 ^ n := by
    rw [IsGalois.card_aut_eq_finrank Cuti M, hn]
  -- there is a subgroup K of order 2^(n-1)
  haveI : Fintype G := Fintype.ofFinite G
  have hdvd : 2 ^ (n - 1) ∣ Nat.card G := by
    rw [hGcard]; exact pow_dvd_pow 2 (Nat.sub_le n 1)
  obtain ⟨K, hKcard⟩ := Sylow.exists_subgroup_card_pow_prime (G := G) 2 (n := n - 1) hdvd
  -- fixedField K has finrank over Cuti = index of K = card G / card K = 2
  have hfix : Module.finrank (IntermediateField.fixedField K) M = Nat.card K :=
    IntermediateField.finrank_fixedField_eq_card K
  have hKcard' : Nat.card (K : Subgroup G) = 2 ^ (n - 1) := hKcard
  have htower : Module.finrank Cuti (IntermediateField.fixedField K) *
      Module.finrank (IntermediateField.fixedField K) M = Module.finrank Cuti M :=
    Module.finrank_mul_finrank Cuti _ M
  rw [hfix, hKcard', hn] at htower
  -- 2^(n-1) factor: finrank Cuti (fixedField K) = 2^n / 2^(n-1) = 2
  have h2pos : 0 < 2 ^ (n - 1) := pow_pos (by norm_num) _
  have hfin2 : Module.finrank Cuti (IntermediateField.fixedField K) = 2 := by
    have : Module.finrank Cuti (IntermediateField.fixedField K) * 2 ^ (n - 1) = 2 * 2 ^ (n - 1) := by
      rw [htower]; rw [← pow_succ']; congr 1; omega
    exact Nat.eq_of_mul_eq_mul_right h2pos this
  exact cuti_no_deg_two_ext (IntermediateField.fixedField K) hfin2

end
end Phys.Algebra
