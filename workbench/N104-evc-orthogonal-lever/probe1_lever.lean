import Phys.Algebra.LorentzContinuumGenerationConverseCompactWord

namespace Phys.Algebra.N104Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- PROBE 1: THE ABSTRACT LEVER. The factored N102/N103 body — EvC-orthogonality lifted to a
    hypothesis. For ANY g, h with IsQvIsomC g, IsEvCAdjoint g h, and h∘g = id, the polar compact
    part equals g itself. Length-INDEPENDENT. -/
theorem evCOrthogonal_compact_part_eq_self (g h : Module.End Cut STVC)
    (hgisom : IsQvIsomC g) (hgadj : IsEvCAdjoint g h)
    (horth : h.comp g = LinearMap.id) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c uu ∧
      g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = g := by
  obtain ⟨n, c, uu, horth_e, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom hgisom hgadj
  refine ⟨n, c, uu, horth_e, hcpos, heq, ?_⟩
  have hspec_id : specOpN c uu = LinearMap.id := by rw [← heq, horth]
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) uu) (specOpN c uu) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth_e
  have h_id : IsEvCOpSqrt (LinearMap.id : Module.End Cut STVC) (specOpN c uu) := by
    refine ⟨lid_isEvCSymm, ?_, ?_⟩
    · intro p; rw [LinearMap.id_apply]; exact EvC_nonneg p
    · rw [hspec_id]; rfl
  have hqinj : Function.Injective (specOpN c uu) := by
    rw [hspec_id]; exact fun x y h => h
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) uu = LinearMap.id :=
    op_sqrt_unique_of_injective hqinj h₁ h_id
  have hres : (∑ i, projC (uu i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth_e hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  have hinv : (specOpN (fun i => cutSqrt (c i)) uu).comp
      (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = LinearMap.id :=
    specOpN_inverse horth_e hres hsq_ne
  rw [hsqrt_eq, LinearMap.id_comp] at hinv
  rw [hinv, LinearMap.comp_id]

/-- PROBE 2: THE GENERAL REDUCTION. For ANY EvC-orthogonal QvC-isometry that is a biMulLin word,
    the bridged compact part lies in genIsomMonoidC2. Reduces the FULL converse to the residual
    "every EvC-orthogonal QvC-isometry is a biMulLin word". -/
theorem evCOrthogonal_word_compact_part_mem_gen2 (g h : Module.End Cut STVC)
    (hgisom : IsQvIsomC g) (hgadj : IsEvCAdjoint g h)
    (horth : h.comp g = LinearMap.id) (hword : g ∈ genIsomMonoidLin) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      h.comp g = specOpN c uu ∧
      endToFunEnd (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)) ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, uu, _, _, heq, hkself⟩ :=
    evCOrthogonal_compact_part_eq_self g h hgisom hgadj horth
  refine ⟨n, c, uu, heq, ?_⟩
  rw [hkself]
  exact endToFunEnd_genIsomMonoidLin_mem_gen2 hword

end
end Phys.Algebra.N104Probe
