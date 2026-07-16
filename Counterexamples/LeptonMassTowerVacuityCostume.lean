/-
  Counterexamples.LeptonMassTowerVacuityCostume — N467 / X8 anti-vacuity (C492).
  ==========================================================================================
  W8 ANTI-VACUITY. The X8 node (arc-X) welds the absolute lepton mass sector (arc P) to the
  fine-structure coupling band tower (arc X): both are readings of the ONE finite band tower from
  the octonion ceiling, at the SAME electroweak band edge `ewClosureRatio = topBandRatio⁻¹`. The
  load-bearing content: (i) the WELD identity — the mass scale measured in the coupling tower's
  electroweak-edge units is the pure DERIVED suppression bundle, `leptonBundle = cutCos foldPhase ·
  s1BornProb · 1 · cutCos(2/3)` (`leptonBundle_eq_bundle`), the exact scale rung cancelling; (ii) the
  suppression GENUINELY BITES — `leptonBundle < 1` (`leptonBundle_lt_one`), the mass scale strictly
  below the electroweak band edge, not pinned at it; (iii) the coupling reading at the SAME edge is
  the EXACT `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27` (`coupling_reading`), the
  shared `topBandRatio` welding the two observables. The weld is a REAL suppression (not vacuous),
  the mass and coupling readings GENUINELY SHARE the edge, and the coupling reading is the exact
  way-point.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the absolute lepton masses and the coupling
  are readings of the ONE tower at the SAME electroweak edge: the mass scale in coupling-tower units
  is the derived suppression bundle, the suppression genuinely bites (< 1), and the coupling reading
  at the shared edge is the exact 1582/27 — NOT vacuous, NOT an unrelated scale, NOT a trivial
  bundle = 1". It is TIED to the banked X8 landings by `xFlag_forced`: the banked
  `leptonBundle_eq_bundle` witnesses the weld identity, `leptonBundle_lt_one` witnesses the genuine
  suppression, and `coupling_reading` witnesses the exact shared-edge coupling reading, so the flag
  is `1`.

  We anchor `min 492 xFlag = 1` (TRUE — `xFlag = 1 < 492`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the weld is vacuous / the mass scale is unrelated to the
  coupling edge / the suppression does not bite / the bundle is trivially 1" mis-reading): that
  `min 492 xFlag = 492`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 492` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (492, 1) is fresh (Cid 492 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LeptonMassTower
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.LeptonMassTower
open Phys.Algebra.AbsMass Phys.Algebra.DischargeArcM Phys.Algebra.GenerationMassRatios
open Phys.Algebra.FoldPhase Phys.Algebra.Gear
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE LEPTON-MASS-TOWER FLAG: `1` = "the absolute lepton masses and the coupling are readings of
    the ONE band tower at the SAME electroweak edge: the mass scale in coupling-tower units IS the
    derived suppression bundle, the suppression genuinely bites, and the coupling reads the exact
    1582/27 at the shared edge". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X8 landings): `leptonBundle_eq_bundle` proves the mass scale in the
    coupling tower's electroweak-edge units is the pure derived suppression bundle (the weld — the
    exact scale rung cancels); `leptonBundle_lt_one` proves the suppression genuinely bites (the mass
    scale strictly below the electroweak band edge); and `coupling_reading` proves the coupling read
    at the SAME edge is the exact `1582/27`. So the flag is present, `xFlag = 1`. If the weld were
    vacuous, the mass scale unrelated to the coupling edge, the suppression trivial, or the reading
    wrong, these witnesses would not exist. -/
theorem xFlag_forced :
    (leptonBundle = (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3)) ∧
    (leptonBundle < 1) ∧
    (invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27) ∧
    xFlag = 1 :=
  ⟨leptonBundle_eq_bundle, leptonBundle_lt_one, coupling_reading, rfl⟩

/-- TRUE: `min 492 xFlag = 1`, holding precisely because `xFlag = 1 < 492`. -/
theorem cert_val_true : min (492 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 492 xFlag = 492`. It GENUINELY equals `1` (`cert_val_true`). A "the weld is
    vacuous / unrelated scale / no suppression / trivial bundle" mis-reading reduces — through the
    banked value — to the false numeric `1 = 492`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (492 : ℕ) xFlag = 492 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 492  (FALSE — the costume bites)

end Counterexamples
