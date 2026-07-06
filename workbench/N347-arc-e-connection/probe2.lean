import Phys.Algebra.SpacetimeWeakFieldMetric

namespace Phys.Algebra.N347Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def lbConn (k : MetricEnd) : MetricEnd := (2⁻¹ : Cut) • (sigOpC * k)
def lbConnAdj (k : MetricEnd) : MetricEnd := (2⁻¹ : Cut) • (k * sigOpC)

-- Beat 3: IsEvCAdjoint of a scaled operator
example (c : Cut) (g h : MetricEnd) (H : IsEvCAdjoint g h) :
    IsEvCAdjoint (c • g) (c • h) := by
  intro p q
  simp only [LinearMap.smul_apply]
  rw [EvC_smul_left, EvC_smul_right, H p q]

-- Beat 3 full: the transport's adjoint is lbConnAdj when k is self-adjoint
example (k : MetricEnd) (hk : IsEvCAdjoint k k) :
    IsEvCAdjoint (lbConn k) (lbConnAdj k) := by
  unfold lbConn lbConnAdj
  intro p q
  simp only [LinearMap.smul_apply]
  rw [EvC_smul_left, EvC_smul_right]
  congr 1
  -- EvC ((sigOpC*k) p) q = EvC p ((k*sigOpC) q)
  show EvC (sigOpC (k p)) q = EvC p (k (sigOpC q))
  rw [sigOpC_isEvCAdjoint_self (k p) q, hk p (sigOpC q)]

-- Beat 5: flat (k=0 ⟹ lbConn 0 = 0)
example : lbConn 0 = 0 := by unfold lbConn; simp

-- Beat 6: linearity
example (k₁ k₂ : MetricEnd) : lbConn (k₁ + k₂) = lbConn k₁ + lbConn k₂ := by
  unfold lbConn; rw [mul_add, smul_add]

-- Beat 7 / W8: the WRONG connection (no ½) fails metric-compat for timeProj
-- wrongConn k := η*k ;  (k*η)*η + η*(η*k) = k + k = 2k ≠ k when k ≠ 0
example : (timeProj * sigOpC) * sigOpC + sigOpC * (sigOpC * timeProj) ≠ (timeProj : MetricEnd) := by
  rw [mul_assoc, eta_mul_self, mul_one, ← mul_assoc, eta_mul_self, one_mul]
  intro hcon
  -- 2*timeProj = timeProj ⟹ timeProj = 0
  have : (timeProj : MetricEnd) = 0 := by
    have h2 : timeProj + timeProj = timeProj := hcon
    linear_combination (norm := abel) h2
  exact timeProj_ne_zero this

-- non-vacuity: lbConn timeProj ≠ 0
example : lbConn timeProj ≠ 0 := by
  unfold lbConn
  intro hcon
  -- ½•(η*timeProj) = 0 ⟹ η*timeProj = 0 (½ ≠ 0) ⟹ timeProj = 0 (η invertible)
  rw [smul_eq_zero] at hcon
  rcases hcon with h | h
  · exact (by norm_num : (2⁻¹ : Cut) ≠ 0) h
  · -- η*timeProj = 0 ⟹ timeProj = 0 via η*η=1
    have : sigOpC * (sigOpC * timeProj) = sigOpC * 0 := by rw [h]
    rw [← mul_assoc, eta_mul_self, one_mul, mul_zero] at this
    exact timeProj_ne_zero this

end

end Phys.Algebra.N347Probe
