import Phys.Algebra.SpacetimeFieldEquationLHS
import Phys.Foundation.ContinuumExpDeriv

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem scalarOp_opderiv (f : Cut → Cut) (df : Cut) (A : MetricEnd)
    (hf : CutHasDerivAt f df 0) :
    HasOpDerivAt0 (fun τ => f τ • A) (df • A) := by
  rw [hasOpDerivAt0_iff]
  intro v
  have hcongr : (fun s : Cut => s⁻¹ • ((f s • A) v - (f 0 • A) v))
      = (fun s : Cut => (s⁻¹ * (f s - f 0)) • (A v)) := by
    funext s; simp only [LinearMap.smul_apply]; rw [mul_smul, ← sub_smul]
  rw [hcongr]
  have hf0 : Tendsto (fun s : Cut => s⁻¹ * (f s - f 0)) (𝓝[≠] (0 : Cut)) (𝓝 df) := by
    have := hf; unfold CutHasDerivAt at this; simpa using this
  have hgoal : ((df • A) v) = df • (A v) := by rw [LinearMap.smul_apply]
  rw [hgoal]; exact hf0.smul_const (A v)

theorem opderiv_neg {H : Cut → MetricEnd} {a : MetricEnd}
    (hH : HasOpDerivAt0 H a) : HasOpDerivAt0 (fun t => - H t) (-a) := by
  rw [hasOpDerivAt0_iff] at hH ⊢
  intro v
  refine Tendsto.congr' ?_ ((hH v).neg)
  filter_upwards with s
  simp only [LinearMap.neg_apply]; rw [← smul_neg]; congr 1; abel

theorem opderiv_sub {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t - K t) (a - b) := by
  have := opderiv_add hH (opderiv_neg hK); simp only [sub_eq_add_neg]; exact this

-- The general trace-reversal candidate endomorphism: Ric − c·R·id.
def genEinsteinRaiseMap (c : Cut) (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  ricciRaiseMap G - (c * ricciScalar G) • (LinearMap.id : MetricEnd)

-- at c = ½ this is the banked einsteinRaiseMap:
theorem genEinstein_half : ∀ G, genEinsteinRaiseMap (2⁻¹) G = einsteinRaiseMap G := by
  intro G; rfl

-- THE ASSEMBLY (grounded in banked objects): given a family of solderings G(τ),
-- if the Ricci-endomorphism field ricciRaiseMap(G τ) has op-derivative dRic and the scalar field
-- ricciScalar(G τ) has scalar-derivative dRs, then the general trace-reversal Einstein-candidate
-- field genEinsteinRaiseMap c (G τ) has op-derivative dRic − (c·dRs)•id.
theorem genEinstein_field_opderiv (c : Cut) (G : Cut → (STVC →ₗ[Cut] MetricEnd))
    (dRic : MetricEnd) (dRs : Cut)
    (hRic : HasOpDerivAt0 (fun τ => ricciRaiseMap (G τ)) dRic)
    (hRs : CutHasDerivAt (fun τ => ricciScalar (G τ)) dRs 0) :
    HasOpDerivAt0 (fun τ => genEinsteinRaiseMap c (G τ)) (dRic - (c * dRs) • (LinearMap.id : MetricEnd)) := by
  unfold genEinsteinRaiseMap
  have hmetric : HasOpDerivAt0 (fun τ => (c * ricciScalar (G τ)) • (LinearMap.id : MetricEnd))
      ((c * dRs) • (LinearMap.id : MetricEnd)) := by
    have hf : CutHasDerivAt (fun τ => c * ricciScalar (G τ)) (c * dRs) 0 := by
      unfold CutHasDerivAt at hRs ⊢
      have := hRs.const_mul c
      refine Tendsto.congr' ?_ this
      filter_upwards with h; ring
    exact scalarOp_opderiv _ _ _ hf
  exact opderiv_sub hRic hmetric

-- THE RIGIDITY: different trace-reversal coefficients give different op-derivatives (when dRs ≠ 0),
-- so AT MOST ONE coefficient c can make the Einstein candidate covariantly-divergence-free.
theorem traceReversal_coeff_rigid (G : Cut → (STVC →ₗ[Cut] MetricEnd))
    (dRic : MetricEnd) (dRs : Cut) (hdRs : dRs ≠ 0)
    {c₁ c₂ : Cut} (hc : c₁ ≠ c₂) :
    (dRic - (c₁ * dRs) • (LinearMap.id : MetricEnd))
      ≠ (dRic - (c₂ * dRs) • (LinearMap.id : MetricEnd)) := by
  intro heq
  -- subtract dRic: (c₁·dRs)•id = (c₂·dRs)•id
  have h2 : ((c₁ * dRs) • (LinearMap.id : MetricEnd)) = ((c₂ * dRs) • (LinearMap.id : MetricEnd)) := by
    have := sub_right_inj.mp heq
    exact this
  -- evaluate at (1,0,0), take .1 component
  have h3 := congrArg (fun (f : MetricEnd) => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h2
  simp only [LinearMap.smul_apply, LinearMap.id_apply, Prod.smul_fst, smul_eq_mul, mul_one] at h3
  -- h3 : c₁ * dRs = c₂ * dRs
  exact hc (mul_right_cancel₀ hdRs h3)

end

end Phys.Algebra
