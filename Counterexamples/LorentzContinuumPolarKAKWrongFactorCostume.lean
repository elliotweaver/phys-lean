import Phys.Algebra.LorentzContinuumPolarKAK

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C97): A BOGUS POLAR POSITIVE FACTOR (wrong operator square root). The concrete
-- polar composite `g = R∘B` with `B = boostC (5/3)(4/3)` has positive operator `g*∘g = boostC 5 4`
-- on the integer slice — and the genuine polar positive part `exp(p) = √(g*g)` is `boostC 2 1`
-- (since `(boostC 2 1)² = boostC (2²+1²)(2·2·1) = boostC 5 4` by `boostC_sq`, and at the `uP`
-- eigenblock `boostC 2 1` reads eigenvalue `2+1 = 3`, whose square `9` is the `uP` reading of the
-- positive operator `boostC 5 4`). A BOGUS polar decomposition that read the positive factor as
-- `boostC 4 1` (`uP` eigenvalue `4+1 = 5`) would claim `(boostC 4 1)² = boostC 5 4` as operators;
-- reading the `uP` eigenblock of both sides via the banked `boostC_sq`/`boostC_uP_read` gives, on
-- the left, the squared eigenvalue `(4+1)² = 25`, and on the right the genuine reading `9`. So the
-- BOGUS polar positive factor reduces, through the actual banked definitions, to the false numeric
-- `25 = 9` and MUST FAIL to compile.
--   CORRECT: `boostC 2 1` is the positive operator square root of `boostC 5 4` (`uP` eigenvalue 3,
--            squared reading 9 = the `uP` reading of `boostC 5 4`).
-- The bite is `25 = 9` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30).
theorem polG_wrong_positive_factor_BOGUS :
    EvC (((boostC (4:Cut) 1).comp (boostC (4:Cut) 1)) uP) uP
      = EvC ((boostC (5:Cut) 4) uP) uP := by
  rw [show EvC (((boostC (4:Cut) 1).comp (boostC (4:Cut) 1)) uP) uP = 25 from by
        rw [boostC_sq, boostC_uP_read]; norm_num,
      show EvC ((boostC (5:Cut) 4) uP) uP = 9 from by rw [boostC_uP_read]; norm_num]

end

end Counterexamples
