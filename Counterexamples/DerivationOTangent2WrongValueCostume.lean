import Phys.Algebra.DerivationOTangent2

namespace Counterexamples

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- WRONG (costume C215): A BOGUS 2ND-ORDER MATRIX-EXPONENTIAL TANGENT CLAIM — "THE 2ND-ORDER TANGENT
-- OF expMap RECOVERS THE WRONG QUADRATIC COEFFICIENT / DOES NOT LAND AT ½•M²".
-- N183 banks expMap_smul_tangent2 / expO_tangent2: the SECOND-order difference quotient
-- (t²)⁻¹•(expMap(t•M) − 1 − t•M) tends to ½•M² = expTerm M 2 (the QUADRATIC coefficient), the genuine
-- 2nd-order data the FIRST-order tangent expMap_smul_tangent (N181, limit M) CANNOT express. The
-- DEFINING 2nd-order content — the piece the first-order tangent cannot see — is that the limit is the
-- QUADRATIC term ½•M² specifically.
--   The W8 witness cwM := single 0 1 1 + single 1 0 2 has SQUARE (cwM²)₀₀ = cwM₀₁·cwM₁₀ = 1·2 = 2, so
-- the genuine 2nd-order coefficient expTerm cwM 2 0 0 = ½·(cwM²)₀₀ = 1 — DISTINCT from the witness
-- FIRST-order coefficient cwM 0 0 = 0, so the test genuinely exercises 2nd-order (not 0th/1st)
-- recovery (a first-order-only tangent would read 0 here).
--   THE BOGUS claim that the recovered quadratic coefficient expTerm cwM 2 0 0 (a stand-in for ANY
-- wrong 2nd-order claim: the tangent recovers the wrong coefficient / lands at the wrong order / the
-- 2nd-order tangent is mis-recovered) equals (183 : Cut) forces, after evaluating the genuine value
-- (which is exactly 1, cwM_second_coeff), the false numeric `(1 : Cut) = (183 : Cut)` and must NOT
-- compile.
--   The bite is a true counterexample, not vacuous: the genuine recovered coefficient GENUINELY is 1
-- (the quadratic coefficient ½•(cwM²)₀₀ the 2nd-order difference quotient recovers), so claiming it is
-- 183 is genuinely FALSE (1 ≠ 183 in the derived ordered field Cut, characteristic 0).
--   The false numeric `1 = 183` is DISTINCT from the banked battery (… C212 180=1, C213 1=181,
-- C214 1=182).
--   PHYSICS-WORDS-REMOVABLE: there are NO physics words; delete "exp"/"derivation"/"tangent"/"flow"
-- and the quadratic coefficient expTerm cwM 2 0 0 = ½·(cwM²)₀₀ of the witness matrix over the derived
-- ordered field Cut equals 1; claiming it equals 183 forces the false numeric. The bite is a false
-- NUMERIC, name-independent.

/-- BOGUS: the witness quadratic coefficient `expTerm cwM 2 0 0` — the value the 2nd-order matrix
    tangent `expMap_smul_tangent2` recovers at entry `(0,0)` — equals `(183 : Cut)`. It GENUINELY
    equals `1` (`cwM_second_coeff`: `½·(cwM²)₀₀ = 1`, distinct from the first-order coefficient
    `cwM 0 0 = 0`). The WRONG claim that it is `183` (the 2nd-order tangent recovers the wrong
    coefficient / lands at the wrong order / the quadratic term is mis-recovered) reduces to the false
    numeric `(1 : Cut) = (183 : Cut)`, so this must NOT compile. -/
theorem expMap_tangent2_wrong_value_BOGUS :
    expTerm cwM 2 0 0 = (183 : Cut) := by
  rw [cwM_second_coeff]

end

end Counterexamples
