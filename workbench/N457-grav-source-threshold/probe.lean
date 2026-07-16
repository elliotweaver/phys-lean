import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.CosmoEquationOfStateCensus

namespace Phys.Algebra.N457Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.CosmoEquationOfStateCensus

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The trace-reversed stress endomorphism S - ½(trace S)•id (the N354 trace-reversal operation).
def traceRevStress (S : STV4 →ₗ[ℚ] STV4) : STV4 →ₗ[ℚ] STV4 :=
  S - (2⁻¹ * LinearMap.trace ℚ STV4 S) • LinearMap.id

-- The time-diagonal reading of the trace-reversed source (active gravitational mass density).
def gravSource (S : STV4 →ₗ[ℚ] STV4) : ℚ := (traceRevStress S (1, 0, 0)).1

-- crux 1: gravSource (pfStress ρ P) = ½(ρ + 3P)
theorem gravSource_pf (rho P : ℚ) : gravSource (pfStress rho P) = 2⁻¹ * (rho + 3 * P) := by
  unfold gravSource traceRevStress
  rw [LinearMap.sub_apply, LinearMap.smul_apply]
  rw [eos_trace]  -- trace (pfStress rho P) = rho - 3*P
  simp [pfStress, LinearMap.prodMap_apply]
  ring

-- crux 2: general dimension form gravSource = ½(ρ + nP) with n = finrank spacelike block
theorem gravSource_pf_dim (rho P : ℚ) :
    gravSource (pfStress rho P) = 2⁻¹ * (rho + (Module.finrank ℚ (ℚ × Dbl ℚ) : ℚ) * P) := by
  rw [gravSource_pf, spacelike_block_finrank]; push_cast; ring

-- crux 3: census gravitational-source values
theorem gravSource_dust (rho : ℚ) : gravSource (pfStress rho 0) = 2⁻¹ * rho := by
  rw [gravSource_pf]; ring

theorem gravSource_radiation (rho : ℚ) : gravSource (pfStress rho (rho/3)) = rho := by
  rw [gravSource_pf]; ring

theorem gravSource_vacuum (rho : ℚ) : gravSource (pfStress rho (-rho)) = -rho := by
  rw [gravSource_pf]; ring

-- crux 4: the acceleration threshold — gravSource vanishes iff w = -1/n
theorem gravSource_zero_iff (rho P : ℚ) (hr : rho ≠ 0) :
    gravSource (pfStress rho P) = 0 ↔ P / rho = -1/3 := by
  rw [gravSource_pf]
  constructor
  · intro h
    have : rho + 3 * P = 0 := by
      rcases mul_eq_zero.mp h with h2 | h3
      · norm_num at h2
      · exact h3
    field_simp
    linarith
  · intro h
    have : P = -rho/3 := by field_simp at h; linarith
    rw [this]; ring

-- crux 5: the marquee sign comparison — gravSource uses +nP, census trace uses -nP
theorem gravSource_vs_censusTrace (rho P : ℚ) :
    2 * gravSource (pfStress rho P) = rho + 3 * P
    ∧ LinearMap.trace ℚ STV4 (pfStress rho P) = rho - 3 * P := by
  refine ⟨?_, eos_trace rho P⟩
  rw [gravSource_pf]; ring

end

end Phys.Algebra.N457Probe
