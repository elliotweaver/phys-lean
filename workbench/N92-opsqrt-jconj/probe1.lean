import Phys.Algebra.LorentzContinuumIsomMetricChar
import Phys.Algebra.LorentzContinuumGGFamilyInverse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

-- P1: the J-conjugation of a positive operator square root is a positive operator square root
-- of the J-conjugate. General, reusable. J* = J (sigOpC_isEvCAdjoint_self), J∘J = id.
theorem opSqrt_sigOpC_conj {s q : Module.End Cut STVC} (hs : IsEvCOpSqrt s q) :
    IsEvCOpSqrt (sigOpC.comp (s.comp sigOpC)) (sigOpC.comp (q.comp sigOpC)) := by
  obtain ⟨hsymm, hpos, hsq⟩ := hs
  have HJ := sigOpC_isEvCAdjoint_self
  refine ⟨?_, ?_, ?_⟩
  · -- EvC-self-adjoint
    intro p p'
    simp only [LinearMap.comp_apply]
    rw [HJ (s (sigOpC p)) p', hsymm (sigOpC p) (sigOpC p'), HJ p (s (sigOpC p'))]
  · -- positive
    intro p
    simp only [LinearMap.comp_apply]
    rw [HJ (s (sigOpC p)) p]
    -- goal: 0 ≤ EvC (s (sigOpC p)) (sigOpC p)
    exact hpos (sigOpC p)
  · -- squares to J q J
    apply LinearMap.ext; intro p
    simp only [LinearMap.comp_apply]
    -- s' s' p = J (s (J (J (s (J p))))) ; J(J x) = x
    have hJJ : ∀ x, sigOpC (sigOpC x) = x := by
      intro x; have := congrArg (fun (f : Module.End Cut STVC) => f x) sigOpC_comp_self
      simpa [LinearMap.comp_apply] using this
    rw [hJJ (s (sigOpC p))]
    -- goal: J (s (s (J p))) = J (q (J p))
    have : s (s (sigOpC p)) = q (sigOpC p) := by
      have := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC p)) hsq
      simpa [LinearMap.comp_apply] using this
    rw [this]

end

end Phys.Algebra
