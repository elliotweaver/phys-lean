import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- The bridge MonoidHom: inside the builder, * is the Function.End monoid mul (= comp).
def endToFunEnd : Module.End Cut STVC →* Function.End STVC where
  toFun k := (k : STVC → STVC)
  map_one' := rfl
  map_mul' a b := rfl

#check @endToFunEnd

example (k : Module.End Cut STVC) : endToFunEnd k = (k : STVC → STVC) := rfl

example : Function.Injective endToFunEnd := by
  intro a b hab
  exact DFunLike.coe_injective hab

-- the compact-part joint via the bridge
example (g h : Module.End Cut STVC) (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      endToFunEnd (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∈ qvIsomMonoidC := by
  obtain ⟨n, c, u, horth, hcpos, heq, hk⟩ := isometry_compact_part_isQvIsom hg H
  exact ⟨n, c, u, hk⟩

end
end Phys.Algebra
