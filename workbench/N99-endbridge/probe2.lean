import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- TEST A: map_mul via funext + reduce both sides explicitly
example (a b : Module.End Cut STVC) :
    (⇑(a * b) : Function.End STVC) = (⇑a : Function.End STVC) * (⇑b : Function.End STVC) := by
  funext p
  change (a * b) p = a (b p)
  rw [Module.End.mul_apply]

-- TEST B: is the compact-part membership in qvIsomMonoidC direct?
-- qvIsomMonoidC carrier = {T : Function.End STVC | IsQvIsomC T}.
example (g h : Module.End Cut STVC) (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      ((g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) : Module.End Cut STVC)
        : Function.End STVC) ∈ qvIsomMonoidC := by
  obtain ⟨n, c, u, horth, hcpos, heq, hk⟩ := isometry_compact_part_isQvIsom hg H
  exact ⟨n, c, u, hk⟩

-- TEST C: biMulFun as the coercion of biMulLin — is the function equal?
example (u u' : O Cut) (p : STVC) :
    (fun q : STVC => (q.1, q.2.1, u * (q.2.2 * u'))) p = biMulFun u u' p := rfl

end
end Phys.Algebra
