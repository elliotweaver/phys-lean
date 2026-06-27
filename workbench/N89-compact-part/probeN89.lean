import Phys.Algebra.LorentzContinuumGGFamilyInverse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

-- (i) THE COMPOSITION-ADJOINT LEMMA: the EvC-adjoint composes contravariantly.
theorem IsEvCAdjoint.compP {a a' b b' : Module.End Cut STVC}
    (Ha : IsEvCAdjoint a a') (Hb : IsEvCAdjoint b b') :
    IsEvCAdjoint (a.comp b) (b'.comp a') := by
  intro p q
  simp only [LinearMap.comp_apply]
  rw [Ha (b p) q, Hb p (a' q)]

-- (ii)+(iii) THE COMPACT PART k := g∘pinv WITH k*k = id, AND the reconstruction g = k∘psqrt.
theorem comp_polar_decompositionP (H : IsEvCAdjoint g h) (hg : Function.Injective g) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      IsEvCAdjoint (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
                   ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h) ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h).comp
          (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) = LinearMap.id ∧
      (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp
          (specOpN (fun i => cutSqrt (c i)) u) = g := by
  obtain ⟨n, c, u, horth, hcpos, heq, hps_pi, hpi_ps⟩ := comp_specInverse_exists H hg
  set psqrt := specOpN (fun i => cutSqrt (c i)) u with hpsqrt
  set pinv := specOpN (fun i => (cutSqrt (c i))⁻¹) u with hpinv
  -- hps_pi : psqrt.comp pinv = id ; hpi_ps : pinv.comp psqrt = id
  have hpinv_adj : IsEvCAdjoint pinv pinv := specOpN_isEvCSymm _ _
  refine ⟨n, c, u, horth, hcpos, heq, H.compP hpinv_adj, ?_, ?_⟩
  · -- k*k = id
    have hsq : psqrt.comp psqrt = h.comp g := by
      rw [hpsqrt, specOpN_comp horth, heq]
      congr 1; funext i; rw [cutSqrt_sq (le_of_lt (hcpos i))]
    apply LinearMap.ext; intro v
    simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    -- goal: pinv (h (g (pinv v))) = v
    have e1 : h (g (pinv v)) = psqrt (psqrt (pinv v)) := by
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
  · -- reconstruction g = k ∘ psqrt
    rw [LinearMap.comp_assoc, hpi_ps, LinearMap.comp_id]

-- NON-VACUITY witness: 3•id
theorem smulId_comp_polar_decompositionP :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      ((3 : Cut) • (LinearMap.id : Module.End Cut STVC)).comp ((3 : Cut) • LinearMap.id)
          = specOpN c u ∧
      IsEvCAdjoint (((3 : Cut) • LinearMap.id).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
                   ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp ((3 : Cut) • LinearMap.id)) ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp ((3 : Cut) • LinearMap.id)).comp
          (((3 : Cut) • LinearMap.id).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
          = LinearMap.id ∧
      (((3 : Cut) • LinearMap.id).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp
          (specOpN (fun i => cutSqrt (c i)) u) = (3 : Cut) • LinearMap.id :=
  comp_polar_decompositionP (smulId_isEvCAdjoint 3) (smulId_injective (by norm_num))

end

end Phys.Algebra

-- axiom check
#print axioms Phys.Algebra.IsEvCAdjoint.compP
#print axioms Phys.Algebra.comp_polar_decompositionP
#print axioms Phys.Algebra.smulId_comp_polar_decompositionP
