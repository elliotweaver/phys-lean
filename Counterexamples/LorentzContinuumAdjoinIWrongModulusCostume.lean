import Phys.Algebra.LorentzContinuumAdjoinI

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C112): A BOGUS VALUE OF THE MODULUS-SQUARE AT THE HEART OF THE TRUNK-NATIVE
-- ARTIN–SCHREIER DEGREE-2 INPUT. N81 banks that the quadratic extension `Cut[i] = Cut[X]/(X²+1)`
-- of the derived ℝ `Cut` is a FIELD in which EVERY ELEMENT IS A SQUARE — and the whole
-- square-root construction rests on the MODULUS `cutiMod a b = √(a² + b²)` (the nonnegative
-- square root over `Cut`, N57 `cutSqrt`), whose DEFINING PROPERTY is `cutiMod a b · cutiMod a b
-- = a² + b²` (`cutiMod_sq`). The modulus is honest: for the concrete pair `a = 5`, `b = 12` the
-- genuine value of the square is `5² + 12² = 25 + 144 = 169` (so `cutiMod 5 12 = 13`). A BOGUS
-- claim that `cutiMod 5 12 · cutiMod 5 12 = 200` reduces, through the genuine `cutiMod_sq` + `Cut`
-- arithmetic, on the left to the genuine `169`, hence to the false numeric `169 = 200`, and MUST
-- FAIL to compile.
--   CORRECT: `cutiMod 5 12 · cutiMod 5 12 = 5² + 12² = 169`, NOT `200` — the modulus (on which the
--            Gaussian square-root formula `p = √((|z|+a)/2)`, `q = b/(2p)` and hence "every element
--            of `Cut[i]` is a square" is built) is computed correctly over the derived ℝ `Cut` via
--            the order-completeness square root `cutSqrt` (N57).
-- The bite is `169 = 200` (distinct from … C108 7=12, C109 9=13, C110 10−1=14, C111 17=40, and the
-- rest of the equality battery).

theorem adjoinI_wrong_modulus_BOGUS :
    cutiMod (5:Cut) 12 * cutiMod (5:Cut) 12 = (200:Cut) := by
  rw [show cutiMod (5:Cut) 12 * cutiMod (5:Cut) 12 = (169:Cut) from by
    rw [cutiMod_sq]; norm_num]

end

end Counterexamples
