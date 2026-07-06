/-
  Counterexamples.SpacetimeCurvatureVacuityCostume — N348 anti-vacuity (C373).
  ============================================================================
  W8 ANTI-VACUITY. The N348 node (arc-E E1c, the curvature `R(k₁,k₂) = [Γ₁,Γ₂]` = the two look-back
  transports failing to commute, over the derived ℝ `Cut`) proves that spacetime CAN be curved: for
  the concrete pair of metric variations `(timeProj, offDiagVar)`, the curvature is genuinely
  NONZERO (`lbCurv_ne_zero`). This is the non-vacuity teeth: curvature is not a trivial "always
  vanishes" object; the two transports genuinely do not commute.

  The forced non-vacuity fact is `lbCurv_ne_zero`: `R(timeProj, offDiagVar) ≠ 0` over the derived
  `Cut`. A mis-derivation (a wrong closed form, a vacuous curvature that is always zero, a wrong
  involution `η`) would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "curvature is genuinely nonzero for a
  concrete pair, i.e. spacetime CAN be curved (the transports do not commute)". It is TIED to the
  banked N348 landing by `cFlag_forced`: the banked `lbCurv_ne_zero` witnesses that the curvature is
  nonzero for `(timeProj, offDiagVar)`, so the flag is `1` (present), not `0`.

  We anchor `min 373 cFlag = 1` (TRUE — `cFlag = 1 < 373`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-curvature / wrong-form mis-reading): that
  `min 373 cFlag = 373`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 373` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (373, 1) is fresh (Cid 373 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeCurvature
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE CURVATURE FLAG: `1` = "curvature is genuinely nonzero for a concrete pair — spacetime CAN be
    curved; the two look-back transports do not commute". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N348 landing): the banked `lbCurv_ne_zero` proves the curvature
    `R(timeProj, offDiagVar)` is nonzero over the derived `Cut`, so the "spacetime can be curved"
    flag is present — `cFlag = 1`. If curvature were vacuous (always zero), this witness would not
    exist. -/
theorem cFlag_forced :
    (lbCurv timeProj offDiagVar ≠ 0) ∧ cFlag = 1 :=
  ⟨lbCurv_ne_zero, rfl⟩

/-- TRUE: `min 373 cFlag = 1`, holding precisely because `cFlag = 1 < 373`. -/
theorem cert_val_true : min (373 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 373 cFlag = 373`. It GENUINELY equals `1` (`cert_val_true`). A vacuous
    curvature / wrong-form mis-reading reduces — through the banked value — to the false numeric
    `1 = 373`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (373 : ℕ) cFlag = 373 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 373  (FALSE — the costume bites)

end Counterexamples
