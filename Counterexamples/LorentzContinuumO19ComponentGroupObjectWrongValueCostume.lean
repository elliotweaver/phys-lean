import Phys.Algebra.LorentzContinuumO19ComponentGroupObject

namespace Counterexamples

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C211): A BOGUS COMPONENT-GROUP-ORDER CLAIM — "THE DISCRETE COMPONENT GROUP
-- OF THE FULL INDEFINITE ORTHOGONAL GROUP O(1,9) (the π₀(O(1,9)) object) HAS AN ORDER OTHER
-- THAN 4 / DOES NOT HAVE EXACTLY FOUR COMPONENTS".
-- N179 banks the ABSTRACT GROUP OBJECT of the O(1,9) discrete component group o19Comp: the four
-- discrete reflections {1, parityUnit, timeRevUnit, ptUnit} lifted to units of Module.End Cut STVC
-- form a Subgroup with Nat.card ↥o19Comp = 4 (o19Comp_natCard_eq_four), Monoid.exponent ↥o19Comp = 2
-- (o19Comp_monoidExponent_eq_two), the abstract Klein-four class IsKleinFour (o19Comp_isKleinFour),
-- the non-cyclic fingerprint, and the abstract iso to ℤ/2 × ℤ/2. The DEFINING content — what makes
-- π₀(O(1,9)) genuinely the Klein four-group and not a triviality — is that the four discrete
-- reflections are PAIRWISE DISTINCT, so the component count is GENUINELY 4 (the ncard of the
-- four-element carrier, closed by the banked distinctness facts transported from
-- fullO19_components_distinct N173).
--   THE BOGUS claim that the component-group order Nat.card ↥o19Comp (a stand-in for ANY wrong
-- π₀ count: the component group has 179 elements / the four components are miscounted) equals 179
-- forces, after evaluating the genuine order (which is exactly 4 = the count of four distinct
-- components), the false numeric `(4 : ℕ) = (179 : ℕ)` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine component count is 4
-- (o19Comp_natCard_eq_four GENUINELY computes the ncard of the four pairwise-distinct reflections),
-- so claiming π₀ has 179 elements is genuinely FALSE (4 ≠ 179 in ℕ).
--   The false numeric `4 = 179` is DISTINCT from the banked battery (… C208 1=176, C209 177=1,
-- C210 4=1).
--   PHYSICS-WORDS-REMOVABLE: there are NO physics words; delete "Lorentz"/"O(1,9)"/"component"/
-- "π₀"/"reflection"/"orthogonal" and the order of the abstract group object Nat.card ↥o19Comp
-- equals 4; claiming it equals 179 forces the false numeric. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the order of the abstract component-group object `Nat.card ↥o19Comp` — which the N179
    cardinality theorem `o19Comp_natCard_eq_four` GENUINELY computes to be `4` (the count of the four
    pairwise-distinct discrete reflections `{1, parityUnit, timeRevUnit, ptUnit}` of `O(1,9)`) —
    equals `179` (a miscounted π₀). It GENUINELY equals `4`. The WRONG claim that it is `179`
    reduces to the false numeric `(4 : ℕ) = (179 : ℕ)`, so this must NOT compile. -/
theorem o19Comp_order_wrong_value_BOGUS :
    Nat.card ↥o19Comp = 179 := by
  rw [o19Comp_natCard_eq_four]

end

end Counterexamples
