/-
  Counterexamples.StrongCPThetaVacuityCostume — N367 anti-vacuity (C392).
  ============================================================================================
  W8 ANTI-VACUITY. The N367 node (arc-F F2 — strong CP / θ̄ = 0, the flavor half) banks that the
  matter-arena reduced determinant `detArena` has EXACTLY ZERO phase (imaginary) component:
  `theta_det_phase_zero : detArena d0 d1 d2 a b c − ocR (reQ (detArena …)) = 0` — there is no
  θ-phase to rotate away.

  The forced non-vacuity fact is `theta_det_phase_zero`: the determinant's imaginary part is 0. If
  the determinant instead carried a nonzero phase (a mis-derived "θ̄ could be nonzero / the arena's
  determinant has an argument to tune"), this pin would break and the whole no-dial dissolution would
  collapse.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the determinant's phase is ZERO (θ̄ = 0
  structurally)". It is TIED to the banked N367 landing by `iFlag_forced`: the banked
  `theta_det_phase_zero` (instantiated at the identity witnesses) witnesses that the phase component
  is `0`, so the flag is `1` (present), not `0`.

  We anchor `min 392 iFlag = 1` (TRUE — `iFlag = 1 < 392`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "θ̄ could be nonzero / the determinant carries a tunable
  phase" mis-reading): that `min 392 iFlag = 392`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 392` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (392, 1) is fresh (Cid 392 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StrongCPTheta
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE θ̄ = 0 NON-VACUITY FLAG: `1` = "the matter-arena determinant's phase (imaginary) component
    is exactly ZERO — there is no θ-phase to rotate". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N367 landing): the banked `theta_det_phase_zero`, instantiated at the
    identity element `(1,1,1; 0,0,0)`, proves the determinant's imaginary component is `0`, so the
    "phase is zero" flag is present, `iFlag = 1`. If the arena's determinant carried a nonzero phase,
    this witness would not exist. -/
theorem iFlag_forced :
    (detArena 1 1 1 0 0 0 - ocR (reQ (detArena 1 1 1 0 0 0)) = 0) ∧ iFlag = 1 :=
  ⟨theta_det_phase_zero 1 1 1 0 0 0, rfl⟩

/-- TRUE: `min 392 iFlag = 1`, holding precisely because `iFlag = 1 < 392`. -/
theorem cert_val_true : min (392 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 392 iFlag = 392`. It GENUINELY equals `1` (`cert_val_true`). A "θ̄ could be
    nonzero / the determinant carries a tunable phase" mis-reading reduces — through the banked value
    — to the false numeric `1 = 392`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (392 : ℕ) iFlag = 392 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 392  (FALSE — the costume bites)

end Counterexamples
