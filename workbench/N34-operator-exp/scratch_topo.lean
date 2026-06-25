import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Topology.Constructions

namespace Phys.Foundation
namespace ContinuumQ

open scoped Classical

noncomputable section

/-- The standard ORDER TOPOLOGY on the derived ℝ. -/
instance instTopologicalSpaceCut : TopologicalSpace Cut := Preorder.topology Cut

instance instOrderTopologyCut : OrderTopology Cut := ⟨rfl⟩

theorem t2Space_cut : T2Space Cut := inferInstance

theorem isTopologicalRing_cut : IsTopologicalRing Cut := inferInstance

theorem orderClosedTopology_cut : OrderClosedTopology Cut := inferInstance

theorem compactIccSpace_cut : CompactIccSpace Cut := inferInstance

/-- ★★ HEINE–BOREL on the DERIVED ℝ. -/
theorem isCompact_Icc_cut (a b : Cut) : IsCompact (Set.Icc a b) := isCompact_Icc

/-- finite-product BOX compactness `[-1,1]^n` over the derived ℝ. -/
theorem isCompact_box {n : ℕ} :
    IsCompact (Set.univ.pi (fun _ : Fin n => Set.Icc (-1 : Cut) 1)) :=
  isCompact_univ_pi (fun _ => isCompact_Icc)

end

end ContinuumQ
end Phys.Foundation
