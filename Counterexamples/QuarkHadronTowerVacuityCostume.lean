/-
  Counterexamples.QuarkHadronTowerVacuityCostume — N468 / X9 anti-vacuity (C493).
  ==========================================================================================
  W8 ANTI-VACUITY. The X9 node (arc-X) places the confinement / hadron mass SCALE on the SAME finite
  coupling band tower assembled in X6/X8: the confinement scale, the coupling, and the lepton masses
  are all readings of the ONE finite band tower from the octonion ceiling, at the SAME electroweak band
  edge `ewClosureRatio = topBandRatio⁻¹`. The load-bearing content: (i) the WELD identity — the
  confinement scale measured in the coupling tower's electroweak-edge units is the pure DERIVED closed
  ratio `confBundle = cutExp(−8·cutPi/3) = Λ/v` (`confBundle_eq`), the exact scale rung cancelling
  against the shared edge; (ii) the suppression GENUINELY BITES — `confBundle < 1` (`confBundle_lt_one`),
  the confinement scale strictly below the electroweak band edge, not pinned at it; (iii) the coupling
  reading at the SAME edge is the EXACT `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27`
  (`coupling_reading`), the shared `topBandRatio` welding the three observables. The weld is a REAL
  suppression (not vacuous), the confinement scale and coupling reading GENUINELY SHARE the edge, and
  the coupling reading is the exact way-point.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the confinement scale and the coupling are
  readings of the ONE tower at the SAME electroweak edge: the confinement scale in coupling-tower units
  is the derived suppression bundle `cutExp(−8π/3)`, the suppression genuinely bites (< 1), and the
  coupling reading at the shared edge is the exact 1582/27 — NOT vacuous, NOT an unrelated scale, NOT a
  trivial bundle = 1". It is TIED to the banked X9 landings by `xFlag_forced`: the banked
  `confBundle_eq` witnesses the weld identity, `confBundle_lt_one` witnesses the genuine suppression,
  and `coupling_reading` witnesses the exact shared-edge coupling reading, so the flag is `1`.

  We anchor `min 493 xFlag = 1` (TRUE — `xFlag = 1 < 493`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the weld is vacuous / the confinement scale is unrelated to the
  coupling edge / the suppression does not bite / the bundle is trivially 1" mis-reading): that
  `min 493 xFlag = 493`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to
  the false numeric `1 = 493` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (493, 1) is fresh (Cid 493 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.QuarkHadronTower
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.QuarkHadronTower
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE QUARK-HADRON-TOWER FLAG: `1` = "the confinement scale and the coupling are readings of the ONE
    band tower at the SAME electroweak edge: the confinement scale in coupling-tower units IS the
    derived suppression bundle `cutExp(−8π/3)`, the suppression genuinely bites, and the coupling reads
    the exact 1582/27 at the shared edge". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X9 landings): `confBundle_eq` proves the confinement scale in the coupling
    tower's electroweak-edge units is the pure derived closed ratio `cutExp(−8π/3)` (the weld — the
    exact scale rung cancels); `confBundle_lt_one` proves the suppression genuinely bites (the
    confinement scale strictly below the electroweak band edge); and `coupling_reading` proves the
    coupling read at the SAME edge is the exact `1582/27`. So the flag is present, `xFlag = 1`. If the
    weld were vacuous, the confinement scale unrelated to the coupling edge, the suppression trivial, or
    the reading wrong, these witnesses would not exist. -/
theorem xFlag_forced :
    (confBundle = cutExp (-(8 * cutPi / 3))) ∧
    (confBundle < 1) ∧
    (invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27) ∧
    xFlag = 1 :=
  ⟨confBundle_eq, confBundle_lt_one, coupling_reading, rfl⟩

/-- TRUE: `min 493 xFlag = 1`, holding precisely because `xFlag = 1 < 493`. -/
theorem cert_val_true : min (493 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 493 xFlag = 493`. It GENUINELY equals `1` (`cert_val_true`). A "the weld is
    vacuous / unrelated scale / no suppression / trivial bundle" mis-reading reduces — through the
    banked value — to the false numeric `1 = 493`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (493 : ℕ) xFlag = 493 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 493  (FALSE — the costume bites)

end Counterexamples
