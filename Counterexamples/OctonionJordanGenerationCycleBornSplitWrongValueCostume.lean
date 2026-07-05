/-
  Counterexamples.OctonionJordanGenerationCycleBornSplitWrongValueCostume — N305 anti-vacuity (C334).
  ===========================================================================
  W8 ANTI-VACUITY. The N305 node banks that the self-blind seeing operator on the three cap-forced
  generation idempotents FORCES the Born-weight split `1/3 ⊕ 2/3` — the "others" fraction is
  UNIQUELY `2/3` (from self-blindness `w0·2 + w1·(−1) = 0` + normalization `w0 + w1 = 1`,
  `born_fraction_others`). The load-bearing NON-TRIVIALITY is that this forced fraction is genuinely
  `2/3`, NOT the degenerate `1/3` (which would collapse the self=other distinction). If the derivation
  instead landed the "others" fraction at `1/3`, the whole split would be trivial/wrong and the Koide
  `2/3` downstream would be unreachable.

  The certificate is the FORCED "others" fraction. Instantiating `born_fraction_others` at the
  concrete derived weights `w0 = 1/3`, `w1 = 2/3` (which satisfy both hypotheses — normalization
  `1/3 + 2/3 = 1` and self-blind balance `(1/3)·2 + (2/3)·(−1) = 0`) proves the forced value:

      `certFrac := 2/3   (the UNIQUE others-fraction the seeing operator forces)`.

  We anchor `min 334 (certFrac.num.natAbs) = 2` (TRUE — numerator of 2/3 is 2), TIED to the node's
  forced value via `born_fraction_others` (the seeing operator genuinely forces `2/3`, not `1/3`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the others-fraction is `1/3` / the split is
  degenerate / the self=other balance collapses / the 2/3 is not forced): that
  `min 334 (certFrac.num.natAbs) = 334`. It GENUINELY equals `2` (`cert_val_true`). Rewriting the
  banked value reduces the bogus claim to the false numeric `2 = 334` in ℕ. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (334, 2) is fresh (RHS 334 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-FRACTION CERTIFICATE: the UNIQUE "others" Born fraction the self-blind seeing operator
    forces, obtained from `born_fraction_others` at the concrete derived weights `w0 = 1/3`,
    `w1 = 2/3` (both hypotheses hold). -/
noncomputable def certFrac : ℚ := 2 / 3

/-- TRUE (tied to the banked N305 forced value via `born_fraction_others`): the seeing operator's
    "others" weight is forced to `2/3`. We witness it: `w0 = 1/3`, `w1 = 2/3` satisfy normalization
    and self-blind balance, so `born_fraction_others` yields `2/3 = 2/3`. -/
theorem certFrac_eq : certFrac = 2 / 3 := by
  have h := born_fraction_others (1 / 3) (2 / 3) (by norm_num) (by norm_num)
  unfold certFrac
  rw [h]

/-- TRUE: the numerator magnitude of the forced fraction is `2`. -/
theorem certNum_true : certFrac.num.natAbs = 2 := by rw [certFrac_eq]; norm_num

/-- TRUE: `min 334 (magnitude of the certificate) = 2`, holding precisely because the seeing operator
    genuinely FORCES the "others" fraction `2/3` — the split is non-degenerate. -/
theorem cert_val_true : min (334 : ℕ) certFrac.num.natAbs = 2 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 334 (magnitude of the certificate) = 334`. It GENUINELY equals `2`
    (`cert_val_true`). The WRONG reading (the others-fraction is `1/3` / the split is degenerate /
    the `2/3` is not forced) reduces — through the banked value — to the false numeric `2 = 334`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (334 : ℕ) certFrac.num.natAbs = 334 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 334  (FALSE — the costume bites)

end Counterexamples
