import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable abbrev B := LieModule.traceForm ℚ derivationLieQ (O ℚ)

-- The two missing cyclic bracket lifts (copy N203 bracket_DI_DJ_eq shape; struct_jk/struct_ki banked).
theorem bracket_DJ_DK_eq : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI := by
  apply Subtype.ext
  show ((⁅DJ, DK⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (((2:ℚ) • DI : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DJ, DK⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DJ : Module.End ℚ (O ℚ)) * (DK : Module.End ℚ (O ℚ))
        - (DK : Module.End ℚ (O ℚ)) * (DJ : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DI : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hI) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  show (innerDeriv (hJ:H ℚ)) ((innerDeriv hK) z) - (innerDeriv hK) ((innerDeriv hJ) z)
      = (2:ℚ) • (innerDeriv hI) z
  have hz : (innerDeriv (hJ:H ℚ)) ((innerDeriv hK) z) - (innerDeriv hK) ((innerDeriv hJ) z)
      = (2:ℤ) • (innerDeriv hI) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_jk
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz, show ((2:ℤ) • (innerDeriv hI) z) = (innerDeriv hI) z + (innerDeriv hI) z by rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hI) z) = (innerDeriv hI) z + (innerDeriv hI) z by rw [two_smul]]

theorem bracket_DK_DI_eq : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ := by
  apply Subtype.ext
  show ((⁅DK, DI⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (((2:ℚ) • DJ : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DK, DI⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DK : Module.End ℚ (O ℚ)) * (DI : Module.End ℚ (O ℚ))
        - (DI : Module.End ℚ (O ℚ)) * (DK : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DJ : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hJ) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  show (innerDeriv (hK:H ℚ)) ((innerDeriv hI) z) - (innerDeriv hI) ((innerDeriv hK) z)
      = (2:ℚ) • (innerDeriv hJ) z
  have hz : (innerDeriv (hK:H ℚ)) ((innerDeriv hI) z) - (innerDeriv hI) ((innerDeriv hK) z)
      = (2:ℤ) • (innerDeriv hJ) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_ki
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz, show ((2:ℤ) • (innerDeriv hJ) z) = (innerDeriv hJ) z + (innerDeriv hJ) z by rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hJ) z) = (innerDeriv hJ) z + (innerDeriv hJ) z by rw [two_smul]]

#print axioms bracket_DJ_DK_eq
#print axioms bracket_DK_DI_eq

end Phys.Algebra
