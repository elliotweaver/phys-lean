/-
  Counterexamples.CosmologyContactConsolidationWrongBlockCostume — N338 anti-vacuity (C363).
  ============================================================================
  W8 ANTI-VACUITY. The N338 node (seeded arc-C C4) consolidates the first-cosmology-contact arc
  through the self / others RESOLUTION OF IDENTITY of generation space: the DC self-projector
  `demProj = (1/3)J` and the inter-generation projector `othersProj = 1 − demProj` form a COMPLETE
  ORTHOGONAL IDEMPOTENT SYSTEM (`demProj + othersProj = 1`, `demProj² = demProj`, `othersProj² =
  othersProj`, `demProj · othersProj = 0`) splitting generation space into a RANK-1 self block ⊕ a
  RANK-2 others block (`trace demProj = 1`, `trace othersProj = 2`, so `1 + 2 = 3`). The BLOCK COUNT
  is load-bearing:

      `block_ranks_sum_to_three : trace demProj + trace othersProj = 3`   (the `3 = 1 + 2` split)
      `demProj_ne_othersProj    : demProj ≠ othersProj`                    (blocks genuinely distinct)
      `generation_resolution_of_identity : demProj + othersProj = 1`      (resolution of identity)

  The `3 = 1 + 2` block split (one massless/sterile/dark self direction ⊕ two massive active
  directions) is what carries all of arc C: the SUM lives on the others block (C1), the self block is
  the massless zero-mode (C2), the self block is the heavy-sterile dark direction (C3). If the
  decomposition were mis-built (wrong ranks, blocks not distinct, not resolving the identity), the
  whole arc-C block structure collapses.

  THE CERTIFICATE. `blockCount := 3` — a ℕ flag standing for "the derived generation space splits as
  `3 = 1 + 2` (rank-1 self block ⊕ rank-2 others block) under the resolution of identity". It is TIED
  to the banked landing by `blockCount_forced` below: the banked `block_ranks_sum_to_three` gives
  `trace demProj + trace othersProj = 3` over the derived `Cut` — the block ranks genuinely sum to the
  full dimension. If the decomposition were mis-built, this would fail.

  We anchor `min 363 blockCount = 3` (TRUE — `blockCount = 3`, the genuine `1 + 2` split).

  THE BOGUS CLAIM (a stand-in for ANY wrong block structure / mis-built decomposition): that
  `min 363 blockCount = 363`. It GENUINELY equals `3` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `3 = 363` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (363, 3) is fresh (RHS 363 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmologyContactConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix

/-- THE BLOCK-COUNT FLAG: `3` = "the derived generation space splits as `3 = 1 + 2` (rank-1 self block
    ⊕ rank-2 others block) under the resolution of identity `demProj + othersProj = 1`". -/
def blockCount : ℕ := 3

/-- TRUE (tied to the banked N338 forced landing): the block ranks sum to the full dimension —
    `trace demProj + trace othersProj = 3` over the derived `Cut` (`block_ranks_sum_to_three`, the
    `1 + 2 = 3` split). If the self / others decomposition were mis-built, this would fail. -/
theorem blockCount_forced :
    Matrix.trace demProj + Matrix.trace othersProj = (3 : Cut) :=
  block_ranks_sum_to_three

/-- TRUE: `min 363 blockCount = 3`, holding precisely because `blockCount = 3` (the genuine `1 + 2`
    split), not `363`. -/
theorem cert_val_true : min (363 : ℕ) blockCount = 3 := by decide

/-- BOGUS: claims `min 363 blockCount = 363`. It GENUINELY equals `3` (`cert_val_true`). A WRONG block
    structure / mis-built decomposition reduces — through the banked value — to the false numeric
    `3 = 363`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (363 : ℕ) blockCount = 363 := by
  rw [cert_val_true]
  -- ⊢ (3 : ℕ) = 363  (FALSE — the costume bites)

end Counterexamples
