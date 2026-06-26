import Phys.Algebra.LorentzContinuumGeneratedGroup

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C85): claiming the boost (time–space) block of the KAK / generated-group structure
-- carries the COMPACT CIRCLE invariant `a²+b²` instead of the NON-COMPACT HYPERBOLA invariant
-- `a²−b²`. The banked boost composition closes under the HYPERBOLA invariant: a boost `boostFunC a b`
-- preserves the Born form `QvC` IFF `a²−b² = 1` (N49 `boostC_isom`), and the boost-block form-change
-- factor is exactly `(a t+b x)²−(b t+a x)² = (a²−b²)(t²−x²)` (the time–space mirror of the space
-- block's circle closure `circParam_circle_mul`, C84). The WRONG `a²+b²` claim applies the COMPACT
-- ROTATION invariant (the wrong block: that is the spacelike circle invariant `c²+s²=1` of the
-- rotation generator, NOT the timelike hyperbola invariant of the boost) to the boost's time block:
--   WRONG:   (a t+b x)² − (b t+a x)² = (a²+b²)(t²−x²)
--   CORRECT: (a t+b x)² − (b t+a x)² = (a²−b²)(t²−x²)
-- The sign on the squared-parameter combination is EXACTLY what distinguishes the non-compact boost
-- block (timelike, `a²−b²`) from the compact rotation block (spacelike, `a²+b²` / `c²+s²`). Evaluated
-- at the concrete point a = b = 1, t = 1, x = 0:
--   WRONG LHS: (1·1 + 1·0)² − (1·1 + 1·0)² = 1² − 1² = 1 − 1 = 0.
--   WRONG RHS: (1² + 1²)·(1² − 0²) = 2·1 = 2.
-- So the WRONG claim reduces to the false numeric `0 = 2` and MUST FAIL to compile. (The CORRECT
-- hyperbola law gives LHS = 0 = (1−1)·1 = (1²−1²)·(1²−0²) = RHS, as `boostParam_hyp_mul` proves.)
theorem boost_block_wrong_invariant_BOGUS :
    (((1 : Cut)*1 + 1*0)^2 - ((1 : Cut)*1 + 1*0)^2)
      = ((1 : Cut)^2 + 1^2) * ((1 : Cut)^2 - 0^2) := by
  ring_nf

end

end Counterexamples
