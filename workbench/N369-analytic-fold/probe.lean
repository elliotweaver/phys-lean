import Phys.Foundation.ContinuumScalarDeriv
import Phys.Foundation.ContinuumExp

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-- The trunk-native derivative notion at a point: the difference quotient tends to `d`
    in the punctured neighbourhood `𝓝[≠] 0`. NO Mathlib HasDerivAt/norm. -/
def CutHasDerivAt (f : Cut → Cut) (d x : Cut) : Prop :=
  Tendsto (fun h => h⁻¹ * (f (x + h) - f x)) (𝓝[≠] (0 : Cut)) (𝓝 d)

/-- ★ THE DERIVATIVE OF cutExp AT 0 IS 1. Instantiate `cut_powerseries_deriv` at the
    coefficient sequence `a n = 1/n! = expTermC 1 n`: then `a 0 = 1`, `a 1 = 1`, and
    `t^n * a n = expTermC t n`, so the summed series IS `cutExp t`. -/
theorem cutExp_diffquot_zero :
    Tendsto (fun t : Cut => t⁻¹ * (cutExp t - 1)) (𝓝[≠] (0 : Cut)) (𝓝 1) := by
  have hkey := cut_powerseries_deriv (expTermC 1) (expTermC_abs_summable 1)
  -- a 0 = 1, a 1 = 1
  have ha0 : expTermC (1 : Cut) 0 = 1 := by unfold expTermC; simp
  have ha1 : expTermC (1 : Cut) 1 = 1 := by unfold expTermC; simp
  -- the summand identity  t^n * expTermC 1 n = expTermC t n
  have hsummand : ∀ t : Cut, (∑' n, t ^ n * expTermC (1 : Cut) n) = cutExp t := by
    intro t
    unfold cutExp expTermC
    apply tsum_congr; intro n; rw [one_pow]; ring
  rw [ha0, ha1] at hkey
  simp only [hsummand] at hkey
  exact hkey

/-- ★★ THE ANALYTIC FOLD: cutExp is its own derivative EVERYWHERE. `CutHasDerivAt cutExp (cutExp x) x`.
    From `cutExp_add` (cutExp(x+h) = cutExp x · cutExp h) the difference quotient factors as
    `cutExp x · (h⁻¹(cutExp h − 1))`, whose limit is `cutExp x · 1 = cutExp x`. -/
theorem cutExp_hasDerivAt (x : Cut) : CutHasDerivAt cutExp (cutExp x) x := by
  unfold CutHasDerivAt
  have hbase := (cutExp_diffquot_zero).const_mul (cutExp x)
  -- rewrite the difference quotient to  cutExp x * (h⁻¹ (cutExp h - 1))
  have hcongr : ∀ h : Cut, h⁻¹ * (cutExp (x + h) - cutExp x)
      = cutExp x * (h⁻¹ * (cutExp h - 1)) := by
    intro h
    rw [← cutExp_add x h]
    ring
  simp only [hcongr]
  simpa using hbase

end

end Phys.Foundation.ContinuumQ
