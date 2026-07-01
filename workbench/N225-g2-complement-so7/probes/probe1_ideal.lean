import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The candidate LieIdeal: derivations D whose 7-rep image lands in range crossEmb.
    lie_mem: for D' in the set and any D, imRep⁅D,D'⁆ = ⁅imRep D, imRep D'⁆ ∈ range crossEmb
    by the banked g₂-invariance of range crossEmb (N224 crossEmb_range_g2_invariant). -/
def interIdeal : LieIdeal ℚ derivationLieQ where
  carrier := {D | imRep D ∈ LinearMap.range crossEmb}
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_setOf_eq] at *
    rw [map_add]; exact Submodule.add_mem _ ha hb
  zero_mem' := by
    simp only [Set.mem_setOf_eq, map_zero]; exact Submodule.zero_mem _
  smul_mem' := by
    intro c a ha
    simp only [Set.mem_setOf_eq] at *
    rw [map_smul]; exact Submodule.smul_mem _ _ ha
  lie_mem := by
    intro D D' hD'
    simp only [Set.mem_setOf_eq] at *
    rw [LieHom.map_lie]
    exact crossEmb_range_g2_invariant D hD'

theorem mem_interIdeal {D : derivationLieQ} :
    D ∈ interIdeal ↔ imRep D ∈ LinearMap.range crossEmb := Iff.rfl

end

end Phys.Algebra
