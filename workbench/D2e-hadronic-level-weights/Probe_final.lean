import Phys.Algebra.HadronicSpectrum
import Phys.Algebra.DerivationAutCompact
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.D2eProbe2

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## IntLat characterization via coordO. -/

theorem intLat_iff_coordO (w : O ℚ) :
    IntLat w ↔ ∀ k : Fin 8, ∃ m : ℤ, coordO w k = (m : ℚ) := by
  constructor
  · rintro ⟨⟨k0,h0⟩,⟨k1,h1⟩,⟨k2,h2⟩,⟨k3,h3⟩,⟨k4,h4⟩,⟨k5,h5⟩,⟨k6,h6⟩,⟨k7,h7⟩⟩ k
    fin_cases k
    · exact ⟨k0, by exact_mod_cast h0⟩
    · exact ⟨k1, by exact_mod_cast h1⟩
    · exact ⟨k2, by exact_mod_cast h2⟩
    · exact ⟨k3, by exact_mod_cast h3⟩
    · exact ⟨k4, by exact_mod_cast h4⟩
    · exact ⟨k5, by exact_mod_cast h5⟩
    · exact ⟨k6, by exact_mod_cast h6⟩
    · exact ⟨k7, by exact_mod_cast h7⟩
  · intro h
    obtain ⟨m0, hm0⟩ := h 0
    obtain ⟨m1, hm1⟩ := h 1
    obtain ⟨m2, hm2⟩ := h 2
    obtain ⟨m3, hm3⟩ := h 3
    obtain ⟨m4, hm4⟩ := h 4
    obtain ⟨m5, hm5⟩ := h 5
    obtain ⟨m6, hm6⟩ := h 6
    obtain ⟨m7, hm7⟩ := h 7
    exact ⟨⟨m0, by exact_mod_cast hm0⟩, ⟨m1, by exact_mod_cast hm1⟩,
           ⟨m2, by exact_mod_cast hm2⟩, ⟨m3, by exact_mod_cast hm3⟩,
           ⟨m4, by exact_mod_cast hm4⟩, ⟨m5, by exact_mod_cast hm5⟩,
           ⟨m6, by exact_mod_cast hm6⟩, ⟨m7, by exact_mod_cast hm7⟩⟩

/-! ## The signed unit and its Born self-overlap. -/

def signedUnit (i : Fin 8) (s : Bool) : O ℚ :=
  coordO.symm (Pi.single i (if s then (1 : ℚ) else -1))

theorem coordO_signedUnit (i : Fin 8) (s : Bool) :
    coordO (signedUnit i s) = Pi.single i (if s then (1 : ℚ) else -1) := by
  unfold signedUnit; exact coordO.apply_symm_apply _

theorem gForm_signedUnit (i : Fin 8) (s : Bool) :
    gForm (signedUnit i s) (signedUnit i s) = 1 := by
  rw [gForm_polar, coordO_signedUnit]
  rw [Finset.sum_eq_single i]
  · simp only [Pi.single_eq_same]; cases s <;> norm_num
  · intro j _ hj; rw [Pi.single_eq_of_ne hj]; ring
  · intro h; exact absurd (Finset.mem_univ i) h

theorem signedUnit_intLat (i : Fin 8) (s : Bool) : IntLat (signedUnit i s) := by
  rw [intLat_iff_coordO]
  intro k
  rw [coordO_signedUnit]
  by_cases hk : k = i
  · subst hk; rw [Pi.single_eq_same]; cases s
    · exact ⟨-1, by norm_num⟩
    · exact ⟨1, by norm_num⟩
  · rw [Pi.single_eq_of_ne hk]; exact ⟨0, by norm_num⟩

/-! ## The uniqueness lemma. -/

