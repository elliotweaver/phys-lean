import Phys.Algebra.LorentzContinuumGenerationConverseCompact

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem probe_genTwoPlaneLin_isQvIsomC (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    IsQvIsomC (genTwoPlaneLin u w) := by
  intro p
  show QvC (genTwoPlaneLin u w p) = QvC p
  have hgp : genTwoPlaneLin u w p = biMulLin w w (biMulLin u u p) := rfl
  rw [hgp, biMulLin_imag_isQvIsomC w hw (biMulLin u u p), biMulLin_imag_isQvIsomC u hu p]

theorem probe_genTwoPlaneLin_isEvCAdjoint (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    IsEvCAdjoint (genTwoPlaneLin u w) (genTwoPlaneLin w u) :=
  IsEvCAdjoint.comp (biMulLin_imag_isEvCAdjoint_self w hw hwss hwL)
                    (biMulLin_imag_isEvCAdjoint_self u hu huss huL)

theorem probe_genTwoPlaneLin_adjoint_comp_self (u w : O Cut)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = LinearMap.id := by
  show (biMulLin u u * biMulLin w w) * (biMulLin w w * biMulLin u u) = LinearMap.id
  have hBB : biMulLin w w * biMulLin w w = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive w hwss hwL
  have hAA : biMulLin u u * biMulLin u u = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive u huss huL
  calc (biMulLin u u * biMulLin w w) * (biMulLin w w * biMulLin u u)
      = biMulLin u u * ((biMulLin w w * biMulLin w w) * biMulLin u u) := by
        rw [mul_assoc, mul_assoc]
    _ = biMulLin u u * ((1 : Module.End Cut STVC) * biMulLin u u) := by rw [hBB]
    _ = biMulLin u u * biMulLin u u := by rw [one_mul]
    _ = 1 := hAA

-- ★★ THE CONVERSE CORE for the PRODUCT: the 2-plane-rotation product's compact part = itself.
theorem probe_genTwoPlaneLin_compact_part_eq_self (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = specOpN c uu ∧
      (genTwoPlaneLin u w).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)
        = genTwoPlaneLin u w := by
  set g := genTwoPlaneLin u w with hg
  set h := genTwoPlaneLin w u with hh
  have hgisom : IsQvIsomC g := probe_genTwoPlaneLin_isQvIsomC u w hu hw
  have hgadj : IsEvCAdjoint g h :=
    probe_genTwoPlaneLin_isEvCAdjoint u w hu hw huss huL hwss hwL
  obtain ⟨n, c, uu, horth, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom hgisom hgadj
  refine ⟨n, c, uu, horth, hcpos, heq, ?_⟩
  -- p = h∘g = id (EvC-orthogonal)
  have hhg_id : h.comp g = LinearMap.id :=
    probe_genTwoPlaneLin_adjoint_comp_self u w huss huL hwss hwL
  have hspec_id : specOpN c uu = LinearMap.id := by rw [← heq, hhg_id]
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) uu) (specOpN c uu) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth
  have h_id : IsEvCOpSqrt (LinearMap.id : Module.End Cut STVC) (specOpN c uu) := by
    refine ⟨lid_isEvCSymm, ?_, ?_⟩
    · intro p; rw [LinearMap.id_apply]; exact EvC_nonneg p
    · rw [hspec_id]; rfl
  have hqinj : Function.Injective (specOpN c uu) := by
    rw [hspec_id]; exact fun x y h => h
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) uu = LinearMap.id :=
    op_sqrt_unique_of_injective hqinj h₁ h_id
  have hres : (∑ i, projC (uu i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  have hinv : (specOpN (fun i => cutSqrt (c i)) uu).comp
      (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = LinearMap.id :=
    specOpN_inverse horth hres hsq_ne
  rw [hsqrt_eq, LinearMap.id_comp] at hinv
  rw [hinv, LinearMap.comp_id]

end

end Phys.Algebra
