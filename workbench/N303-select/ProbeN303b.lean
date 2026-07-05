import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset

/-!  N303 de-risk probe B — the reverse leg kAB(slotC c) and the complex structure. -/

namespace Phys.Algebra.HJ.ProbeN303b

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

-- probe: kAB(slotC c). By innerMul_apply = jb (slotA u1)(jb (slotB 1)(slotC c)) - jb (slotB 1)(jb (slotA u1)(slotC c)).
-- jb (slotB 1)(slotC c) = slotA (1 * star c) = slotA (star c)   [jb_slotB_slotC b=1]
-- jb (slotA u1)(slotC c): slotA and slotC share index... jb_slotC_slotA a c = slotB (a*c). Need jb (slotA u1)(slotC c).
--   jb_comm then jb_slotC_slotA: jb (slotA u1)(slotC c) = jb (slotC c)(slotA u1) = slotB (u1 * c)
-- so innerMul = jb (slotA u1)(slotA (star c)) - jb (slotB 1)(slotB (u1*c))
--   jb (slotA u1)(slotA (star c)) — need general jb_slotA_slotA (both nontrivial). measure this.
-- Let me just try to compute the full reverse leg by the same idiom as famC_slotC.

-- First: is there a general jb_slotA_slotA? Test by attempting.
example (a c : O ℚ) : jb (slotA a) (slotA c) = Dg (reQ (star a * c) * 2) 0 0 → True := by
  intro _; trivial

-- Measure the ACTUAL complex-structure action-values via double innerMul unfolding.
-- famMixJ := ⁅famC, kAB⁆. famMixJ(slotC 1) should be (-4)•slotC u1.
-- This requires kAB(slotC 1) and famC(kAB(slotC 1)) etc — heavier. Measure cost of just stating.
set_option maxHeartbeats 400000 in
theorem famMixJ_slotC_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1)
      = (-4 : ℚ) • slotC (u1 : O ℚ) := by
  sorry

end Phys.Algebra.HJ.ProbeN303b
