import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Cascade.Sedenion

open scoped Classical
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem probe_nzd {x y : O ℚ} (hxy : x * y = 0) (hx : x ≠ 0) : y = 0 := by
  have hcomp := gForm_comp x y
  rw [hxy, (gForm_self_eq_zero).mpr rfl] at hcomp
  have hxx : gForm x x ≠ 0 := fun h => hx (gForm_self_eq_zero.mp h)
  exact gForm_self_eq_zero.mp ((mul_eq_zero.mp hcomp.symm).resolve_left hxx)

-- WORLD-COMPLETENESS: every nonzero standpoint's worldMap (LeftMul) is INJECTIVE.
-- (Every fold standpoint opens a COMPLETE inner world — nothing collapses to zero.)
theorem probe_worldMap_injective {a : O ℚ} (ha : a ≠ 0) :
    Function.Injective (LeftMul a) := by
  rw [injective_iff_map_eq_zero]
  intro x hx
  simp only [LeftMul_apply] at hx
  exact probe_nzd hx ha

#print axioms probe_worldMap_injective
