import Phys.Foundation.ContinuumScalarDeriv
import Phys.Algebra.SpacetimeHawkingTemperature

namespace Phys.Algebra.Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- Derived scalar derivative predicate over Cut (trunk-native Tendsto, N34 order topology). -/
def HasCutDerivAt (f : Cut → Cut) (f' x : Cut) : Prop :=
    Tendsto (fun t : Cut => t⁻¹ * (f (x + t) - f x)) (𝓝[≠] (0 : Cut)) (𝓝 f')

/-- The identity tends to 0 in the punctured nbhd of 0. -/
theorem cut_tendsto_id_zero : Tendsto (fun t : Cut => t) (𝓝[≠] (0:Cut)) (𝓝 0) := by
  have h := (continuous_id (X := Cut)).tendsto (0:Cut)
  exact h.mono_left nhdsWithin_le_nhds

/-- ★ THE DERIVATIVE OF THE SQUARE: d/dx (x²) = 2x. Difference quotient = 2x + t → 2x. -/
theorem hasCutDerivAt_sq (x : Cut) : HasCutDerivAt (fun y => y ^ 2) (2 * x) x := by
  unfold HasCutDerivAt
  -- eventually on t ≠ 0, the difference quotient equals 2x + t
  have hcongr : (fun t : Cut => t⁻¹ * ((x + t) ^ 2 - x ^ 2))
      =ᶠ[𝓝[≠] (0:Cut)] (fun t : Cut => 2 * x + t) := by
    filter_upwards [self_mem_nhdsWithin] with t ht
    have htne : t ≠ 0 := ht
    field_simp
    ring
  rw [tendsto_congr' hcongr]
  have : Tendsto (fun t : Cut => 2 * x + t) (𝓝[≠] (0:Cut)) (𝓝 (2 * x + 0)) :=
    tendsto_const_nhds.add cut_tendsto_id_zero
  simpa using this

/-- Const-multiple of a derivative. -/
theorem hasCutDerivAt_const_mul (c : Cut) {f : Cut → Cut} {f' x : Cut}
    (h : HasCutDerivAt f f' x) : HasCutDerivAt (fun y => c * f y) (c * f') x := by
  unfold HasCutDerivAt at h ⊢
  have hc : Tendsto (fun t : Cut => c * (t⁻¹ * (f (x + t) - f x)))
      (𝓝[≠] (0:Cut)) (𝓝 (c * f')) := h.const_mul c
  refine hc.congr ?_
  intro t; ring

end

end Phys.Algebra.Probe
