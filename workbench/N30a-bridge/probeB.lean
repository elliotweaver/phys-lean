import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- the double-restrict nondegeneracy, mirroring banked gBil_restrict_nondegenerate
theorem gImO_restrict_N_nondeg (N : Submodule ℚ ImO) :
    ((gBil.restrict ImO).restrict N).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm ((x : ImO) : O ℚ) ((x : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hx x
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))
  · intro y hy
    have h0 : gForm ((y : ImO) : O ℚ) ((y : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hy y
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))

-- the full complement, for a ℚ-subspace N of ↥ImO
example (N : Submodule ℚ ImO) :
    IsCompl N ((gBil.restrict ImO).orthogonal N) :=
  (gBil.restrict ImO).isCompl_orthogonal_of_restrict_nondegenerate
    ((gBil_restrict_symm ImO).isRefl) (gImO_restrict_N_nondeg N)

end
end Phys.Algebra