theorem sumSq_eq_one_unique (m : Fin 8 → ℤ) (h : ∑ i, (m i)^2 = 1) :
    ∃ i, (m i = 1 ∨ m i = -1) ∧ ∀ j, j ≠ i → m j = 0 := by
  classical
  set T : Finset (Fin 8) := Finset.univ.filter (fun i => m i ≠ 0) with hT
  have hsplit : ∑ i, (m i)^2 = ∑ i ∈ T, (m i)^2 := by
    symm
    apply Finset.sum_subset (Finset.filter_subset _ _)
    intro i _ hi
    simp only [hT, Finset.mem_filter, Finset.mem_univ, true_and, not_not] at hi
    rw [hi]; ring
  have hsumT : ∑ i ∈ T, (m i)^2 = 1 := by rw [← hsplit]; exact h
  have hge1 : ∀ i ∈ T, (1:ℤ) ≤ (m i)^2 := by
    intro i hi
    simp only [hT, Finset.mem_filter, Finset.mem_univ, true_and] at hi
    have : m i ≤ -1 ∨ 1 ≤ m i := by omega
    rcases this with h'|h' <;> nlinarith
  have hcard_le : (T.card : ℤ) ≤ 1 := by
    calc (T.card : ℤ) = ∑ _i ∈ T, (1:ℤ) := by simp
      _ ≤ ∑ i ∈ T, (m i)^2 := Finset.sum_le_sum hge1
      _ = 1 := hsumT
  have hTne : T.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hemp
    rw [hemp, Finset.sum_empty] at hsumT
    exact absurd hsumT (by norm_num)
  have hcard1 : T.card = 1 := by
    have : 1 ≤ T.card := Finset.Nonempty.card_pos hTne
    omega
  obtain ⟨i₀, hi₀⟩ := Finset.card_eq_one.mp hcard1
  have hsq0 : (m i₀)^2 = 1 := by
    have : ∑ i ∈ T, (m i)^2 = (m i₀)^2 := by rw [hi₀, Finset.sum_singleton]
    rw [this] at hsumT; exact hsumT
  have hpm : m i₀ = 1 ∨ m i₀ = -1 := by
    have h1 : (m i₀ - 1) * (m i₀ + 1) = 0 := by nlinarith [hsq0]
    rcases mul_eq_zero.mp h1 with h'|h'
    · left; omega
    · right; omega
  refine ⟨i₀, hpm, ?_⟩
  intro j hj
  have hjT : j ∉ T := by rw [hi₀]; simp [hj]
  simp only [hT, Finset.mem_filter, Finset.mem_univ, true_and, not_not] at hjT
  exact hjT

/-! ## The per-level Born occupancy set and the floor bijection. -/

def levelOccupancy (n : ℕ) : Set (O ℚ) := { w | IntLat w ∧ gForm w w = (n : ℚ) }

def σ : Bool × Fin 8 → O ℚ := fun p => signedUnit p.2 p.1

theorem σ_injective : Function.Injective σ := by
  rintro ⟨s, i⟩ ⟨t, j⟩ hst
  have hst' : signedUnit i s = signedUnit j t := hst
  have h := congrArg coordO hst'
  rw [coordO_signedUnit, coordO_signedUnit] at h
  have hij : i = j := by
    by_contra hne
    have hc := congrFun h i
    rw [Pi.single_eq_same, Pi.single_eq_of_ne hne] at hc
    cases s <;> simp at hc
  subst hij
  have hsign := congrFun h i
  rw [Pi.single_eq_same, Pi.single_eq_same] at hsign
  have hst2 : s = t := by cases s <;> cases t <;> first | rfl | (exfalso; norm_num at hsign)
  subst hst2; rfl

theorem range_σ_eq : Set.range σ = levelOccupancy 1 := by
  ext w
  constructor
  · rintro ⟨⟨s, i⟩, rfl⟩
    exact ⟨signedUnit_intLat i s, by
      show gForm (signedUnit i s) (signedUnit i s) = ((1 : ℕ) : ℚ)
      rw [gForm_signedUnit]; norm_num⟩
  · rintro ⟨hlat, hval⟩
    rw [intLat_iff_coordO] at hlat
    choose m hm using hlat
    have hsum : ∑ i, (m i)^2 = 1 := by
      have hg : gForm w w = ∑ i : Fin 8, (m i : ℚ)^2 := by
        rw [gForm_polar]; apply Finset.sum_congr rfl; intro i _; rw [hm i]; ring
      rw [hg] at hval
      have hq : ((∑ i, (m i)^2 : ℤ) : ℚ) = ((1 : ℕ) : ℚ) := by push_cast; push_cast at hval; linarith [hval]
      exact_mod_cast hq
    obtain ⟨i₀, hpm, hzero⟩ := sumSq_eq_one_unique m hsum
    rcases hpm with h1 | h1
    · refine ⟨(true, i₀), ?_⟩
      show signedUnit i₀ true = w
      apply coordO.injective
      rw [coordO_signedUnit]
      funext k
      by_cases hk : k = i₀
      · subst hk; rw [Pi.single_eq_same, hm k, h1]; norm_num
      · rw [Pi.single_eq_of_ne hk, hm k, hzero k hk]; norm_num
    · refine ⟨(false, i₀), ?_⟩
      show signedUnit i₀ false = w
      apply coordO.injective
      rw [coordO_signedUnit]
      funext k
      by_cases hk : k = i₀
      · subst hk; rw [Pi.single_eq_same, hm k, h1]; norm_num
      · rw [Pi.single_eq_of_ne hk, hm k, hzero k hk]; norm_num

/-! ## THE FLOOR OCCUPANCY = 16 = 2·dim(O). -/

theorem floorOccupancy_eq_sixteen : Nat.card ↥(levelOccupancy 1) = 16 := by
  rw [← range_σ_eq]
  rw [Nat.card_congr (Equiv.ofInjective σ σ_injective).symm]
  simp [Nat.card_eq_fintype_card]

theorem floorOccupancy_eq_two_dim :
    Nat.card ↥(levelOccupancy 1) = 2 * Module.finrank ℚ (O ℚ) := by
  rw [floorOccupancy_eq_sixteen, finrank_O_eq_eight]

end

end Phys.Algebra.D2eProbe2
