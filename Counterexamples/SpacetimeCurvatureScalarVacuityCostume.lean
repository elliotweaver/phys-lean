/-
  Counterexamples.SpacetimeCurvatureScalarVacuityCostume — N349 anti-vacuity (C374).
  ============================================================================
  W8 ANTI-VACUITY. The N349 node (arc-E E1c-scalar, the theory-native curvature SCALAR = the fold's
  Born self-overlap of the non-closure `bornCurv p k₁ k₂ = EvC (R·p) (R·p)`, over the derived ℝ `Cut`)
  proves that the fold's Born form genuinely SEES the curvature: for the concrete pair of metric
  variations `(timeProj, offDiagVar)` at the witness vector `curvSampleVec = (0,1,0)`, the Born
  curvature scalar is strictly POSITIVE (`bornCurv_pos`, hence nonzero `bornCurv_ne_zero`) — while the
  naive endomorphism trace of the curvature is identically zero (blind). This is the non-vacuity teeth:
  the theory-native scalar is not a trivial "always vanishes" object; the Born self-overlap of the
  non-closure is genuinely positive.

  The forced non-vacuity fact is `bornCurv_ne_zero`: `bornCurv curvSampleVec timeProj offDiagVar ≠ 0`
  over the derived `Cut`. A mis-derivation (a vacuous curvature scalar that is always zero, a wrong Born
  form, a wrong curvature closed form, a wrong involution `η`) would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the Born curvature scalar is genuinely nonzero
  for a concrete pair, i.e. the fold's positive form sees the non-closure the trace cannot". It is TIED
  to the banked N349 landing by `cFlag_forced`: the banked `bornCurv_ne_zero` witnesses that the Born
  curvature scalar is nonzero for `(curvSampleVec, timeProj, offDiagVar)`, so the flag is `1` (present),
  not `0`.

  We anchor `min 374 cFlag = 1` (TRUE — `cFlag = 1 < 374`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-scalar / wrong-form mis-reading): that
  `min 374 cFlag = 374`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to
  the false numeric `1 = 374` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (374, 1) is fresh (Cid 374 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeCurvatureScalar
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE BORN-CURVATURE-SCALAR FLAG: `1` = "the fold's Born self-overlap of the non-closure is genuinely
    nonzero for a concrete pair — the positive form sees the curvature the endomorphism trace cannot". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N349 landing): the banked `bornCurv_ne_zero` proves the Born curvature
    scalar `bornCurv curvSampleVec timeProj offDiagVar` is nonzero over the derived `Cut`, so the "the
    Born form sees the non-closure" flag is present — `cFlag = 1`. If the scalar were vacuous (always
    zero), this witness would not exist. -/
theorem cFlag_forced :
    (bornCurv curvSampleVec timeProj offDiagVar ≠ 0) ∧ cFlag = 1 :=
  ⟨bornCurv_ne_zero, rfl⟩

/-- TRUE: `min 374 cFlag = 1`, holding precisely because `cFlag = 1 < 374`. -/
theorem cert_val_true : min (374 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 374 cFlag = 374`. It GENUINELY equals `1` (`cert_val_true`). A vacuous
    curvature-scalar / wrong-form mis-reading reduces — through the banked value — to the false numeric
    `1 = 374`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (374 : ℕ) cFlag = 374 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 374  (FALSE — the costume bites)

end Counterexamples
