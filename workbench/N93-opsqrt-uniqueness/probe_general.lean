import Phys.Algebra.LorentzContinuumOpSqrtScalarUnique

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- helper A: S + a•id injective for a > 0, S EvC-positive-semidefinite.
theorem probe_shift_injective {S : Module.End Cut STVC} (hpos : ∀ p, 0 ≤ EvC (S p) p)
    {a : Cut} (ha : 0 < a) :
    Function.Injective (S + a • (LinearMap.id : Module.End Cut STVC)) := by
  intro x y hxy
  have hd : (S + a • (LinearMap.id : Module.End Cut STVC)) (x - y) = 0 := by
    rw [map_sub, hxy, sub_self]
  set d : STVC := x - y with hdd
  have hexp : EvC ((S + a • (LinearMap.id : Module.End Cut STVC)) d) d
      = EvC (S d) d + a * EvC d d := by
    simp only [LinearMap.add_apply, LinearMap.smul_apply, LinearMap.id_apply]
    rw [EvC_add_left, EvC_smul_left]
  have hz : EvC ((S + a • (LinearMap.id : Module.End Cut STVC)) d) d = 0 := by
    rw [hd, EvC_zero_left]
  rw [hexp] at hz
  have ht1 : 0 ≤ EvC (S d) d := hpos d
  have ht2 : 0 ≤ a * EvC d d := mul_nonneg ha.le (EvC_nonneg d)
  have haz : a * EvC d d = 0 := by linarith
  have hdz : EvC d d = 0 := by
    rcases mul_eq_zero.mp haz with h | h
    · exact absurd h (ne_of_gt ha)
    · exact h
  have : d = 0 := (EvC_eq_zero_iff d).mp hdz
  rw [hdd, sub_eq_zero] at this
  exact this

-- helper B: two linear maps agreeing on an orthonormal family that resolves the identity are equal.
theorem probe_agree_on_family {T R : Module.End Cut STVC} {n : ℕ} {w : Fin n → STVC}
    (hres : (∑ i, projC (w i)) = (LinearMap.id : Module.End Cut STVC))
    (hagree : ∀ k, T (w k) = R (w k)) : T = R := by
  apply LinearMap.ext; intro p
  have hp : (∑ i, projC (w i)) p = p := by rw [hres]; rfl
  rw [LinearMap.sum_apply] at hp
  -- T p = T (∑ projC w_i p) = ∑ T (projC w_i p), and same for R, agreeing termwise
  calc T p = T (∑ i, projC (w i) p) := by rw [hp]
    _ = ∑ i, T (projC (w i) p) := by rw [map_sum]
    _ = ∑ i, R (projC (w i) p) := by
          refine Finset.sum_congr rfl ?_
          intro i _
          rw [projC_apply, map_smul, map_smul, hagree i]
    _ = R (∑ i, projC (w i) p) := by rw [map_sum]
    _ = R p := by rw [hp]

-- MAIN PROBE: INJECTIVE-q general positive-operator-square-root uniqueness.
theorem probe_op_sqrt_unique_inj {s₁ s₂ q : Module.End Cut STVC}
    (hqinj : Function.Injective q)
    (h₁ : IsEvCOpSqrt s₁ q) (h₂ : IsEvCOpSqrt s₂ q) :
    s₁ = s₂ := by
  obtain ⟨hs1sym, hs1pos, hs1sq⟩ := h₁
  obtain ⟨hs2sym, hs2pos, hs2sq⟩ := h₂
  obtain ⟨n, a, w, horth, hs1eq⟩ := stvc_selfadj_specExists hs1sym
  have hs1inj : Function.Injective s₁ := by
    intro x y hxy
    apply hqinj
    have : (s₁.comp s₁) x = (s₁.comp s₁) y := by simp only [LinearMap.comp_apply, hxy]
    rwa [hs1sq] at this
  have hspecinj : Function.Injective (specOpN a w) := by rw [← hs1eq]; exact hs1inj
  have hres : (∑ i, projC (w i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hspecinj
  have hapos0 : ∀ p, 0 ≤ EvC (specOpN a w p) p := by intro p; rw [← hs1eq]; exact hs1pos p
  have haposi : ∀ i, 0 < a i := fun i => specExists_eigen_pos horth hapos0 hspecinj i
  -- agreement on each eigenvector
  have hagree : ∀ k, s₁ (w k) = s₂ (w k) := by
    intro k
    have hs1ev : s₁ (w k) = a k • w k := by rw [hs1eq]; exact specOpN_eigenvector horth k
    have hqev : q (w k) = (a k * a k) • w k := by
      have hq : q (w k) = s₁ (s₁ (w k)) := by
        have := congrArg (fun (f : Module.End Cut STVC) => f (w k)) hs1sq.symm
        simpa [LinearMap.comp_apply] using this
      rw [hq, hs1ev, map_smul, hs1ev, smul_smul]
    set z : STVC := s₂ (w k) - a k • w k with hzdef
    have hkill : (s₂ + a k • (LinearMap.id : Module.End Cut STVC)) z = 0 := by
      simp only [hzdef, LinearMap.add_apply, LinearMap.smul_apply, LinearMap.id_apply,
        map_sub, map_smul]
      have hs2s2 : s₂ (s₂ (w k)) = q (w k) := by
        have := congrArg (fun (f : Module.End Cut STVC) => f (w k)) hs2sq
        simpa [LinearMap.comp_apply] using this
      rw [hs2s2, hqev, smul_add, smul_smul]
      abel
    have hz0 : z = 0 := by
      have hinj := probe_shift_injective hs2pos (haposi k)
      apply hinj
      rw [hkill, map_zero]
    have : s₂ (w k) = a k • w k := by rw [hzdef] at hz0; exact sub_eq_zero.mp hz0
    rw [hs1ev, this]
  exact probe_agree_on_family hres hagree

end

end Phys.Algebra
