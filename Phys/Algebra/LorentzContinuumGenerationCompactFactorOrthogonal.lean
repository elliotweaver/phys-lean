/-
  Phys.Algebra.LorentzContinuumGenerationCompactFactorOrthogonal — N131: THE COMPACT FACTOR OF AN
  ARBITRARY `BvC`-ISOMETRY IS AN EvC-ORTHOGONAL `QvC`-ISOMETRY — the joint wiring N130's converse
  polar decomposition into N104's single-residual reduction, over the derived ℝ `Cut`.
  ===========================================================================
  CONTEXT. N130 banked `bvIsomLin_polar_path_decomp`: an arbitrary `IsBvIsomLin S` factors as
  `S = k·γ(1)` with the compact factor `k := S∘(p^{1/2})⁻¹` a `QvC`-isometry (`IsQvIsomC k` only).
  Separately, N104 banked the SINGLE-RESIDUAL REDUCTION `evCOrthogonal_word_compact_part_mem_gen2`:
  for ANY `g h` with `IsQvIsomC g`, `IsEvCAdjoint g h`, `h.comp g = id` (EvC-ORTHOGONALITY), AND
  `g ∈ genIsomMonoidLin`, the bridged compact part lies in `genIsomMonoidC2` — reducing the full
  converse generation `qvIsomMonoidC ≤ genIsomMonoidC2` to the single residual "every EvC-orthogonal
  `QvC`-isometry IS a `biMulLin` word".

  THE MISSING JOINT. N130 NEVER banked that the compact factor `k` of an arbitrary `BvC`-isometry is
  EvC-ORTHOGONAL (`kadj∘k = id`) — only that it is `IsQvIsomC`. EvC-orthogonality is exactly the
  `horth` hypothesis N104's reduction consumes. THIS node banks it: the compact factor of an
  arbitrary `BvC`-isometry is an EvC-orthogonal `QvC`-isometry, with an explicit EvC-adjoint
  `kadj := (p^{1/2})⁻¹∘h`. Banking it WIRES N130 → N104, conditionally closing the global reverse
  surjectivity on the single clean residual `k ∈ genIsomMonoidLin` (childed N132 — the literal
  `Spin(9)` / triality word-membership, the genuine W1 group-manifold remainder).

  ── THE DERIVATION (theory-native, the N93 `comp_polar_decomposition` body fed by N130's joint) ──
  `bvIsomLin_compact_factor_spec` — extracts, over a SINGLE spectral witness, the four facts of the
    compact factor `k := S∘(p^{1/2})⁻¹` of an arbitrary `BvC`-isometry `S`:
      • `h.comp S = specOpN c u`              (the positive part `p = S*S`, via `bvIsomLin_has_evCAdjoint`)
      • `IsEvCAdjoint k ((p^{1/2})⁻¹∘h)`      (the adjoint composes contravariantly, `IsEvCAdjoint.comp`)
      • `((p^{1/2})⁻¹∘h)∘k = id`              ★ THE EvC-ORTHOGONALITY (the `comp_polar_decomposition`
                                               collapse: `h∘S = p^{1/2}∘p^{1/2}`, two-sided inverse N88)
      • `IsQvIsomC k`                          (the metric-condition route — `linIsom_metric_condition`,
                                               `op_sqrt_unique_of_injective`, `metric_condition_imp_isQvIsom`)
  ★★ `bvIsomLin_compact_factor_word_mem_gen2` — THE CONDITIONAL CLOSURE: for an arbitrary
    `BvC`-isometry there exist `k, kadj` with `IsQvIsomC k`, `IsEvCAdjoint k kadj`, `kadj∘k = id`,
    AND `k ∈ genIsomMonoidLin → endToFunEnd (k∘(p^{1/2})⁻¹') ∈ genIsomMonoidC2`. The global reverse
    surjectivity for an ARBITRARY `BvC`-isometry reduced to the SINGLE clean word-membership residual.

  ── WHAT THIS NODE BANKS ──
    bvIsomLin_compact_factor_spec        — the four compact-factor facts over a single witness.
    ★★ bvIsomLin_compact_factor_word_mem_gen2 — THE CONDITIONAL CLOSURE wiring N130 → N104.
    W8 (genuinely-indefinite):
    bvIsomLin_boost_compact_factor_evCOrthogonal — the concrete boost `(5/3,4/3)`'s compact factor is
                                          EvC-orthogonal (`kadj∘k = id`), derived ONLY from its
                                          `IsBvIsomLin` property.
    bvIsomLin_boost_compact_factor_witness_qvC — the compact factor of the boost `(5/3,4/3)` preserves
                                          the Born quadratic of the moved timelike axis, reading `1`.

  THE MOAT: the literature POSITS the polar/KAK decomposition of `SO⁺(1,9)` and reads the compact
  factor's orthogonality off the maximal-compact subgroup structure. Here the EvC-orthogonality of an
  arbitrary `BvC`-isometry's compact factor DESCENDS from the banked positive-operator-square-root
  uniqueness (N93) + the two-sided spectral inverse (N88) + the metric-condition characterization
  (N91) fed by N130's EvC-adjoint joint — and feeding it into N104's reduction reduces the global
  surjectivity to the single clean word-membership residual, with NO operator topology, NO operator
  `exp`, NO Mathlib spectral theory, the structure DERIVED not asserted.

  DERIVED from the banked N49–N130 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / compact /
  orthogonal / isometry / polar / KAK / Cartan / adjoint / Minkowski / signature / Spin / SO(9) /
  SO⁺(1,9) / generation / generator / word / triality / bridge": what remains is pure linear algebra
  over the derived complete ordered field `Cut`, `O Cut`, the positive-definite form `EvC`, the
  indefinite form `BvC` — for a `Cut`-linear `S` with `∀ p q, BvC (S p)(S q) = BvC p q`, the operator
  `k := S∘(specOpN (cutSqrt∘c)⁻¹ u)` has an explicit EvC-adjoint `kadj` with `kadj∘k = id` and
  `∀ p, QvC (k p) = QvC p`; and IF `k` lies in the closure of the `biMulLin` generator set THEN
  `endToFunEnd k` lies in the closure of the bimultiplication generator set on `Function.End STVC`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationConversePolar
import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The compact factor of an arbitrary `BvC`-isometry — the four facts over a single witness. -/

/-- ★ THE CORE — for an arbitrary `BvC`-isometry `S`, over a SINGLE spectral witness, the compact
    factor `k := S∘(p^{1/2})⁻¹` (`p^{1/2} = specOpN (cutSqrt∘c) u`, `p = S*S = specOpN c u`) has:
    `h.comp S = specOpN c u`, an explicit EvC-adjoint `(p^{1/2})⁻¹∘h`, the EvC-orthogonality
    `((p^{1/2})⁻¹∘h)∘k = id`, and `IsQvIsomC k`. Fed by N130's `bvIsomLin_has_evCAdjoint` +
    `bvIsomLin_injective`, so it holds for EVERY `BvC`-isometry — the `comp_polar_decomposition` body
    (N93) plus the metric-condition `IsQvIsomC` route, assembled over one eigen-family. -/
theorem bvIsomLin_compact_factor_spec {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      h.comp S = specOpN c u ∧
      IsEvCAdjoint (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
                   ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h) ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h).comp
          (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) = LinearMap.id ∧
      IsQvIsomC (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) := by
  obtain ⟨h, Hadj⟩ := bvIsomLin_has_evCAdjoint hS
  have hg : IsQvIsomC S := bvIsomLin_isQvIsomC hS
  have hinj : Function.Injective S := bvIsomLin_injective hS
  obtain ⟨n, c, u, horth, hcpos, heq, hps_pi, hpi_ps⟩ := comp_specInverse_exists Hadj hinj
  set psqrt := specOpN (fun i => cutSqrt (c i)) u with hpsqrt
  set pinv := specOpN (fun i => (cutSqrt (c i))⁻¹) u with hpinv
  have hpinv_adj : IsEvCAdjoint pinv pinv := specOpN_isEvCSymm _ _
  have hkadj : IsEvCAdjoint (S.comp pinv) (pinv.comp h) := Hadj.comp hpinv_adj
  refine ⟨h, n, c, u, heq, hkadj, ?_, ?_⟩
  · -- ★ THE EvC-ORTHOGONALITY: `k*∘k = id` (the `comp_polar_decomposition` collapse).
    have hsq : psqrt.comp psqrt = h.comp S := by
      rw [hpsqrt, specOpN_comp horth, heq]
      congr 1; funext i; rw [cutSqrt_sq (le_of_lt (hcpos i))]
    apply LinearMap.ext; intro v
    simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    have e1 : h (S (pinv v)) = psqrt (psqrt (pinv v)) := by
      have := congrArg (fun (f : Module.End Cut STVC) => f (pinv v)) hsq
      simp only [LinearMap.comp_apply] at this
      exact this.symm
    rw [e1]
    have e2 : psqrt (pinv v) = v := by
      have := congrArg (fun (f : Module.End Cut STVC) => f v) hps_pi
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [e2]
    have e3 : pinv (psqrt v) = v := by
      have := congrArg (fun (f : Module.End Cut STVC) => f v) hpi_ps
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [e3]
  · -- `IsQvIsomC k` (the metric-condition route, the N93 `isometry_compact_part_isQvIsom` body).
    have hlift : sigOpC.comp (psqrt.comp sigOpC) = pinv := by
      have hroot1 : IsEvCOpSqrt (sigOpC.comp (psqrt.comp sigOpC))
          (specOpN (fun i => (c i)⁻¹) u) := by
        have h1 := linIsom_JsqrtJ_isOpSqrt horth hcpos heq
        rw [linIsom_JpJ_eq_specInv hg Hadj hinj horth heq] at h1
        exact h1
      have hroot2 : IsEvCOpSqrt pinv (specOpN (fun i => (c i)⁻¹) u) :=
        linIsom_posInv_isOpSqrt horth hcpos
      have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
        have hpinj : Function.Injective (specOpN c u) := by
          rw [← heq]; exact comp_injective_of_adjoint Hadj hinj
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
    apply metric_condition_imp_isQvIsom hkadj
    have hswap : sigOpC.comp pinv = psqrt.comp sigOpC := by
      rw [← hlift, ← LinearMap.comp_assoc, ← LinearMap.comp_assoc, sigOpC_comp_self,
        LinearMap.id_comp]
    have hmc : h.comp (sigOpC.comp S) = sigOpC := linIsom_metric_condition hg Hadj
    calc (pinv.comp h).comp (sigOpC.comp (S.comp pinv))
        = pinv.comp ((h.comp (sigOpC.comp S)).comp pinv) := by
          simp only [LinearMap.comp_assoc]
      _ = pinv.comp (sigOpC.comp pinv) := by rw [hmc]
      _ = pinv.comp (psqrt.comp sigOpC) := by rw [hswap]
      _ = (pinv.comp psqrt).comp sigOpC := by rw [LinearMap.comp_assoc]
      _ = sigOpC := by rw [hpi_ps, LinearMap.id_comp]

/-! ## THE CONDITIONAL CLOSURE — wiring N130 → N104. -/

/-- ★★ THE CONDITIONAL CLOSURE — for an arbitrary `BvC`-isometry `S` there exist a compact factor
    `k := S∘(p^{1/2})⁻¹` and its EvC-adjoint `kadj := (p^{1/2})⁻¹∘h` with `IsQvIsomC k`,
    `IsEvCAdjoint k kadj`, `kadj∘k = id` (EvC-orthogonal), AND: IF `k ∈ genIsomMonoidLin` (the single
    residual childed N132 — the literal `Spin(9)` / triality word membership), THEN the bridged
    compact factor `endToFunEnd (k∘(p^{1/2})⁻¹') ∈ genIsomMonoidC2` (via N104's
    `evCOrthogonal_word_compact_part_mem_gen2`). The global reverse surjectivity for an ARBITRARY
    `BvC`-isometry reduced to the SINGLE clean word-membership residual — the converse generation
    `qvIsomMonoidC ≤ genIsomMonoidC2` standing on one open lemma, with NO operator topology, NO
    posited group. -/
theorem bvIsomLin_compact_factor_word_mem_gen2 {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k kadj : Module.End Cut STVC),
      IsQvIsomC k ∧ IsEvCAdjoint k kadj ∧ kadj.comp k = LinearMap.id ∧
      (k ∈ genIsomMonoidLin →
        ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
          kadj.comp k = specOpN c uu ∧
          endToFunEnd (k.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)) ∈ genIsomMonoidC2) := by
  obtain ⟨h, n, c, u, heq, hkadj, horth, hkqv⟩ := bvIsomLin_compact_factor_spec hS
  refine ⟨S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u),
          (specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h, hkqv, hkadj, horth, ?_⟩
  intro hword
  exact evCOrthogonal_word_compact_part_mem_gen2 _ _ hkqv hkadj horth hword

/-! ## W8 — the concrete boost's compact factor is EvC-orthogonal + a numeric teeth. -/

/-- ★ W8 NON-VACUITY / TEETH — the converse-derived compact factor of the CONCRETE boost `(5/3,4/3)`
    (a genuine non-identity `BvC`-isometry, off-diagonal `4/3 ≠ 0`, derived ONLY from its
    `IsBvIsomLin` property) is EvC-ORTHOGONAL: its EvC-adjoint composes back to the identity
    `kadj∘k = id`. The maximal-compact factor of a genuine boost is genuinely orthogonal. -/
theorem bvIsomLin_boost_compact_factor_evCOrthogonal :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      h.comp (boostEndC ((5:Cut)/3) ((4:Cut)/3)) = specOpN c u ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h).comp
        ((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
          (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) = LinearMap.id := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨h, n, c, u, heq, _, horth, _⟩ :=
    bvIsomLin_compact_factor_spec (boostEndC_isBvIsomLin hab)
  exact ⟨h, n, c, u, heq, horth⟩

/-- ★ W8 TEETH — the compact factor of the boost `(5/3,4/3)` PRESERVES the Born quadratic of the
    (moved) timelike axis `mTimeUnit`, reading `1` (`= QvC mTimeUnit = BvC mTimeUnit mTimeUnit`). The
    distinguishing read-off the costume C163 bites: the compact factor is a `QvC`-isometry
    (`bvIsomLin_compact_factor_spec`), so `QvC (k mTimeUnit) = QvC mTimeUnit = 1`. -/
theorem bvIsomLin_boost_compact_factor_witness_qvC :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      h.comp (boostEndC ((5:Cut)/3) ((4:Cut)/3)) = specOpN c u ∧
      QvC ((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u) (mTimeUnit : STVC)) = 1 := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨h, n, c, u, heq, _, _, hkqv⟩ :=
    bvIsomLin_compact_factor_spec (boostEndC_isBvIsomLin hab)
  refine ⟨h, n, c, u, heq, ?_⟩
  rw [hkqv, ← BvC_self, BvC_mTimeUnit_self]

end

end Phys.Algebra
