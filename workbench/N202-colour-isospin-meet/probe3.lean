import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Module.LinearMap.Rat
import Mathlib.Tactic

open Phys.Cascade
namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def innerDerivQ (q : H ℚ) : Module.End ℚ (O ℚ) :=
  ((innerDeriv q).toAddMonoidHom).toRatLinearMap
theorem innerDerivQ_isDerivQ (q : H ℚ) (hq : star q = -q) : IsDerivQ (innerDerivQ q) := by
  intro x y
  show (innerDeriv q) (x * y) = (innerDeriv q) x * y + x * (innerDeriv q) y
  exact innerDeriv_isDeriv q hq x y
noncomputable def DI : derivationLieQ := ⟨innerDerivQ hI, innerDerivQ_isDerivQ hI hI_imag⟩
noncomputable def DJ : derivationLieQ := ⟨innerDerivQ hJ, innerDerivQ_isDerivQ hJ hJ_imag⟩
noncomputable def DK : derivationLieQ := ⟨innerDerivQ hK, innerDerivQ_isDerivQ hK hK_imag⟩
theorem DI_u1 : (DI : Module.End ℚ (O ℚ)) u1 = 0 := innerDeriv_hI_u1
theorem DJ_u1 : (DJ : Module.End ℚ (O ℚ)) u1 = iotaO (-(2:ℚ) • hK) := innerDeriv_hJ_u1
theorem DK_u1 : (DK : Module.End ℚ (O ℚ)) u1 = iotaO ((2:ℚ) • hJ) := by
  show (innerDeriv hK) u1 = iotaO ((2 : ℚ) • hJ)
  rw [innerDeriv_u1, adHom_apply, hK_hI, hI_hK]
  congr 1; show hJ - -hJ = (2 : ℚ) • hJ; module
theorem comb_u1 (a b c : ℚ) :
    ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1
      = iotaO ((-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) := by
  have hcoe : ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ))
      = a • (DI : Module.End ℚ (O ℚ)) + b • (DJ : Module.End ℚ (O ℚ))
        + c • (DK : Module.End ℚ (O ℚ)) := rfl
  rw [hcoe]
  simp only [LinearMap.add_apply, LinearMap.smul_apply, DI_u1, DJ_u1, DK_u1]
  rw [smul_zero, zero_add, ← map_smul, ← map_smul, ← map_add]
  congr 1; rw [smul_smul, smul_smul]; module

-- probe A: hJ, hK independence read off coordinates. hJ=⟨0,⟨1,0⟩⟩, hK=⟨0,⟨0,1⟩⟩.
-- x•hK + y•hJ = 0 ⟹ x=0 ∧ y=0
example (x y : ℚ) (h : x • hK + y • hJ = 0) : x = 0 ∧ y = 0 := by
  constructor
  · have := congrArg (fun w : H ℚ => w.im.im) h
    simpa [hK, hJ, hI, CD.iota, CD.e2, Dbl.J, Dbl.smul_re, Dbl.smul_im, cd_qsmul_re, cd_qsmul_im,
      CD.add_re, CD.add_im] using this
  · have := congrArg (fun w : H ℚ => w.im.re) h
    simpa [hK, hJ, hI, CD.iota, CD.e2, Dbl.J, Dbl.smul_re, Dbl.smul_im, cd_qsmul_re, cd_qsmul_im,
      CD.add_re, CD.add_im] using this

-- probe B: iotaO injective is banked
example (a b : H ℚ) (h : iotaO a = iotaO b) : a = b := iotaO_injective h
