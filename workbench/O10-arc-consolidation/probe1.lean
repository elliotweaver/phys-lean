import Phys.Algebra.ScaleTowerDischargeArcM
import Phys.Algebra.CKMTwoSectorPhase
import Phys.Algebra.ReciprocalSpectrum
import Phys.Algebra.UnruhModularWeld
import Phys.Algebra.EquivalenceNoether
import Phys.Algebra.SpacetimeGravitationalCoupling
import Mathlib.Tactic

namespace Phys.Algebra.ArcOConsolidationProbe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.FoldPhase
open Phys.Algebra.CKMTwoSectorPhase
open Phys.Algebra.UnruhModularWeld
open Phys.Algebra.EquivNoether

noncomputable section

/-! ## §1 — THE ONE BORN TURN threads five arc-O/tower quantities. -/

-- O1 fold phase = azimuthalTurn / 16
theorem foldPhase_azimuthal : foldPhase = azimuthalTurn / 16 := by
  unfold foldPhase azimuthalTurn; ring

-- O3 Cabibbo phase 2P = azimuthalTurn / 8
theorem cabibbo_azimuthal : (2 : Cut) * foldPhase = azimuthalTurn / 8 := by
  unfold foldPhase azimuthalTurn; ring

-- O8 budget = azimuthalTurn * 42  (banked)
example : criticalPhaseNumerator = azimuthalTurn * 42 := numerator_azimuthal

-- N359 gravity = azimuthalTurn * 4 (banked)
example : gravCouplingCoeff = azimuthalTurn * 4 := gravCouplingCoeff_azimuthal

-- O9 period = azimuthalTurn / a (banked)
example (a : Cut) : unruhPeriod a = azimuthalTurn / a := unruhPeriod_eq a

/-! ## §2 — THE HALF-ANGLE CASCADE: O2 mass phase = ℍ half-step of O3 Cabibbo phase. -/

theorem foldPhase_is_half_of_cabibbo :
    cutCos foldPhase * cutCos foldPhase = (1 + cutCos ((2 : Cut) * foldPhase)) / 2 := by
  rw [twoP_eq_quarter]
  exact foldPhase_amplitude.2

/-! ## §3 — SELF=OTHER BALANCE = CP FACTOR (O1 ⟺ O3). -/

theorem balance_is_cpFactor :
    cutCos ((2 : Cut) * foldPhase) * cutCos ((2 : Cut) * foldPhase) = cpFactorDerived := by
  rw [twoP_eq_quarter, cutCos_quarter_sq, cpFactorDerived_eq_half]

/-! ## §4 — THE ONE REDUCED (1,3) FORM threads O4/O5/O7. -/

-- O5 E=mc² invariant restricted to the plane
theorem emc2_diag (t x : ℚ) : massSq (t, x, (0 : Dbl ℚ)) = Q4 t x 0 := by
  rw [massSq_eq_Q4v]; rfl

-- O7 EP mass channel = same diagonal
example (t x : ℚ) : massForm2 t x = Q4 t x 0 := massForm2_eq_Q4 t x

-- The EP mass channel = the E=mc² invariant on the plane (O5 ⟺ O7)
theorem ep_is_emc2 (t x : ℚ) : massForm2 t x = massSq (t, x, (0 : Dbl ℚ)) := by
  rw [massForm2_eq_Q4, emc2_diag]

-- O4 (1,9) restriction: the (1,3) diagonal IS the octonionic (1,9) form on the embedded plane
theorem oct19_restricts_to_emc2 (t x : ℚ) :
    Qv (emb4 (t, x, (0 : Dbl ℚ))) = massSq (t, x, (0 : Dbl ℚ)) := by
  rw [emb4_preserves_form]; exact (massSq_eq_Q4v _).symm

end

end Phys.Algebra.ArcOConsolidationProbe
