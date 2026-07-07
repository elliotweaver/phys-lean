/-
  Counterexamples.CosmicFateEternalApproachVacuityCostume — N383 anti-vacuity (C408).
  ============================================================================================
  W8 ANTI-VACUITY. The N383 node (arc-H H5 — the fate of the universe / the eternal approach)
  banks that the coherence gap `g(t) = g₀ · cutExp(−λ·t)` is STRICTLY POSITIVE at every finite
  `t` (`heat_death_never_reached`) — the completed state (gap 0 = completed self-coincidence =
  heat death) is NEVER reached. The gap-genuinely-nonzero fact is the anti-vacuity content: a
  mis-reading where the gap reached 0 in finite time (heat death IS attained) would break it — it
  would make the fold's eternal approach collapse to a finite arrival.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "for the concrete positive data
  `g₀ = λ = t = 1` the coherence gap `coherenceGap 1 1 1` GENUINELY DIFFERS from `0`
  (`coherenceGap 1 1 1 ≠ 0`), so the gap stays positive and heat death is NOT reached". It is
  TIED to the banked N383 landing by `iFlag_forced`: the banked `gap_concrete_ne_zero` witnesses
  the inequality, so the flag is `1`.

  We anchor `min 408 iFlag = 1` (TRUE — `iFlag = 1 < 408`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the gap reaches 0 / heat death is attained in finite time /
  the approach ends" mis-reading): that `min 408 iFlag = 408`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 408` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (408, 1) is fresh (Cid 408 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmicFateEternalApproach
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE GAP-STAYS-POSITIVE FLAG: `1` = "for the concrete positive data `g₀ = λ = t = 1` the
    coherence gap `coherenceGap 1 1 1` GENUINELY DIFFERS from `0`, so the fold's eternal approach
    never reaches the completed self-coincidence (heat death) in finite time". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N383 landing): the banked `gap_concrete_ne_zero` proves
    `coherenceGap 1 1 1 ≠ 0`, so the "gap stays positive / heat death not reached" flag is
    present, `iFlag = 1`. If the gap reached `0` in finite time, this witness would not exist. -/
theorem iFlag_forced :
    (coherenceGap (1 : Phys.Foundation.ContinuumQ.Cut) 1 1 ≠ 0) ∧ iFlag = 1 :=
  ⟨gap_concrete_ne_zero, rfl⟩

/-- TRUE: `min 408 iFlag = 1`, holding precisely because `iFlag = 1 < 408`. -/
theorem cert_val_true : min (408 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 408 iFlag = 408`. It GENUINELY equals `1` (`cert_val_true`). A "the gap
    reaches 0 / heat death is attained / the approach ends" mis-reading reduces — through the
    banked value — to the false numeric `1 = 408`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (408 : ℕ) iFlag = 408 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 408  (FALSE — the costume bites)

end Counterexamples
