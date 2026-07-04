import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Mathlib.Tactic

/- N292 crux de-risk 2: the slot-level actions of kAB = innerMul (slotA u1)(slotB 1).
   Measured (probe_closedform): kAB (slotB u1) = -slotA 1,  kAB (slotC 1) = 0.
   These + antisymmetry/bilinearity give the closure. Probe whether they reduce
   via banked slot lemmas (innerMul_slot_* / jb_slot* ) WITHOUT coordinate bash.
   We just STATE them as `example`s with `sorry` placeholder for the proof to check
   the STATEMENTS typecheck and the target shapes are right; then try a light tactic. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- What banked lemmas exist for innerMul applied to a slot? Check innerMul_apply reduction.
-- innerMul (slotA u1)(slotB 1) (slotB u1) = jb (slotA u1) (jb (slotB 1)(slotB u1))
--                                          - jb (slotB 1) (jb (slotA u1)(slotB u1))
example (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    innerMul (slotA u1) (slotB (1:O ℚ)) X
      = jb (slotA u1) (jb (slotB 1) X) - jb (slotB 1) (jb (slotA u1) X) :=
  innerMul_apply _ _ _

end Phys.Algebra.HJ
