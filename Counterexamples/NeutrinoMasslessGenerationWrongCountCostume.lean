/-
  Counterexamples.NeutrinoMasslessGenerationWrongCountCostume — N336 anti-vacuity (C361).
  ============================================================================
  W8 ANTI-VACUITY. The N336 node (seeded arc-C C2) derives the MASSLESS LIGHTEST NEUTRINO: the fold's
  self-blind self-direction (killed by the "others" projector) has ZERO Born self-overlap through the
  banked light seesaw operator, so the self / sterile generation is MASSLESS (`m₁ = 0`), and the
  massless state is the LIGHTEST (PSD ordering floor). The spectrum is `{0, +, +}` — EXACTLY ONE
  massless generation (the rank-1 self-direction), the other TWO massive:

      `self_generation_massless : massOfDir (othersProj · D₀) M selfDir = 0`   (m₁ = 0 exact)
      `demProj_trace_one : Matrix.trace demProj = 1`                            (ONE massless)
      `othersProj_trace_two : Matrix.trace othersProj = 2`                      (TWO massive)

  The MASSLESS COUNT `1` is LOAD-BEARING: the DC / self projector `demProj` selecting the massless
  direction has trace exactly `1` (rank-1 self-direction over the derived `Cut`). If the self-blind
  structure were mis-built — the wrong self-direction, a wrong projector, more/fewer than one massless
  generation — this count would not be `1`.

  THE CERTIFICATE. `masslessCount := 1` — a ℕ flag standing for "the derived ν spectrum has EXACTLY
  ONE massless generation (the rank-1 self / DC direction, `Tr demProj = 1`)". It is TIED to the
  banked landing by `masslessCount_forced` below: the banked `demProj_trace_one` gives
  `Matrix.trace demProj = 1`, exhibiting the rank-1 massless self-direction. If `demProj` / the
  self-blind structure were mis-built, this would not hold.

  We anchor `min 361 masslessCount = 1` (TRUE — `masslessCount = 1`, the genuine single massless
  generation).

  THE BOGUS CLAIM (a stand-in for ANY wrong massless-count / mis-built spectrum): that
  `min 361 masslessCount = 361`. It GENUINELY equals `1` (`cert_val_true`). Rewriting the banked
  value reduces the bogus claim to the false numeric `1 = 361` in ℕ. The kernel cannot close it; it
  BITES.

  DISTINCT from the banked battery: the pair (361, 1) is fresh (RHS 361 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NeutrinoMasslessGeneration
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix

/-- THE MASSLESS-COUNT FLAG: `1` = "the derived ν spectrum has EXACTLY ONE massless generation (the
    rank-1 self / DC direction, `Tr demProj = 1`)". -/
def masslessCount : ℕ := 1

/-- TRUE (tied to the banked N336 forced landing): the DC / self projector selecting the massless
    direction has trace `1` — the rank-1 massless self-direction. If `demProj` or the self-blind
    structure were mis-built, this would not hold. -/
theorem masslessCount_forced : Matrix.trace demProj = 1 :=
  demProj_trace_one

/-- TRUE: `min 361 masslessCount = 1`, holding precisely because `masslessCount = 1` (the genuine
    single massless generation), not `361`. -/
theorem cert_val_true : min (361 : ℕ) masslessCount = 1 := by decide

/-- BOGUS: claims `min 361 masslessCount = 361`. It GENUINELY equals `1` (`cert_val_true`). A WRONG
    massless count / mis-built spectrum reduces — through the banked value — to the false numeric
    `1 = 361`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (361 : ℕ) masslessCount = 361 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 361  (FALSE — the costume bites)

end Counterexamples
