import Phys.Algebra.LorentzContinuumGivensWordExhaustion

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C189): A BOGUS GROUP-CONSTRAINED PATH-COMPONENT (JoinedIdQvC) / NON-VACUITY /
-- NON-VACUOUS-GENERAL-AXIS-BASE-CASE / GIVENS-WORD READ-OFF — "THE GROUP-CONSTRAINED PATH COMPONENT
-- JoinedIdQvC DOES NOT GENUINELY CONSTRAIN ITS ELEMENT TO BE AN ISOMETRY (so the non-vacuity
-- joinedIdQvC_isQvIsomC is empty), the unit-axis quarter-turn is NOT a genuine non-trivial isometry
-- in the path component, and the non-vacuous general-axis base case joinedIdQvC_axisRotLin / the
-- Givens-word joinedIdQvC_axisRotProd do not assemble".
-- N157 banks the GROUP-CONSTRAINED path-component engine JoinedIdQvC (the NON-VACUOUS repair of the
-- N155 JoinedIdC predicate, which the convex operator segment shows is satisfied by EVERY operator,
-- joinedIdC_everything): JoinedIdQvC g requires the WHOLE connecting set to consist of QvC-isometries,
-- so joinedIdQvC_isQvIsomC genuinely forces g to preserve QvC. The W8 NON-VACUITY anchor: the
-- unit-axis quarter-turn axisRotLin e₂ 0 1 is JoinedIdQvC (joinedIdQvC_axisRotLin_quarterTurn, needs
-- the unit axis e2_gFormC_self) and GENUINELY moves the x-axis unit vector: applied to (0,1,0), the
-- e₂-overlap of the moved v-block reads
--   gFormC ((axisRotLin e₂ 0 1 (0,1,0)).2.2) e₂ = gFormC (1•e₂) e₂ = 1·gFormC e₂ e₂ = 1
-- (the quarter-turn rotates the x-axis into the e₂ octonion slot with coefficient 1). A genuine
-- non-trivial isometry in the group-constrained path component, not the identity, not vacuous.
--   THE BOGUS claim that this quarter-turn e₂-slot read-off reads 157 (a stand-in for ANY wrong
-- JoinedIdQvC / non-vacuity / non-vacuous-base-case / Givens-word value: JoinedIdQvC fails to
-- constrain to the group / the quarter-turn is not a genuine isometry / the non-vacuous base case
-- fails / the Givens-word does not assemble) forces, after rewriting by the genuine value, the false
-- numeric `(1 : Cut) = 157` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the unit-axis quarter-turn GENUINELY reads 1 on
-- the moved e₂ slot (a banked read-off over the derived field Cut), so the claim of 157 is genuinely
-- FALSE (1 ≠ 157 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 157` is DISTINCT from the banked battery (… C185 1=153, C186 1=154,
-- C187 1=155, C188 1=156).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/Givens/axis/quarter-turn/isometry/compact/
-- word/path-connected/topology/JoinedIdQvC/non-vacuous/Cayley/circle/SO(1,9)/SO(9)/Spin/octonion":
-- over the derived complete ordered field Cut, the linear operator axisRotLin e₂ 0 1 applied to
-- (0,1,0) has third-coordinate-block whose gFormC-overlap with e₂ is 1; claiming it equals 157
-- forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the unit-axis quarter-turn `axisRotLin e₂ 0 1` (the W8 element of the group-constrained
    path component `JoinedIdQvC`, `joinedIdQvC_axisRotLin_quarterTurn`) applied to `(0,1,0)` has a
    moved `v`-block whose `e₂`-overlap is `157`. It GENUINELY equals `1` (the quarter-turn rotates
    the x-axis into the `e₂` octonion slot with coefficient `1`, `axisRotLin_quarterTurn_e2_read`).
    The WRONG claim that it is `157` (JoinedIdQvC fails to constrain to the isometry group / the
    quarter-turn is not a genuine non-trivial isometry / the non-vacuous general-axis base case
    fails / the Givens-word does not assemble) reduces, after rewriting by the genuine value, to the
    false numeric `(1 : Cut) = 157`, so this must NOT compile. -/
theorem joinedIdQvC_givens_wrong_value_BOGUS :
    gFormC ((axisRotLin (CD.e2 : O Cut) (0:Cut) 1 ((0:Cut), (1:Cut), (0:O Cut))).2.2)
      (CD.e2 : O Cut) = (157 : Cut) := by
  rw [axisRotLin_quarterTurn_e2_read]

end

end Counterexamples
