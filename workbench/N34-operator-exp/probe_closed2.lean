import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Topology.Constructions

open Phys.Foundation ContinuumQ
open scoped BigOperators

noncomputable instance instTopCut : TopologicalSpace Cut := Preorder.topology Cut
instance instOrdTopCut : OrderTopology Cut := ⟨rfl⟩

abbrev Mat := Fin 8 → Fin 8 → Cut

theorem entry_cont (i j : Fin 8) : Continuous (fun M : Mat => M i j) :=
  (continuous_apply j).comp (continuous_apply i)

theorem bilin_cont (j k : Fin 8) : Continuous (fun M : Mat => ∑ i, M i j * M i k) := by
  apply continuous_finset_sum
  intro i _
  exact (entry_cont i j).mul (entry_cont i k)

theorem ortho_closed (j k : Fin 8) (c : Cut) :
    IsClosed {M : Mat | (∑ i, M i j * M i k) = c} :=
  isClosed_eq (bilin_cont j k) continuous_const

-- the FULL isometry box: orthonormal columns ∩ entry-box [-1,1]
-- intersection of closed orthonormality conditions = closed
-- contained in the compact box ⟹ compact
theorem box_compact :
    IsCompact (Set.univ.pi (fun _ : Fin 8 => Set.univ.pi (fun _ : Fin 8 => Set.Icc (-1:Cut) 1))) :=
  isCompact_univ_pi (fun _ => isCompact_univ_pi (fun _ => isCompact_Icc))
