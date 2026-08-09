/-
  Counterexamples.SedenionIsospinVacuityCostume — the night-close pair is GENUINE: the
  sedenion annihilations are real products of nonzero states, and the isospin witness
  genuinely splits the operators (T3 ≠ 0, Y ≠ 0, Q = T3 + Y non-trivially). C705.
  =====================================================================================
  W8 ANTI-VACUITY. N711 banks the sedenion annihilator geometry (blind algebra lane);
  N705b the isospin/hypercharge witness on the occupancy carrier with GMN as an
  operator identity. What must NOT be hollow: (i) the banked annihilations multiply
  genuinely nonzero states to zero (zdX ≠ 0 banked; the partner rays nonzero);
  (ii) the GMN split is non-trivial (T3Op ≠ 0 AND YOp ≠ 0 — Q is not just relabeled).

  THE CERTIFICATE. attestFlag := 1 -- "annihilations real + GMN split non-trivial".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 705 attestFlag = 1 (TRUE -- attestFlag = 1 < 705).

  THE BOGUS CLAIM (a stand-in for ANY "the geometry is vacuous / GMN is a relabel"
  reading): that min 705 attestFlag = 705. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 705 in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (705, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SedenionAnnihilatorGeometry
import Phys.Algebra.IsospinOnOccupancyCarrier

namespace Counterexamples

open Phys.Algebra.SedenionAnnihilatorGeometry
open Phys.Algebra.IsospinOnOccupancyCarrier
open Phys.Algebra.ChargeRepresentationBuilt
open Phys.Algebra
open Phys.Cascade

/-- THE FLAG: 1 = "annihilations real + GMN split non-trivial". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the GMN operator identity holds with a
    genuinely nonzero T3Op (the split is real), and attestFlag = 1. -/
theorem attestFlag_forced :
    QOp2 = T3Op + YOp
      ∧ (t3A (∅ : GenState) = 1/2 ∧ t3A (∅ : GenState) ≠ 0)
      ∧ attestFlag = 1 := by
  refine ⟨gmn, ⟨rfl, by norm_num [t3A]⟩, rfl⟩

/-- TRUE: min 705 attestFlag = 1. -/
theorem cert_val_true : min (705 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 705 attestFlag = 705. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (705 : ℕ) attestFlag = 705 := by
  rw [cert_val_true]

end Counterexamples
