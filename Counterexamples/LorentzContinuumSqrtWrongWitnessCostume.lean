import Phys.Algebra.LorentzContinuumSqrt

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- WRONG (costume C88): claiming the WRONG nonnegative square root over the derived ℝ `Cut`.
-- The banked positive-definite square root `cutSqrt` is characterized by `cutSqrt a · cutSqrt a
-- = a` for `a ≥ 0` (`cutSqrt_sq`) and pinned uniquely on the nonnegative branch (`sq_nonneg_inj`/
-- `cutSqrt_unique`), so at the concrete value `4` the ONLY nonnegative root is `2`
-- (`cutSqrt_four_eq_two : cutSqrt 4 = 2`, since `2 · 2 = 4` and `0 ≤ 2`).
--   CORRECT:  cutSqrt 4 = 2,  and indeed  2 · 2 = 4.
-- The WRONG claim asserts a DIFFERENT nonnegative witness — `3` — as the square root of `4`,
-- i.e. that `3` (a perfectly good nonnegative element) satisfies the defining square-root identity
-- `3 · 3 = 4`. That is exactly the failure mode a sloppy polar/KAK "boost part" extraction would
-- commit: pulling out a positive factor whose square is NOT the form-adjoint composite. By the
-- defining property, the WRONG witness forces its square to equal the radicand:
--   WRONG:    "cutSqrt 4 = 3"  ⟹  3 · 3 = 4   (via cutSqrt_sq),  i.e.  9 = 4.
-- So the WRONG square-root claim reduces to the false numeric `9 = 4` and MUST FAIL to compile.
-- (The CORRECT witness gives `2 · 2 = 4`, i.e. `4 = 4`, as `cutSqrt_four_eq_two` + `cutSqrt_sq`
-- prove.) The bite is the squared value `9 = 4` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`,
-- C87 `10=8`).
theorem cutSqrt_four_wrong_witness_BOGUS :
    (3 : Cut) * (3 : Cut) = (4 : Cut) := by
  ring_nf

end

end Counterexamples
