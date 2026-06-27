import Phys.Algebra.LorentzContinuumGeneration
import Phys.Algebra.LorentzContinuumReverseSurj
import Phys.Algebra.LorentzContinuumPolarKAK

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- MEASURE 0: is boostEndC ≡ boostC definitionally? (both (t,x,v) ↦ (a t+b x, b t+a x, v))
example (a b : Cut) : boostEndC a b = boostC a b := rfl

-- MEASURE 1: the positivity helper for boostEndC (via boostC_nonneg, defeq)
theorem boostEndC_nonneg' {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) (p : STVC) :
    0 ≤ EvC (boostEndC a b p) p :=
  boostC_nonneg hab hab' p

-- MEASURE 2: boostEndC is its own positive operator square root of its square
theorem boostEndC_op_sqrt' {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) :
    IsEvCOpSqrt (boostEndC a b) ((boostEndC a b).comp (boostEndC a b)) :=
  ⟨boostEndC_isEvCAdjoint_self a b, boostEndC_nonneg' hab hab', rfl⟩

-- MEASURE 3 (THE CORE): the boost's polar compact part IS the identity.
theorem boostEndC_compact_part_eq_id' {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (hpos : 0 ≤ a + b) (hpos' : 0 ≤ a - b) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      (boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id := by
  obtain ⟨n, c, u, horth, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)
  refine ⟨n, c, u, horth, hcpos, heq, ?_⟩
  -- both `specOpN (cutSqrt∘c) u` and `boostEndC a b` are positive operator square roots of `g*g`
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) u) (specOpN c u) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth
  have h₂ : IsEvCOpSqrt (boostEndC a b) (specOpN c u) := by
    exact ⟨boostEndC_isEvCAdjoint_self a b, boostEndC_nonneg' hpos hpos', heq⟩
  -- the positive part `g*g = specOpN c u` is injective
  have hg_inj : Function.Injective (boostEndC a b) :=
    linIsom_injective (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)
  have hqinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint (boostEndC_isEvCAdjoint_self a b) hg_inj
  -- by sqrt-uniqueness, the spectral root equals the boost itself
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) u = boostEndC a b :=
    op_sqrt_unique_of_injective hqinj h₁ h₂
  -- so `boostEndC a b ∘ (p^{1/2})⁻¹ = p^{1/2} ∘ (p^{1/2})⁻¹ = id`
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  rw [← hsqrt_eq]
  exact specOpN_inverse horth hres hsq_ne

-- MEASURE 4: compact part = id ∈ genIsomMonoidLin (one_mem after rewriting to id)
theorem boostEndC_compact_part_mem_genLin' {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (hpos : 0 ≤ a + b) (hpos' : 0 ≤ a - b) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      (boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) ∈ genIsomMonoidLin := by
  obtain ⟨n, c, u, _, _, heq, hkid⟩ := boostEndC_compact_part_eq_id' hab hpos hpos'
  refine ⟨n, c, u, heq, ?_⟩
  rw [hkid]
  exact one_mem genIsomMonoidLin

-- MEASURE 5 (THE CONVERSE GENERATION on the boost sector): bridged compact part ∈ genIsomMonoidC2
theorem boostEndC_compact_part_mem_gen2' {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (hpos : 0 ≤ a + b) (hpos' : 0 ≤ a - b) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      endToFunEnd ((boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
        ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, u, heq, hmem⟩ := boostEndC_compact_part_mem_genLin' hab hpos hpos'
  exact ⟨n, c, u, heq, endToFunEnd_genIsomMonoidLin_mem_gen2 hmem⟩

-- MEASURE 6 (W8 teeth): concrete boost (5/3,4/3) compact part = id reads time coord 1 at (1,0,0)
theorem boostEndC_compact_part_id_coord
    {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC)
    (hkid : (boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id) :
    ((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u) ((1:Cut),(0:Cut),(0:O Cut))).1 = 1 := by
  rw [hkid]; rfl

end

end Phys.Algebra
