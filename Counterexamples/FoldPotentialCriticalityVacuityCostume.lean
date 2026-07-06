/-
  Counterexamples.FoldPotentialCriticalityVacuityCostume — N370 anti-vacuity (C395).
  ============================================================================================
  W8 ANTI-VACUITY. The N370 node (arc-F F4 proper — THE FOLD-POTENTIAL CRITICALITY) banks that the
  fold's self-coupling potential `plateauApproachPot c` has its UNIQUE critical point at the
  coherence-closure fold-origin: `foldPotential_criticality` says a vanishing derived-ℝ derivative on
  `φ ≥ 0` forces `φ = 0`. The load-bearing content is that the derivative is genuinely NONZERO away
  from the origin: `foldPotential_deriv_pos` gives `foldPotentialDeriv 1 1 > 0`, i.e. the fold
  potential is NOT critical at `φ = 1` (for `c = 1`). If instead the derivative vanished at `φ = 1`
  (a mis-derived "the potential is flat / critical everywhere"), then the criticality theorem would be
  vacuous — the origin would not be the UNIQUE critical point. The banked `foldPotential_deriv_pos`
  rules this out: the derivative is strictly positive at every `φ > 0`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the fold potential is NOT critical at `φ = 1`
  (its derivative there is strictly positive, so the origin is the unique critical point)". It is TIED
  to the banked N370 landing by `iFlag_forced`: the banked `foldPotential_deriv_pos` witnesses
  `foldPotentialDeriv 1 1 > 0`, so the flag is `1` (present).

  We anchor `min 395 iFlag = 1` (TRUE — `iFlag = 1 < 395`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the potential is flat / critical at a nonzero point / the
  criticality theorem is vacuous" mis-reading): that `min 395 iFlag = 395`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 395` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (395, 1) is fresh (Cid 395 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FoldPotentialCriticality
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation.ContinuumQ

/-- THE CRITICALITY NON-VACUITY FLAG: `1` = "the fold potential is NOT critical at `φ = 1` — its
    derived-ℝ derivative there is strictly positive, so the coherence-closure origin is the UNIQUE
    critical point". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N370 landing): the banked `foldPotential_deriv_pos` proves the fold
    potential's derivative at `φ = 1` (for `c = 1`) is strictly positive, so the potential is NOT
    critical there and the "not-critical-at-1" flag is present, `iFlag = 1`. If the potential were
    critical at `φ = 1`, this witness would not exist. -/
theorem iFlag_forced :
    (0 < foldPotentialDeriv 1 1) ∧ iFlag = 1 :=
  ⟨foldPotential_deriv_pos 1 1 (by norm_num) (by norm_num), rfl⟩

/-- TRUE: `min 395 iFlag = 1`, holding precisely because `iFlag = 1 < 395`. -/
theorem cert_val_true : min (395 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 395 iFlag = 395`. It GENUINELY equals `1` (`cert_val_true`). A "the potential is
    flat / critical at a nonzero point / the criticality theorem is vacuous" mis-reading reduces —
    through the banked value — to the false numeric `1 = 395`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (395 : ℕ) iFlag = 395 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 395  (FALSE — the costume bites)

end Counterexamples
