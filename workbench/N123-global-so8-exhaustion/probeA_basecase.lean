import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The fixed submodule of a linear operator: `ker (S - id)`. -/
def fixSubmodule (S : O Cut →ₗ[Cut] O Cut) : Submodule Cut (O Cut) :=
  LinearMap.ker (S - LinearMap.id)

theorem mem_fixSubmodule (S : O Cut →ₗ[Cut] O Cut) (v : O Cut) :
    v ∈ fixSubmodule S ↔ S v = v := by
  unfold fixSubmodule
  rw [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

/-- BASE CASE / TERMINATION: an operator whose fixed submodule is full-rank (finrank 8) is the
    identity. Uses N122 `finrank_O_eq_eight_Cut` + `Submodule.eq_top_of_finrank_eq`. -/
theorem isom_fix_full_eq_id (S : O Cut →ₗ[Cut] O Cut)
    (hfix : Module.finrank Cut (fixSubmodule S) = 8) :
    S = LinearMap.id := by
  have htop : fixSubmodule S = ⊤ :=
    Submodule.eq_top_of_finrank_eq (by rw [hfix, finrank_O_eq_eight_Cut])
  apply LinearMap.ext
  intro v
  have hv : v ∈ fixSubmodule S := htop ▸ Submodule.mem_top
  rw [mem_fixSubmodule] at hv
  rw [hv, LinearMap.id_apply]

end

end Phys.Algebra
