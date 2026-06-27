import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- TEST A1: map_mul via Function.End mul unfolding
example (a b : Module.End Cut STVC) :
    (⇑(a * b) : Function.End STVC) = (⇑a : Function.End STVC) * (⇑b : Function.End STVC) := by
  funext p
  show (a * b) p = a (b p)
  rfl

-- TEST A2: alternative — show the End mul reduces
example (a b : Module.End Cut STVC) (p : STVC) :
    ((⇑a : Function.End STVC) * (⇑b : Function.End STVC)) p = a (b p) := rfl

-- TEST B: compact-part membership in qvIsomMonoidC (the JOINT). hk : IsQvIsomC (g.comp ...).
-- qvIsomMonoidC.carrier = {T : Function.End STVC | IsQvIsomC T}; membership is IsQvIsomC of coe.
example (g h : Module.End Cut STVC) (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) : STVC → STVC) ∈ qvIsomMonoidC := by
  obtain ⟨n, c, u, horth, hcpos, heq, hk⟩ := isometry_compact_part_isQvIsom hg H
  exact ⟨n, c, u, hk⟩

end
end Phys.Algebra
