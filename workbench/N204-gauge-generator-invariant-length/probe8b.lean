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

-- check lie_skew direction
example : (⁅DI, DK⁆ : derivationLieQ) = -(2:ℚ) • DJ := by
  have h : (⁅DI, DK⁆ : derivationLieQ) = -(⁅DK, DI⁆ : derivationLieQ) := by
    rw [← lie_skew DI DK]  -- lie_skew DI DK : -⁅DI,DK⁆ = ⁅DK,DI⁆ ; so ⁅DK,DI⁆ rewrites... try
  sorry

-- simpler: -⁅DK,DI⁆ = ⁅DI,DK⁆ is `lie_skew`. So ⁅DI,DK⁆ = -⁅DK,DI⁆.
example : (⁅DI, DK⁆ : derivationLieQ) = -(2:ℚ) • DJ := by
  rw [← neg_neg (⁅DI, DK⁆ : derivationLieQ), lie_skew, bracket_DK_DI_eq, neg_smul]

end Phys.Algebra
