/-
  Counterexamples.TwoEndsConstructedVacuityCostume — the two-ends construction is GENUINE: the
  odd-moment annihilation is EXACT (not approximate), the surviving second moment is strictly
  positive (the return surface does not annihilate EVERYTHING — the selection discriminates),
  and its normalization is the banked depthWeight. C590.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the mirror term's α² is CONSTRUCTED: the one-ended and
  three-ended return fluxes vanish exactly while the two-ended flux survives. The content
  that must NOT be hollow: (i) the annihilation is exact (firstMomentFlux_vanishes /
  thirdMomentFlux_vanishes: = 0, not small); (ii) the second moment is STRICTLY POSITIVE
  (0 < meridianFlux cutPi — if the surface killed all moments the "selection" would be
  vacuous annihilation, selecting nothing); (iii) the surviving moment's normalization IS
  the banked depthWeight = 1/3 (the same object carrying the mirror coefficient's w-slot —
  the ends-selection and the weight are one construction, not two coincidences).

  THE CERTIFICATE. attestFlag := 1 -- "odd moments exactly zero, even moment strictly
  positive and equal to the banked weight". TIED to the banked landing by attestFlag_forced.

  We anchor min 590 attestFlag = 1 (TRUE -- attestFlag = 1 < 590).

  THE BOGUS CLAIM (a stand-in for ANY "the annihilation is approximate / everything
  vanishes / the weight is unrelated to the selection" reading): that
  min 590 attestFlag = 590. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the
  bogus claim to the false numeric 1 = 590 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (590, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TwoEndsConstructed

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.DepthWeight
open Phys.Algebra.TwoEndsConstructed
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "odd moments exactly zero, even moment strictly positive = banked weight". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the one- and three-ended fluxes vanish exactly, the
    two-ended flux is strictly positive with normalization the banked depthWeight = 1/3
    (`twoEnds_constructed`), and `attestFlag = 1`. -/
theorem attestFlag_forced :
    firstMomentFlux cutPi = 0
    ∧ thirdMomentFlux cutPi = 0
    ∧ (0:Cut) < meridianFlux cutPi
    ∧ meridianFlux cutPi / sinAntideriv cutPi = depthWeight
    ∧ depthWeight = 1/3
    ∧ attestFlag = 1 := by
  obtain ⟨h1, h3, hpos, hnorm, hw⟩ := twoEnds_constructed
  exact ⟨h1, h3, hpos, hnorm, hw, rfl⟩

/-- TRUE: min 590 attestFlag = 1. -/
theorem cert_val_true : min (590 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 590 attestFlag = 590. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (590 : ℕ) attestFlag = 590 := by
  rw [cert_val_true]

end Counterexamples
