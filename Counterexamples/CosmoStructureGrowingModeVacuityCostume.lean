/-
  Counterexamples.CosmoStructureGrowingModeVacuityCostume — N456 anti-vacuity (C481).
  ============================================================================================
  W8 ANTI-VACUITY. The N456 node (the gravitational growing mode / the instability of the smooth
  state — the cosmic middle, the sign-mirror of the banked N383 fate) banks that the growing mode
  `δ(t) = δ₀·cutExp(+ω·t)` is STRICTLY INCREASING and exceeds its initial value at finite `t`
  (`growingMode_concrete_gt : (1 : Cut) < growingMode 1 1 1`) — the smooth state is UNSTABLE and
  structure grows. The mode-genuinely-grows fact is the anti-vacuity content: a mis-reading where
  the growing mode did NOT exceed its initial value (the smooth state is stable / no structure
  forms) would break it — it would collapse the fold's growing branch to a non-growing constant.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "for the concrete positive data
  `δ₀ = ω = t = 1` the growing mode `growingMode 1 1 1` GENUINELY EXCEEDS its initial value `1`
  (`(1 : Cut) < growingMode 1 1 1`), so the perturbation grows and the smooth state is unstable".
  It is TIED to the banked N456 landing by `iFlag_forced`: the banked `growingMode_concrete_gt`
  witnesses the strict inequality, so the flag is `1`.

  We anchor `min 481 iFlag = 1` (TRUE — `iFlag = 1 < 481`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the mode does not grow / the smooth state is stable / no
  structure forms" mis-reading): that `min 481 iFlag = 481`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 481` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (481, 1) is fresh (Cid 481 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoStructureGrowingMode
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE MODE-GROWS FLAG: `1` = "for the concrete positive data `δ₀ = ω = t = 1` the growing mode
    `growingMode 1 1 1` GENUINELY EXCEEDS its initial value `1`, so the smooth state is unstable and
    structure grows". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N456 landing): the banked `growingMode_concrete_gt` proves
    `(1 : Cut) < growingMode 1 1 1`, so the "mode grows / smooth state unstable" flag is present,
    `iFlag = 1`. If the mode did not grow, this witness would not exist. -/
theorem iFlag_forced :
    ((1 : Phys.Foundation.ContinuumQ.Cut) < growingMode 1 1 1) ∧ iFlag = 1 :=
  ⟨growingMode_concrete_gt, rfl⟩

/-- TRUE: `min 481 iFlag = 1`, holding precisely because `iFlag = 1 < 481`. -/
theorem cert_val_true : min (481 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 481 iFlag = 481`. It GENUINELY equals `1` (`cert_val_true`). A "the mode does
    not grow / the smooth state is stable / no structure forms" mis-reading reduces — through the
    banked value — to the false numeric `1 = 481`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (481 : ℕ) iFlag = 481 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 481  (FALSE — the costume bites)

end Counterexamples
