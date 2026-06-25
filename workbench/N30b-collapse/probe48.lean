import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- MEASURE: does prime_split_dichotomy instantiate at concrete A_I with hdich stubbed?
example (I : LieIdeal ℚ derivationLieQ) :
    (∀ a : (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))),
        ∃ c : ℚ, (a : Module.End ℚ ImO) = c • LinearMap.id) ∨
      IsSimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO := by
  apply Collapse.prime_split_dichotomy _ 7 (by norm_num) finrank_ImO
    (semisimpleModule_imRep_adjoin I)
  · sorry

end
end Phys.Algebra
