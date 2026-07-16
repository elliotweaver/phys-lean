/-
  MEASURE-FIRST probe for N433 (arc-P P7): the parameter-free certificate.
  Verifies: (a) every arc-P capstone reference resolves and projects; (b) WELD 1 (P1⊗P2) and
  WELD 2 (P3⊗P6) compile. LIGHT node — projections + rw only.
-/
import Phys.Algebra.ElectroweakTransmutation
import Phys.Algebra.AbsoluteMassSpectrum
import Phys.Algebra.NonAbelianAnomalyCancellation
import Phys.Algebra.GaugeThetaHyperchargeNormalization
import Phys.Algebra.SpacetimeTwiceContractedBianchi
import Phys.Algebra.OctonionJordanTrialityGroup
import Phys.Algebra.ScaleTowerDischargeArcM
import Mathlib.Tactic

namespace ProbeP7

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- (a) capstone references resolve
example := @Phys.Algebra.electroweak_transmutation_keystone
example := @Phys.Algebra.AbsMass.absolute_mass_spectrum
example := @Phys.Algebra.nonabelian_witten_anomaly_cancellation
example := @Phys.Algebra.gauge_theta_hypercharge_normalization
example := @Phys.Algebra.spacetime_conservation
example := @Phys.Algebra.HJ.trialityHom_injective

-- P1 projections
example : minimalWrapRatio = ewClosureRatio := electroweak_transmutation_keystone.2.2.2.1
example : minimalWrapRatio ≠ 1 := minimalWrapRatio_ne_one

-- P5 concrete divergence + nonzero field
example (gradR : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov ((skewWit + metricScalarField gradR) - metricScalarField gradR) ν = 0 :=
  einstein_divCov_zero_concrete gradR ν
example : skewWit ≠ 0 := skewWit_ne_zero

-- WELD 1 (P1 ⊗ P2): the mass scale anchored on the DERIVED minimal-wrap amplitude
example :
    Phys.Algebra.AbsMass.massScale
      = minimalWrapRatio * ((cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3)) := by
  show Phys.Algebra.DischargeArcM.absScaleChainDerived
      = minimalWrapRatio * ((cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3))
  rw [minimalWrapRatio_eq_ewClosureRatio]
  exact Phys.Algebra.DischargeArcM.absScaleChainDerived_eq_anchor_mul

-- WELD 2 (P3 ⊗ P6): the triality cycle order IS the derived colour/generation count finrank Uhol
example : trialityHom gcyc ^ (Module.finrank ℚ Uhol) = 1 := by
  rw [finrank_Uhol]; exact trialityHom_gcyc_order3
example : trialityHom gcyc ≠ 1 := trialityHom_gcyc_ne_one

-- P4 teeth + P3 teeth resolve
example : weinberg (2 * 2) (16 / 3) ≠ 3 / 8 := weinberg_single_sided_breaks
example : su2MixedCoeff 2 (Module.finrank ℚ singlet) ≠ 0 := su2_mixed_anomaly_wrong_colour

end

end ProbeP7
