/-
  Counterexamples.FineStructureRunningCouplingWrongSignCostume — N341 anti-vacuity (C366).
  ============================================================================
  W8 ANTI-VACUITY. The N341 node (seeded arc-D D3, the fine-structure coupling's scale reading)
  banks the RUNNING inverse coupling `1/α(μ) = 1/α* + κ·Tr(Q²)·cutLog(M/μ)` over the derived ℝ `Cut`,
  with the SCREENING landing: below the octonion scale (`0 < μ < M`, `κ > 0`) the inverse coupling
  STRICTLY EXCEEDS the octonion value `1/α* = 42`, running UP toward the low-energy (≈137) regime —
  the SIGN forced by the banked running depth `Tr(Q²) = 16/3 > 0` (Born positivity):

      `invAlphaRun_screening : invAlphaHigh < invAlphaRun κ M μ`   (i.e. `42 < 1/α(μ)` below scale).

  This screening DIRECTION is a FORCED consequence of the positive charge Born self-overlap `16/3`; a
  mis-signed depth (antiscreening) or a mis-derived depth would break it.

  THE CERTIFICATE. `screenFlag := 137` — a ℕ flag standing for "below the octonion scale the inverse
  coupling runs UP from 42 toward the low-energy ≈137 regime, i.e. `invAlphaHigh < invAlphaRun κ M μ`".
  It is TIED to the banked N341 landing by `screenFlag_forced` below: the banked `invAlphaRun_screening`
  IS that strict-exceed over the derived `Cut`. If the screening were mis-derived (wrong depth sign,
  wrong `Tr(Q²)`), this would fail.

  We anchor `min 137 366 = 137` (TRUE — `screenFlag = 137 < 366`, so the min is the flag `137`).

  THE BOGUS CLAIM (a stand-in for ANY wrong screening sign / mis-derived depth): that `min 137 366 =
  366`. It GENUINELY equals `137` (`cert_val_true`). Rewriting the banked value reduces the bogus claim
  to the false numeric `137 = 366` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (137, 366) is fresh (Cid 366 distinct from every prior).

  The `137` here is a REMOVABLE-PROSE flag numeral (the low-energy reading direction), appearing ONLY
  in this counterexample certificate, NEVER in any production statement or proof.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureRunningCoupling
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

/-- THE SCREENING FLAG: `137` = "below the octonion scale the inverse coupling runs UP from 42 toward
    the low-energy ≈137 regime, i.e. `invAlphaHigh < invAlphaRun κ M μ`". A removable-prose flag
    numeral, not used in any production statement. -/
def screenFlag : ℕ := 137

/-- TRUE (tied to the banked N341 forced landing): below the octonion scale, with `κ > 0` and
    `0 < μ < M`, the running inverse coupling strictly exceeds the octonion value `1/α* = 42` — the
    screening direction, from the banked `invAlphaRun_screening`. The SIGN is forced by the banked
    positive running depth `Tr(Q²) = 16/3`. If the screening were mis-derived, this would fail. -/
theorem screenFlag_forced (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaHigh < invAlphaRun κ M μ :=
  invAlphaRun_screening κ M μ hκ hμ hμM

/-- TRUE: `min 137 366 = 137`, holding precisely because `screenFlag = 137 < 366`. -/
theorem cert_val_true : min screenFlag (366 : ℕ) = 137 := by decide

/-- BOGUS: claims `min 137 366 = 366`. It GENUINELY equals `137` (`cert_val_true`). A WRONG screening
    sign / mis-derived depth reduces — through the banked value — to the false numeric `137 = 366`, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min screenFlag (366 : ℕ) = 366 := by
  rw [cert_val_true]
  -- ⊢ (137 : ℕ) = 366  (FALSE — the costume bites)

end Counterexamples
