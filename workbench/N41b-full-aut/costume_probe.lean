import Phys.Cascade.OctonionTopology

namespace Counterexamples

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- WRONG: the genuine induced topology on O Cut claimed to be the discrete topology ⊥.
theorem oCut_topology_discrete_BOGUS :
    (CD.instUniformSpace : UniformSpace (O Cut)).toTopologicalSpace = (⊥ : TopologicalSpace (O Cut)) := by
  rw [CD.topology_eq_induced]

end

end Counterexamples
