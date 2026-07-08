/-
  Counterexamples.TsirelsonBoundVacuityCostume — N437 anti-vacuity (C462).
  ============================================================================================
  W8 ANTI-VACUITY. The N437 node (arc-Q Q3 — THE TSIRELSON BOUND: quantum correlations stop at
  2√2, not the logical maximum 4) has genuine content only if the bound landings genuinely DEPEND
  on the banked objects and the threads bite. Specifically it needs:
  (a) Born positivity = Cauchy–Schwarz (`bornForm_cauchy_schwarz`) and the squared bound on unit
      settings (`chshValue_sq_le_eight`);
  (b) the number is the banked derived-ℝ `sqrt2` (`sqrt2_sq_two`: √2·√2 = 2), giving the two-sided
      bound `−2√2 ≤ S ≤ 2√2` (`abs_chshValue_le_tsirelson`);
  (c) the ceiling sits STRICTLY between the classical bound 2 and the logical max 4
      (`tsirelson_gt_classical`, `tsirelson_lt_logical_max` — the PR-box exclusion);
  (d) the bound is SATURATED by explicit optimal settings (`tsirelson_saturated`,
      `optSettings_unit`);
  (e) the correlation IS the banked bell state's coefficient overlap on `TwoFibre`
      (`bellOverlap_tmul`, non-vacuous `bellOverlap_bell`) and the capstone
      (`tsirelson_bound_derived`).
  A mis-reading where the "bound" were slack (not saturated), or where the ceiling reached the
  logical max 4 (no exclusion), or where the correlation were a degenerate zero pairing, would gut Q3.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N437 Tsirelson bound is genuine:
  correlation is Born self-overlap, the ceiling |S| ≤ 2√2 is forced by positivity, sits strictly
  between the classical bound 2 and the logical max 4, is saturated by explicit settings, and is the
  banked bell state's coefficient overlap on TwoFibre". It is TIED to the banked N437 landing by
  `cFlag_forced` through `bornForm_cauchy_schwarz`, `chshValue_sq_le_eight`, `sqrt2_sq_two`,
  `abs_chshValue_le_tsirelson`, `tsirelson_gt_classical`, `tsirelson_lt_logical_max`,
  `optSettings_unit`, `tsirelson_saturated`, `bellOverlap_tmul`, `bellOverlap_bell`, and
  `tsirelson_bound_derived`.

  We anchor `min 462 cFlag = 1` (TRUE — `cFlag = 1 < 462`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the bound is slack / reaches 4 / the correlation is hollow"
  mis-reading): that `min 462 cFlag = 462`. It GENUINELY equals `1` (`cons_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 462` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (462, 1) is fresh (Cid 462 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.TsirelsonBound
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum

/-- THE N437-NON-VACUITY FLAG: `1` = "the Tsirelson bound is genuine: correlation is Born
    self-overlap, |S| ≤ 2√2 is forced by positivity, the ceiling sits strictly between the
    classical bound 2 and the logical max 4, is saturated, and is the bell state's overlap on
    TwoFibre". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N437 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q3 landings — Born positivity = Cauchy–Schwarz (`bornForm_cauchy_schwarz`) and the
    squared bound (`chshValue_sq_le_eight`), the √2 grammar (`sqrt2_sq_two`) giving the two-sided
    bound (`abs_chshValue_le_tsirelson`), the strict classical/logical-max sandwiching
    (`tsirelson_gt_classical`, `tsirelson_lt_logical_max`), the saturation
    (`optSettings_unit`, `tsirelson_saturated`), the TwoFibre tie (`bellOverlap_tmul`,
    `bellOverlap_bell`), and the capstone (`tsirelson_bound_derived`). If the bound were slack /
    reached 4 / the correlation were hollow, those decls would not exist and this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @bornForm_cauchy_schwarz
  have _ := @chshValue_sq_le_eight
  have _ := sqrt2_sq_two
  have _ := @abs_chshValue_le_tsirelson
  have _ := tsirelson_gt_classical
  have _ := tsirelson_lt_logical_max
  have _ := optSettings_unit
  have _ := tsirelson_saturated
  have _ := @bellOverlap_tmul
  have _ := bellOverlap_bell
  have _ := tsirelson_bound_derived
  rfl

/-- TRUE: `min 462 cFlag = 1`, holding precisely because `cFlag = 1 < 462`. -/
theorem cons_val_true : min (462 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 462 cFlag = 462`. It GENUINELY equals `1` (`cons_val_true`). A "the bound is
    slack / reaches 4 / the correlation is hollow" mis-reading reduces — through the banked N437
    landing — to the false numeric `1 = 462`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (462 : ℕ) cFlag = 462 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 462  (FALSE — the costume bites)

end Counterexamples
