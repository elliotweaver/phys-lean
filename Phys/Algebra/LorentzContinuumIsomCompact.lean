/-
  Phys.Algebra.LorentzContinuumIsomCompact — N93: THE GENERAL (INJECTIVE-TARGET) POSITIVE-OPERATOR-
  SQUARE-ROOT UNIQUENESS → THE LIFT `J p^{1/2} J = (p^{1/2})⁻¹` → THE FULL ISOMETRY-COMPACT-PART
  LEMMA — over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after THE TWO POSITIVE OPERATOR SQUARE ROOTS OF `p⁻¹` (N92,
  `linIsom_two_opSqrts_of_posInv`) and THE SCALAR-TARGET UNIQUENESS KERNEL (N93 part 1,
  `LorentzContinuumOpSqrtScalarUnique.lean`). N92 banked the SETUP: for a linear isometry `g` with
  `EvC`-adjoint `h`, BOTH `J p^{1/2} J` and `(p^{1/2})⁻¹` are positive operator square roots of the
  SAME operator `p⁻¹ = specOpN c⁻¹ u` (positive part `p := h∘g`, `p^{1/2} = specOpN (cutSqrt∘c) u`).
  Their EQUALITY — the lift `J p^{1/2} J = (p^{1/2})⁻¹` — needs the positive-operator-square-root
  UNIQUENESS. THIS node banks the GENERAL uniqueness for an INJECTIVE target (which is exactly the
  case the lift needs, since `p⁻¹` is injective), the lift, and the full compact-part lemma.

  ── WHY THE INJECTIVE-TARGET CASE IS THE GENERAL ONE WE NEED (THE ONE LAW — reframe from the
     trunk, NO analysis, NO functional calculus, NO Mathlib spectral theorem) ──
  Two `EvC`-self-adjoint `EvC`-positive-semidefinite operators `s₁,s₂` with `s₁∘s₁ = s₂∘s₂ = q`,
  `q` INJECTIVE, are EQUAL. The two roots need NOT share an eigen-family — the classical
  `EvC`-inner-product route is genuinely circular without commuting, and the Halmos anticommutation
  identity collapses to a tautology over a real-closed field with no analysis. The honest
  finite-dimensional route, dissolved from the trunk:
    • `s₁` is `EvC`-self-adjoint, so it has a FULL spectral resolution `s₁ = specOpN a w` over an
      `EvC`-orthonormal eigen-family `{w k}` (N85 `stvc_selfadj_specExists`);
    • `q` injective ⟹ `s₁` injective (`s₁ x = s₁ y ⟹ q x = s₁(s₁ x) = s₁(s₁ y) = q y ⟹ x = y`),
      so `specOpN a w` is injective ⟹ its eigenprojections RESOLVE the identity (N88
      `specOpN_resolution_of_injective`, NO dimension count) and every eigenvalue `0 < a k`
      (N86 `specExists_eigen_pos`);
    • on each eigenvector `w k`: `s₁ (w k) = a k • w k`, and `q (w k) = s₁(s₁(w k)) = (a k)² • w k`;
      the OTHER root satisfies `s₂(s₂(w k)) = q(w k) = (a k)² • w k`, and `z := s₂(w k) − a k • w k`
      is killed by `s₂ + a k • id` — which is INJECTIVE (`a k > 0`, `s₂` positive-semidefinite:
      `EvC ((s₂ + a k)v)v = EvC(s₂ v)v + a k · EvC v v`, a sum of two non-negatives, the Born
      self-overlap positivity) — so `z = 0`, i.e. `s₂ (w k) = a k • w k = s₁ (w k)`;
    • two linear maps agreeing on a family that resolves the identity are EQUAL.

  ── WHAT THIS NODE DERIVES (FORCED) ──
    • `evC_shift_injective` — `S + a•id` is injective for `a > 0`, `S` `EvC`-positive-semidefinite
      (the Born-positivity injectivity lever the per-eigenvector argument consumes).
    • `linMap_eq_of_resolution` — two linear maps agreeing on a resolving family are equal.
    • `op_sqrt_unique_of_injective` — ★ THE DELIVERABLE: `IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q →
      s₁ = s₂` for INJECTIVE `q` (the operator lift of N57 `cutSqrt_unique`).
    • `linIsom_JsqrtJ_eq_posInv` — ★★ THE LIFT: `J p^{1/2} J = (p^{1/2})⁻¹` as an OPERATOR EQUALITY,
      for a linear isometry (apply the uniqueness to the N92 two-roots setup; `p⁻¹` is injective
      as the reciprocal-eigenvalue inverse of the injective `p`).
    • `isometry_compact_part_isQvIsom` — ★★★ THE FULL ISOMETRY-COMPACT-PART LEMMA: the compact part
      `k := g∘(p^{1/2})⁻¹` of an isometry `g` itself preserves `QvC` (`IsQvIsomC k`). Pure
      composition algebra from the lift: `k*∘J∘k = (p^{1/2})⁻¹∘(h∘J∘g)∘(p^{1/2})⁻¹ =
      (p^{1/2})⁻¹∘J∘(p^{1/2})⁻¹ = J` via `J∘(p^{1/2})⁻¹ = p^{1/2}∘J` (the lift) and
      `(p^{1/2})⁻¹∘p^{1/2} = id`, then the N91 converse `metric_condition_imp_isQvIsom`.
    • non-vacuity (W8): `boostEndC_compact_part_isQvIsom` — a concrete boost (`a²−b²=1`) realises
      the compact-part lemma; `not_op_sqrt_unique_clash` — a WRONG two-roots collapse fails.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object ← the banked N49–N92 ← the order-completeness of the derived ℝ `Cut` ←
  the fold. `LinearMap.injective_iff_surjective`, `map_sum`, `LinearMap.comp_assoc`, `Finset.sum_congr`
  are standard MACHINERY on the DERIVED objects (STANDARD §3). Complete: `#print axioms ⊆ {propext,
  Classical.choice, Quot.sound}` for every declaration (Audits/AxiomAudit.lean). Words-removable:
  delete "square-root/uniqueness/isometry/compact/spectral/eigen*/orthonormal/self-adjoint/positive-
  semidefinite/Lorentz/boost/signature/metric/polar/KAK/conjugate/involution" → over the derived
  complete ordered field `Cut` with the positive-definite symmetric form `EvC` and the involution
  `sigOpC`: pure linear-algebra math. NO theorem STATEMENT needs a physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumOpSqrtScalarUnique

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-! ## THE BORN-POSITIVITY INJECTIVITY LEVER. -/

