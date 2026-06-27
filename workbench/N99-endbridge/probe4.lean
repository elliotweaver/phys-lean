import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- Use the Monoid mul explicitly via the typeclass to avoid Pi.instMul ambiguity.
example (a b : Module.End Cut STVC) :
    (DFunLike.coe (a * b) : Function.End STVC)
      = (DFunLike.coe a : Function.End STVC) * (DFunLike.coe b : Function.End STVC) := by
  rfl

-- TEST B isolated: the compact-part joint into qvIsomMonoidC
example (g h : Module.End Cut STVC) (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (DFunLike.coe (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) : Function.End STVC)
        ∈ qvIsomMonoidC := by
  obtain ⟨n, c, u, horth, hcpos, heq, hk⟩ := isometry_compact_part_isQvIsom hg H
  exact ⟨n, c, u, hk⟩

end
end Phys.Algebra
