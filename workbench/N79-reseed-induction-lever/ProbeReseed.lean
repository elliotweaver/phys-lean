import Phys.Algebra.LorentzContinuumEvenSeed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The EvC-orthogonal complement of `u` = kernel of the bundled functional `EvCRight u`. -/
def uPerp (u : STVC) : Submodule Cut STVC := LinearMap.ker (EvCRight u)

theorem mem_uPerp (u p : STVC) : p ∈ uPerp u ↔ EvC u p = 0 := by
  unfold uPerp
  rw [LinearMap.mem_ker]
  rfl

/-- For a unit `u` (`EvC u u = 1`) the functional `EvCRight u` is surjective. -/
theorem evCRight_surjective {u : STVC} (hu : EvC u u = 1) :
    Function.Surjective (EvCRight u) := by
  intro c
  refine ⟨c • u, ?_⟩
  show EvC u (c • u) = c
  rw [EvC_smul_right, hu, mul_one]

/-- range finrank = 1. -/
example {u : STVC} (hu : EvC u u = 1) :
    Module.finrank Cut (LinearMap.range (EvCRight u)) = 1 := by
  have h : LinearMap.range (EvCRight u) = ⊤ := LinearMap.range_eq_top.mpr (evCRight_surjective hu)
  rw [h, finrank_top]; simp

/-- the codim-one finrank drop via rank-nullity. -/
example {u : STVC} (hu : EvC u u = 1) :
    Module.finrank Cut (uPerp u) = Module.finrank Cut STVC - 1 := by
  have hrn := (EvCRight u).finrank_range_add_finrank_ker
  have hr : Module.finrank Cut (LinearMap.range (EvCRight u)) = 1 := by
    have h : LinearMap.range (EvCRight u) = ⊤ := LinearMap.range_eq_top.mpr (evCRight_surjective hu)
    rw [h, finrank_top]; simp
  unfold uPerp
  omega

end

end Phys.Algebra