/-- `S + a•id` is INJECTIVE for `a > 0` and `S` `EvC`-positive-semidefinite. For `d := x − y` with
    `(S + a•id) d = 0`: `0 = EvC ((S + a•id) d) d = EvC (S d) d + a · EvC d d`, a sum of two
    non-negatives (the Born self-overlap positivity `EvC (S d) d ≥ 0` and `a · EvC d d ≥ 0`), so
    `a · EvC d d = 0`; `a > 0` forces `EvC d d = 0`, hence `d = 0` (`EvC` positive-definite). The
    elementary lever the per-eigenvector step of the operator-square-root uniqueness consumes. -/
theorem evC_shift_injective {S : Module.End Cut STVC} (hpos : ∀ p, 0 ≤ EvC (S p) p)
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
    rcases mul_eq_zero.mp haz with hh | hh
    · exact absurd hh (ne_of_gt ha)
    · exact hh
  have : d = 0 := (EvC_eq_zero_iff d).mp hdz
  rw [hdd, sub_eq_zero] at this
  exact this

/-- Two linear maps agreeing on a family `{w i}` whose eigenprojections RESOLVE the identity
    (`∑ projC (w i) = id`) are EQUAL: `T p = T (∑ projC (w i) p) = ∑ T (projC (w i) p) =
    ∑ R (projC (w i) p) = R p` (`projC_apply`, `map_smul`, the termwise agreement). NO basis,
    NO dimension count — just the resolution of identity. -/
theorem linMap_eq_of_resolution {T R : Module.End Cut STVC} {n : ℕ} {w : Fin n → STVC}
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

/-! ## THE GENERAL (INJECTIVE-TARGET) POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS. -/

