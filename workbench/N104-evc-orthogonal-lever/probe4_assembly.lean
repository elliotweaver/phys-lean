import Phys.Algebra.LorentzContinuumGenerationConverseCompactWord

namespace Phys.Algebra.N104Probe4

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def triHalfTurnLin (u w x : O Cut) : Module.End Cut STVC :=
  biMulLin x x * genTwoPlaneLin u w

theorem triHalfTurnLin_isQvIsomC (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1) :
    IsQvIsomC (triHalfTurnLin u w x) := by
  intro p
  show QvC (triHalfTurnLin u w x p) = QvC p
  have hgp : triHalfTurnLin u w x p = biMulLin x x (genTwoPlaneLin u w p) := rfl
  rw [hgp, biMulLin_imag_isQvIsomC x hx (genTwoPlaneLin u w p),
      genTwoPlaneLin_isQvIsomC u w hu hw p]

theorem triHalfTurnLin_isEvCAdjoint (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    IsEvCAdjoint (triHalfTurnLin u w x)
      (genTwoPlaneLin w u * biMulLin x x) := by
  have hC := biMulLin_imag_isEvCAdjoint_self x hx hxss hxL
  have hgen := genTwoPlaneLin_isEvCAdjoint u w hu hw huss huL hwss hwL
  exact hC.comp hgen

theorem triHalfTurnLin_adjoint_comp_self (u w x : O Cut)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    (genTwoPlaneLin w u * biMulLin x x).comp (triHalfTurnLin u w x)
      = LinearMap.id := by
  show (genTwoPlaneLin w u * biMulLin x x) * (biMulLin x x * genTwoPlaneLin u w)
      = LinearMap.id
  have hCC : biMulLin x x * biMulLin x x = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive x hxss hxL
  have hgen : (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = LinearMap.id :=
    genTwoPlaneLin_adjoint_comp_self u w huss huL hwss hwL
  set P := genTwoPlaneLin w u
  set Q := genTwoPlaneLin u w
  set C := biMulLin x x
  calc (P * C) * (C * Q)
      = P * ((C * C) * Q) := by rw [mul_assoc, ← mul_assoc C C Q]
    _ = P * ((1 : Module.End Cut STVC) * Q) := by rw [hCC]
    _ = P * Q := by rw [one_mul]
    _ = LinearMap.id := hgen

theorem triHalfTurnLin_mem_genLin (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1) :
    triHalfTurnLin u w x ∈ genIsomMonoidLin := by
  have gC : biMulLin x x ∈ genIsomMonoidLin :=
    Submonoid.subset_closure ⟨x, x, hx, hx, rfl⟩
  have gQ : genTwoPlaneLin u w ∈ genIsomMonoidLin := genTwoPlaneLin_mem_genLin u w hu hw
  exact mul_mem gC gQ

/-- THE ABSTRACT LEVER (copied from probe1, kept local). -/
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

/-- THE THREE-WORD COMPACT PART IS THE THREE-WORD ITSELF (via the abstract lever). -/
theorem triHalfTurnLin_compact_part_eq_self (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (genTwoPlaneLin w u * biMulLin x x).comp (triHalfTurnLin u w x) = specOpN c uu ∧
      (triHalfTurnLin u w x).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)
        = triHalfTurnLin u w x := by
  obtain ⟨n, c, uu, _, _, heq, hkself⟩ :=
    evCOrthogonal_compact_part_eq_self (triHalfTurnLin u w x)
      (genTwoPlaneLin w u * biMulLin x x)
      (triHalfTurnLin_isQvIsomC u w x hu hw hx)
      (triHalfTurnLin_isEvCAdjoint u w x hu hw hx huss huL hwss hwL hxss hxL)
      (triHalfTurnLin_adjoint_comp_self u w x huss huL hwss hwL hxss hxL)
  exact ⟨n, c, uu, heq, hkself⟩

/-- W8 TEETH: the concrete e2,je2,e2 three-word's compact part (= itself) NEGATES the real axis
    (0,0,1), reading re.re.re = -1. The two-word fixes it (+1, N103); one more half-turn negates
    it. -/
theorem triHalfTurnLin_e2je2e2_compact_part_real_coord :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      ((((triHalfTurnLin (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (-1 : Cut) := by
  obtain ⟨n, c, uu, _, hkself⟩ :=
    triHalfTurnLin_compact_part_eq_self (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut)
      e2_gFormC_self je2_gFormC_self e2_gFormC_self
      biMulFun_e2_sq e2_alt je2_sq je2_alt biMulFun_e2_sq e2_alt
  refine ⟨n, c, uu, ?_⟩
  rw [hkself]
  -- triHalfTurnLin e2 je2 e2 (0,0,1) = biMulLin e2 e2 (genTwoPlaneLin e2 je2 (0,0,1))
  -- genTwoPlaneLin e2 je2 fixes (0,0,1); biMulLin e2 e2 negates the real component.
  have hfix : (endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)))
        ((0 : Cut), (0 : Cut), (1 : O Cut))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := genTwoPlaneLin_e2je2_fixes_one
  rw [endToFunEnd_apply] at hfix
  show ((biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut)
      (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)
        ((0 : Cut), (0 : Cut), (1 : O Cut)))).2.2).re.re.re = (-1 : Cut)
  rw [hfix]
  show ((CD.e2 : O Cut) * ((1 : O Cut) * (CD.e2 : O Cut))).re.re.re = (-1 : Cut)
  rw [one_mul, biMulFun_e2_sq]
  rfl

end
end Phys.Algebra.N104Probe4
