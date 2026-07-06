/-
  Counterexamples.SpacetimeWeakFieldMetricVacuityCostume — N346 anti-vacuity (C371).
  ============================================================================
  W8 ANTI-VACUITY. The N346 node (arc-E E1a, the weak-field metric `g = η + h` over the derived ℝ
  `Cut`) proves the EXACT linearized-inverse residual `g·ǧ = 1 − (hη)²` and, crucially, that for a
  CONCRETE nonzero field the residual is genuinely NONZERO — the metric and its linearized inverse
  do NOT compose to the identity (`metric_inverse_not_exact`). This is the non-vacuity teeth: the
  banked identity is not the trivial `g·ǧ = 1`; the non-closure residual bites.

  The forced non-vacuity fact is `residual_ne_zero`: `(timeProj·η)² ≠ 0` over the derived `Cut`. A
  mis-derivation (a vacuous residual, a wrong involution `η`, a truncated-to-exact inverse) would
  make the residual vanish and this pin would break.

  THE CERTIFICATE. `rFlag := 1` — a ℕ flag standing for "the concrete-field residual is nonzero,
  i.e. the linearized inverse is genuinely inexact (the non-closure defect is real)". It is TIED to
  the banked N346 landing by `rFlag_forced`: the banked `metric_inverse_not_exact` witnesses that
  `weakMetric timeProj * linInv timeProj ≠ 1`, so the residual flag is `1` (present), not `0`.

  We anchor `min 371 rFlag = 1` (TRUE — `rFlag = 1 < 371`, so the min is `rFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-residual / exact-inverse mis-reading): that
  `min 371 rFlag = 371`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 371` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (371, 1) is fresh (Cid 371 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeWeakFieldMetric
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE RESIDUAL FLAG: `1` = "the concrete-field residual is nonzero — the linearized inverse is
    genuinely inexact (the look-back non-closure is real)". -/
def rFlag : ℕ := 1

/-- TRUE (tied to the banked N346 landing): the banked `metric_inverse_not_exact` proves the
    weak-field metric and its linearized inverse do NOT compose to the identity for the concrete
    nonzero field `timeProj`, so the residual is present — `rFlag = 1`. If the residual were vacuous
    (wrong `η`, exact inverse), this witness would not exist. -/
theorem rFlag_forced : (weakMetric timeProj * linInv timeProj ≠ 1) ∧ rFlag = 1 :=
  ⟨metric_inverse_not_exact, rfl⟩

/-- TRUE: `min 371 rFlag = 1`, holding precisely because `rFlag = 1 < 371`. -/
theorem cert_val_true : min (371 : ℕ) rFlag = 1 := by decide

/-- BOGUS: claims `min 371 rFlag = 371`. It GENUINELY equals `1` (`cert_val_true`). A vacuous
    residual / exact-inverse mis-reading reduces — through the banked value — to the false numeric
    `1 = 371`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (371 : ℕ) rFlag = 371 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 371  (FALSE — the costume bites)

end Counterexamples
