import Phys.Algebra.CosmoGravitationalSourceThreshold

namespace ProbeN458

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.CosmoEquationOfStateCensus
open Phys.Algebra.CosmoGravitationalSourceThreshold

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The enthalpy / null-energy combination: density + pressure = the eigenvalue GAP. -/
def enthalpy (S : STV4 →ₗ[ℚ] STV4) : ℚ := eosDensity S + eosPressure S

/-- ρ+P with coefficient 1 on P (NO finrank) — dimension-independent. -/
theorem enthalpy_pf (rho P : ℚ) : enthalpy (pfStress rho P) = rho + P := by
  unfold enthalpy
  rw [eosDensity_pf, eosPressure_pf]

/-- The gap = the difference of the two diagonal eigenvalues (timelike ρ minus spacelike −P). -/
theorem enthalpy_eq_eigengap (rho P : ℚ) :
    enthalpy (pfStress rho P) = (pfStress rho P (1,0,0)).1 - (pfStress rho P (0,1,0)).2.1 := by
  unfold enthalpy eosDensity eosPressure
  ring

/-- THE VACUUM THRESHOLD — dimension-INDEPENDENT: enthalpy = 0 ⟺ w = −1 (NO finrank). -/
theorem enthalpy_zero_iff (rho P : ℚ) (hr : rho ≠ 0) :
    enthalpy (pfStress rho P) = 0 ↔ eosState (pfStress rho P) = -1 := by
  rw [enthalpy_pf, eosState_pf]
  constructor
  · intro h
    rw [div_eq_iff hr]; linarith
  · intro h
    rw [div_eq_iff hr] at h; linarith

/-- enthalpy = 0 ⟺ the stress is ∝ identity (spectral degeneracy / isotropy). -/
theorem enthalpy_zero_iff_isotropic (rho P : ℚ) :
    enthalpy (pfStress rho P) = 0 ↔ pfStress rho P = rho • LinearMap.id := by
  rw [enthalpy_pf]
  constructor
  · intro h
    have : P = -rho := by linarith
    rw [this]; exact vacuum_eq_smul_id rho
  · intro h
    -- read off the (0,1,0) spacelike coordinate: LHS gives −P, RHS gives ρ
    have hread := congrArg (fun (M : STV4 →ₗ[ℚ] STV4) => (M (0,1,0)).2.1) h
    simp [pfStress, LinearMap.prodMap_apply] at hread
    linarith

/-- THE TRICHOTOMY of P-coefficients: trace ρ−n·P, source ρ+n·P, enthalpy ρ+1·P — the first two
    carry the DERIVED dimension n=finrank, the third carries 1 (dimension-free). -/
theorem trichotomy_coeffs (rho P : ℚ) :
    LinearMap.trace ℚ STV4 (pfStress rho P) = rho - (Module.finrank ℚ (ℚ × Dbl ℚ) : ℚ) * P
    ∧ 2 * gravSource (pfStress rho P) = rho + (Module.finrank ℚ (ℚ × Dbl ℚ) : ℚ) * P
    ∧ enthalpy (pfStress rho P) = rho + 1 * P := by
  refine ⟨eos_trace_dim rho P, ?_, ?_⟩
  · rw [gravSource_pf_dim]; ring
  · rw [enthalpy_pf]; ring

/-- W8: the three combinations are genuinely distinct for P ≠ 0 (enthalpy ≠ trace ≠ 2·source). -/
theorem trichotomy_distinct (rho P : ℚ) (hP : P ≠ 0) :
    enthalpy (pfStress rho P) ≠ LinearMap.trace ℚ STV4 (pfStress rho P)
    ∧ enthalpy (pfStress rho P) ≠ 2 * gravSource (pfStress rho P) := by
  rw [enthalpy_pf, eos_trace, gravSource_pf]
  constructor
  · intro h; apply hP; linarith
  · intro h; apply hP; linarith

/-- The dimension-INDEPENDENCE contrast: enthalpy's threshold reads −1 with NO finrank, while
    the trace's threshold reads +1/n and the source's −1/n carry finrank spaceSub4. W8 that n ≠ 1. -/
theorem enthalpy_threshold_dimension_free :
    (Module.finrank ℚ spaceSub4 : ℚ) ≠ 1 := by
  rw [finrank_spaceSub4]; norm_num

end

end ProbeN458
