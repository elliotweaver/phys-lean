import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic
import Mathlib.Topology.Algebra.Field
import Mathlib.Topology.Algebra.Order.Field

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Filter Topology

theorem hasCutDerivAt_inv (x : Cut) (hx : x ≠ 0) :
    HasCutDerivAt (fun y => y⁻¹) (-(x^2)⁻¹) x := by
  unfold HasCutDerivAt
  have hxadd : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), x + t ≠ 0 := by
    have hcont : ContinuousAt (fun t : Cut => x + t) 0 := (continuous_const.add continuous_id).continuousAt
    have hev : ∀ᶠ t : Cut in 𝓝 (0:Cut), x + t ≠ 0 := by
      have h0 : (fun t : Cut => x + t) 0 = x := by simp
      have := hcont.eventually_ne (by simpa [h0] using hx)
      simpa using this
    exact hev.filter_mono nhdsWithin_le_nhds
  have hcongr : (fun t : Cut => t⁻¹ * ((x + t)⁻¹ - x⁻¹))
      =ᶠ[𝓝[≠] (0:Cut)] (fun t : Cut => -((x + t) * x)⁻¹) := by
    filter_upwards [self_mem_nhdsWithin, hxadd] with t ht hxt
    have htne : t ≠ 0 := ht
    field_simp
    ring
  rw [tendsto_congr' hcongr]
  have hden : ContinuousAt (fun t : Cut => (x + t) * x) 0 :=
    ((continuous_const.add continuous_id).mul continuous_const).continuousAt
  have hne0 : (fun t : Cut => (x + t) * x) 0 ≠ 0 := by simp [mul_ne_zero hx hx]
  have hinv : ContinuousAt (fun t : Cut => ((x + t) * x)⁻¹) 0 := hden.inv₀ hne0
  have hneg : ContinuousAt (fun t : Cut => -((x + t) * x)⁻¹) 0 := hinv.neg
  have htend := hneg.tendsto.mono_left (nhdsWithin_le_nhds (s := {(0:Cut)}ᶜ))
  have hval : -((x + (0:Cut)) * x)⁻¹ = -(x^2)⁻¹ := by
    have h : (x + (0:Cut)) * x = x^2 := by ring
    rw [h]
  rw [hval] at htend
  exact htend
