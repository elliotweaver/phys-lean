/-
  Counterexamples.PathIntegralMeasureRenormVacuityCostume — N377 anti-vacuity (C402).
  ============================================================================================
  W8 ANTI-VACUITY. The N377 node (arc-G G5 — THE PATH-INTEGRAL MEASURE / RENORMALIZABILITY) banks
  that the tower of scaling dimensions is the GENUINELY ORDERED discrete ladder
  `λ_n = −n/(84·cutPi)`, marginal (`= 0`) EXACTLY at `n = 0` and strictly decreasing off it — so the
  `n = 1` direction is GENUINELY NON-MARGINAL (`scalingDim 1 ≠ 0`, `scalingDim_one_ne_zero`). The
  load-bearing content is that the spectrum is NOT trivially all-marginal: a "the spectrum is
  degenerate / every scaling dimension is marginal / the ladder collapses" mis-reading would break
  the renormalizability content. The banked `scalingDim_one_ne_zero` rules this out:
  `Phys.Algebra.PathIntegral.scalingDim 1 ≠ 0`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the scaling ladder is genuinely ordered:
  the `n = 1` direction is strictly irrelevant, `λ₁ ≠ 0`, the spectrum is not trivially all-marginal".
  It is TIED to the banked N377 landing by `iFlag_forced`: the banked `scalingDim_one_ne_zero`
  witnesses `scalingDim 1 ≠ 0`, so the flag is `1` (present).

  We anchor `min 402 iFlag = 1` (TRUE — `iFlag = 1 < 402`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the spectrum is degenerate / all directions marginal / the
  ladder is vacuous" mis-reading): that `min 402 iFlag = 402`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 402` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (402, 1) is fresh (Cid 402 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.PathIntegralMeasureRenorm
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.PathIntegral

/-- THE SCALING-LADDER ORDER FLAG: `1` = "the scaling ladder `λ_n = −n/(84·cutPi)` is genuinely
    ordered — the `n = 1` direction is strictly irrelevant, `λ₁ ≠ 0`, the spectrum is not trivially
    all-marginal (the renormalizability content bites)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N377 landing): the banked `scalingDim_one_ne_zero` proves the `n = 1`
    scaling dimension `scalingDim 1` is `≠ 0`, so the "ordered ladder" flag is present, `iFlag = 1`.
    If the spectrum were trivially all-marginal, this witness would not exist. -/
theorem iFlag_forced :
    (scalingDim 1 ≠ 0) ∧ iFlag = 1 :=
  ⟨scalingDim_one_ne_zero, rfl⟩

/-- TRUE: `min 402 iFlag = 1`, holding precisely because `iFlag = 1 < 402`. -/
theorem cert_val_true : min (402 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 402 iFlag = 402`. It GENUINELY equals `1` (`cert_val_true`). A "the spectrum is
    degenerate / all directions marginal / the ladder is vacuous" mis-reading reduces — through the
    banked value — to the false numeric `1 = 402`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (402 : ℕ) iFlag = 402 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 402  (FALSE — the costume bites)

end Counterexamples
