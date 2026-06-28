import Phys.Algebra.LorentzContinuumGenerationSO8RankDropRestriction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- D1: THE ORTHOGONAL-AXIS-PRESERVING REFLECTION. octDeflate e w FIXES any axis e₀ Born-orthogonal
    to the bisector e−w. The reflection identity octRefl_reflect_imag at the unit bisector n: the
    m-line term vanishes because gFormC e₀ n = 0. -/
theorem octDeflate_fixes_orthogonal_axis {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    octDeflate e w ((0:Cut), (0:Cut), e₀) = ((0:Cut), (0:Cut), e₀) := by
  have hg : gFormC e₀ ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = 0 := by
    rw [gFormC_smul_right, hortho, mul_zero]
  unfold octDeflate
  rw [biMulLin_tx_apply, octRefl_reflect_imag (octBisector_imag he hw) he₀,
      octBisector_unit hne, hg, mul_zero, zero_smul, sub_zero, one_smul]

end

end Phys.Algebra
