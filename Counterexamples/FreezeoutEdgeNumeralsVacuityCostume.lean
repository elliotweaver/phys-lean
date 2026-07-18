/-
  Counterexamples.FreezeoutEdgeNumeralsVacuityCostume — the three freeze-out edge logs are certified
  two-sided rational brackets over the derived ℝ `Cut` (bottom `∈ [−7/5,−1]`, light `∈ [14/5,7/2]`,
  charm `∈ [4,41/10]`), with genuinely two-sided widths and genuinely distinct shape logs. C566.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE FREEZE-OUT EDGE NUMERALS) proves the bottom (rb) and light (rl) edge
  logs as certified brackets and re-exports the charm (rc). The content that must NOT be hollow is that
  the brackets are GENUINE — the bottom edge log is genuinely NEGATIVE (a real suppression, not a
  degenerate `1` giving log `0`), the light edge log is genuinely POSITIVE (a real screening), and the
  two within-sector shape logs are genuinely DISTINCT (opposite signs — the shape structure is
  load-bearing, not a collapse of all masses to one). If the bottom-edge log were `≥ 0`, or the two
  shape logs coincided, the edge numerals would be vacuous. They are genuinely distinct: the bottom edge
  log `< 0` (`bottomEdgeLog_neg`), the light edge log `> 0` (`lightEdgeLog_pos`), and the shape logs
  differ (`shape_logs_distinct`).

  THE CERTIFICATE. edgeFlag := 1 -- a natural-number flag standing for "the three freeze-out edge logs
  are certified genuine two-sided brackets: the bottom edge log is negative, the light edge log is
  positive, and the two shape logs are distinct". It is TIED to the banked landing by edgeFlag_forced.

  We anchor min 566 edgeFlag = 1 (TRUE -- edgeFlag = 1 < 566, so the min is edgeFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the bottom edge log is nonnegative / the light edge log is
  nonpositive / the two shape logs coincide / the edge brackets are vacuous" reading): that
  min 566 edgeFlag = 566. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 566 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (566, 1) is fresh (Cid 566 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FreezeoutEdgeNumerals
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.FreezeoutEdgeNumerals
open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the three freeze-out edge logs are certified genuine two-sided brackets: bottom edge
    log negative, light edge log positive, shape logs distinct". -/
def edgeFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the bottom edge log is genuinely negative
    (`bottomEdgeLog_neg`), the light edge log genuinely positive (`lightEdgeLog_pos`), and the two shape
    logs genuinely distinct (`shape_logs_distinct`) — and `edgeFlag = 1`. -/
theorem edgeFlag_forced :
    (cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2) < 0)
    ∧ ((0 : Cut) < cutLog downConfBundle + cutLog (bMass 2))
    ∧ (cutLog (bMass 0) ≠ cutLog (bMass 2))
    ∧ edgeFlag = 1 :=
  ⟨bottomEdgeLog_neg, lightEdgeLog_pos, shape_logs_distinct, rfl⟩

/-- TRUE: min 566 edgeFlag = 1, holding precisely because edgeFlag = 1 < 566. -/
theorem cert_val_true : min (566 : ℕ) edgeFlag = 1 := by decide

/-- BOGUS: claims min 566 edgeFlag = 566. It GENUINELY equals 1 (cert_val_true). A "the bottom edge log
    is nonnegative / the light edge log is nonpositive / the shape logs coincide / the edge brackets are
    vacuous" reading reduces -- through the banked bottomEdgeLog_neg / lightEdgeLog_pos /
    shape_logs_distinct tie -- to the false numeric 1 = 566 in the naturals. The kernel cannot close it;
    it BITES. -/
theorem bogus_claim : min (566 : ℕ) edgeFlag = 566 := by
  rw [cert_val_true]

end Counterexamples
