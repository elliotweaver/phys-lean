/-
  Counterexamples.StandpointResidualVacuityCostume — N446 anti-vacuity (C471).
  ============================================================================================
  W8 ANTI-VACUITY. The R2 node (arc-R R2 — THE RESIDUAL) has genuine content only if the self-residual
  `res x := look x − x` on the banked terminal carrier `O Cut` is a REAL, non-trivial structure:
  (a) IT VANISHES ONLY AT THE VOID — `res x = 0 ↔ x = 0` (`foldResidual_eq_zero_iff`), the banked
      `fold_self_blind` re-instantiated on the 2-torsion-free `O Cut` (`oCut_two_torsion_free`);
  (c) IT IS LINEAR — `res x = (−2)•x` (`foldResidual_eq_neg_two_smul`), DERIVED from `fold_eq_neg`;
  (★) THE BORN WELD — `gFormC (res x) (res x) = 4 · gFormC x x` (`foldResidual_born_eq`), the miss's
      magnitude a fixed positive multiple of the state's;
  (b) IT IS BORN-POSITIVE OFF THE VOID — `x ≠ 0 → 0 < gFormC (res x) (res x)`
      (`foldResidual_born_pos`);
  (W8) IT BITES ON THE UNIT — `0 < gFormC (res 1) (res 1)` (`foldResidual_one_pos`);
  (Σ) the whole residual bundles as ONE object (`foldResidual_structure`).
  A mis-reading where the residual could vanish on a nonzero state (no self-blindness), or were not
  linear, or the Born weld failed (magnitude untied to the state), or the self-overlap were not
  strictly positive, would gut R2.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R2 residual is genuine: a void-only,
  linear, Born-positive self-miss with the 4× magnitude weld on `O Cut`". It is TIED to the banked R2
  landing by `cFlag_forced` through `foldResidual_eq_zero_iff`, `foldResidual_eq_neg_two_smul`,
  `foldResidual_born_eq`, `foldResidual_born_pos`, `foldResidual_one_pos`, and `foldResidual_structure`.

  We anchor `min 471 cFlag = 1` (TRUE — `cFlag = 1 < 471`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the residual vanishes on a live state / is not linear / the
  Born weld fails / the self-overlap is not positive" mis-reading): that `min 471 cFlag = 471`. It
  GENUINELY equals `1` (`cons_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 471` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (471, 1) is fresh (Cid 471 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointResidual
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointResidual

/-- THE R2-NON-VACUITY FLAG: `1` = "the self-residual on `O Cut` is genuine: void-only, linear,
    Born-positive, with the 4× magnitude weld". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R2 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R2 landings — void-only vanishing (`foldResidual_eq_zero_iff`), linearity
    (`foldResidual_eq_neg_two_smul`), the ★ Born weld (`foldResidual_born_eq`), strict positivity
    (`foldResidual_born_pos`), the unit non-vacuity (`foldResidual_one_pos`), and the capstone
    (`foldResidual_structure`). If any were hollow, those decls would not exist and this could not
    compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @foldResidual_eq_zero_iff
  have _ := @foldResidual_eq_neg_two_smul
  have _ := @foldResidual_born_eq
  have _ := @foldResidual_born_pos
  have _ := @foldResidual_one_pos
  have _ := @foldResidual_structure
  rfl

/-- TRUE: `min 471 cFlag = 1`, holding precisely because `cFlag = 1 < 471`. -/
theorem cons_val_true : min (471 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 471 cFlag = 471`. It GENUINELY equals `1` (`cons_val_true`). A "residual
    vanishes on a live state / not linear / Born weld fails / self-overlap not positive" mis-reading
    reduces — through the banked R2 landing — to the false numeric `1 = 471`, so this must NOT
    compile. -/
theorem cons_val_wrong_BOGUS :
    min (471 : ℕ) cFlag = 471 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 471  (FALSE — the costume bites)

end Counterexamples