/-- ★ THE DELIVERABLE — THE GENERAL POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS for an INJECTIVE
    target: two `EvC`-self-adjoint, `EvC`-positive-semidefinite operators `s₁, s₂` with
    `s₁∘s₁ = s₂∘s₂ = q` and `q` INJECTIVE are EQUAL. The operator lift of N57 `cutSqrt_unique`,
    dissolved from the trunk (NO analysis, NO functional calculus): resolve `s₁ = specOpN a w`
    over its `EvC`-orthonormal eigen-family (N85); `q` injective ⟹ `s₁` injective ⟹ the family
    resolves the identity (N88) and every `0 < a k` (N86); on each `w k`, `s₂(w k)` and `a k • w k`
    are both roots of `(a k)² • w k`, and `s₂ + a k • id` is injective (`evC_shift_injective`,
    Born positivity) so `s₂(w k) = a k • w k = s₁(w k)`; `linMap_eq_of_resolution` finishes.
    The genuine difficulty — the two roots live over DIFFERENT eigen-families — is dissolved by
    going eigen-family-by-eigen-family of ONE root and pinning the OTHER pointwise. -/
theorem op_sqrt_unique_of_injective {s₁ s₂ q : Module.End Cut STVC}
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
      have hinj := evC_shift_injective hs2pos (haposi k)
      apply hinj
      rw [hkill, map_zero]
    have : s₂ (w k) = a k • w k := by rw [hzdef] at hz0; exact sub_eq_zero.mp hz0
    rw [hs1ev, this]
  exact linMap_eq_of_resolution hres hagree

/-! ## THE LIFT `J p^{1/2} J = (p^{1/2})⁻¹`. -/

/-- ★★ THE LIFT — `J p^{1/2} J = (p^{1/2})⁻¹` AS AN OPERATOR EQUALITY. For a linear isometry `g`
    (`IsQvIsomC g`) with `EvC`-adjoint `h`, the N92 setup `linIsom_two_opSqrts_of_posInv` gives
    BOTH `J∘(specOpN (cutSqrt∘c) u)∘J` and `specOpN ((cutSqrt∘c)⁻¹) u` as positive operator square
    roots of the SAME `q := specOpN c⁻¹ u` (positive part `h∘g = specOpN c u`, `0 < c i`). That `q`
    is INJECTIVE — it has the left inverse `specOpN c u` (`(c i)·(c i)⁻¹ = 1`) — so by the general
    uniqueness `op_sqrt_unique_of_injective` the two roots are EQUAL. The precise operator equality
    the isometry-compact-part lemma consumes. -/
theorem linIsom_JsqrtJ_eq_posInv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      sigOpC.comp ((specOpN (fun i => cutSqrt (c i)) u).comp sigOpC)
        = specOpN (fun i => (cutSqrt (c i))⁻¹) u := by
  obtain ⟨n, c, u, horth, hcpos, heq, hroot1, hroot2⟩ :=
    linIsom_two_opSqrts_of_posInv hg H
  refine ⟨n, c, u, horth, hcpos, heq, ?_⟩
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
    have hpinj : Function.Injective (specOpN c u) := by
      rw [← heq]; exact comp_injective_of_adjoint H (linIsom_injective hg H)
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
  exact op_sqrt_unique_of_injective hqinj hroot1 hroot2

/-! ## THE FULL ISOMETRY-COMPACT-PART LEMMA. -/

/-- ★★★ THE FULL ISOMETRY-COMPACT-PART LEMMA — the compact part `k := g∘(p^{1/2})⁻¹` of a linear
    isometry `g` (`IsQvIsomC g`) ITSELF preserves `QvC` (`IsQvIsomC k`). The polar/KAK orthogonal
    factor of an isometry is an isometry. Pure composition algebra, dissolved from the trunk:
    with `p^{1/2} := specOpN (cutSqrt∘c) u`, `(p^{1/2})⁻¹ := specOpN ((cutSqrt∘c)⁻¹) u`, the lift
    `J p^{1/2} J = (p^{1/2})⁻¹` (`linIsom_JsqrtJ_eq_posInv`) gives `J∘(p^{1/2})⁻¹ = p^{1/2}∘J`; the
    EvC-adjoint of `k` is `(p^{1/2})⁻¹∘h` (`IsEvCAdjoint.comp`, `(p^{1/2})⁻¹` self-adjoint); and
      `k*∘J∘k = (p^{1/2})⁻¹∘(h∘J∘g)∘(p^{1/2})⁻¹ = (p^{1/2})⁻¹∘J∘(p^{1/2})⁻¹
              = (p^{1/2})⁻¹∘(p^{1/2}∘J) = ((p^{1/2})⁻¹∘p^{1/2})∘J = id∘J = J`
    (`linIsom_metric_condition` `h∘J∘g = J`, the lift, `(p^{1/2})⁻¹∘p^{1/2} = id`), so the N91
    converse `metric_condition_imp_isQvIsom` lands `IsQvIsomC k`. The KAK statement that the
    maximal-compact factor of a (pseudo-)orthogonal element is itself orthogonal — the global
    reverse-surjectivity step made local. NO posited Lorentz group, NO Mathlib spectral theory. -/
