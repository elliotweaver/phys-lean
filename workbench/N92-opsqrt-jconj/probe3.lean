import Phys.Algebra.LorentzContinuumIsomMetricChar
import Phys.Algebra.LorentzContinuumGGFamilyInverse
import Phys.Algebra.LorentzContinuumCompactPart

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

-- P1
theorem opSqrt_sigOpC_conj {s q : Module.End Cut STVC} (hs : IsEvCOpSqrt s q) :
    IsEvCOpSqrt (sigOpC.comp (s.comp sigOpC)) (sigOpC.comp (q.comp sigOpC)) := by
  obtain ⟨hsymm, hpos, hsq⟩ := hs
  have HJ := sigOpC_isEvCAdjoint_self
  refine ⟨?_, ?_, ?_⟩
  · intro p p'
    simp only [LinearMap.comp_apply]
    rw [HJ (s (sigOpC p)) p', hsymm (sigOpC p) (sigOpC p'), HJ p (s (sigOpC p'))]
  · intro p
    simp only [LinearMap.comp_apply]
    rw [HJ (s (sigOpC p)) p]
    exact hpos (sigOpC p)
  · apply LinearMap.ext; intro p
    simp only [LinearMap.comp_apply]
    have hJJ : ∀ x, sigOpC (sigOpC x) = x := by
      intro x; have := congrArg (fun (f : Module.End Cut STVC) => f x) sigOpC_comp_self
      simpa [LinearMap.comp_apply] using this
    rw [hJJ (s (sigOpC p))]
    have : s (s (sigOpC p)) = q (sigOpC p) := by
      have := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC p)) hsq
      simpa [LinearMap.comp_apply] using this
    rw [this]

-- THE J-CONJUGATION INVERSION as an OPERATOR EQUALITY J p J = p⁻¹ = specOpN c⁻¹ u.
-- N91 gives (J∘p∘J)∘p = id; specOpN_inverse gives p ∘ (specOpN c⁻¹ u) = id; so
-- J p J = J p J ∘ (p ∘ pinv) = (J p J ∘ p) ∘ pinv = pinv.
theorem linIsom_JpJ_eq_specInv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h)
    (hgi : Function.Injective g)
    {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (heq : h.comp g = specOpN c u) :
    sigOpC.comp ((h.comp g).comp sigOpC) = specOpN (fun i => (c i)⁻¹) u := by
  -- spectral data: p injective ⟹ resolution of identity; eigenvalues nonzero
  have hpinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint H hgi
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hpinj
  have hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p := by
    intro p; rw [← heq]; exact H.comp_nonneg p
  have hcpos : ∀ i, 0 < c i := fun i => specExists_eigen_pos horth hpos hpinj i
  have hcne : ∀ i, c i ≠ 0 := fun i => ne_of_gt (hcpos i)
  -- p ∘ pinv = id
  have hpinv : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id :=
    specOpN_inverse horth hres hcne
  have hpinv' : (h.comp g).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id := by
    rw [heq]; exact hpinv
  -- N91 lever: (J∘p∘J)∘p = id
  have hlever : (sigOpC.comp ((h.comp g).comp sigOpC)).comp (h.comp g) = LinearMap.id :=
    linIsom_posPart_J_conj_inv hg H
  -- left inverse = right inverse:  JpJ = JpJ ∘ (p ∘ pinv) = (JpJ ∘ p) ∘ pinv = id ∘ pinv = pinv
  set JpJ := sigOpC.comp ((h.comp g).comp sigOpC) with hJpJ
  have key : JpJ.comp ((h.comp g).comp (specOpN (fun i => (c i)⁻¹) u)) = JpJ := by
    rw [hpinv', LinearMap.comp_id]
  rw [← key, ← LinearMap.comp_assoc, hlever, LinearMap.id_comp]

end

end Phys.Algebra
