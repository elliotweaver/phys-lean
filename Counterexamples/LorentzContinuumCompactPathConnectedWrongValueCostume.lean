import Phys.Algebra.LorentzContinuumCompactPathConnected

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C187): A BOGUS COMPACT-WORD-INDUCTION / JoinedIdC / SUBMONOID / WORD-ASSEMBLY /
-- HALF-TURN / FULL-PATH-CONNECTEDNESS READ-OFF — "THE WORD-INDUCTION ASSEMBLY DOES NOT GENUINELY
-- REACH THE ANTIPODE HALF-TURN (so the path-component of the identity is NOT closed under products,
-- joinedIdC_mul fails, the submonoid joinedIdSubmonoid is not a submonoid, joinedIdC_listProd does
-- not assemble a word, the antipode half-turn planeRotLin (-1) 0 — outside the single Cayley chart
-- 1+(-1)=0 — is NOT reached as the product of two quarter-turns, the full reduction
-- bvIsom_joinedIdC_of_compact_joinedSet fails, the conditional full SO⁺(1,9) path-connectedness
-- bvIsom_joinedIdC_of_compact_word fails)".
-- N155 banks the set-form engine JoinedIdC (g lies in a preconnected subset of endOpC with the
-- identity), joinedIdC_mul (closed under * via IsPreconnected.union at the shared point + the N153
-- right-mult glue), the submonoid joinedIdSubmonoid, the word-induction joinedIdC_listProd (a finite
-- product of joined factors is joined), the full reduction (set form), and the W8 NON-VACUITY
-- anchor: the ANTIPODE half-turn planeRotLin (-1) 0 — NOT reachable by the single Cayley chart
-- rotPath (halfTurn_antipode_not_cayley: 1+(-1)=0) — IS JoinedIdC as the product of two quarter-turns
-- (planeRotLin 0 1 * planeRotLin 0 1 = planeRotLin (-1) 0 by planeRotLin_mul). The half-turn
-- GENUINELY flips the x-axis: applied to (0,-1,0) its x-coordinate reads
-- ((planeRotLin (-1) 0) (0,-1,0)).2.1 = (-1)·(-1) - 0·reQC 0 = 1 (the antipode 2-plane rotation
-- reflecting the x-axis through the origin of the (x, real-octonion) plane). A genuine nontrivial
-- reach beyond the single chart, not vacuous.
--   THE BOGUS claim that this antipode half-turn x-coordinate read-off reads 155 (a stand-in for ANY
-- wrong compact-word-induction / JoinedIdC / submonoid / word-assembly / half-turn /
-- full-path-connectedness value: the engine is not closed under products / the path-component is not
-- a submonoid / the word does not assemble / the antipode is not reached via the word / the full
-- reduction fails / the conditional full path-connectedness fails) forces, after rewriting by the
-- genuine value (planeRotLin_apply), the false numeric `(1 : Cut) = 155` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the antipode half-turn GENUINELY reads 1 on the
-- flipped x-axis (a banked read-off over the derived field Cut), so the claim of 155 is genuinely
-- FALSE (1 ≠ 155 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 155` is DISTINCT from the banked battery (… C183 1=151, C184 1=152,
-- C185 1=153, C186 1=154).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/half-turn/antipode/isometry/compact/word/
-- path-connected/topology/JoinedIdC/submonoid/Cayley/circle/SO(1,9)/SO(9)/Spin/octonion": over the
-- derived complete ordered field Cut, the linear operator planeRotLin (-1) 0 applied to (0,-1,0) has
-- second coordinate (-1)·(-1) - 0·reQC 0 = 1; claiming it equals 155 forces the false numeric. The
-- bite is a false NUMERIC, name-independent.

/-- BOGUS: the antipode half-turn `planeRotLin (-1) 0` (the W8 element reached via the word-induction,
    outside the single Cayley chart) applied to `(0,-1,0)` has second coordinate `155`. It GENUINELY
    equals `1` (the antipode rotation flipping the x-axis: `(-1)·(-1) - 0·reQC 0 = 1`). The WRONG
    claim that it is `155` (the engine is not closed under products / the path-component is not a
    submonoid / the word does not assemble / the antipode is not reached via the word / the full
    reduction fails / the conditional full path-connectedness fails) reduces, after rewriting by the
    genuine value, to the false numeric `(1 : Cut) = 155`, so this must NOT compile. -/
theorem compact_word_assembly_wrong_value_BOGUS :
    ((planeRotLin (-1:Cut) 0) ((0:Cut), (-1:Cut), (0:O Cut))).2.1 = (155 : Cut) := by
  rw [planeRotLin_apply]
  show ((-1:Cut) * (-1) - 0 * reQC (0:O Cut)) = 155
  have hval : ((-1:Cut) * (-1) - 0 * reQC (0:O Cut)) = 1 := by ring
  rw [hval]

end

end Counterexamples
