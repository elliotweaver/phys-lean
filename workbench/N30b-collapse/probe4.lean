import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- The module instance that synthesizes: which one is it? Use a generic subalgebra of End.
-- Try the abstract version first: any subalgebra A of End ℚ V acts on V; is V finite over A?
example (V : Type*) [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    (A : Subalgebra ℚ (Module.End ℚ V)) : Module A V := by infer_instance

set_option synthInstance.maxHeartbeats 80000 in
example (V : Type*) [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    (A : Subalgebra ℚ (Module.End ℚ V)) : SMul A V := by infer_instance

end
end Phys.Algebra
