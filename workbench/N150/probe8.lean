import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

abbrev EXT := ExteriorAlgebra Cut STVC
abbrev IdxN := Module.Free.ChooseBasisIndex Cut STVC
noncomputable abbrev bST : Module.Basis IdxN Cut STVC := Module.Free.chooseBasis Cut STVC

local notation "ιe" => ExteriorAlgebra.ι (R := Cut)
local notation "ctr" => CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC))

noncomputable def numOp : EXT →ₗ[Cut] EXT :=
  ∑ i : IdxN, (LinearMap.mulLeft Cut (ιe (bST i))).comp (ctr (bST.dualBasis i))

theorem numOp_apply (x : EXT) :
    numOp x = ∑ i : IdxN, ιe (bST i) * (ctr (bST.dualBasis i) x) := by
  simp only [numOp, LinearMap.coe_sum, Finset.sum_apply, LinearMap.comp_apply,
    LinearMap.mulLeft_apply]

-- numOp kills scalars
theorem numOp_algebraMap (r : Cut) : numOp (algebraMap Cut EXT r) = 0 := by
  rw [numOp_apply]
  apply Finset.sum_eq_zero
  intro i _
  rw [CliffordAlgebra.contractLeft_algebraMap, mul_zero]

-- grade 0 = scalars? check the Mathlib characterization
example : (⋀[Cut]^0 STVC : Submodule Cut EXT) = (1 : Submodule Cut EXT) := by
  exact?

end

end Phys.Algebra
