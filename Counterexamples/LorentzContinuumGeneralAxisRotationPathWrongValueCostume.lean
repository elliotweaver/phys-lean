import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C188): A BOGUS GENERAL-AXIS GIVENS / BASE-CASE / GIVENS-WORD / HALF-TURN /
-- SO(9)-EXHAUSTION / FULL-PATH-CONNECTEDNESS READ-OFF — "THE GENERAL-AXIS LEVER DOES NOT GENUINELY
-- REACH THE ANTIPODE HALF-TURN AT A GENERAL AXIS (so the general-axis base case joinedIdC_axisRotLin
-- fails, the Givens-word joinedIdC_axisRotProd does not assemble, the general-axis half-turn
-- axisRotLin e (-1) 0 — outside the single Cayley chart 1+(-1)=0 — is NOT reached as the product of
-- two general-axis quarter-turns, and the refined conditional full SO⁺(1,9) path-connectedness
-- bvIsom_joinedIdC_of_axisRotWord fails)".
-- N156 banks the general-axis rotation path axisRotPath e m := axisRotLin e (cayleyC m)(cayleyS m)
-- (continuous in endOpC, starts at 1, reaches an arbitrary general-axis rotation off the antipode),
-- the GENERAL-AXIS base case joinedIdC_axisRotLin (every Givens rotation axisRotLin e c s is
-- JoinedIdC, generalizing N155's real-axis-only joinedIdC_planeRotLin to ANY unit octonion axis),
-- the Givens-word joinedIdC_axisRotProd, the refined conditional full path-connectedness, and the W8
-- NON-VACUITY anchor: the GENERAL-AXIS antipode half-turn axisRotLin e (-1) 0 — NOT reachable by the
-- single Cayley chart (halfTurn_antipode_not_cayley: 1+(-1)=0) — IS JoinedIdC as the product of two
-- general-axis quarter-turns via axisRotLin_comp_same_axis. The half-turn GENUINELY flips the x-axis
-- for EVERY axis e: applied to (0,-1,0) its x-coordinate reads
-- ((axisRotLin e (-1) 0) (0,-1,0)).2.1 = (-1)·(-1) - 0·gFormC 0 e = 1 (the antipode 2-plane rotation
-- of the (x, e)-plane reflecting the x-axis through the origin; the gFormC term vanishes on the zero
-- octonion). A genuine nontrivial reach beyond the single chart at a general axis, not vacuous.
--   THE BOGUS claim that this general-axis antipode half-turn x-coordinate read-off reads 156 (a
-- stand-in for ANY wrong general-axis Givens / base-case / Givens-word / half-turn / SO(9)-exhaustion
-- / full-path-connectedness value: the base case fails / the Givens-word does not assemble / the
-- general-axis antipode is not reached via the word / the refined conditional full path-connectedness
-- fails) forces, after rewriting by the genuine value (axisRotLin_apply), the false numeric
-- `(1 : Cut) = 156` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the general-axis antipode half-turn GENUINELY
-- reads 1 on the flipped x-axis (a banked read-off over the derived field Cut, for EVERY axis e), so
-- the claim of 156 is genuinely FALSE (1 ≠ 156 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 156` is DISTINCT from the banked battery (… C183 1=151, C184 1=152,
-- C185 1=153, C186 1=154, C187 1=155).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/Givens/axis/half-turn/antipode/isometry/
-- compact/word/path-connected/topology/JoinedIdC/Cayley/circle/SO(1,9)/SO(9)/Spin/octonion": over
-- the derived complete ordered field Cut, for every e the linear operator axisRotLin e (-1) 0 applied
-- to (0,-1,0) has second coordinate (-1)·(-1) - 0·gFormC 0 e = 1; claiming it equals 156 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the general-axis antipode half-turn `axisRotLin e (-1) 0` (the W8 element reached via the
    general-axis word-induction, outside the single Cayley chart, for any axis `e`) applied to
    `(0,-1,0)` has second coordinate `156`. It GENUINELY equals `1` (the antipode rotation flipping
    the x-axis of the `(x, e)`-plane: `(-1)·(-1) - 0·gFormC 0 e = 1`). The WRONG claim that it is
    `156` (the general-axis base case fails / the Givens-word does not assemble / the general-axis
    antipode is not reached via the word / the refined conditional full path-connectedness fails)
    reduces, after rewriting by the genuine value, to the false numeric `(1 : Cut) = 156`, so this
    must NOT compile. -/
theorem general_axis_givens_wrong_value_BOGUS (e : O Cut) :
    ((axisRotLin e (-1:Cut) 0) ((0:Cut), (-1:Cut), (0:O Cut))).2.1 = (156 : Cut) := by
  rw [axisRotLin_apply]
  show ((-1:Cut) * (-1) - 0 * gFormC (0:O Cut) e) = 156
  have hval : ((-1:Cut) * (-1) - 0 * gFormC (0:O Cut) e) = 1 := by ring
  rw [hval]

end

end Counterexamples
