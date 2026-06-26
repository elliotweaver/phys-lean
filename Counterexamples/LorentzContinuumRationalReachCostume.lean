import Phys.Algebra.LorentzContinuum

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

-- WRONG (costume C80): claiming that the RATIONAL boost generators ALONE reach the CONTINUUM —
-- specifically that the IRRATIONAL continuum boost `(3√2/4, √2/4)` (a genuine isometry of the
-- continuum Born form over the DERIVED ℝ, `irrBoost_isom`) is EQUAL to a boost with derived-RATIONAL
-- parameters `Qcut a`, `Qcut b` (here witnessed by the rationals `0, 0`). This is the FALSE
-- surjectivity claim: that the rational cover (N48 `spinorCoverMonoid`, whose boosts have rational
-- parameters) reaches the continuous isometry component WITHOUT the derived ℝ. It is FALSE — the
-- banked `continuum_strictly_extends_rational` proves the irrational boost is NOT equal to ANY
-- rational-parameter boost (its space component `√2/4` is not in the image of `Qcut`,
-- `sqrt2_quarter_not_rational`), so reaching the continuous group genuinely REQUIRES the derived ℝ.
-- The `rfl` witness for the (false) equality `boostFunC (3√2/4) (√2/4) = boostFunC (Qcut 0) (Qcut 0)`
-- cannot type-check (`3√2/4 ≠ Qcut 0 = 0`). Must FAIL to compile.
theorem rational_boosts_reach_continuum_BOGUS :
    ∃ a b : Q, boostFunC ((3 * sqrt2)/4) (sqrt2/4) = boostFunC (Qcut a) (Qcut b) :=
  ⟨0, 0, rfl⟩

end Counterexamples