theorem isometry_compact_part_isQvIsom (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      IsQvIsomC (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) := by
  have hgi : Function.Injective g := linIsom_injective hg H
  obtain ⟨n, c, u, horth, hcpos, heq, hps_pi, hpi_ps⟩ := comp_specInverse_exists H hgi
  set psqrt := specOpN (fun i => cutSqrt (c i)) u with hpsqrt
  set pinv := specOpN (fun i => (cutSqrt (c i))⁻¹) u with hpinvdef
  have hlift : sigOpC.comp (psqrt.comp sigOpC) = pinv := by
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
    exact op_sqrt_unique_of_injective hqinj hroot1 hroot2
  set k : Module.End Cut STVC := g.comp pinv with hk
  have hpinv_adj : IsEvCAdjoint pinv pinv := specOpN_isEvCSymm _ _
  have hkadj : IsEvCAdjoint k (pinv.comp h) := H.comp hpinv_adj
  refine ⟨n, c, u, horth, hcpos, heq, ?_⟩
  apply metric_condition_imp_isQvIsom hkadj
  have hswap : sigOpC.comp pinv = psqrt.comp sigOpC := by
    rw [← hlift, ← LinearMap.comp_assoc, ← LinearMap.comp_assoc, sigOpC_comp_self,
      LinearMap.id_comp]
  have hmc : h.comp (sigOpC.comp g) = sigOpC := linIsom_metric_condition hg H
  calc (pinv.comp h).comp (sigOpC.comp (g.comp pinv))
      = pinv.comp ((h.comp (sigOpC.comp g)).comp pinv) := by
        simp only [LinearMap.comp_assoc]
    _ = pinv.comp (sigOpC.comp pinv) := by rw [hmc]
    _ = pinv.comp (psqrt.comp sigOpC) := by rw [hswap]
    _ = (pinv.comp psqrt).comp sigOpC := by rw [LinearMap.comp_assoc]
    _ = sigOpC := by rw [hpi_ps, LinearMap.id_comp]

/-! ## Non-vacuity (W8). -/

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) realises the isometry-compact-part lemma —
    its compact part `k := g∘(g*g)^{-1/2}` is a genuine `QvC`-preserving operator over the derived
    ℝ `Cut`. The lemma is not vacuous: the isometry monoid `qvIsomMonoidC` contains genuine
    non-identity boosts whose compact parts the lemma applies to. -/
theorem boostEndC_compact_part_isQvIsom {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      IsQvIsomC ((boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) :=
  isometry_compact_part_isQvIsom (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

/-- ★ NON-VACUITY (W8 teeth): the general uniqueness has genuine content — a WRONG two-roots
    collapse fails. `2•id` and `3•id` are BOTH `EvC`-self-adjoint and `EvC`-positive-semidefinite,
    but they are NOT both positive operator square roots of the same injective `q`: if they were,
    `op_sqrt_unique_of_injective` would force `2•id = 3•id`, hence `2 = 3` (`cutSmul_id_inj`). The
    uniqueness is not vacuous: distinct homotheties cannot share a square. -/
theorem not_op_sqrt_unique_clash {q : Module.End Cut STVC} (hqinj : Function.Injective q)
    (h2 : IsEvCOpSqrt ((2 : Cut) • (LinearMap.id : Module.End Cut STVC)) q)
    (h3 : IsEvCOpSqrt ((3 : Cut) • (LinearMap.id : Module.End Cut STVC)) q) : False := by
  have heq : (2 : Cut) • (LinearMap.id : Module.End Cut STVC)
      = (3 : Cut) • (LinearMap.id : Module.End Cut STVC) :=
    op_sqrt_unique_of_injective hqinj h2 h3
  have : (2 : Cut) = 3 := cutSmul_id_inj heq
  norm_num at this

end

end Phys.Algebra
