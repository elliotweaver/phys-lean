import Phys.Algebra.LorentzContinuumOpSqrtScalarUnique

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

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

-- helper B: two linear maps agreeing on a resolving family are equal.
theorem probe_agree_on_family {T R : Module.End Cut STVC} {n : ℕ} {w : Fin n → STVC}
    (hres : (∑ i, projC (w i)) = (LinearMap.id : Module.End Cut STVC))
    (hagree : ∀ k, T (w k) = R (w k)) : T = R := by
  apply LinearMap.ext; intro p
  have hp : (∑ i, projC (w i)) p = p := by rw [hres]; rfl
  rw [LinearMap.sum_apply] at hp
  calc T p = T (∑ i, projC (w i) p) := by rw [hp]
    _ = ∑ i, T (projC (w i) p) := by rw [map_sum]
    _ = ∑ i, R (projC (w i) p) := by
          refine Finset.sum_congr rfl ?_
          intro i _
          rw [projC_apply, map_smul, map_smul, hagree i]
    _ = R (∑ i, projC (w i) p) := by rw [map_sum]
    _ = R p := by rw [hp]

-- MAIN: INJECTIVE-q general positive-operator-square-root uniqueness.
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

/- THE LIFT: J p^{1/2} J = (p^{1/2})⁻¹.
   For a linear isometry g with EvC-adjoint h, the N92 setup linIsom_two_opSqrts_of_posInv gives
   BOTH J p^{1/2} J and (p^{1/2})⁻¹ as positive operator square roots of the SAME
   q := specOpN c⁻¹ u. That q is INJECTIVE (reciprocal-eigenvalue inverse of the injective p),
   so the general injective-q uniqueness forces them equal. -/
theorem probe_linIsom_JsqrtJ_eq_posInv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      sigOpC.comp ((specOpN (fun i => cutSqrt (c i)) u).comp sigOpC)
        = specOpN (fun i => (cutSqrt (c i))⁻¹) u := by
  obtain ⟨n, c, u, horth, hcpos, heq, hroot1, hroot2⟩ :=
    linIsom_two_opSqrts_of_posInv hg H
  refine ⟨n, c, u, horth, hcpos, heq, ?_⟩
  -- q = specOpN c⁻¹ u is injective: reciprocal eigenvalues are all nonzero.
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
    have hpinj : Function.Injective (specOpN c u) := by
      rw [← heq]; exact comp_injective_of_adjoint H (linIsom_injective hg H)
    exact specOpN_resolution_of_injective horth hpinj
  have hc_ne : ∀ i, c i ≠ 0 := fun i => ne_of_gt (hcpos i)
  have hqinj : Function.Injective (specOpN (fun i => (c i)⁻¹) u) := by
    -- it has a left inverse specOpN c u (since (c i)·(c i)⁻¹ = 1)
    have hli : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id :=
      specOpN_inverse horth hres hc_ne
    intro x y hxy
    have : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) x
         = (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) y := by
      simp only [LinearMap.comp_apply, hxy]
    rwa [hli, LinearMap.id_apply, LinearMap.id_apply] at this
  exact probe_op_sqrt_unique_inj hqinj hroot1 hroot2

/- THE FULL ISOMETRY-COMPACT-PART LEMMA: the compact part k := g∘(p^{1/2})⁻¹ of an isometry g
   itself preserves QvC.  k* J k = pinv∘(h∘J∘g)∘pinv = pinv∘J∘pinv = J via the lift
   J∘psqrt∘J = pinv (so psqrt∘J = J∘pinv) and pinv∘psqrt = id; then N91 converse. -/
