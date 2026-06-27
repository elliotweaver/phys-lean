import Phys.Algebra.LorentzContinuumGenerationFullSO9Assembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def deflateNinth (x' : Cut) (v' : O Cut) : Module.End Cut STVC :=
  axisRotLin ((cutSqrt (gFormC v' v'))⁻¹ • v') x' (-(cutSqrt (gFormC v' v')))

theorem gFormC_pos_of_ne {v' : O Cut} (hv : v' ≠ 0) : 0 < gFormC v' v' := by
  rcases lt_or_eq_of_le (gFormC_nonneg v') with h | h
  · exact h
  · exact absurd ((gFormC_eq_zero_iff v').mp h.symm) hv

theorem deflate_r_ne {v' : O Cut} (hv : v' ≠ 0) : cutSqrt (gFormC v' v') ≠ 0 :=
  ne_of_gt (cutSqrt_pos (gFormC_pos_of_ne hv))

theorem deflateNinth_axis_unit {v' : O Cut} (hv : v' ≠ 0) :
    gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  rw [gFormC_smul_left, gFormC_smul_right, ← hrr]
  field_simp

/-- The circle condition: x'² + (−r)² = 1 from the norm condition. -/
theorem deflateNinth_circle {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    x' ^ 2 + (-(cutSqrt (gFormC v' v'))) ^ 2 = 1 := by
  have hrr : cutSqrt (gFormC v' v') * cutSqrt (gFormC v' v') = gFormC v' v' :=
    cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  nlinarith [hnorm, hrr]

/-- SOUND ∈ genIsomMonoidLinFamily: a general-axis ninth generator (unit axis + circle point). -/
theorem deflateNinth_mem {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' ∈ genIsomMonoidLinFamily :=
  axisRotLin_mem_genIsomMonoidLinFamily _ _ _ (deflateNinth_axis_unit hv)
    (deflateNinth_circle hv hnorm)

/-- A QvC-isometry via family soundness. -/
theorem deflateNinth_isQvIsomC {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    IsQvIsomC (deflateNinth x' v') :=
  genIsomMonoidLinFamily_isQvIsomC (deflateNinth_mem hv hnorm)

theorem isom_xaxis_image_norm {T : STVC → STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut} (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) :
    x' ^ 2 + gFormC v' v' = 1 := by
  have h := hT ((0:Cut), (1:Cut), (0:O Cut))
  rw [hTimg] at h
  unfold QvC QformC at h
  simp only at h
  rw [gFormC_zero_left] at h
  nlinarith [h]

theorem deflateNinth_apply_image {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' ((0:Cut), x', v') = ((0:Cut), (1:Cut), (0:O Cut)) := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold deflateNinth
  rw [axisRotLin_apply]
  have hread : gFormC v' (r⁻¹ • v') = r := by
    rw [gFormC_smul_right, ← hrr]; field_simp
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show x' * x' - (-(r)) * gFormC v' (r⁻¹ • v') = 1
    rw [hread]
    have : x' * x' + r * r = 1 := by rw [hrr]; nlinarith [hnorm]
    ring_nf; ring_nf at this; linarith [this]
  · show v' + ((-(r)) * x' + (x' - 1) * gFormC v' (r⁻¹ • v')) • ((r⁻¹) • v') = 0
    rw [hread, smul_smul]
    rw [show ((-(r)) * x' + (x' - 1) * r) * r⁻¹ = (-(1:Cut)) by field_simp; ring]
    rw [neg_one_smul]; abel

/-- ★★ THE DEFLATION STEP: T a QvC-isometry, T(0,1,0)=(0,x',v'), v'≠0 ⇒ the composite
    deflateNinth x' v' ∘ T FIXES the x-axis unit vector (0,1,0). The x-motion is peeled off by a
    single explicit general-axis ninth rotation — the SO(9)→(x-fixing stabilizer) reduction. -/
theorem deflateNinth_step {T : Module.End Cut STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut}
    (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0) :
    (deflateNinth x' v' * T) ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)) := by
  have hnorm := isom_xaxis_image_norm hT hTimg
  rw [Module.End.mul_apply, hTimg, deflateNinth_apply_image hv hnorm]

/-! ## W8 teeth — a concrete x-moving image `(3/5, (4/5)•e₂)` deflated back to (0,1,0). -/

/-- The concrete moved image `(0, 3/5, (4/5)•e₂)` satisfies the norm condition:
    (3/5)² + gFormC ((4/5)•e₂) ((4/5)•e₂) = 9/25 + (4/5)²·1 = 1. -/
theorem deflate_witness_norm :
    ((3:Cut)/5) ^ 2 + gFormC (((4:Cut)/5) • (CD.e2 : O Cut)) (((4:Cut)/5) • (CD.e2 : O Cut)) = 1 := by
  rw [gFormC_smul_left, gFormC_smul_right, e2_gFormC_self]; norm_num

theorem deflate_witness_v_ne : (((4:Cut)/5) • (CD.e2 : O Cut)) ≠ 0 := by
  intro h
  have : gFormC (((4:Cut)/5) • (CD.e2 : O Cut)) (((4:Cut)/5) • (CD.e2 : O Cut)) = 0 := by
    rw [h, gFormC_zero_left]
  rw [gFormC_smul_left, gFormC_smul_right, e2_gFormC_self] at this
  norm_num at this

/-- ★ W8 — the concrete x-moving image `(3/5,(4/5)•e₂)` is deflated back to `(0,1,0)`:
    its x-slot reads `1`. -/
theorem deflate_witness_x_val :
    (deflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))
        ((0:Cut), (3:Cut)/5, ((4:Cut)/5) • (CD.e2 : O Cut))).2.1 = 1 := by
  rw [deflateNinth_apply_image deflate_witness_v_ne deflate_witness_norm]

end

end Phys.Algebra
