import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Topology.Constructions

namespace Phys.Foundation
namespace ContinuumQ
open scoped Classical
noncomputable section
instance instTopologicalSpaceCut : TopologicalSpace Cut := Preorder.topology Cut
instance instOrderTopologyCut : OrderTopology Cut := ⟨rfl⟩
theorem isCompact_Icc_cut (a b : Cut) : IsCompact (Set.Icc a b) := isCompact_Icc
theorem isCompact_box {n : ℕ} :
    IsCompact (Set.univ.pi (fun _ : Fin n => Set.Icc (-1 : Cut) 1)) :=
  isCompact_univ_pi (fun _ => isCompact_Icc)
end
end ContinuumQ
end Phys.Foundation

#print axioms Phys.Foundation.ContinuumQ.isCompact_Icc_cut
#print axioms Phys.Foundation.ContinuumQ.isCompact_box
