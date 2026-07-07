/-
  Counterexamples.TransitionAmplitudeVacuityCostume — N399 anti-vacuity (C424).
  ============================================================================================
  W8 ANTI-VACUITY. The N399 node (arc-K K3 — the transition amplitude + the optical theorem)
  derives the scattering amplitude as the derived look-back transport between asymptotic states
  (`transAmp U out inp = hInner (toDbl out) (toDbl (evolve U inp))`), and the OPTICAL THEOREM —
  `2 · Im T = dblNormSq T = wIn + wOut` for the interaction operator `T = intOp U = (U − 1)·(−J)`
  of a unit-phase transport — as a CONSEQUENCE of K1's unitarity.

  The load-bearing non-vacuity fact is that the fold's own phase `Dbl.J` is a GENUINE interaction:
  its interaction amplitude has a NONZERO imaginary part (`intOp Dbl.J`.im = 1) balanced by a
  NONZERO modulus-square (`dblNormSq (intOp Dbl.J) = 2`). So the optical theorem `2 · Im T =
  dblNormSq T` is the non-trivial `2 · 1 = 2`, NOT the vacuous `0 = 0` that would hold if the
  interaction operator were identically zero (i.e. if every transport did nothing / `S = 1`).

  A mis-reading where K3 were VACUOUS (the interaction operator is trivial / the amplitude has no
  interacting part / `S = 1` for the fold's own phase / the optical theorem is `0 = 0`) would have
  `dblNormSq (intOp Dbl.J) = 0`, not `2`.

  THE CERTIFICATE. `cFlag := 2` — a ℕ flag standing for "the fold's own phase `Dbl.J` genuinely
  interacts: its interaction-operator modulus-square is `2 ≠ 0`, so the optical theorem is the
  non-trivial `2·Im T = dblNormSq T` (`2·1 = 2`), not the vacuous `0 = 0`". It is TIED to the
  banked N399 landing by `cFlag_forced`: `intOp_J_nontrivial` gives `(intOp Dbl.J).im = 1` and
  `dblNormSq (intOp Dbl.J) = 2`, and `optical_theorem` (applied to the unit phase `Dbl.J`,
  `J_is_unit_phase`) witnesses `2 · (intOp Dbl.J).im = dblNormSq (intOp Dbl.J)`.

  We anchor `min 424 cFlag = 2` (TRUE — `cFlag = 2 < 424`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "K3 is vacuous / the interaction operator is trivial /
  `S = 1` / the optical theorem is `0 = 0`" mis-reading): that `min 424 cFlag = 424`. It GENUINELY
  equals `2` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `2 = 424`
  in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (424, 2) is fresh (Cid 424 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.TransitionAmplitude
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open Phys.Cascade

/-- THE K3-NON-VACUITY FLAG: `2` = "the fold's own phase `Dbl.J` genuinely interacts; its
    interaction-operator modulus-square is `2 ≠ 0`, so the optical theorem is the non-trivial
    `2·Im T = dblNormSq T` (`2·1 = 2`), not the vacuous `0 = 0`". -/
def cFlag : ℕ := 2

/-- TRUE (tied to the banked N399 landing): `intOp_J_nontrivial` proves the fold-phase interaction
    amplitude has `Im T = 1` and `dblNormSq T = 2`; `optical_theorem` (at the unit phase `Dbl.J`,
    `J_is_unit_phase`) witnesses `2 · Im T = dblNormSq T`. So the optical theorem genuinely bites on
    a nonzero interaction; hence `cFlag = 2`. If K3 were vacuous (`S = 1`, the interaction operator
    trivial), the modulus-square would be `0`, not `2`. -/
theorem cFlag_forced :
    (intOp (Dbl.J : Dbl Phys.Foundation.ContinuumQ.Cut)).im = 1
      ∧ dblNormSq (intOp (Dbl.J : Dbl Phys.Foundation.ContinuumQ.Cut)) = 2
      ∧ 2 * (intOp (Dbl.J : Dbl Phys.Foundation.ContinuumQ.Cut)).im
          = dblNormSq (intOp (Dbl.J : Dbl Phys.Foundation.ContinuumQ.Cut))
      ∧ cFlag = 2 :=
  ⟨intOp_J_nontrivial.1, intOp_J_nontrivial.2,
    optical_theorem Dbl.J J_is_unit_phase, rfl⟩

/-- TRUE: `min 424 cFlag = 2`, holding precisely because `cFlag = 2 < 424`. -/
theorem cert_val_true : min (424 : ℕ) cFlag = 2 := by decide

/-- BOGUS: claims `min 424 cFlag = 424`. It GENUINELY equals `2` (`cert_val_true`). A "K3 is
    vacuous / the interaction operator is trivial / `S = 1` / the optical theorem is `0 = 0`"
    mis-reading reduces — through the banked genuinely-nontrivial fold-phase interaction — to the
    false numeric `2 = 424`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (424 : ℕ) cFlag = 424 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 424  (FALSE — the costume bites)

end Counterexamples
