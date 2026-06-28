import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

abbrev EXT := ExteriorAlgebra Cut STVC

-- the chosen basis of STVC and its dual
abbrev IdxN := Module.Free.ChooseBasisIndex Cut STVC
abbrev bST : Module.Basis IdxN Cut STVC := Module.Free.chooseBasis Cut STVC

-- left multiplication by ι v in EXT
abbrev LmulE (v : STVC) : EXT →ₗ[Cut] EXT :=
  LinearMap.mulLeft Cut (ExteriorAlgebra.ι (R := Cut) v)

-- contraction by the i-th dual basis vector
abbrev CtrE (i : IdxN) : EXT →ₗ[Cut] EXT :=
  CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC)) (bST.dualBasis i)

-- THE NUMBER OPERATOR N = Σᵢ Lᵢ ∘ Cᵢ
noncomputable def numOp : EXT →ₗ[Cut] EXT :=
  ∑ i : IdxN, (LmulE (bST i)).comp (CtrE i)

-- basis completeness in vector form: Σᵢ (dualBasis i w) • bST i = w
theorem basis_complete (w : STVC) : (∑ i : IdxN, (bST.dualBasis i w) • bST i) = w := by
  conv_rhs => rw [← bST.sum_repr w]
  apply Finset.sum_congr rfl
  intro i _
  rw [bST.dualBasis_apply]

end

end Phys.Algebra
