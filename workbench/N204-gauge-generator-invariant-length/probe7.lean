import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable abbrev B := LieModule.traceForm ℚ derivationLieQ (O ℚ)

-- Stand-ins (proven in probe5/6) so probe7 can be checked standalone.
axiom traceForm_DI_DI : B DI DI = -16
axiom bracket_DI_DJ_eq' : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK   -- = N203 bracket_DI_DJ_eq
axiom bracket_DJ_DK_eq : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI
axiom bracket_DK_DI_eq : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ

-- invariance: B ⁅x,y⁆ z = B x ⁅y,z⁆ (Mathlib LieModule.traceForm_apply_lie_apply)
-- equinorm: B(DK,DK) from B(DI,DI).
-- 2•B(DK,DK) = B(2•DK, DK) = B(⁅DI,DJ⁆, DK) = B(DI, ⁅DJ,DK⁆) = B(DI, 2•DI) = 2•B(DI,DI)
example : B DK DK = -16 := by
  have key : B (⁅DI, DJ⁆ : derivationLieQ) DK = B DI (⁅DJ, DK⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DI DJ DK
  rw [bracket_DI_DJ_eq', bracket_DJ_DK_eq] at key
  -- key : B (2•DK) DK = B DI (2•DI)
  rw [LinearMap.map_smul₂, LinearMap.map_smul, traceForm_DI_DI] at key
  -- key : 2 • B DK DK = 2 • (-16)
  have : (2:ℚ) • B DK DK = (2:ℚ) • (-16 : ℚ) := key
  have h2 : B DK DK = -16 := by
    have := smul_right_injective ℚ (by norm_num : (2:ℚ) ≠ 0) this
    exact this
  exact h2

end Phys.Algebra
