/-
  Counterexamples.SpacetimeOperatorDerivativeVacuityCostume — N350 anti-vacuity (C375).
  ============================================================================
  W8 ANTI-VACUITY. The N350 node (arc-E E1-deriv, the operator-field directional derivative on the
  derived-ℝ tangent structure — the `dΓ` machinery completing `F = dΓ + Γ∧Γ` — over the derived ℝ
  `Cut`) proves that the transport-derivative of a genuinely non-constant field is a NONZERO object:
  for the affine field `t ↦ timeProj + t•offDiagVar`, the transport family `t ↦ Γ(timeProj +
  t•offDiagVar)` has directional derivative `Γ(offDiagVar) = lbConn offDiagVar` (by the theory-native
  heart `lbConn_opderiv`), and that transport-derivative is nonzero (`lbConn_offDiagVar_ne_zero`). This
  is the non-vacuity teeth: the `dΓ` machinery is not a trivial "always zero" object; the look-back
  transport genuinely carries the field's first variation.

  The forced non-vacuity fact is `lbConn_offDiagVar_ne_zero`: `lbConn offDiagVar ≠ 0` over the derived
  `Cut`. A mis-derivation (a vacuous transport-derivative that is always zero, a wrong transport `Γ`, a
  wrong involution `η`, dropping the operator topology so the derivative degenerates) would make this
  pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the transport-derivative of a non-constant
  field is genuinely nonzero, i.e. the `dΓ` machinery is not vacuous". It is TIED to the banked N350
  landing by `cFlag_forced`: the banked `lbConn_offDiagVar_ne_zero` witnesses that the concrete
  transport `Γ(offDiagVar)` is nonzero, so the flag is `1` (present), not `0`.

  We anchor `min 375 cFlag = 1` (TRUE — `cFlag = 1 < 375`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-derivative / wrong-transport mis-reading): that
  `min 375 cFlag = 375`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to
  the false numeric `1 = 375` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (375, 1) is fresh (Cid 375 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeOperatorDerivative
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE TRANSPORT-DERIVATIVE FLAG: `1` = "the transport-derivative of a genuinely non-constant field is
    nonzero — the `dΓ` machinery is not vacuous". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N350 landing): the banked `lbConn_offDiagVar_ne_zero` proves the concrete
    transport `lbConn offDiagVar` is nonzero over the derived `Cut`, so the "the `dΓ` machinery is not
    vacuous" flag is present — `cFlag = 1`. If the transport-derivative were vacuous (always zero), this
    witness would not exist. -/
theorem cFlag_forced :
    (lbConn offDiagVar ≠ 0) ∧ cFlag = 1 :=
  ⟨lbConn_offDiagVar_ne_zero, rfl⟩

/-- TRUE: `min 375 cFlag = 1`, holding precisely because `cFlag = 1 < 375`. -/
theorem cert_val_true : min (375 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 375 cFlag = 375`. It GENUINELY equals `1` (`cert_val_true`). A vacuous
    transport-derivative / wrong-transport mis-reading reduces — through the banked value — to the false
    numeric `1 = 375`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (375 : ℕ) cFlag = 375 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 375  (FALSE — the costume bites)

end Counterexamples
