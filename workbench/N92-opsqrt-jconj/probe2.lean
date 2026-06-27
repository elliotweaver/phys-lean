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

-- P1 (already measured clean) reproduced
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

-- THE J-CONJUGATION INVERSION as an OPERATOR EQUALITY: J p J = p⁻¹.
-- N91 gives (J∘p∘J)∘p = id (a LEFT inverse of p); N88 gives p a two-sided inverse pinv with
-- p∘pinv = id; so J p J = (J p J)∘(p∘pinv) = ((J p J)∘p)∘pinv = id∘pinv = pinv. Generic: left
-- inverse = right inverse when both exist. Here we get J p J = pinv directly.
-- Measure: does N91's lever compose to a clean operator equality with the N88 inverse?

-- P2 setup: for an isometry g with EvC-adjoint h, the spectral data of p := h∘g.
theorem linIsom_JsqrtJ_isOpSqrt (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∀ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) →
      (∀ i, 0 < c i) →
      h.comp g = specOpN c u →
      IsEvCOpSqrt
        (sigOpC.comp ((specOpN (fun i => cutSqrt (c i)) u).comp sigOpC))
        (sigOpC.comp ((h.comp g).comp sigOpC)) := by
  intro n c u horth hcpos heq
  -- p^{1/2} := specOpN (cutSqrt∘c) u is a positive op sqrt of p = h∘g = specOpN c u (N68)
  have hsqrt : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) u) (h.comp g) := by
    rw [heq]
    exact specOpN_op_sqrt (fun i => (hcpos i).le) horth
  exact opSqrt_sigOpC_conj hsqrt

-- P3: (p^{1/2})⁻¹ = specOpN (cutSqrt∘c)⁻¹ u is a positive op sqrt of p⁻¹ = specOpN c⁻¹ u.
theorem linIsom_posInv_isOpSqrt (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∀ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) →
      (∀ i, 0 < c i) →
      IsEvCOpSqrt
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)
        (specOpN (fun i => (c i)⁻¹) u) := by
  intro n c u horth hcpos
  refine ⟨specOpN_isEvCSymm _ _, specOpN_nonneg (fun i => inv_nonneg.mpr (cutSqrt_nonneg (c i))) u, ?_⟩
  rw [specOpN_comp horth]
  congr 1
  funext i
  -- ((cutSqrt c_i)⁻¹)² = (c_i)⁻¹ : cutSqrt c_i squared = c_i (cutSqrt_sq, c_i ≥ 0)
  rw [← mul_inv, cutSqrt_sq (hcpos i).le]

end

end Phys.Algebra
