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

theorem probe_ke2je2_e2_ortho : gFormC (ke2je2 : O Cut) (CD.e2 : O Cut) = 0 := by
  show reQC ((ke2je2 : O Cut) * star (CD.e2 : O Cut)) = 0
  rw [e2_imag, mul_neg (ke2je2 : O Cut) (CD.e2 : O Cut), reQC_neg]
  show -((ke2je2 : O Cut) * (CD.e2 : O Cut)).re.re.re = 0
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J, ke2je2]

theorem probe_ke2je2_je2_ortho : gFormC (ke2je2 : O Cut) (je2 : O Cut) = 0 := by
  show reQC ((ke2je2 : O Cut) * star (je2 : O Cut)) = 0
  rw [je2_imag, mul_neg (ke2je2 : O Cut) (je2 : O Cut), reQC_neg]
  show -((ke2je2 : O Cut) * (je2 : O Cut)).re.re.re = 0
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J, ke2je2]

theorem probe_ke2je2_ortho_bisector :
    gFormC (ke2je2 : O Cut) ((CD.e2 : O Cut) - (je2 : O Cut)) = 0 := by
  rw [sub_eq_add_neg, gFormC_add_right,
      show (-(je2 : O Cut)) = ((-1 : Cut) • (je2 : O Cut)) by simp,
      gFormC_smul_right, probe_ke2je2_e2_ortho, probe_ke2je2_je2_ortho]
  ring

theorem probe_witness :
    octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (ke2je2 : O Cut))
      = ((0:Cut), (0:Cut), (ke2je2 : O Cut)) :=
  octDeflate_fixes_orthogonal_axis e2_imag je2_imag ke2je2_imag
    probe_ke2je2_ortho_bisector octDeflate_witness_ne

theorem probe_witness_coord :
    (octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      ((0:Cut), (0:Cut), (ke2je2 : O Cut))).2.2 = (ke2je2 : O Cut) := by
  rw [probe_witness]

end

end Phys.Algebra
