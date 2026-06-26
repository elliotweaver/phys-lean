import Phys.Algebra.LorentzContinuumPolar

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C87): claiming the continuum Born self-overlap form `gFormC v v` is INDEFINITE
-- — a DIFFERENCE of coordinate squares (like the indefinite Minkowski time–space block
-- `t² − x²`) — rather than POSITIVE-DEFINITE — the SUM of the coordinate squares. The banked
-- structural heart (`gFormC_sumOfSquares`) is
--   CORRECT (positive-definite):  gFormC v v = Σ (coordinate)²   [a SUM of squares, ≥ 0]
-- which is exactly why the Born self-overlap is nonnegative (`gFormC_nonneg`) and positive-definite
-- (`gFormC_eq_zero_iff`), forcing the NINE space directions to be negative-definite in `QvC`
-- (the `−9` of the (1,9) signature). The WRONG claim treats two space coordinates with the OPPOSITE
-- sign — a difference `a² − b²`, the indefinite signature of the TIME–space block, misapplied to
-- the purely spacelike self-overlap:
--   WRONG (indefinite):           gFormC v v "=" a² − b²          [a DIFFERENCE, can be < 0]
-- The sign of the second square is EXACTLY what distinguishes the positive-definite spacelike Born
-- self-overlap (which the polar/reverse decomposition's positive part rests on) from the indefinite
-- Minkowski block. Evaluated at the concrete coordinates a = 3, b = 1:
--   CORRECT sum-of-squares:  3² + 1² = 9 + 1 = 10.
--   WRONG   difference:      3² − 1² = 9 − 1 = 8.
-- So the WRONG indefinite claim reduces to the false numeric `10 = 8` and MUST FAIL to compile.
-- (The CORRECT positive-definite form gives 10 = 10, as `gFormC_sumOfSquares` + `positivity` prove.)
theorem gFormC_indefinite_wrong_sign_BOGUS :
    (3 : Cut) ^ 2 + (1 : Cut) ^ 2 = (3 : Cut) ^ 2 - (1 : Cut) ^ 2 := by
  ring_nf

end

end Counterexamples
