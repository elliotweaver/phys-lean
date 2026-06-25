import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Topology.Constructions

open Phys.Foundation ContinuumQ
open scoped BigOperators

noncomputable instance instTopCut : TopologicalSpace Cut := Preorder.topology Cut
instance instOrdTopCut : OrderTopology Cut := ⟨rfl⟩

-- matrices as Fin 8 → Fin 8 → Cut (product topology)
abbrev Mat := Fin 8 → Fin 8 → Cut

-- continuity of a single entry evaluation
example (i j : Fin 8) : Continuous (fun M : Mat => M i j) := by
  exact (continuous_apply j).comp (continuous_apply i)

-- continuity of the orthonormality bilinear: M ↦ ∑ i, M i j * M i k
example (j k : Fin 8) : Continuous (fun M : Mat => ∑ i, M i j * M i k) := by
  apply continuous_finset_sum
  intro i _
  exact ((continuous_apply j).comp (continuous_apply i)).mul ((continuous_apply k).comp (continuous_apply i))

-- the orthonormality condition set is closed (preimage of {δ} which is closed since T2)
example (j k : Fin 8) (c : Cut) :
    IsClosed {M : Mat | (∑ i, M i j * M i k) = c} := by
  have hcont : Continuous (fun M : Mat => ∑ i, M i j * M i k) := by
    apply continuous_finset_sum; intro i _
    exact ((continuous_apply j).comp (continuous_apply i)).mul ((continuous_apply k).comp (continuous_apply i))
  exact isClosed_eq hcont continuous_const
