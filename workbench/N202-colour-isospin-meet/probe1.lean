import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Module.LinearMap.Rat
import Mathlib.Tactic

open Phys.Cascade
namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- MAKE-OR-BREAK 1: realize innerDeriv q (ℤ-linear) as ℚ-linear Module.End ℚ (O ℚ).
noncomputable def innerDerivQ (q : H ℚ) : Module.End ℚ (O ℚ) :=
  ((innerDeriv q).toAddMonoidHom).toRatLinearMap

example (q : H ℚ) (z : O ℚ) : innerDerivQ q z = innerDeriv q z := rfl

-- MAKE-OR-BREAK 2: IsDerivQ from the banked ℤ-Leibniz innerDeriv_isDeriv
example (q : H ℚ) (hq : star q = -q) : IsDerivQ (innerDerivQ q) := by
  intro x y
  show (innerDeriv q) (x * y) = (innerDeriv q) x * y + x * (innerDeriv q) y
  exact innerDeriv_isDeriv q hq x y

-- MAKE-OR-BREAK 3: innerDeriv hK u1 = ιO(2•hJ)  [the new generator value]
example : (innerDeriv hK) u1 = iotaO ((2 : ℚ) • hJ) := by
  rw [innerDeriv_u1, adHom_apply, hK_hI, hI_hK]
  congr 1
  show hJ - -hJ = (2 : ℚ) • hJ
  module

#print axioms innerDerivQ
