import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable abbrev B := LieModule.traceForm ℚ derivationLieQ (O ℚ)

axiom bracket_DJ_DK_eq : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI
axiom bracket_DK_DI_eq : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ
axiom bracket_DI_DJ_eq' : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK

-- Orthogonality: B(DI,DJ) = 0.
-- 2•B(DI,DJ) = B(DI, 2•DJ) = B(DI, ⁅DK,DI⁆) = B(⁅DI,DK⁆, DI) = B(-2•DJ, DI) = -2•B(DJ,DI) = -2•B(DI,DJ)
-- (using B symmetric). So 4•B(DI,DJ)=0 ⟹ B(DI,DJ)=0.
example : B DI DJ = 0 := by
  -- invariance applied to (DI, DK, DI): B ⁅DI,DK⁆ DI = B DI ⁅DK,DI⁆
  have key : B (⁅DI, DK⁆ : derivationLieQ) DI = B DI (⁅DK, DI⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DI DK DI
  -- ⁅DI,DK⁆ = -⁅DK,DI⁆ = -(2•DJ)
  have hIK : (⁅DI, DK⁆ : derivationLieQ) = -(2:ℚ) • DJ := by
    rw [← neg_neg (⁅DI, DK⁆ : derivationLieQ), lie_skew, bracket_DK_DI_eq, neg_smul]
  rw [hIK, bracket_DK_DI_eq] at key
  -- key : B (-2•DJ) DI = B DI (2•DJ)
  rw [LinearMap.map_smul₂, LinearMap.map_smul] at key
  -- key : (-2) • B DJ DI = 2 • B DI DJ
  rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DJ DI] at key
  -- key : (-2) • B DI DJ = 2 • B DI DJ
  have : (-2:ℚ) • B DI DJ = (2:ℚ) • B DI DJ := key
  simp only [smul_eq_mul] at this
  linarith [this]

end Phys.Algebra
