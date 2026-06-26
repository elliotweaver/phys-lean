import Phys.Algebra.LorentzContinuumEigenBasis

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

def rotA (c s : Cut) : STVC := (c, s, (0 : O Cut))
def rotB (c s : Cut) : STVC := (-s, c, (0 : O Cut))

theorem rotA_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (rotA c s) (rotA c s) = 1 := by
  show c * c + s * s + gFormC 0 0 = 1
  rw [gFormC_zero_left, add_zero]; exact h
theorem rotB_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (rotB c s) (rotB c s) = 1 := by
  show (-s) * (-s) + c * c + gFormC 0 0 = 1
  rw [gFormC_zero_left, add_zero]; linear_combination h
theorem rotAB_orth (c s : Cut) : EvC (rotA c s) (rotB c s) = 0 := by
  show c * (-s) + s * c + gFormC 0 0 = 0
  rw [gFormC_zero_left, add_zero]; ring

theorem specOp_rot_eq_txOp (l₁ l₂ c s : Cut) :
    specOp l₁ l₂ (rotA c s) (rotB c s)
      = txOp (l₁*c*c + l₂*s*s) ((l₁-l₂)*c*s) (l₁*s*s + l₂*c*c) := by
  apply LinearMap.ext
  intro p; obtain ⟨t, x, v⟩ := p
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

-- the constructed eigenbasis is normalized: (b/nrm)²+((R-δ)/nrm)²=1
theorem rotEig_normalized (b R δ nrm : Cut)
    (hRR : R * R = δ*δ + b*b) (hN : nrm * nrm = 2*R*(R-δ)) (hnrm : nrm ≠ 0) :
    (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 := by
  have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
  have key : b*b + (R-δ)*(R-δ) = nrm*nrm := by rw [hN]; linear_combination -hRR
  calc (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm)
      = (b*b + (R-δ)*(R-δ))/(nrm*nrm) := by ring
    _ = (nrm*nrm)/(nrm*nrm) := by rw [key]
    _ = 1 := div_self hN2

-- ===== CONCRETE WITNESS via the forward lemma (clean rational rotation) =====
-- specOp 100 25 (rotA 4/5 3/5)(rotB 4/5 3/5) = txOp 73 36 52 (unequal diagonal 73 ≠ 52)
theorem txOp_73_36_52_diag :
    txOp (73:Cut) 36 52 = specOp 100 25 (rotA (4/5) (3/5)) (rotB (4/5) (3/5)) := by
  rw [specOp_rot_eq_txOp]; norm_num

-- its operator square root specOp 10 5 (same eigenbasis)
theorem txOp_73_36_52_witness :
    IsEvCOpSqrt (specOp (10:Cut) 5 (rotA (4/5) (3/5)) (rotB (4/5) (3/5))) (txOp 73 36 52) := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  have h := specOp_op_sqrt (c₁ := (100:Cut)) (c₂ := (25:Cut)) (by norm_num) (by norm_num)
    (rotA_norm hn) (rotB_norm hn) (rotAB_orth (4/5) (3/5))
  rw [txOp_73_36_52_diag]
  rwa [show cutSqrt (100:Cut) = 10 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (25:Cut) = 5 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

end
end Phys.Algebra
