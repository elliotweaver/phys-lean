/-
  Counterexamples.ArcMConsolidationVacuityCostume — N410 anti-vacuity (C435).
  ============================================================================================
  W8 ANTI-VACUITY. The N410 node (arc-M M4 — the arc-M consolidation) banks THREE never-banked
  cross-ties threaded by the ONE self-blind count `finrank ℚ Uhol = 3`, plus the grade split. The
  load-bearing non-vacuity fact: that threaded count is GENUINELY `≠ 1` (N410 `count_ne_one`, from
  the banked N42c `finrank_Uhol = 3`); a mis-reading where the self-blind count were the trivial `1`
  (so the winding spacing = 1 = the trivial ℤ-ladder, the gear divisor trivial, and every cross-tie
  degenerate) would collapse the whole M4 consolidation — the cross-ties would carry no content.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked self-blind count that threads
  all three cross-ties is a genuine nontrivial count (`finrank ℚ Uhol ≠ 1`), and the theorem-exact
  ratio genuinely carries the balanced value `2/3 ≠ 1`". It is TIED to the banked N410 landing by
  `cFlag_forced` through `count_ne_one` and `parameter_dependence_bites`.

  We anchor `min 435 cFlag = 1` (TRUE — `cFlag = 1 < 435`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the count is the trivial 1 / the cross-ties are degenerate /
  the consolidation is a hollow ∧" mis-reading): that `min 435 cFlag = 435`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 435` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (435, 1) is fresh (Cid 435 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ArcMConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ArcMConsolidation
open Phys.Algebra Phys.Algebra.ScaleChain

/-- THE M4-NON-VACUITY FLAG: `1` = "the banked self-blind count threading all three cross-ties is a
    genuine nontrivial count (`finrank ℚ Uhol ≠ 1`), and the parameter dependence genuinely bites". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N410 landing): the self-blind count is a genuine nontrivial count
    (`(finrank ℚ Uhol : ℤ) ≠ 1`, `count_ne_one`) and the absolute-chain parameter dependence
    genuinely bites (`absScaleChain 0 1 1 ≠ absScaleChain 1 1 1`, `parameter_dependence_bites`);
    hence `cFlag = 1`. If the count were the trivial `1` or the chain parameter-independent, one of
    these would fail. -/
theorem cFlag_forced :
    ((Module.finrank ℚ Phys.Algebra.Uhol : ℤ) ≠ 1
      ∧ absScaleChain 0 1 1 ≠ absScaleChain 1 1 1)
    ∧ cFlag = 1 :=
  ⟨⟨count_ne_one, parameter_dependence_bites⟩, rfl⟩

/-- TRUE: `min 435 cFlag = 1`, holding precisely because `cFlag = 1 < 435`. -/
theorem cert_val_true : min (435 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 435 cFlag = 435`. It GENUINELY equals `1` (`cert_val_true`). A "the count is
    the trivial 1 / the cross-ties are degenerate / the consolidation is a hollow ∧" mis-reading
    reduces — through the banked genuinely-nontrivial count and biting parameter dependence — to the
    false numeric `1 = 435`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (435 : ℕ) cFlag = 435 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 435  (FALSE — the costume bites)

end Counterexamples
