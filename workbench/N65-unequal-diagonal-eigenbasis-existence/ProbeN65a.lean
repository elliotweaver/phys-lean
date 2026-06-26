import Phys.Algebra.LorentzContinuumEigenBasis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- the rotation eigenbasis (parameter-dependent, unequal-diagonal)
def rotA (c s : Cut) : STVC := (c, s, (0 : O Cut))
def rotB (c s : Cut) : STVC := (-s, c, (0 : O Cut))

-- orthonormality under c²+s²=1
theorem rotA_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (rotA c s) (rotA c s) = 1 := by
  show c * c + s * s + gFormC 0 0 = 1
  rw [gFormC_zero_left, add_zero]; exact h

theorem rotB_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (rotB c s) (rotB c s) = 1 := by
  show (-s) * (-s) + c * c + gFormC 0 0 = 1
  rw [gFormC_zero_left, add_zero]; linear_combination h

theorem rotAB_orth (c s : Cut) : EvC (rotA c s) (rotB c s) = 0 := by
  show c * (-s) + s * c + gFormC 0 0 = 0
  rw [gFormC_zero_left, add_zero]; ring

-- ★ THE FORWARD DECOMPOSITION (holds for ALL c,s — no orthonormality needed for the FORM)
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

end

end Phys.Algebra
