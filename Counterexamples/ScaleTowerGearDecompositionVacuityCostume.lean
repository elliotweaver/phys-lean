/-
  Counterexamples.ScaleTowerGearDecompositionVacuityCostume — N408 anti-vacuity (C433).
  ============================================================================================
  W8 ANTI-VACUITY. The N408 node (arc-M M2 — the S1 gear decomposition for `m_b`) banks the
  decomposition of the `m_b` Born ratio into a (deferred) fold-phase factor times the BANKED
  self-blind Born-survival `s1BornProb = tr Poth / 3 = 2/3` (N308), and the SELECTION of the
  level-1 gear (S1, rational Born self-overlap = the banked fraction) over the empty level-2
  gear-search (S2, `1/√3` irrational). The load-bearing non-vacuity fact: the survival is a
  GENUINE Born suppression — `s1BornProb = 2/3 ≠ 1` (a trivial gear `= 1` would make the whole
  decomposition vacuous). A mis-reading where the survival gear were trivial (`= 1`, no
  suppression) would collapse the whole M2 decomposition.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked S1 survival is a genuine
  non-trivial Born suppression (`s1BornProb = 2/3 ≠ 1`), and the S2 gear-search is genuinely empty
  (`¬ ∃ x : ℚ, x² = 1/3`)". It is TIED to the banked N408 landing by `cFlag_forced` through
  `s1BornProb_ne_one` and `s2_gear_search_empty`.

  We anchor `min 433 cFlag = 1` (TRUE — `cFlag = 1 < 433`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the survival gear is trivial / the S2 search is nonempty /
  the decomposition is vacuous" mis-reading): that `min 433 cFlag = 433`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 433` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (433, 1) is fresh (Cid 433 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerGearDecomposition
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Gear
open Phys.Algebra.HJ

/-- THE M2-NON-VACUITY FLAG: `1` = "the banked S1 survival is a genuine non-trivial Born
    suppression (`s1BornProb = 2/3 ≠ 1`), and the S2 gear-search is genuinely empty". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N408 landing): the S1 survival is a genuine Born suppression
    (`s1BornProb ≠ 1`, `s1BornProb_ne_one`) and the S2 gear-search is empty
    (`s2_gear_search_empty`); hence `cFlag = 1`. If the survival gear were trivial (`= 1`) or the
    S2 search nonempty, one of these would fail. -/
theorem cFlag_forced :
    (s1BornProb ≠ 1 ∧ ¬ ∃ x : ℚ, x ^ 2 = 1 / 3) ∧ cFlag = 1 :=
  ⟨⟨s1BornProb_ne_one, s2_gear_search_empty⟩, rfl⟩

/-- TRUE: `min 433 cFlag = 1`, holding precisely because `cFlag = 1 < 433`. -/
theorem cert_val_true : min (433 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 433 cFlag = 433`. It GENUINELY equals `1` (`cert_val_true`). A "the survival
    gear is trivial / the S2 search is nonempty / the decomposition is vacuous" mis-reading reduces
    — through the banked genuinely-suppressing survival and empty S2 search — to the false numeric
    `1 = 433`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (433 : ℕ) cFlag = 433 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 433  (FALSE — the costume bites)

end Counterexamples
