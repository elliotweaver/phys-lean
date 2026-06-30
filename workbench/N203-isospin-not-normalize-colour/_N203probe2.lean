import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Lie.Normalizer
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Inspect how the subtype bracket on derivationLieQ coerces to End.
-- DI DJ DK : derivationLieQ.  ⁅DI, DJ⁆ : derivationLieQ.
-- struct_ij : ⁅innerDeriv hI, innerDeriv hJ⁆ = (2:ℤ)•innerDeriv hK   (in Module.End ℤ (O ℚ))
-- DI = ⟨innerDerivQ hI, _⟩ where innerDerivQ hI is the ℚ-linear version.

-- First: what does the subtype bracket coerce to?
example : ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
    = (DI : Module.End ℚ (O ℚ)) * (DJ : Module.End ℚ (O ℚ))
      - (DJ : Module.End ℚ (O ℚ)) * (DI : Module.End ℚ (O ℚ)) := rfl

-- Goal: bracket_DI_DJ_eq : ⁅DI, DJ⁆ = (2:ℚ)•DK in derivationLieQ.
-- Strategy: prove equality at the Module.End ℚ level then lift via Subtype.ext.
-- coercion of (2:ℚ)•DK to End is (2:ℚ)•(DK : End) = (2:ℚ)•innerDerivQ hK.
example : (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ))
    = (2:ℚ) • (innerDerivQ hK) := rfl

-- innerDerivQ q z = innerDeriv q z (defeq via innerDerivQ_apply rfl).
-- So we need: (innerDerivQ hI ∘ innerDerivQ hJ - innerDerivQ hJ ∘ innerDerivQ hI) = 2•innerDerivQ hK
-- pointwise this is struct_ij applied. Let's check via LinearMap.ext.

end Phys.Algebra
