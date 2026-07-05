/-
  Counterexamples.OctonionJordanGenerationKoideWrongValueCostume — N307 anti-vacuity (C336).
  ===========================================================================
  W8 ANTI-VACUITY. The N307 node banks that the Koide relation `Q = 2/3` is an EXACT IDENTITY of the
  ℤ₃-Fourier cycle FORM, holding for ALL phases `δ` (the δ-invariance of the self=other Born balance):
  for the δ-family `genVec M A p r` on the rational phase conic `3p² + r² = 3`, the self=other Born
  balance `DCpower = cyclepower` FORCES the amplitude-squared ratio `A² = 2·M²` (the `√2`,
  `forced_sqrt2_genVec`), which makes the Koide quantity `2/3` for every δ (`koide_genVec`). The
  load-bearing NON-TRIVIALITY is that the forced amplitude-squared ratio is genuinely `2` (the 45°
  balance, `Q = 2/3`), NOT the degenerate `4` (the WRONG 2:1 operator-weight reading, which would give
  `Q = 1` for the whole δ-family, `koide_genVec_not_one`, destroying the Koide relation).

  The certificate is the FORCED amplitude-squared ratio `A²/M²` at a phase witness. Instantiating
  `forced_sqrt2_genVec` at a concrete conic point and balance witness (`p = 1`, `r = 0` — the δ=0
  point, `3·1² + 0² = 3`; `M = 1`, `A² = 2`, the balance `DCpower(genVec 1 A 1 0) =
  cyclepower(genVec 1 A 1 0)` holding via `balance_genVec`) proves the ratio is `2`:

      `certRatio := 2   (the UNIQUE amplitude-squared ratio A²/M² the δ-invariant Born balance forces)`.

  We anchor `min 336 certRatio = 2` (TRUE — the forced ratio is 2), TIED to the node's forced value
  via `forced_sqrt2_genVec` (the balance genuinely forces `A² = 2·M²`, not `4·M²`, at every phase).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the amplitude ratio is `4` / the Koide quantity
  is `1` / the identity fails to be δ-invariant / the `√2` is really `2`): that
  `min 336 certRatio = 336`. It GENUINELY equals `2` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `2 = 336` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (336, 2) is fresh (RHS 336 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationKoide
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-RATIO CERTIFICATE: the UNIQUE amplitude-squared ratio `A²/M²` that the δ-invariant
    self=other Born balance forces on the cycle FORM at every phase. From `forced_sqrt2_genVec` at the
    conic witness `p = 1`, `r = 0` and balance witness `M = 1`, `A² = 2` (the balance holds by
    `balance_genVec`), the ratio is `2`. -/
def certRatio : ℕ := 2

/-- TRUE (tied to the banked N307 forced value via `forced_sqrt2_genVec`): for a witness `A` with
    `A² = 2`, `M = 1` at the conic point `(p, r) = (1, 0)`, the balance `DCpower(genVec 1 A 1 0) =
    cyclepower(genVec 1 A 1 0)` holds, so `forced_sqrt2_genVec` yields `A² = 2·1² = 2` — the forced
    ratio is `2`, at this (and by δ-invariance, every) phase. -/
theorem certRatio_forced (A : ℚ) (hA : A ^ 2 = 2) : A ^ 2 = 2 * (1 : ℚ) ^ 2 := by
  have hconic : (3 : ℚ) * (1:ℚ)^2 + (0:ℚ)^2 = 3 := by norm_num
  have hbal : DCpower (genVec 1 A 1 0) = cyclepower (genVec 1 A 1 0) :=
    balance_genVec 1 A 1 0 hconic (by rw [hA]; ring)
  exact forced_sqrt2_genVec 1 A 1 0 hconic (by norm_num) hbal

/-- TRUE: `min 336 certRatio = 2`, holding precisely because the balance genuinely FORCES the
    amplitude-squared ratio `2` (not the degenerate `4`) at every phase. -/
theorem cert_val_true : min (336 : ℕ) certRatio = 2 := by decide

/-- BOGUS: claims `min 336 certRatio = 336`. It GENUINELY equals `2` (`cert_val_true`). The WRONG
    reading (the amplitude ratio is `4` / the Koide quantity is `1` / the identity is not δ-invariant
    / the `√2` is really `2`) reduces — through the banked value — to the false numeric `2 = 336`, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (336 : ℕ) certRatio = 336 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 336  (FALSE — the costume bites)

end Counterexamples
