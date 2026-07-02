import Phys.Algebra.LorentzContinuumSO9CompactAssembly

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators

-- M1: cutSqrt is globally Monotone (0 on negatives, increasing on nonneg)
theorem m_cutSqrt_monotone : Monotone (cutSqrt : Cut → Cut) := by
  intro x y hxy
  rcases lt_or_ge x 0 with hx | hx
  · -- x < 0 : cutSqrt x = 0
    have : cutSqrt x = 0 := by unfold cutSqrt; rw [dif_neg (not_le.mpr hx)]
    rw [this]; exact cutSqrt_nonneg y
  · -- 0 ≤ x ≤ y : both nonneg, squares ordered
    have hy : 0 ≤ y := le_trans hx hxy
    have hsx := cutSqrt_nonneg x
    have hsy := cutSqrt_nonneg y
    nlinarith [cutSqrt_sq hx, cutSqrt_sq hy, mul_self_nonneg (cutSqrt y - cutSqrt x)]

-- M2: THE KEY — continuity of the cosh-analogue  m ↦ cutSqrt(1+m²)  via squeeze.
theorem m_cont_cutSqrt_one_add_sq : Continuous (fun m : Cut => cutSqrt (1 + m^2)) := by
  rw [continuous_iff_continuousAt]
  intro m₀
  set c := cutSqrt (1 + m₀^2) with hc
  have h1m : ∀ m : Cut, (0:Cut) ≤ 1 + m^2 := fun m => by positivity
  have hge1 : ∀ m : Cut, (1:Cut) ≤ cutSqrt (1 + m^2) := by
    intro m
    have hsq := cutSqrt_sq (h1m m)
    nlinarith [cutSqrt_nonneg (1 + m^2), sq_nonneg m]
  -- |h(m)-c| ≤ |m²-m₀²|  then squeeze
  have hbound : ∀ m : Cut, |cutSqrt (1 + m^2) - c| ≤ |m^2 - m₀^2| := by
    intro m
    have hsm := cutSqrt_sq (h1m m)
    have hsc := cutSqrt_sq (h1m m₀)
    have hden : (1:Cut) ≤ cutSqrt (1 + m^2) + c := by
      have ha1 := hge1 m; have ha2 := hge1 m₀; rw [← hc] at ha2; linarith
    have hdenpos : (0:Cut) < cutSqrt (1 + m^2) + c := by linarith
    have hdiff : (cutSqrt (1 + m^2) - c) * (cutSqrt (1 + m^2) + c) = m^2 - m₀^2 := by
      have hcc : c * c = 1 + m₀^2 := by rw [hc]; exact hsc
      nlinarith [hsm, hcc]
    have : |cutSqrt (1 + m^2) - c| * |cutSqrt (1 + m^2) + c| = |m^2 - m₀^2| := by
      rw [← abs_mul, hdiff]
    rw [abs_of_pos hdenpos] at this
    have habs : |cutSqrt (1 + m^2) - c| * (cutSqrt (1 + m^2) + c) = |m^2 - m₀^2| := this
    -- divide
    rw [← habs]
    nlinarith [abs_nonneg (cutSqrt (1 + m^2) - c), hden]
  -- squeeze:  c - |m²-m₀²| ≤ h(m) ≤ c + |m²-m₀²|
  have hcont_e : Continuous (fun m : Cut => |m^2 - m₀^2|) :=
    (continuous_abs).comp ((continuous_pow 2).sub continuous_const)
  have htend_e0 : Filter.Tendsto (fun m : Cut => |m^2 - m₀^2|) (nhds m₀) (nhds 0) := by
    have h0 : |m₀^2 - m₀^2| = (0:Cut) := by simp
    have := hcont_e.tendsto m₀
    rwa [h0] at this
  have hlo : Filter.Tendsto (fun m : Cut => c - |m^2 - m₀^2|) (nhds m₀) (nhds c) := by
    have := (tendsto_const_nhds (x := c) (f := nhds m₀)).sub htend_e0
    simpa using this
  have hhi : Filter.Tendsto (fun m : Cut => c + |m^2 - m₀^2|) (nhds m₀) (nhds c) := by
    have := (tendsto_const_nhds (x := c) (f := nhds m₀)).add htend_e0
    simpa using this
  show Filter.Tendsto (fun m : Cut => cutSqrt (1 + m^2)) (nhds m₀) (nhds c)
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le hlo hhi
  · intro m; have := hbound m; rw [abs_sub_le_iff] at this; linarith [this.1, abs_nonneg (cutSqrt (1+m^2) - c)]
  · intro m; have := hbound m; rw [abs_sub_le_iff] at this; linarith [this.1]

-- M3: isometry + reaches are pure algebra (no continuity)
theorem m_iso (m : Cut) : (cutSqrt (1 + m^2))^2 - m^2 = 1 := by
  have := cutSqrt_sq (show (0:Cut) ≤ 1 + m^2 by positivity)
  nlinarith [this]

theorem m_reaches (a b : Cut) (hab : a^2 - b^2 = 1) (ha : 0 < a) :
    cutSqrt (1 + b^2) = a := by
  have h1b : (1:Cut) + b^2 = a^2 := by nlinarith [hab]
  rw [h1b]
  exact (cutSqrt_unique (le_of_lt ha) (by ring)).symm

end
end Phys.Algebra
