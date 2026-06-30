import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Lie.Normalizer
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- The End ℚ equality, proved pointwise then lifted.
theorem bracket_DI_DJ_eq : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK := by
  apply Subtype.ext
  -- goal at End ℚ level
  show ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) = (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DI : Module.End ℚ (O ℚ)) * (DJ : Module.End ℚ (O ℚ))
        - (DJ : Module.End ℚ (O ℚ)) * (DI : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hK) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  -- now: DI(DJ z) - DJ(DI z) = (2:ℚ)•innerDerivQ hK z
  -- DI = innerDerivQ hI etc; innerDerivQ q w = innerDeriv q w
  show (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℚ) • (innerDeriv hK) z
  have hz : (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℤ) • (innerDeriv hK) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_ij
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz]
  -- (2:ℤ)•x = (2:ℚ)•x
  rw [show ((2:ℤ) • (innerDeriv hK) z) = (innerDeriv hK) z + (innerDeriv hK) z by
        rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hK) z) = (innerDeriv hK) z + (innerDeriv hK) z by
        rw [two_smul]]

end Phys.Algebra
