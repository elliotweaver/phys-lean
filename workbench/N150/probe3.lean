import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

abbrev EXT := ExteriorAlgebra Cut STVC

-- chooseBasis index is a Fintype
example : Fintype (Module.Free.ChooseBasisIndex Cut STVC) := by infer_instance

-- the basis completeness identity: Σ_i (b.dualBasis i a) • b i = a
example (b : Module.Basis (Module.Free.ChooseBasisIndex Cut STVC) Cut STVC) (a : STVC) :
    (∑ i, (b.dualBasis i a) • b i) = a := by
  conv_rhs => rw [← b.sum_repr a]
  apply Finset.sum_congr rfl
  intro i _
  rw [Basis.dualBasis_apply]

-- the anticommute fact in EXT (polar 0 = 0)
example (a c : STVC) :
    ExteriorAlgebra.ι (R := Cut) a * ExteriorAlgebra.ι (R := Cut) c
      + ExteriorAlgebra.ι (R := Cut) c * ExteriorAlgebra.ι (R := Cut) a = 0 := by
  have := CliffordAlgebra.ι_mul_ι_add_swap (Q := (0 : QuadraticForm Cut STVC)) a c
  rw [QuadraticMap.polar] at this
  simpa using this

end

end Phys.Algebra
