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

theorem deflateC_mapsTo_uPerp {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) :
    ∀ p ∈ uPerp u, deflateC g l u p ∈ uPerp u := by
  intro p _; rw [mem_uPerp]; exact deflateC_image_orth hg hu heig p

def deflateRestrict {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) :
    Module.End Cut (uPerp u) :=
  (deflateC g l u).restrict (deflateC_mapsTo_uPerp hg hu heig)

theorem deflateRestrict_coe {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) (p : uPerp u) :
    ((deflateRestrict hg hu heig) p : STVC) = deflateC g l u (p : STVC) := rfl

instance uPerp_finite (u : STVC) : Module.Finite Cut (uPerp u) :=
  Module.Finite.of_injective (uPerp u).subtype (Subtype.coe_injective)

/-- Non-vacuity: `u ∉ uPerp u` for a unit `u` (since `EvC u u = 1 ≠ 0`). -/
theorem self_not_mem_uPerp {u : STVC} (hu : EvC u u = 1) : u ∉ uPerp u := by
  rw [mem_uPerp, hu]
  exact one_ne_zero

/-- Non-vacuity: `uPerp u` is a PROPER subspace for a unit `u`. -/
theorem uPerp_ne_top {u : STVC} (hu : EvC u u = 1) : uPerp u ≠ ⊤ := by
  intro htop
  exact self_not_mem_uPerp hu (htop ▸ Submodule.mem_top)

/-- THE RE-SEEDING COROLLARY: if `finrank Cut (uPerp u)` is ODD, the deflated operator has a nonzero
    eigenvector lying inside `uPerp u`. Re-seeding via N77 `dim_odd_has_eigenvector`. -/
theorem deflateRestrict_odd_reseed {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u)
    (hodd : Odd (Module.finrank Cut (uPerp u))) :
    ∃ (lam : Cut) (v : STVC), v ∈ uPerp u ∧ v ≠ 0 ∧ deflateC g l u v = lam • v := by
  obtain ⟨lam, w, hw0, hwev⟩ := dim_odd_has_eigenvector hodd (deflateRestrict hg hu heig)
  refine ⟨lam, (w : STVC), w.2, ?_, ?_⟩
  · intro h
    exact hw0 (Subtype.ext (by rw [h]; rfl))
  · have hc := congrArg (Subtype.val) hwev
    rw [deflateRestrict_coe] at hc
    rw [hc]
    rfl

end

end Phys.Algebra
