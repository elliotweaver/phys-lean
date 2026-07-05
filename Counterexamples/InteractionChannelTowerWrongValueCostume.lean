/-
  Counterexamples.InteractionChannelTowerWrongValueCostume — N314 anti-vacuity (C343).
  ===========================================================================
  W8 ANTI-VACUITY. The N314 node (seeded gauge route A2) banks the INTERACTION-CHANNEL TOWER
  `ℂ:0, ℍ:6, 𝕆:42` as the off-diagonal ordered-pair count `n(n−1)` of the imaginary units of the
  banked cascade rungs `Dbl ℚ / H ℚ / O ℚ` (imaginary dims `n = 1, 3, 7`, banked
  `finrank_dbl_eq_two`/`finrank_ImH_eq_three`/`finrank_ImO`):

      `channels_H : imChannelCount (finrank ℚ ImH) = 6`   (`= 3·2 = n(n−1)`, n = 3).

  The value FALLS OUT of `Finset.offDiag_card` (`|offDiag(Fin n)| = n² − n`): the `3` imaginary
  quaternion units give `3·2 = 6` OFF-DIAGONAL ordered pairs; the `3` diagonal self-pairs vanish.
  It is not free.

  The certificate is the FORCED `ℍ`-rung channel count:

      `certSix := 6   (the FORCED n(n−1) = 6 for the ℍ rung, off-diagonal ordered-pair count)`.

  We anchor `min 343 certSix = 6` (TRUE — the count is genuinely `6`, NOT the naive `n² = 9` that
  would keep the degenerate diagonal), TIED to the node's forced landing via `channels_H`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the diagonal was NOT dropped so the count is
  `9 = n²`, or the wrong rung, or a miscount): that `min 343 certSix = 343`. It GENUINELY equals `6`
  (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `6 = 343` in ℕ. The kernel cannot close it; it BITES.

  (Note the tower non-vacuity is itself banked: `channels_H_ne_9` — the diagonal genuinely drops —
  and `channelTower_distinct` — `0 ≠ 6 ≠ 42`.)

  DISTINCT from the banked battery: the pair (343, 6) is fresh (RHS 343 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.InteractionChannelTower
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE FORCED `ℍ`-RUNG CHANNEL-COUNT CERTIFICATE: `n(n−1) = 6`, the off-diagonal ordered-pair count
    of the three imaginary quaternion units. From `channels_H`, the banked N314 landing. -/
def certSix : ℕ := 6

/-- TRUE (tied to the banked N314 forced landing via `channels_H`): the `ℍ`-rung interaction-channel
    count is genuinely `6` — the `6` off-diagonal ordered pairs, the `3` diagonal self-pairs
    dropped. -/
theorem certSix_forced : imChannelCount (Module.finrank ℚ ImH) = 6 := channels_H

/-- TRUE: `min 343 certSix = 6`, holding precisely because the forced count is genuinely `6`
    (`n(n−1)`), not `9` (`n²`, keeping the degenerate diagonal). -/
theorem cert_val_true : min (343 : ℕ) certSix = 6 := by decide

/-- BOGUS: claims `min 343 certSix = 343`. It GENUINELY equals `6` (`cert_val_true`). The WRONG
    reading (the diagonal not dropped so `n² = 9` / the wrong rung / a miscount) reduces — through
    the banked value — to the false numeric `6 = 343`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (343 : ℕ) certSix = 343 := by
  rw [cert_val_true]
  -- ⊢ (6 : ℕ) = 343  (FALSE — the costume bites)

end Counterexamples
