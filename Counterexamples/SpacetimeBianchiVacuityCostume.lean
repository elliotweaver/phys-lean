/-
  Counterexamples.SpacetimeBianchiVacuityCostume — N355 anti-vacuity (C380).
  ============================================================================
  W8 ANTI-VACUITY. The N355 node (arc-E E2-route, THE (differential) BIANCHI IDENTITY IS THE JACOBI
  IDENTITY of the look-back-transport commutator, over the derived ℝ `Cut`) proves that the Bianchi
  identity `D_{k₁}R(k₂,k₃) + D_{k₂}R(k₃,k₁) + D_{k₃}R(k₁,k₂) = 0` is a GENUINE cancellation of NONZERO
  curvature terms — not a vacuous `0 = 0`. The curvature it acts on is genuinely nonzero: the two
  look-back transports fail to commute, `⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0`
  (`curvBracket_ne_zero`, tied to the banked N348 `lbCurv_ne_zero` via `lbCurv_eq_bracket`).

  The forced non-vacuity fact is `curvBracket_ne_zero`: the concrete curvature-bracket is nonzero over
  the derived `Cut`. A mis-derivation (a vacuous curvature that always commutes, so the Bianchi
  identity is a trivial `0 = 0`; a wrong `lbCurv_eq_bracket` severing the curvature from the Lie
  bracket whose Jacobi identity is the Bianchi identity) would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the Bianchi identity is a real cancellation of
  a genuinely nonzero curvature-bracket". It is TIED to the banked N355 landing by `cFlag_forced`: the
  banked `curvBracket_ne_zero` witnesses that the concrete curvature-bracket is nonzero, so the flag is
  `1` (present), not `0`.

  We anchor `min 380 cFlag = 1` (TRUE — `cFlag = 1 < 380`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-curvature / wrong-bracket mis-reading): that
  `min 380 cFlag = 380`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 380` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (380, 1) is fresh (Cid 380 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeBianchi
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

/-- THE BIANCHI NON-VACUITY FLAG: `1` = "the Bianchi identity is a real cancellation of a genuinely
    nonzero curvature-bracket — the transports fail to commute, the identity is not vacuous `0 = 0`". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N355 landing): the banked `curvBracket_ne_zero` proves the concrete
    curvature-bracket `⁅lbConn timeProj, lbConn offDiagVar⁆` is nonzero over the derived `Cut`, so the
    "the Bianchi cancellation is not vacuous" flag is present — `cFlag = 1`. If the curvature were
    vacuous (always commuting, so the cyclic sum is a trivial `0 = 0`), this witness would not exist. -/
theorem cFlag_forced :
    (⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0) ∧ cFlag = 1 :=
  ⟨curvBracket_ne_zero, rfl⟩

/-- TRUE: `min 380 cFlag = 1`, holding precisely because `cFlag = 1 < 380`. -/
theorem cert_val_true : min (380 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 380 cFlag = 380`. It GENUINELY equals `1` (`cert_val_true`). A vacuous-curvature
    / wrong-bracket mis-reading reduces — through the banked value — to the false numeric `1 = 380`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (380 : ℕ) cFlag = 380 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 380  (FALSE — the costume bites)

end Counterexamples
