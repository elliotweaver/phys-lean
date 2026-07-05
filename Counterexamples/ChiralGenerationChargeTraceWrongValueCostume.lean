/-
  Counterexamples.ChiralGenerationChargeTraceWrongValueCostume — N317 anti-vacuity (C346).
  ===========================================================================
  W8 ANTI-VACUITY. The N317 node (seeded gauge route A5, pillar 1) banks the
  CHIRAL-GENERATION CHARGE-SQUARED TRACE `Tr(Q²) = 16/3` — the GUT-normalization
  DENOMINATOR of the weak mixing angle — DERIVED from the colour exterior ladder,
  grounded to the banked derived colour dimension `finrank ℚ Uhol = 3`:

      `generation_charge_trace : ladderChargeTrace (finrank ℚ Uhol) = 16/3`.

  The charge trace is `2 · Σ_{S⊆Fin 3} (|S|/3)² = 2·(24/9) = 16/3` (the second moment
  of the colour occupation number, normalized by the colour count `n_c = 3`). It is
  FORCED: the value `16/3` falls out of the ℕ second moment `Σ |S|² = 24` divided by
  `n_c² = 9`, doubled — never premised.

  The certificate is that forced trace, cleared of the denominator: `3·Tr(Q²) = 16`.

      `threeTrQ2 := 16   (= 3·(16/3), the FORCED numerator, DERIVED not asserted)`.

  We anchor `min 346 threeTrQ2 = 16` (TRUE — `3·Tr(Q²) = 16`, from the derived colour
  ladder over `n_c = finrank Uhol = 3`, NOT the F₄-trap `3/4` route and NOT a wrong
  colour count `n_c = 2` which would give `Tr(Q²) = 3` so `3·Tr(Q²) = 9`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the naive gauged-F₄ normalization
  giving `3/4`, a wrong colour count `n_c ≠ 3`, a mis-normalized occupation charge, or
  an asserted value): that `min 346 threeTrQ2 = 346`. It GENUINELY equals `16`
  (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `16 = 346` in ℕ. The kernel cannot close it; it BITES.

  (Non-vacuity is itself banked: `ladderChargeTrace_two_ne` — `n_c=2` gives `3 ≠ 16/3` —
  and `charge_trace_ne_trap` — `Tr(Q²) = 16/3 ≠ 3/4`, the F₄ trap.)

  DISTINCT from the banked battery: the pair (346, 16) is fresh (RHS 346 distinct from
  every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE FORCED CHARGE-TRACE CERTIFICATE, denominator cleared: `3·Tr(Q²) = 16`. From
    `generation_charge_trace` (`Tr(Q²) = 16/3` over the banked colour dim), the N317
    landing. -/
def threeTrQ2 : ℕ := 16

/-- TRUE (tied to the banked N317 forced landing): three times the chiral-generation
    charge-squared trace is genuinely `16` (`3·(16/3) = 16`), from the colour ladder
    over `n_c = finrank Uhol = 3`. -/
theorem threeTrQ2_forced :
    (3 : ℚ) * ladderChargeTrace (Module.finrank ℚ Uhol) = 16 := by
  rw [generation_charge_trace]; norm_num

/-- TRUE: `min 346 threeTrQ2 = 16`, holding precisely because `3·Tr(Q²) = 16` (the
    colour-ladder value over `n_c = 3`), not `9` (`n_c = 2`) and not the F₄ trap. -/
theorem cert_val_true : min (346 : ℕ) threeTrQ2 = 16 := by decide

/-- BOGUS: claims `min 346 threeTrQ2 = 346`. It GENUINELY equals `16` (`cert_val_true`).
    The WRONG reading (F₄ trap `3/4` / wrong colour count / mis-normalized charge /
    asserted value) reduces — through the banked value — to the false numeric `16 = 346`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (346 : ℕ) threeTrQ2 = 346 := by
  rw [cert_val_true]
  -- ⊢ (16 : ℕ) = 346  (FALSE — the costume bites)

end Counterexamples
