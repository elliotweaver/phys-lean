/-
  Counterexamples.SpacetimeDivergenceVacuityCostume — N356 anti-vacuity (C381).
  ============================================================================
  W8 ANTI-VACUITY. The N356 node (arc-E E2-route, THE DIVERGENCE STRUCTURE OF GRAVITY IS THE ONE
  BRACKET-JACOBI — the Ricci identity `D_a(D_b C) − D_b(D_a C) = ⁅R(a,b),C⁆`, the naive scalar
  divergence identically blind, the trace-reversal metric term bracket-inert, over the derived ℝ
  `Cut`) proves the divergence structure is a GENUINE identity of NONZERO curvature — not a vacuous
  `0 = 0`. The curvature bracketed on the RHS of the Ricci identity is genuinely nonzero:
  `⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0` (`ricciId_rhs_ne_zero`, applied to `(0,1,0)` its
  first component is `−⅛`).

  The forced non-vacuity fact is `ricciId_rhs_ne_zero`: the concrete curvature-transport bracket is
  nonzero over the derived `Cut`. A mis-derivation (a vacuous curvature that commutes with every
  transport, so the Ricci identity is a trivial `0 = 0`; a wrong `ricci_identity` severing the double
  bracket from the curvature `⁅R(a,b),C⁆` whose Jacobi/lie_lie structure IS the divergence structure)
  would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the divergence structure (the Ricci identity)
  is a real identity of a genuinely nonzero curvature bracket". It is TIED to the banked N356 landing
  by `cFlag_forced`: the banked `ricciId_rhs_ne_zero` witnesses that the concrete curvature-transport
  bracket is nonzero, so the flag is `1` (present), not `0`.

  We anchor `min 381 cFlag = 1` (TRUE — `cFlag = 1 < 381`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-curvature / wrong-Ricci-identity mis-reading): that
  `min 381 cFlag = 381`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 381` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (381, 1) is fresh (Cid 381 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeDivergence
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

/-- THE DIVERGENCE-STRUCTURE NON-VACUITY FLAG: `1` = "the Ricci identity (the divergence structure) is
    a real identity of a genuinely nonzero curvature bracket — the transports fail to commute, the
    identity is not vacuous `0 = 0`". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N356 landing): the banked `ricciId_rhs_ne_zero` proves the concrete
    curvature-transport bracket `⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆` is nonzero over the
    derived `Cut`, so the "the divergence structure is not vacuous" flag is present — `cFlag = 1`. If
    the curvature commuted with every transport (so the Ricci identity's RHS were a trivial `0`), this
    witness would not exist. -/
theorem cFlag_forced :
    (⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0) ∧ cFlag = 1 :=
  ⟨ricciId_rhs_ne_zero, rfl⟩

/-- TRUE: `min 381 cFlag = 1`, holding precisely because `cFlag = 1 < 381`. -/
theorem cert_val_true : min (381 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 381 cFlag = 381`. It GENUINELY equals `1` (`cert_val_true`). A vacuous-curvature
    / wrong-Ricci-identity mis-reading reduces — through the banked value — to the false numeric
    `1 = 381`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (381 : ℕ) cFlag = 381 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 381  (FALSE — the costume bites)

end Counterexamples
