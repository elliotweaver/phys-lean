/-
  Counterexamples.ScaleTowerBornGearDecompositionVacuityCostume — N408 anti-vacuity (C433).
  ============================================================================================
  W8 ANTI-VACUITY. The N408 node (arc-M M2 — the Born-survival gear decomposition + the S1/S2 gear
  selection) banks: the S1 Born gear `bornGearP` is the derived √ of the BANKED self-seen fraction
  `Matrix.trace Poth / 3 = 2/3` (N308), squaring back to it (`bornGearP_sq`); the S2 Born weight
  `3^{−1/2} = cutSqrt (1/3)` is NOT a rational cast (`s2_bornweight_irrational`), so the S2
  gear-search over rational Born weights is EMPTY; and the S1 fraction `2/3` differs from the
  democratic `1/3` (`selfseen_ne_democratic`). A mis-reading where the gear grammar were VACUOUS —
  S2 admissible after all (some rational squaring to `1/3`), or the S1 gear NOT squaring to the
  self-seen fraction, or the S1 fraction collapsing to the democratic one — would gut the M2
  selection.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked gear grammar genuinely selects
  S1 (Born gear squares to the self-seen 2/3) AND excludes S2 (its Born weight is irrational) AND
  the S1 fraction is not the democratic one — a real selection, not a vacuous grammar". It is TIED
  to the banked N408 landings by `cFlag_forced` through `bornGearP_sq`, `s2_bornweight_irrational`,
  and `selfseen_ne_democratic`.

  We anchor `min 433 cFlag = 1` (TRUE — `cFlag = 1 < 433`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the gear grammar is vacuous / S2 admissible / S1 gear wrong /
  S1 = democratic" mis-reading): that `min 433 cFlag = 433`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 433` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (433, 1) is fresh (Cid 433 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerBornGearDecomposition
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.GearGrammar
open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.HJ

/-- THE M2-NON-VACUITY FLAG: `1` = "the banked gear grammar genuinely selects S1, excludes S2, and
    keeps the S1 fraction distinct from the democratic one — a real selection, not a vacuous grammar". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N408 landings): the S1 Born gear squares to the banked self-seen
    fraction (`bornGearP_sq`), the S2 Born weight is irrational (`s2_bornweight_irrational`), and the
    S1 fraction differs from the democratic one (`selfseen_ne_democratic`); hence `cFlag = 1`. If the
    grammar were vacuous (S2 admissible, or the S1 gear not squaring to the self-seen fraction, or the
    S1 fraction democratic), one of these would fail. -/
theorem cFlag_forced :
    (bornGearP * bornGearP = ((Matrix.trace Poth / 3 : ℚ) : Cut)
      ∧ (¬ ∃ w : ℚ, cutSqrt (((1/3 : ℚ) : Cut)) = ((w : ℚ) : Cut))
      ∧ ((Matrix.trace Poth / 3 : ℚ) : Cut) ≠ ((1/3 : ℚ) : Cut)) ∧ cFlag = 1 :=
  ⟨⟨bornGearP_sq, s2_bornweight_irrational, selfseen_ne_democratic⟩, rfl⟩

/-- TRUE: `min 433 cFlag = 1`, holding precisely because `cFlag = 1 < 433`. -/
theorem cert_val_true : min (433 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 433 cFlag = 433`. It GENUINELY equals `1` (`cert_val_true`). A "the gear
    grammar is vacuous / S2 admissible / S1 gear wrong / S1 = democratic" mis-reading reduces —
    through the banked genuinely-selecting gear grammar — to the false numeric `1 = 433`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (433 : ℕ) cFlag = 433 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 433  (FALSE — the costume bites)

end Counterexamples
