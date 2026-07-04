import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- coset member kAB = innerMul (slotA u1)(slotB 1) ∈ derH3 (banked)
example : innerMul (slotA u1) (slotB (1:O ℚ)) ∈ derH3 := coupling_mem_derH3

-- coset member kBC = innerMul (slotB u1)(slotC 1) ∈ derH3 (slotB u1 = Xz 0 u1 0 Hermitian)
example : innerMul (slotB u1) (slotC (1:O ℚ)) ∈ derH3 :=
  innerMul_mem_derH3 (Xz_herm 0 u1 0) slotC_one_herm

-- coset member kCA = innerMul (slotC u1)(slotA 1) ∈ derH3
example : innerMul (slotC u1) (slotA (1:O ℚ)) ∈ derH3 :=
  innerMul_mem_derH3 (Xz_herm 0 0 u1) slotA_one_herm

end Phys.Algebra.HJ
