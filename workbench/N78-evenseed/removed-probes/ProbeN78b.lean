import Phys.Algebra.LorentzContinuumRealClosed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

-- the single-factor bridge: aeval g of a monic quadratic = the operator-quadratic
example (g : Module.End Cut STVC) (b c : Cut) :
    (aeval g) (X^2 + C b * X + C c) = g*g + b•g + c•(1:Module.End Cut STVC) := by
  rw [map_add, map_add, map_mul, map_pow, aeval_X, aeval_C, aeval_C,
      Module.algebraMap_end_eq_smul_id, Module.algebraMap_end_eq_smul_id]
  simp only [sq, smul_mul_assoc, LinearMap.id_comp, Module.End.mul_eq_comp,
    Module.End.one_eq_id]

end

end Phys.Algebra
