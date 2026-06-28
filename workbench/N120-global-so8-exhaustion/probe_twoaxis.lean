import Phys.Algebra.LorentzContinuumGenerationSO8RankDropRestriction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem octDeflate_fixes_orthogonal_axis {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    octDeflate e w ((0:Cut), (0:Cut), e₀) = ((0:Cut), (0:Cut), e₀) := by
  have hg : gFormC e₀ ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = 0 := by
    rw [gFormC_smul_right, hortho, mul_zero]
  unfold octDeflate
  rw [biMulLin_tx_apply, octRefl_reflect_imag (octBisector_imag he hw) he₀,
      octBisector_unit hne, hg, mul_zero, zero_smul, sub_zero, one_smul]

/-- THE TWO-AXIS DEFLATION STEP. T moves axis e→w (T(0,0,e)=(0,0,w)) and the deflated operator
    R₁·T = octDeflate e w · T moves a SECOND axis e'→w' ((R₁·T)(0,0,e')=(0,0,w')), where e' is
    ORTHOGONAL to the first bisector (gFormC e' (e−w)=0, so R₁ fixes (0,0,e')) AND e is orthogonal
    to the SECOND bisector (gFormC e (e'−w')=0, so R₂=octDeflate e' w' fixes (0,0,e)). Then the
    two-reflection composite R₂·R₁·T fixes BOTH (0,0,e) and (0,0,e'). -/
theorem octDeflate_two_axis_step {T : Module.End Cut STVC}
    {e w e' w' : O Cut}
    (he : star e = -e) (hw : star w = -w) (he' : star e' = -e') (hw' : star w' = -w')
    (hee : gFormC e e = 1) (hww : gFormC w w = 1) (hee' : gFormC e' e' = 1) (hww' : gFormC w' w' = 1)
    (hTe : T ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), w))
    (hne : e - w ≠ 0) (hne' : e' - w' ≠ 0)
    (he'ortho : gFormC e' (e - w) = 0)
    (heortho : gFormC e (e' - w') = 0)
    (hRTe' : (octDeflate e w * T) ((0:Cut), (0:Cut), e') = ((0:Cut), (0:Cut), w')) :
    (octDeflate e' w' * (octDeflate e w * T)) ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), e) ∧
    (octDeflate e' w' * (octDeflate e w * T)) ((0:Cut), (0:Cut), e') = ((0:Cut), (0:Cut), e') := by
  constructor
  · -- first axis e: R₁·T fixes e (octDeflate_step), then R₂ fixes e (orthogonal)
    rw [Module.End.mul_apply, octDeflate_step he hw hee hww hTe hne,
        octDeflate_fixes_orthogonal_axis he' hw' he heortho hne']
  · -- second axis e': R₂·(R₁·T) fixes e' (octDeflate_step on R₁·T)
    exact octDeflate_step he' hw' hee' hww' hRTe' hne'

end

end Phys.Algebra
