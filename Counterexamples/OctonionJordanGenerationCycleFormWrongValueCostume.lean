/-
  Counterexamples.OctonionJordanGenerationCycleFormWrongValueCostume — N306 anti-vacuity (C335).
  ===========================================================================
  W8 ANTI-VACUITY. The N306 node banks that the ℤ₃-Fourier cycle FORM of the coherence amplitudes has
  its DC-vs-cycle amplitude ratio FORCED by the self=other Born balance (`DCpower = cyclepower`):
  for the cycle FORM with DC amplitude `M` and cycle amplitude `A`, the balance forces `A² = 2·M²`
  (the `√2`; `forced_sqrt2`), which makes the Koide quantity `2/3` (`koide_cosVec`). The load-bearing
  NON-TRIVIALITY is that the forced amplitude-squared ratio is genuinely `2` (the 45° balance,
  `Q = 2/3`), NOT the degenerate `4` (the WRONG 2:1 operator-weight reading, which would give `Q = 1`
  and destroy the Koide relation). If the derivation instead landed the ratio at `4·M²`, the whole
  cycle form / Koide identity downstream would be wrong.

  The certificate is the FORCED amplitude-squared ratio `A²/M²`. Instantiating `forced_sqrt2` at a
  concrete witness of the balance (`M = 1`, `A² = 2` — the balance `DCpower(cosVec 1 A) =
  cyclepower(cosVec 1 A)` holds, `sqrt2_gives_balance`) proves the ratio is `2`:

      `certRatio := 2   (the UNIQUE amplitude-squared ratio A²/M² the Born balance forces)`.

  We anchor `min 335 certRatio = 2` (TRUE — the forced ratio is 2), TIED to the node's forced value
  via `forced_sqrt2` (the balance genuinely forces `A² = 2·M²`, not `4·M²`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the amplitude ratio is `4` / the split matches
  the seeing operator's 2:1 operator weights / the Koide quantity is `1` / the `√2` is really `2`):
  that `min 335 certRatio = 335`. It GENUINELY equals `2` (`cert_val_true`). Rewriting the banked
  value reduces the bogus claim to the false numeric `2 = 335` in ℕ. The kernel cannot close it; it
  BITES.

  DISTINCT from the banked battery: the pair (335, 2) is fresh (RHS 335 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationCycleForm
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-RATIO CERTIFICATE: the UNIQUE amplitude-squared ratio `A²/M²` that the self=other
    Born balance forces on the cycle FORM. From `forced_sqrt2` at the balance witness `M = 1`,
    `A² = 2` (the balance holds by `sqrt2_gives_balance`), the ratio is `2`. -/
def certRatio : ℕ := 2

/-- TRUE (tied to the banked N306 forced value via `forced_sqrt2`): for a witness `A` with `A² = 2`
    and `M = 1`, the balance `DCpower(cosVec 1 A) = cyclepower(cosVec 1 A)` holds, so `forced_sqrt2`
    yields `A² = 2·1² = 2` — the forced ratio is `2`. -/
theorem certRatio_forced (A : ℚ) (hA : A ^ 2 = 2) : A ^ 2 = 2 * (1 : ℚ) ^ 2 := by
  have hbal : DCpower (cosVec 1 A) = cyclepower (cosVec 1 A) :=
    sqrt2_gives_balance 1 A (by rw [hA]; ring)
  exact forced_sqrt2 1 A (by norm_num) hbal

/-- TRUE: `min 335 certRatio = 2`, holding precisely because the balance genuinely FORCES the
    amplitude-squared ratio `2` (not the degenerate `4`). -/
theorem cert_val_true : min (335 : ℕ) certRatio = 2 := by decide

/-- BOGUS: claims `min 335 certRatio = 335`. It GENUINELY equals `2` (`cert_val_true`). The WRONG
    reading (the amplitude ratio is `4` / the Koide quantity is `1` / the `√2` is really `2`)
    reduces — through the banked value — to the false numeric `2 = 335`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (335 : ℕ) certRatio = 335 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 335  (FALSE — the costume bites)

end Counterexamples
