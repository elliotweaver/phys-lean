import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- MEASURE 1: does ↥ImO carry an A_I-module structure automatically?
-- A_I is a Subalgebra of (Module.End ℚ ↥ImO). ↥ImO is a module over End ℚ ↥ImO.
-- A subalgebra acts via Subalgebra → restrict scalars.
example (I : LieIdeal ℚ derivationLieQ) :
    Module (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  infer_instance

-- MEASURE 2: IsSemisimpleModule is banked. Module.Finite over A_I?
example (I : LieIdeal ℚ derivationLieQ) :
    IsSemisimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO :=
  semisimpleModule_imRep_adjoin I

-- MEASURE 3: is ↥ImO Module.Finite over A_I? (needed for linearEquiv_fun)
example (I : LieIdeal ℚ derivationLieQ) :
    Module.Finite (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  infer_instance

end
end Phys.Algebra
