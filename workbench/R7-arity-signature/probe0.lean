import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationFinrank
import Mathlib.Algebra.Algebra.NonUnitalSubalgebra
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- PROBE 1: third-slot associator linearity (need for full trilinearity)
theorem probe_assoc_add_right (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel

theorem probe_assoc_smul_right (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]

-- PROBE 2: Teichmüller identity (free, additive-only, NO associativity)
-- [wx,y,z] = [w,xy,z] − [w,x,yz] + w·[x,y,z] + [w,x,y]·z
theorem probe_teichmuller (w x y z : O ℚ) :
    assoc (w * x) y z
      = assoc w (x * y) z - assoc w x (y * z) + w * assoc x y z + assoc w x y * z := by
  simp only [assoc, mul_sub, sub_mul, add_mul_na, mul_add_na]
  abel

-- PROBE 3: does NonUnitalAlgebra.adjoin typecheck on O ℚ?
noncomputable def probe_adjoin (a b : O ℚ) : NonUnitalSubalgebra ℚ (O ℚ) :=
  NonUnitalAlgebra.adjoin ℚ {a, b}

end Phys.Algebra
