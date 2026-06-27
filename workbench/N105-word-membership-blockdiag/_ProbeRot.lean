import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem gFormC_one_right (v : O Cut) : gFormC v (1 : O Cut) = reQC v := by
  unfold gFormC; rw [star_one, mul_one]
theorem gFormC_one_left (v : O Cut) : gFormC (1 : O Cut) v = reQC v := by
  rw [gFormC_symm]; exact gFormC_one_right v

theorem gFormC_add_one_self (v : O Cut) (a : Cut) :
    gFormC (v + a • (1 : O Cut)) (v + a • (1 : O Cut))
      = gFormC v v + 2 * (a * reQC v) + a^2 := by
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right]
  rw [gFormC_smul_right a v (1:O Cut), gFormC_one_right v]
  rw [gFormC_smul_left a (1:O Cut) v, gFormC_one_left v]
  rw [gFormC_smul_left a (1:O Cut) (a • (1:O Cut)), gFormC_smul_right a (1:O Cut) (1:O Cut), gFormC_one]
  ring

-- Genuine SO(2) rotation of span{x, (1)-axis of v} by circle point (c,s).
def planeRotLin (c s : Cut) : Module.End Cut STVC where
  toFun p := (p.1, c * p.2.1 - s * reQC p.2.2,
              p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut))
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (p.2.1 + q.2.1) - s * reQC (p.2.2 + q.2.2)
          = (c * p.2.1 - s * reQC p.2.2) + (c * q.2.1 - s * reQC q.2.2)
      rw [reQC_add]; ring
    · show (p.2.2 + q.2.2) + (s * (p.2.1 + q.2.1) + (c - 1) * reQC (p.2.2 + q.2.2)) • (1 : O Cut)
          = (p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut))
            + (q.2.2 + (s * q.2.1 + (c - 1) * reQC q.2.2) • (1 : O Cut))
      rw [reQC_add]
      rw [show s * (p.2.1 + q.2.1) + (c - 1) * (reQC p.2.2 + reQC q.2.2)
            = (s * p.2.1 + (c - 1) * reQC p.2.2) + (s * q.2.1 + (c - 1) * reQC q.2.2) by ring]
      rw [add_smul]; abel
  map_smul' a p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (a • p.2.1) - s * reQC (a • p.2.2) = a • (c * p.2.1 - s * reQC p.2.2)
      rw [reQC_smul]; simp only [smul_eq_mul]; ring
    · show (a • p.2.2) + (s * (a • p.2.1) + (c - 1) * reQC (a • p.2.2)) • (1 : O Cut)
          = a • (p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut))
      rw [reQC_smul]
      rw [smul_add, smul_smul]
      rw [show s * (a • p.2.1) + (c - 1) * (a * reQC p.2.2)
            = a * (s * p.2.1 + (c - 1) * reQC p.2.2) by simp only [smul_eq_mul]; ring]

theorem planeRotLin_apply (c s : Cut) (p : STVC) :
    planeRotLin c s p = (p.1, c * p.2.1 - s * reQC p.2.2,
              p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut)) := rfl

theorem planeRotLin_isQvIsomC (c s : Cut) (h : c^2 + s^2 = 1) :
    IsQvIsomC (planeRotLin c s) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [planeRotLin_apply]
  show QvC (t, c * x - s * reQC v, v + (s * x + (c - 1) * reQC v) • (1 : O Cut))
      = QvC (t, x, v)
  unfold QvC QformC
  simp only
  rw [gFormC_add_one_self v (s * x + (c - 1) * reQC v)]
  set r := reQC v with hr
  ring_nf
  nlinarith [h, sq_nonneg (c*x - s*r)]

theorem reQC_zero : reQC (0 : O Cut) = 0 := by simp [reQC]

theorem planeRotLin_moves_x (c s : Cut) :
    (planeRotLin c s ((0:Cut), (1:Cut), (0:O Cut))).2.1 = c := by
  rw [planeRotLin_apply]
  show c * 1 - s * reQC (0 : O Cut) = c
  rw [reQC_zero]; ring

end

end Phys.Algebra
