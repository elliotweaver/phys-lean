import Phys.Foundation.ContinuumScalarDeriv2

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter
open scoped Topology BigOperators

noncomputable section

-- WRONG (costume C214): A BOGUS 2ND-ORDER POWER-SERIES DERIVATIVE CLAIM — "THE 2ND-ORDER DIFFERENCE
-- QUOTIENT RECOVERS THE WRONG COEFFICIENT / DOES NOT LAND AT THE QUADRATIC COEFFICIENT a₂".
-- N182 banks cut_powerseries_deriv2: for an entire Cut-valued series (∑ |a n| summable), the
-- SECOND-order difference quotient (t²)⁻¹·((∑' n, tⁿ·aₙ) − a₀ − t·a₁) tends to the QUADRATIC
-- coefficient a₂ as t → 0 in 𝓝[≠] 0 — the exact 2nd-order analog of cut_powerseries_deriv (N41g,
-- which recovers a₁ from t⁻¹·((∑' tⁿaₙ) − a₀)). The DEFINING 2nd-order content — the piece the
-- first-order tangent CANNOT express — is that the limit point is a₂ specifically, NOT a₀, NOT a₁.
-- The W8 witness wseq has DISTINCT low coefficients a₀ = 5, a₁ = 7, a₂ = 1: the 2nd-order quotient
-- genuinely recovers wseq 2 = 1 (the value cut_powerseries_deriv2 lands at), distinct from the 0th
-- coefficient 5 and the 1st coefficient 7, so the test genuinely exercises 2nd-order (not 0th/1st)
-- recovery.
--   THE BOGUS claim that the recovered quadratic coefficient wseq 2 (a stand-in for ANY wrong
-- 2nd-order claim: the quotient recovers the wrong coefficient / lands at the wrong order / the
-- 2nd derivative is mis-recovered) equals (182 : Cut) forces, after evaluating the genuine value
-- (which is exactly 1), the false numeric `(1 : Cut) = (182 : Cut)` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine recovered coefficient GENUINELY is 1
-- (the quadratic coefficient the 2nd-order difference quotient recovers), so claiming it is 182 is
-- genuinely FALSE (1 ≠ 182 in the derived ordered field Cut, characteristic 0).
--   The false numeric `1 = 182` is DISTINCT from the banked battery (… C211 4=179, C212 180=1,
-- C213 1=181).
--   PHYSICS-WORDS-REMOVABLE: there are NO physics words; delete "derivative"/"Taylor"/"flow" and the
-- quadratic coefficient wseq 2 of the entire series over the derived ordered field Cut equals 1;
-- claiming it equals 182 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- The W8 witness entire series with DISTINCT low coefficients `a₀ = 5`, `a₁ = 7`, `a₂ = 1` (finite
    support, hence `∑ |a n|` summable — an entire series), so the 2nd-order difference quotient of
    `cut_powerseries_deriv2` genuinely recovers `wseq 2 = 1`, distinct from `a₀` and `a₁`. -/
def wseq : ℕ → Cut := fun n => if n = 0 then 5 else if n = 1 then 7 else if n = 2 then 1 else 0

/-- BOGUS: the quadratic coefficient `wseq 2` — the value the 2nd-order difference quotient
    `cut_powerseries_deriv2` recovers for the witness entire series — equals `(182 : Cut)`. It
    GENUINELY equals `1` (the quadratic coefficient, distinct from `a₀ = 5` and `a₁ = 7`). The WRONG
    claim that it is `182` (the 2nd-order quotient recovers the wrong coefficient / lands at the wrong
    order / the 2nd derivative is mis-recovered) reduces to the false numeric `(1 : Cut) = (182 : Cut)`,
    so this must NOT compile. -/
theorem cut_powerseries_deriv2_wrong_value_BOGUS :
    wseq 2 = (182 : Cut) := by
  rw [show wseq 2 = (1 : Cut) from by norm_num [wseq]]

end

end Counterexamples
