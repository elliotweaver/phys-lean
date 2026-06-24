/-
  Counterexamples.DerivationSimpleTrivialActionCostume — N29 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N29 simplicity-reduction pin. N29 banks the FAITHFULNESS LEVER
  `eq_bot_of_lie_ImLie_bot` (a Lie ideal that brackets to `⊥` against the faithful 7-rep
  `ImLie` is itself `⊥`) and its contrapositive `lie_ImLie_ne_bot_of_ne_bot` (every NONZERO
  ideal acts NONTRIVIALLY on the irreducible 7-rep). The teeth: the 7-rep `imRep` is FAITHFUL
  (banked `imRep_injective`, N22), so a nonzero ideal cannot act as `0` on `ImO`.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the WHOLE algebra (the
  nonzero top ideal `⊤`) is itself `⊥` — the degenerate reading in which the algebra acts
  trivially / is not really there. Applying the banked faithfulness lever
  `eq_bot_of_lie_ImLie_bot` reduces `⊤ = ⊥` to `⁅⊤, ImLie⁆ = ⊥` (the top ideal acts trivially
  on the 7-rep). That is genuinely FALSE — faithfulness (`lie_ImLie_ne_bot_of_ne_bot ⊤`) proves
  `⁅⊤, ImLie⁆ ≠ ⊥` — so the residual goal cannot be discharged. If the 7-rep were NOT faithful,
  a nonzero ideal could act trivially and the simplicity reduction would collapse; W8 demands
  this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationSimple

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the nonzero top ideal `⊤` is `⊥` (the degenerate "algebra acts trivially"
    reading). Applying the banked faithfulness lever `eq_bot_of_lie_ImLie_bot` reduces the goal
    to `⁅⊤, ImLie⁆ = ⊥`, which is false (a nonzero ideal acts nontrivially on the faithful
    7-rep) and cannot be discharged. Must FAIL to compile. -/
theorem top_eq_bot_via_trivial_action_BOGUS :
    (⊤ : LieIdeal ℚ derivationLieQ) = ⊥ := by
  apply eq_bot_of_lie_ImLie_bot

end Counterexamples
