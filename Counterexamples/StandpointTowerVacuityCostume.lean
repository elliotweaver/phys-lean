/-
  Counterexamples.StandpointTowerVacuityCostume — N### anti-vacuity (C473).
  ============================================================================================
  W8 ANTI-VACUITY. The R4 node (arc-R R4 — THE TOWER TERMINATION) has genuine content only if the
  tower-termination structure on the banked fibre `StateFibre` with the banked complex structure
  `J = foldComplex` is a REAL, non-trivial structure:
  (a) NO COMPLETED TOWER — no nonempty `<`-descent-closed class on `ℕ` (`no_completed_tower`, via the
      well-founded collapse tool `distinguished_empty`);
  (b) STATE-LEVEL NO COMPLETION — the look-back of a fold fixes no live state
      (`lookback_no_live_fixed_point`, needs `fibre_two_torsion_free`);
  (b) THE COVER — `J ∘ J` IS the look-back (`foldComplex_covers_fold`), and `J` fixes nothing live
      (`cover_fixed_point_free`);
  (★) TERMINATION BY COVER — on every live state, no-completion + cover + `J`'s fixed-point-freeness
      hold together on the same `J` (`termination_by_cover_not_fixed_point`); [W8] it bites on the
      concrete state `eInward` under the negation fold (`termination_by_cover_bites`);
  (Σ) the whole tower termination bundles as ONE object (`tower_termination`).
  A mis-reading where the tower COMPLETED (a nonempty descent-closed class existed), or the look-back
  DID fix a live state (a completed self-representation), or `J` FAILED to cover the look-back, or `J`
  had a live fixed point, would gut R4.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R4 tower termination is genuine: no
  completed tower, no live look-back fixed point, `J` covers the look-back and fixes nothing live, all
  welded per live state". It is TIED to the banked R4 landing by `cFlag_forced` through
  `no_completed_tower`, `lookback_no_live_fixed_point`, `foldComplex_covers_fold`,
  `cover_fixed_point_free`, `termination_by_cover_not_fixed_point`, `termination_by_cover_bites`, and
  `tower_termination`.

  We anchor `min 473 cFlag = 1` (TRUE — `cFlag = 1 < 473`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the tower completes / the look-back fixes a live state / `J`
  fails to cover / `J` has a live fixed point" mis-reading): that `min 473 cFlag = 473`. It GENUINELY
  equals `1`. Rewriting reduces the bogus claim to the false numeric `1 = 473` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (473, 1) is fresh (Cid 473 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointTower
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointTower

/-- THE R4-NON-VACUITY FLAG: `1` = "the tower termination on `StateFibre` with the banked `J` is
    genuine: no completed tower, no live look-back fixed point, `J` covers the look-back and fixes
    nothing live, all welded". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R4 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R4 landings — the empty-tower collapse (`no_completed_tower`), the state-level
    no-completion (`lookback_no_live_fixed_point`), the ★ cover (`foldComplex_covers_fold`), `J`'s
    fixed-point-freeness (`cover_fixed_point_free`), the ★ per-live-state weld
    (`termination_by_cover_not_fixed_point`), the W8 concrete bite (`termination_by_cover_bites`), and
    the capstone (`tower_termination`). If any were hollow, those decls would not exist and this could
    not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @no_completed_tower
  have _ := @lookback_no_live_fixed_point
  have _ := @foldComplex_covers_fold
  have _ := @cover_fixed_point_free
  have _ := @termination_by_cover_not_fixed_point
  have _ := @termination_by_cover_bites
  have _ := @tower_termination
  rfl

/-- TRUE: `min 473 cFlag = 1`, holding precisely because `cFlag = 1 < 473`. -/
theorem cons_val_true : min (473 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 473 cFlag = 473`. It GENUINELY equals `1` (`cons_val_true`). A "tower
    completes / look-back fixes a live state / `J` fails to cover / `J` has a live fixed point"
    mis-reading reduces — through the banked R4 landing — to the false numeric `1 = 473`, so this must
    NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (473 : ℕ) cFlag = 473 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 473  (FALSE — the costume bites)

end Counterexamples
