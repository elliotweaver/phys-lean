import Phys.Algebra.LorentzContinuumGenerationFullSO9Assembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE EXPLICIT DEFLATING general-axis ninth rotation. -/
def deflateNinth (x' : Cut) (v' : O Cut) : Module.End Cut STVC :=
  axisRotLin ((cutSqrt (gFormC v' v'))⁻¹ • v') x' (-(cutSqrt (gFormC v' v')))

/-- v' ≠ 0 ⇒ gFormC v' v' > 0. -/
theorem gFormC_pos_of_ne {v' : O Cut} (hv : v' ≠ 0) : 0 < gFormC v' v' := by
  rcases lt_or_eq_of_le (gFormC_nonneg v') with h | h
  · exact h
  · exact absurd ((gFormC_eq_zero_iff v').mp h.symm) hv

/-- v' ≠ 0 ⇒ r = cutSqrt(gFormC v' v') ≠ 0. -/
theorem deflate_r_ne {v' : O Cut} (hv : v' ≠ 0) : cutSqrt (gFormC v' v') ≠ 0 :=
  ne_of_gt (cutSqrt_pos (gFormC_pos_of_ne hv))

/-- The normalized axis r⁻¹•v' is a UNIT: gFormC (r⁻¹•v') (r⁻¹•v') = 1. -/
theorem deflateNinth_axis_unit {v' : O Cut} (hv : v' ≠ 0) :
    gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  rw [gFormC_smul_left, gFormC_smul_right]
  rw [← hrr]
  field_simp

/-- The norm condition x'² + gFormC v' v' = 1 from QvC-isometry. -/
theorem isom_xaxis_image_norm {T : STVC → STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut} (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) :
    x' ^ 2 + gFormC v' v' = 1 := by
  have h := hT ((0:Cut), (1:Cut), (0:O Cut))
  rw [hTimg] at h
  unfold QvC QformC at h
  simp only at h
  rw [gFormC_zero_left] at h
  nlinarith [h]

/-- ★★ THE ROTATE-BACK: deflateNinth x' v' (0, x', v') = (0,1,0), given the norm condition and v'≠0. -/
theorem deflateNinth_apply_image {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' ((0:Cut), x', v') = ((0:Cut), (1:Cut), (0:O Cut)) := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold deflateNinth
  rw [axisRotLin_apply]
  -- read component gFormC v' (r⁻¹•v') = r⁻¹ * gFormC v' v' = r⁻¹*(r*r) = r
  have hread : gFormC v' (r⁻¹ • v') = r := by
    rw [gFormC_smul_right, ← hrr]; field_simp
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · -- x-slot: x'·x' - (-r)·(gFormC v' (r⁻¹•v')) = x'² + r·r = 1
    show x' * x' - (-(r)) * gFormC v' (r⁻¹ • v') = 1
    rw [hread]
    have : x' * x' + r * r = 1 := by rw [hrr]; nlinarith [hnorm]
    ring_nf
    ring_nf at this
    linarith [this]
  · -- v-block: v' + (-r·x' + (x'-1)·gFormC v' (r⁻¹•v'))•(r⁻¹•v') = 0
    show v' + ((-(r)) * x' + (x' - 1) * gFormC v' (r⁻¹ • v')) • ((r⁻¹) • v') = 0
    rw [hread]
    rw [smul_smul]
    rw [show ((-(r)) * x' + (x' - 1) * r) * r⁻¹ = (-(1:Cut)) by
      field_simp; ring]
    rw [neg_one_smul]
    abel

end

end Phys.Algebra
