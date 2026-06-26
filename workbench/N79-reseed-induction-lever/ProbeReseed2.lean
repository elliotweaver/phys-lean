import Phys.Algebra.LorentzContinuumEvenSeed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def uPerp (u : STVC) : Submodule Cut STVC := LinearMap.ker (EvCRight u)

theorem mem_uPerp (u p : STVC) : p ∈ uPerp u ↔ EvC u p = 0 := by
  unfold uPerp; rw [LinearMap.mem_ker]; rfl

/-- The deflated operator maps `uPerp u` into `uPerp u` (its whole image is EvC-orthogonal to `u`). -/
theorem deflateC_mapsTo_uPerp {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) :
    ∀ p ∈ uPerp u, deflateC g l u p ∈ uPerp u := by
  intro p _
  rw [mem_uPerp]
  exact deflateC_image_orth hg hu heig p

/-- The restricted operator on the codim-1 invariant subspace `uPerp u`. -/
def deflateRestrict {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) :
    Module.End Cut (uPerp u) :=
  (deflateC g l u).restrict (deflateC_mapsTo_uPerp hg hu heig)

/-- The restriction coercion: `↑(deflateRestrict … p) = deflateC g l u ↑p`. -/
theorem deflateRestrict_coe {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) (p : uPerp u) :
    ((deflateRestrict hg hu heig) p : STVC) = deflateC g l u (p : STVC) := by
  rfl

/-- The restricted operator is EvC-self-adjoint on `uPerp u`. -/
theorem deflateRestrict_isEvCSymm {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) (p q : uPerp u) :
    EvC ((deflateRestrict hg hu heig p : STVC)) (q : STVC)
      = EvC ((p : STVC)) ((deflateRestrict hg hu heig q : STVC)) := by
  rw [deflateRestrict_coe, deflateRestrict_coe]
  exact deflateC_isEvCSymm hg l u (p : STVC) (q : STVC)

/-- `Module.Finite Cut (uPerp u)` — a submodule of the finite STVC. -/
instance uPerp_finite (u : STVC) : Module.Finite Cut (uPerp u) :=
  Module.Finite.of_injective (uPerp u).subtype (Subtype.coe_injective)

end

end Phys.Algebra
