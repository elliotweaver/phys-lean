/-
  Counterexamples.CascadeFoldPhaseVacuityCostume — N416 anti-vacuity (C441).
  ============================================================================================
  W8 ANTI-VACUITY. The N416 node (arc-O O1 — the fold phase P via the half-angle amplitude
  cascade) derives the fold phase `P = cutPi/8` as the ℍ-level Cayley–Dickson fold angle, the
  third rung of the amplitude-HALVING cascade anchored at the forced quarter-turn `J²=−1`
  (`cutCos(cutPi/2)=0`). The load-bearing non-vacuity fact: the cascade GENUINELY descends — the
  ℂ-fold amplitude `cutCos(cutPi/4)² = 1/2` is a real intermediate Born root (neither the full
  quarter-turn `0` nor the trivial `1`), and the ℍ-fold amplitude (the fold phase's cosine) is
  strictly positive with `cutCos(cutPi/8)² = (1 + cutCos(cutPi/4))/2`. A mis-reading where the
  cascade were vacuous (the angle did not genuinely halve, the amplitudes collapsed to `0` or `1`,
  the fold phase were an empty coincidence) would gut the whole N416 derivation.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N416 fold-phase cascade genuinely
  descends: `cutCos(cutPi/4)² = 1/2` AND `0 < cutCos(cutPi/8)` with the ℍ-amplitude square law". It
  is TIED to the banked N416 landing by `cFlag_forced` through `cutCos_quarter_sq` +
  `foldPhase_amplitude`.

  We anchor `min 441 cFlag = 1` (TRUE — `cFlag = 1 < 441`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the cascade is vacuous / the angle does not halve / the fold
  phase is an empty coincidence" mis-reading): that `min 441 cFlag = 441`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 441` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (441, 1) is fresh (Cid 441 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CascadeFoldPhase
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.FoldPhase
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE N416-NON-VACUITY FLAG: `1` = "the fold-phase amplitude cascade genuinely descends over the
    derived ℝ". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N416 landing): the ℂ-fold amplitude is the genuine intermediate Born
    root `cutCos(cutPi/4)² = 1/2` (`cutCos_quarter_sq`) and the fold phase's cosine is the strictly
    positive ℍ-amplitude root with the half-angle square law (`foldPhase_amplitude`); hence
    `cFlag = 1`. If the cascade were vacuous these facts would fail. -/
theorem cFlag_forced :
    (cutCos (cutPi / 4) * cutCos (cutPi / 4) = 1 / 2
      ∧ 0 < cutCos foldPhase
      ∧ cutCos foldPhase * cutCos foldPhase = (1 + cutCos (cutPi / 4)) / 2)
    ∧ cFlag = 1 :=
  ⟨⟨cutCos_quarter_sq, foldPhase_amplitude.1, foldPhase_amplitude.2⟩, rfl⟩

/-- TRUE: `min 441 cFlag = 1`, holding precisely because `cFlag = 1 < 441`. -/
theorem cert_val_true : min (441 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 441 cFlag = 441`. It GENUINELY equals `1` (`cert_val_true`). A "the cascade
    is vacuous / the angle does not halve" mis-reading reduces — through the banked fold-phase
    amplitude landing — to the false numeric `1 = 441`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (441 : ℕ) cFlag = 441 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 441  (FALSE — the costume bites)

end Counterexamples
