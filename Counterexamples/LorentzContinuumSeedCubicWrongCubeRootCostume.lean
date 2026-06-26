import Phys.Algebra.LorentzContinuumSeedCubic

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C106): A BOGUS CUBE-ROOT VALUE IN THE ODD-DEGREE ROOT ENGINE — the WRONG cube of the
-- cube root of `8`. N75 banks THE ODD-DEGREE ROOT ENGINE over the derived ℝ `Cut`: the cube root
-- `cutCbrt` with its defining property `cutCbrt_cube : 0 ≤ a → cutCbrt a * cutCbrt a * cutCbrt a = a`
-- (the IVT on `x ↦ x·x·x` riding the banked order-completeness, the degree-3 escalation of `cutSqrt`).
-- For `a = 8 ≥ 0` the genuine defining property gives `cutCbrt 8 * cutCbrt 8 * cutCbrt 8 = 8` (the
-- nonnegative cube root of `8` cubed returns `8`; concretely `cutCbrt 8 = 2`, `2·2·2 = 8`). A BOGUS
-- claim that the cube of `cutCbrt 8` is `27` (i.e. that the cube root of `8` were `3`) would reduce,
-- through the actual banked defining property `cutCbrt_cube` — on the left to the genuine cube `8` — to
-- the false numeric `8 = 27`, and MUST FAIL to compile.
--   CORRECT: the cube of the nonnegative cube root of `8` is `8` (the root is `2`, not `3`) — the
--            odd-degree root engine is honest, so the eigenvalue-existence lever it supplies at
--            dimension ≥ 3 (a genuine root of the characteristic cubic) is real, not a wrong value.
-- The bite is `8 = 27` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40, C104 25=11, C105 25=13).
theorem cutCbrt_eight_cube_wrong_BOGUS :
    cutCbrt (8:Cut) * cutCbrt (8:Cut) * cutCbrt (8:Cut) = (27:Cut) := by
  rw [cutCbrt_cube (show (0:Cut) ≤ 8 by norm_num)]

end

end Counterexamples
