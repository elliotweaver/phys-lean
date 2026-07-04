import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/- N292 crux de-risk 3: prove the coset closure [kAB,kBC] = famB via the DIRECT slot route.
   kAB = innerMul (slotA u1)(slotB 1), kBC = innerMul (slotB u1)(slotC 1).
   The derivation-Jacobi route needs the mixed Leibniz [kAB, Lmul C] = Lmul (kAB C).
   Test: can we build that operator lemma from innerMul being a jb-derivation?
   Alternatively try the closed-form intermediate directly.

   FIRST: measure the mixed-Leibniz operator lemma. kAB is a Jordan derivation on Hermitian
   args (coupling_mem_derH3.2). L_C = Lmul C. We want ⁅kAB, Lmul C⁆ = Lmul (kAB C) for Herm C.
   Applied to Hermitian X: ⁅kAB,Lmul C⁆ X = kAB(jb C X) - jb C (kAB X) = jb (kAB C) X (Leibniz).
   That's EXACTLY the Leibniz law IF X is Hermitian. But operators act on ALL X...
   The full-op identity held numerically. Test the Leibniz-as-operators claim in Lean. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- Route A: does the mixed Leibniz hold as a LinearMap identity (all X)? Try to prove for
-- Hermitian A,B,C via the derivation Leibniz field. This may FAIL for non-Herm X.
-- We probe the SHAPE only. Use `sorry` to check the statement typechecks & measure the goal.
set_option maxHeartbeats 800000 in
example :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotB u1)⁆
      = Lmul ((innerMul (slotA u1) (slotB (1:O ℚ))) (slotB u1)) := by
  sorry

end Phys.Algebra.HJ
