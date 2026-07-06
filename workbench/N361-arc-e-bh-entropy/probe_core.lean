import Phys.Foundation.ContinuumScalarDeriv
import Phys.Algebra.SpacetimeHawkingTemperature
import Phys.Algebra.FineStructureRunningCoupling

namespace Phys.Algebra.Probe2

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- from probe 1 (assume banked)
def HasCutDerivAt (f : Cut → Cut) (f' x : Cut) : Prop :=
    Tendsto (fun t : Cut => t⁻¹ * (f (x + t) - f x)) (𝓝[≠] (0 : Cut)) (𝓝 f')

theorem cut_tendsto_id_zero : Tendsto (fun t : Cut => t) (𝓝[≠] (0:Cut)) (𝓝 0) := by
  have h := (continuous_id (X := Cut)).tendsto (0:Cut)
  exact h.mono_left nhdsWithin_le_nhds

theorem hasCutDerivAt_sq (x : Cut) : HasCutDerivAt (fun y => y ^ 2) (2 * x) x := by
  unfold HasCutDerivAt
  have hcongr : (fun t : Cut => t⁻¹ * ((x + t) ^ 2 - x ^ 2))
      =ᶠ[𝓝[≠] (0:Cut)] (fun t : Cut => 2 * x + t) := by
    filter_upwards [self_mem_nhdsWithin] with t ht
    have htne : t ≠ 0 := ht
    field_simp; ring
  rw [tendsto_congr' hcongr]
  have : Tendsto (fun t : Cut => 2 * x + t) (𝓝[≠] (0:Cut)) (𝓝 (2 * x + 0)) :=
    tendsto_const_nhds.add cut_tendsto_id_zero
  simpa using this

theorem hasCutDerivAt_const_mul (c : Cut) {f : Cut → Cut} {f' x : Cut}
    (h : HasCutDerivAt f f' x) : HasCutDerivAt (fun y => c * f y) (c * f') x := by
  unfold HasCutDerivAt at h ⊢
  have hc := h.const_mul c
  refine hc.congr ?_; intro t; ring

theorem hasCutDerivAt_congr {f g : Cut → Cut} {f' x : Cut} (h : HasCutDerivAt f f' x)
    (hfg : ∀ y, f y = g y) : HasCutDerivAt g f' x := by
  unfold HasCutDerivAt at h ⊢
  simpa only [hfg] using h

-- ===== Part B: first law =====
def bhEntropy (M : Cut) : Cut := gravCouplingCoeff * M ^ 2 / 2

/-- dS/dM = gravCouplingCoeff·M (the first law form 1/T_H). -/
theorem bhEntropy_firstLaw (M : Cut) : HasCutDerivAt bhEntropy (gravCouplingCoeff * M) M := by
  have h1 : HasCutDerivAt (fun y => (gravCouplingCoeff / 2) * y ^ 2)
      ((gravCouplingCoeff / 2) * (2 * M)) M :=
    hasCutDerivAt_const_mul (gravCouplingCoeff / 2) (hasCutDerivAt_sq M)
  have hval : (gravCouplingCoeff / 2) * (2 * M) = gravCouplingCoeff * M := by ring
  rw [hval] at h1
  exact hasCutDerivAt_congr h1 (fun y => by unfold bhEntropy; ring)

/-- The first law as 1/T_H: dS/dM = 1/hawkingTemp, given κsg=(4M)⁻¹. -/
theorem bhEntropy_firstLaw_temp (κsg M : Cut) (hM : M ≠ 0) (h : κsg = (4 * M)⁻¹) :
    HasCutDerivAt bhEntropy (1 / hawkingTemp κsg) M := by
  have hT : (1 : Cut) / hawkingTemp κsg = gravCouplingCoeff * M := by
    rw [hawkingTemp_schwarzschild κsg M hM h, one_div_one_div]
  rw [hT]; exact bhEntropy_firstLaw M

-- ===== Part C: area law + 1/4 =====
def bhArea (M : Cut) : Cut := gaussSphereSolidAngle * (2 * M) ^ 2

/-- ★★★ S = A/4, reduces to the banked gravCouplingCoeff = 2·gaussSphereSolidAngle (N359). -/
theorem bhEntropy_eq_area_quarter (M : Cut) : bhEntropy M = bhArea M / 4 := by
  unfold bhEntropy bhArea
  rw [gravCouplingCoeff_two_flux]; ring

-- ===== Part D: binary self-blindness count =====
def cellEntropy : Cut := cutLog 2
def cellArea : Cut := 4 * cellEntropy

theorem cellEntropy_pos : 0 < cellEntropy := by
  unfold cellEntropy; exact cutLog_pos (by norm_num)

/-- S = N·s₀ cell decomposition (N = A/a* cells). -/
theorem bhEntropy_cell_decomposition (M : Cut) :
    bhEntropy M = (bhArea M / cellArea) * cellEntropy := by
  have hne : cellEntropy ≠ 0 := ne_of_gt cellEntropy_pos
  unfold cellArea
  rw [bhEntropy_eq_area_quarter]
  field_simp

-- ===== Part E: W8 non-vacuity =====
/-- binary is load-bearing: ln2 ≠ ln3 (ω=3 would give 4 ln3). -/
theorem cellEntropy_binary_ne_ternary : cellEntropy ≠ cutLog 3 := by
  unfold cellEntropy
  have := cutLog_lt (by norm_num : (0:Cut) < 2) (by norm_num : (2:Cut) < 3)
  exact ne_of_lt this

/-- ½ instead of ¼ fails: S ≠ A/2 for M≠0. -/
theorem bhEntropy_ne_area_half (M : Cut) (hM : M ≠ 0) : bhEntropy M ≠ bhArea M / 2 := by
  unfold bhEntropy bhArea
  rw [gravCouplingCoeff_two_flux]
  have hg := gaussSphereSolidAngle_pos
  have hM2 : 0 < M ^ 2 := by positivity
  intro hc
  -- gaussSphereSolidAngle*M^2 = gaussSphereSolidAngle*2M^2  ⟹  contradiction
  have : gaussSphereSolidAngle * M ^ 2 = gaussSphereSolidAngle * (2 * M ^ 2) := by
    field_simp at hc ⊢; nlinarith [hc]
  nlinarith [mul_pos hg hM2]

end

end Phys.Algebra.Probe2
