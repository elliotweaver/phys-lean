import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- bornBil is symmetric (banked gForm_symm)
theorem bornBil_isSymm : (bornBil).IsSymm := by
  intro x y
  simp only [bornBil_apply, RingHom.id_apply]
  exact gForm_symm (x : O ℚ) (y : O ℚ)

-- bornBil is nondegenerate (banked Born anisotropy gForm_self_eq_zero)
theorem bornBil_nondegenerate : (bornBil).Nondegenerate := by
  intro x hx
  have hxx : gForm (x : O ℚ) (x : O ℚ) = 0 := by
    have := hx x; simpa [bornBil_apply] using this
  exact Subtype.ext (gForm_self_eq_zero.mp hxx)

-- finrank so(7) ≤ 21 (banked N28 so(n)-bound at the 7-dim Born form)
theorem finrank_so7_le :
    Module.finrank ℚ (bornBil).skewAdjointSubmodule ≤ 21 := by
  have h := finrank_skewAdjoint_le_choose bornBil bornBil_isSymm bornBil_nondegenerate
  rw [show Module.finrank ℚ ImO = 7 from finrank_ImO] at h
  simpa using h

#check @finrank_so7_le

end
end Phys.Algebra
