import Phys.Algebra.CosmoEnthalpyNullEnergy
import Phys.Algebra.CosmoDarkEnergyEquationOfState
import Phys.Algebra.CosmicFateEternalApproach
import Phys.Foundation.ContinuumLog

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.CosmoEquationOfStateCensus
open Phys.Algebra.CosmoGravitationalSourceThreshold
open Phys.Algebra.CosmoEnthalpyNullEnergy
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- n = derived spacelike dim as ℚ
abbrev nQ : ℚ := (Module.finrank ℚ spaceSub4 : ℚ)

/-- THE DILUTION EXPONENT `k = n·(ρ+P)/ρ = n·enthalpy/ρ`. -/
def dilutionExponent (S : STV4 →ₗ[ℚ] STV4) : ℚ :=
  nQ * enthalpy S / eosDensity S

/-- reading on the fluid stress. -/
theorem dilutionExponent_pf (rho P : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho P) = nQ * (rho + P) / rho := by
  unfold dilutionExponent
  rw [enthalpy_pf, eosDensity_pf]

/-- dust (P=0): k = n. -/
theorem dilutionExponent_dust (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho 0) = nQ := by
  rw [dilutionExponent_pf rho 0 hr]
  field_simp

/-- radiation (P = ρ/n, i.e. w = 1/n, the N455 dimension-locked value): k = n+1. -/
theorem dilutionExponent_radiation (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho (rho / nQ)) = nQ + 1 := by
  have hn : nQ = 3 := by unfold_let nQ; rw [finrank_spaceSub4]; norm_num
  rw [dilutionExponent_pf rho _ hr, hn]
  field_simp
  ring

/-- vacuum (P=−ρ): k = 0. -/
theorem dilutionExponent_vacuum (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho (-rho)) = 0 := by
  rw [dilutionExponent_pf rho (-rho) hr]
  simp

/-- k=0 ⟺ enthalpy=0 (⟺ isotropy by N458). -/
theorem dilutionExponent_zero_iff (rho P : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho P) = 0 ↔ pfStress rho P = rho • LinearMap.id := by
  rw [← enthalpy_zero_iff_isotropic]
  unfold dilutionExponent
  rw [enthalpy_pf, eosDensity_pf]
  constructor
  · intro h
    have hn : nQ ≠ 0 := by unfold_let nQ; rw [finrank_spaceSub4]; norm_num
    rw [div_eq_zero_iff] at h
    rcases h with h | h
    · rcases mul_eq_zero.mp h with h1 | h2
      · exact absurd h1 hn
      · rw [enthalpy_pf]; exact h2
    · exact absurd h hr
  · intro h
    rw [enthalpy_pf] at h
    rw [h]; simp

-- ===== THE FLOW over Cut =====

/-- THE DENSITY HISTORY `ρ(t) = ρ₀·cutExp(−k·H·t)`. -/
def densityHistory (rho0 k H t : Cut) : Cut := rho0 * cutExp (-(k * H) * t)

theorem densityHistory_pos (rho0 k H t : Cut) (h0 : 0 < rho0) :
    0 < densityHistory rho0 k H t := by
  unfold densityHistory; exact mul_pos h0 (cutExp_pos _)

/-- THE CONTINUITY FLOW `ρ̇ = −(kH)·ρ` — a cutExp derivative property, NOT a posited ODE. -/
theorem densityHistory_continuity (rho0 k H t : Cut) (h : k * H ≠ 0) :
    CutHasDerivAt (densityHistory rho0 k H) (-(k * H) * densityHistory rho0 k H t) t := by
  have hbase : CutHasDerivAt (fun y => cutExp (-(k * H) * y)) (-(k * H) * cutExp (-(k * H) * t)) t :=
    cutExp_scale_hasDerivAt (-(k * H)) t (by simpa using h)
  have := cutHasDerivAt_const_mul (f := fun y => cutExp (-(k * H) * y)) rho0 hbase
  unfold densityHistory
  convert this using 1
  ring

/-- vacuum non-dilution: k=0 ⟹ constant density. -/
theorem densityHistory_vacuum_constant (rho0 H t : Cut) :
    densityHistory rho0 0 H t = rho0 := by
  unfold densityHistory
  simp [cutExp_zero]

/-- THE POWER LAW `ρ = ρ₀·a^{−k}` via cutRpow on the banked scale factor. -/
theorem densityHistory_power_law (rho0 k H t : Cut) :
    densityHistory rho0 k H t = rho0 * cutRpow (scaleFactor H t) (-k) := by
  unfold densityHistory scaleFactor cutRpow
  rw [cutLog_cutExp]
  congr 2
  ring

end