theorem probe_isometry_compact_part (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      IsQvIsomC (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) := by
  have hgi : Function.Injective g := linIsom_injective hg H
  -- the two-roots / lift data on the SAME family from comp_specInverse_exists.
  obtain ⟨n, c, u, horth, hcpos, heq, hps_pi, hpi_ps⟩ := comp_specInverse_exists H hgi
  set psqrt := specOpN (fun i => cutSqrt (c i)) u with hpsqrt
  set pinv := specOpN (fun i => (cutSqrt (c i))⁻¹) u with hpinvdef
  -- THE LIFT on THIS family: J∘psqrt∘J = pinv.
  have hlift : sigOpC.comp (psqrt.comp sigOpC) = pinv := by
    -- both J p^{1/2} J and (p^{1/2})⁻¹ are positive op sqrts of the same q = specOpN c⁻¹ u.
    have hroot1 : IsEvCOpSqrt (sigOpC.comp (psqrt.comp sigOpC))
        (specOpN (fun i => (c i)⁻¹) u) := by
      have h1 := linIsom_JsqrtJ_isOpSqrt horth hcpos heq
      rw [linIsom_JpJ_eq_specInv hg H hgi horth heq] at h1
      exact h1
    have hroot2 : IsEvCOpSqrt pinv (specOpN (fun i => (c i)⁻¹) u) :=
      linIsom_posInv_isOpSqrt horth hcpos
    have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
      have hpinj : Function.Injective (specOpN c u) := by
        rw [← heq]; exact comp_injective_of_adjoint H hgi
      exact specOpN_resolution_of_injective horth hpinj
    have hc_ne : ∀ i, c i ≠ 0 := fun i => ne_of_gt (hcpos i)
    have hqinj : Function.Injective (specOpN (fun i => (c i)⁻¹) u) := by
      have hli : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id :=
        specOpN_inverse horth hres hc_ne
      intro x y hxy
      have : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) x
           = (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) y := by
        simp only [LinearMap.comp_apply, hxy]
      rwa [hli, LinearMap.id_apply, LinearMap.id_apply] at this
    exact probe_op_sqrt_unique_inj hqinj hroot1 hroot2
  -- k := g∘pinv ;  k* := pinv∘h (pinv self-adjoint, IsEvCAdjoint.comp).
  set k : Module.End Cut STVC := g.comp pinv with hk
  have hpinv_adj : IsEvCAdjoint pinv pinv := specOpN_isEvCSymm _ _
  have hkadj : IsEvCAdjoint k (pinv.comp h) := H.comp hpinv_adj
  refine ⟨n, c, u, horth, hcpos, heq, ?_⟩
  -- the metric condition for k:  (pinv∘h)∘J∘(g∘pinv) = J.
  apply metric_condition_imp_isQvIsom hkadj
  -- J∘pinv = psqrt∘J  (from the lift, J∘J = id).
  have hswap : sigOpC.comp pinv = psqrt.comp sigOpC := by
    rw [← hlift, ← LinearMap.comp_assoc, ← LinearMap.comp_assoc, sigOpC_comp_self,
      LinearMap.id_comp]
  -- h∘J∘g = J.
  have hmc : h.comp (sigOpC.comp g) = sigOpC := linIsom_metric_condition hg H
  -- assemble:  (pinv∘h)∘(J∘(g∘pinv)) = pinv∘(h∘J∘g)∘pinv = pinv∘J∘pinv = pinv∘(J∘pinv)
  --          = pinv∘(psqrt∘J) = (pinv∘psqrt)∘J = id∘J = J.
  calc (pinv.comp h).comp (sigOpC.comp (g.comp pinv))
      = pinv.comp ((h.comp (sigOpC.comp g)).comp pinv) := by
        simp only [LinearMap.comp_assoc]
    _ = pinv.comp (sigOpC.comp pinv) := by rw [hmc]
    _ = pinv.comp (psqrt.comp sigOpC) := by rw [hswap]
    _ = (pinv.comp psqrt).comp sigOpC := by rw [LinearMap.comp_assoc]
    _ = sigOpC := by rw [hpi_ps, LinearMap.id_comp]

end

end Phys.Algebra
