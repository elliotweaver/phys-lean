import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- MEASURE 3b: IsScalarTower ℚ A_I ↥ImO?
example (I : LieIdeal ℚ derivationLieQ) :
    IsScalarTower ℚ (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  infer_instance

-- MEASURE 3c: Module.Finite ℚ ↥ImO?
example : Module.Finite ℚ ImO := by infer_instance

-- MEASURE 3d: derive Module.Finite A_I ↥ImO from ℚ-finiteness + scalar tower
example (I : LieIdeal ℚ derivationLieQ) :
    Module.Finite (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  have : Module.Finite ℚ ImO := inferInstance
  exact Module.Finite.of_restrictScalars_finite ℚ
    (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO

end
end Phys.Algebra
