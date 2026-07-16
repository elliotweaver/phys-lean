import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.CosmoEquationOfStateCensus

namespace Phys.Algebra.N457Probe2

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.CosmoEquationOfStateCensus

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def traceRevStress (S : STV4 →ₗ[ℚ] STV4) : STV4 →ₗ[ℚ] STV4 :=
  S - (2⁻¹ * LinearMap.trace ℚ STV4 S) • LinearMap.id

def gravSource (S : STV4 →ₗ[ℚ] STV4) : ℚ := (traceRevStress S (1, 0, 0)).1

theorem gravSource_pf (rho P : ℚ) : gravSource (pfStress rho P) = 2⁻¹ * (rho + 3 * P) := by
  unfold gravSource traceRevStress
  rw [LinearMap.sub_apply, LinearMap.smul_apply, eos_trace]
  simp [pfStress, LinearMap.prodMap_apply]; ring

-- dimension-locked threshold: gravSource vanishes iff w = -1/(finrank spaceSub4)
theorem gravSource_zero_iff_dim (rho P : ℚ) (hr : rho ≠ 0) :
    gravSource (pfStress rho P) = 0 ↔
      eosState (pfStress rho P) = -1 / (Module.finrank ℚ spaceSub4 : ℚ) := by
  rw [gravSource_pf, eosState_pf, finrank_spaceSub4]
  push_cast
  constructor
  · intro h
    have hs : rho + 3 * P = 0 := by
      rcases mul_eq_zero.mp h with h2 | h3
      · norm_num at h2
      · exact h3
    rw [div_eq_div_iff hr (by norm_num : (3:ℚ) ≠ 0)]; linarith
  · intro h
    rw [div_eq_div_iff hr (by norm_num : (3:ℚ) ≠ 0)] at h
    have : P = -rho/3 := by linarith
    rw [this]; ring

-- W8 sign facts (ρ > 0): the load-bearing repulsion content
theorem vacuum_source_negative (rho : ℚ) (h : 0 < rho) : gravSource (pfStress rho (-rho)) < 0 := by
  rw [gravSource_pf]; nlinarith

theorem radiation_source_positive (rho : ℚ) (h : 0 < rho) : 0 < gravSource (pfStress rho (rho/3)) := by
  rw [gravSource_pf]; nlinarith

theorem dust_source_positive (rho : ℚ) (h : 0 < rho) : 0 < gravSource (pfStress rho 0) := by
  rw [gravSource_pf]; nlinarith

-- W8 sign load-bearing: the trace-reversal `+3P` is genuinely NOT the census `-3P` (differ when P≠0)
theorem source_sign_load_bearing (rho P : ℚ) (hP : P ≠ 0) :
    2 * gravSource (pfStress rho P) ≠ LinearMap.trace ℚ STV4 (pfStress rho P) := by
  rw [gravSource_pf, eos_trace]; intro h; apply hP; linarith

-- the marquee cross-tie: radiation is ordinary-traceless (census w=+1/3) yet gravitates positively;
-- vacuum has max ordinary trace 4ρ yet negative gravitational source.
theorem radiation_traceless_but_gravitates (rho : ℚ) (h : 0 < rho) :
    LinearMap.trace ℚ STV4 (pfStress rho (rho/3)) = 0
    ∧ 0 < gravSource (pfStress rho (rho/3)) := by
  refine ⟨?_, radiation_source_positive rho h⟩
  rw [eos_trace]; ring

end

end Phys.Algebra.N457Probe2
