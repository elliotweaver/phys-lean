import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- W9 MEASURE: does isotypic_prime_split instantiate at the CONCRETE A_I when the semisimple
-- instance is supplied explicitly from the banked bridge? The dichotomy is stubbed with sorry;
-- we only test whether the APPLICATION elaborates (typeclass synthesis) within budget.
example (I : LieIdeal ℚ derivationLieQ) :
    ∃ (n : ℕ) (S : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO),
      IsSimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) S ∧
      Nonempty (ImO ≃ₗ[Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))] (Fin n → S)) ∧
      ((n = 7 ∧ Module.finrank ℚ S = 1) ∨ (n = 1 ∧ Module.finrank ℚ S = 7)) := by
  haveI hss : IsSemisimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO :=
    semisimpleModule_imRep_adjoin I
  apply Collapse.isotypic_prime_split _ 7 (by norm_num) finrank_ImO hss
  · sorry

end
end Phys.Algebra
