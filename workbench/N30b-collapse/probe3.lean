import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

set_option synthInstance.maxHeartbeats 40000 in
-- What Module instance is found, and how fast?
example (I : LieIdeal ℚ derivationLieQ) :
    Module (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  infer_instance

set_option synthInstance.maxHeartbeats 40000 in
-- SMul directly
example (I : LieIdeal ℚ derivationLieQ) :
    SMul (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  infer_instance

end
end Phys.Algebra
