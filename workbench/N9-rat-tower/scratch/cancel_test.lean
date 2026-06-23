import Phys.Foundation.IntegerTower
import Mathlib.Algebra.Ring.Defs
import Mathlib.Algebra.GroupWithZero.Defs
import Mathlib.Tactic

namespace Phys.Foundation
namespace Z

-- minimal stand-ins to test what synthesizes; assume NoZeroDivisors + Nontrivial banked
variable [NoZeroDivisors Z] [Nontrivial Z]

-- what fraction-field transitivity needs: cancellation by a nonzero element.
example (a b c : Z) (hb : b ≠ 0) (h : a * b = c * b) : a = c := mul_right_cancel₀ hb h
example (a b c : Z) (ha : a ≠ 0) (h : a * b = a * c) : b = c := mul_left_cancel₀ ha h
example : IsDomain Z := inferInstance

end Z
end Phys.Foundation
