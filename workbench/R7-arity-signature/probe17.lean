import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Mathlib.Algebra.Algebra.NonUnitalSubalgebra
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- Provide the two missing instances from the banked qsmul lemmas, under the GLOBAL instModuleQO.
noncomputable local instance oIsScalarTower : IsScalarTower ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_left]⟩

noncomputable local instance oSMulCommClass : SMulCommClass ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_right]⟩

-- Now can we form adjoin ℚ {a,b}?
example (a b : O ℚ) : True := by
  let S := NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ))
  trivial

-- And the induction principle available?
example (a b : O ℚ) (x : O ℚ) (hx : x ∈ NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ))) :
    x ∈ (⊤ : NonUnitalSubalgebra ℚ (O ℚ)) := trivial

end Phys.Algebra
