import Phys.Algebra.LorentzContinuumEigenBasis

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

def rotA (c s : Cut) : STVC := (c, s, (0 : O Cut))
def rotB (c s : Cut) : STVC := (-s, c, (0 : O Cut))

theorem specOp_rot_eq_txOp (l₁ l₂ c s : Cut) :
    specOp l₁ l₂ (rotA c s) (rotB c s)
      = txOp (l₁*c*c + l₂*s*s) ((l₁-l₂)*c*s) (l₁*s*s + l₂*c*c) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [specOp_apply, txOp_apply]
  have eA : EvC (rotA c s) (t, x, v) = c*t + s*x := by
    show c * t + s * x + gFormC 0 v = c*t + s*x
    rw [gFormC_zero_left, add_zero]
  have eB : EvC (rotB c s) (t, x, v) = -s*t + c*x := by
    show (-s) * t + c * x + gFormC 0 v = -s*t + c*x
    rw [gFormC_zero_left, add_zero]
  rw [eA, eB]
  simp only [rotA, rotB, Prod.smul_mk, smul_eq_mul, Prod.mk_add_mk, smul_zero, add_zero]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show l₁ * (c*t + s*x) * c + l₂ * (-s*t + c*x) * -s = (l₁*c*c + l₂*s*s) * t + (l₁-l₂)*c*s * x
    ring
  · show l₁ * (c*t + s*x) * s + l₂ * (-s*t + c*x) * c = (l₁-l₂)*c*s * t + (l₁*s*s + l₂*c*c) * x
    ring
  · show (0 : O Cut) = 0; rfl

-- THE FULL REVERSE EXISTENCE.  m=(a+d)/2, δ=(a-d)/2, R=cutSqrt(δ²+b²), nrm=cutSqrt(2R(R-δ)).
-- For b ≠ 0:  R-δ > 0, nrm > 0, the pair u± = (b/nrm,(R-δ)/nrm,0)/(-(R-δ)/nrm, b/nrm,0) is
-- EvC-orthonormal, and  txOp a b d = specOp (m+R)(m-R) u₊ u₋.
theorem txOp_eq_specOp_rot (a b d : Cut) (hb : b ≠ 0) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    txOp a b d = specOp ((a+d)/2 + R) ((a+d)/2 - R) (rotA (b/nrm) ((R-δ)/nrm))
                                                     (rotB (b/nrm) ((R-δ)/nrm)) := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  -- R - δ > 0 : from R² = δ²+b² > δ²  and R>0
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  rw [specOp_rot_eq_txOp]
  congr 1
  · -- identity A
    symm
    have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
    have key : ((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-δ)*(R-δ) = a*(nrm*nrm) := by
      rw [hN]; linear_combination (-((a+d)/2 + R)) * hRR
    calc ((a+d)/2 + R) * (b/nrm) * (b/nrm)
          + ((a+d)/2 - R) * ((R-δ)/nrm) * ((R-δ)/nrm)
        = (((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-δ)*(R-δ))/(nrm*nrm) := by ring
      _ = (a*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = a := by rw [mul_div_assoc, div_self hN2, mul_one]
  · -- identity B
    symm
    have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
    have key : (((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-δ) = b*(nrm*nrm) := by
      rw [hN]; ring
    calc (((a+d)/2 + R) - ((a+d)/2 - R)) * (b/nrm) * ((R-δ)/nrm)
        = ((((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-δ))/(nrm*nrm) := by ring
      _ = (b*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = b := by rw [mul_div_assoc, div_self hN2, mul_one]
  · -- identity D
    symm
    have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
    have key : ((a+d)/2 + R)*(R-δ)*(R-δ) + ((a+d)/2 - R)*b*b = d*(nrm*nrm) := by
      rw [hN]; linear_combination (-((a+d)/2 - R)) * hRR
    calc ((a+d)/2 + R) * ((R-δ)/nrm) * ((R-δ)/nrm)
          + ((a+d)/2 - R) * (b/nrm) * (b/nrm)
        = (((a+d)/2 + R)*(R-δ)*(R-δ) + ((a+d)/2 - R)*b*b)/(nrm*nrm) := by ring
      _ = (d*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = d := by rw [mul_div_assoc, div_self hN2, mul_one]

end
end Phys.Algebra
