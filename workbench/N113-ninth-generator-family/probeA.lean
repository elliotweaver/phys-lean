import Phys.Algebra.LorentzContinuumGenerationKAK

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE GENERAL-AXIS NINTH-DIRECTION ROTATION: rotation of `span{x, e}` for a general octonion axis
    `e`, reading the `e`-component `gFormC v e`. The `e = 1` case is `planeRotLin` (since
    `gFormC v 1 = reQC v`). -/
def axisRotLin (e : O Cut) (c s : Cut) : Module.End Cut STVC where
  toFun p := (p.1, c * p.2.1 - s * gFormC p.2.2 e,
              p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (p.2.1 + q.2.1) - s * gFormC (p.2.2 + q.2.2) e
          = (c * p.2.1 - s * gFormC p.2.2 e) + (c * q.2.1 - s * gFormC q.2.2 e)
      rw [gFormC_add_left]; ring
    · show (p.2.2 + q.2.2) + (s * (p.2.1 + q.2.1) + (c - 1) * gFormC (p.2.2 + q.2.2) e) • e
          = (p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
            + (q.2.2 + (s * q.2.1 + (c - 1) * gFormC q.2.2 e) • e)
      rw [gFormC_add_left]
      rw [show s * (p.2.1 + q.2.1) + (c - 1) * (gFormC p.2.2 e + gFormC q.2.2 e)
            = (s * p.2.1 + (c - 1) * gFormC p.2.2 e) + (s * q.2.1 + (c - 1) * gFormC q.2.2 e) by ring]
      rw [add_smul]; abel
  map_smul' a p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (a • p.2.1) - s * gFormC (a • p.2.2) e = a • (c * p.2.1 - s * gFormC p.2.2 e)
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (a • p.2.2) + (s * (a • p.2.1) + (c - 1) * gFormC (a • p.2.2) e) • e
          = a • (p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
      rw [gFormC_smul_left, smul_add, smul_smul]
      rw [show s * (a • p.2.1) + (c - 1) * (a * gFormC p.2.2 e)
            = a * (s * p.2.1 + (c - 1) * gFormC p.2.2 e) by simp only [smul_eq_mul]; ring]

theorem axisRotLin_apply (e : O Cut) (c s : Cut) (p : STVC) :
    axisRotLin e c s p = (p.1, c * p.2.1 - s * gFormC p.2.2 e,
              p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e) := rfl

/-- For the real axis `e = 1`, the general-axis rotation IS `planeRotLin` (`gFormC v 1 = reQC v`). -/
theorem axisRotLin_one_eq_planeRotLin (c s : Cut) :
    axisRotLin (1 : O Cut) c s = planeRotLin c s := by
  apply LinearMap.ext
  intro p
  rw [axisRotLin_apply, planeRotLin_apply, gFormC_one_right]

/-- THE GENERAL-AXIS completing-the-square identity:
    `gFormC (v + a•e) (v + a•e) = gFormC v v + 2·(a·gFormC v e) + a²·gFormC e e`. -/
theorem gFormC_add_axis_self (e v : O Cut) (a : Cut) :
    gFormC (v + a • e) (v + a • e)
      = gFormC v v + 2 * (a * gFormC v e) + a ^ 2 * gFormC e e := by
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right]
  rw [gFormC_smul_right a v e]
  rw [gFormC_smul_left a e v]
  rw [gFormC_smul_left a e (a • e), gFormC_smul_right a e e]
  rw [gFormC_symm e v]
  ring

/-- ★ `axisRotLin e c s` is a `QvC`-isometry for a unit axis (`gFormC e e = 1`) and `c²+s²=1`. -/
theorem axisRotLin_isQvIsomC (e : O Cut) (he : gFormC e e = 1) (c s : Cut) (h : c^2 + s^2 = 1) :
    IsQvIsomC (axisRotLin e c s) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [axisRotLin_apply]
  show QvC (t, c * x - s * gFormC v e, v + (s * x + (c - 1) * gFormC v e) • e)
      = QvC (t, x, v)
  unfold QvC QformC
  simp only
  rw [gFormC_add_axis_self e v (s * x + (c - 1) * gFormC v e), he]
  set r := gFormC v e with hr
  ring_nf
  nlinarith [h, sq_nonneg (c*x - s*r)]

end

end Phys.Algebra
