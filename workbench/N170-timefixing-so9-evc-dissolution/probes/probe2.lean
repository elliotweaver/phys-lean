import Phys.Algebra.LorentzContinuumSO9CompactAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem timeFixing_xaxis_time_zero {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    (k ((0:Cut), (1:Cut), (0:O Cut))).1 = 0 := by
  have h := linIsom_BvC_preserved hk ((0:Cut), (1:Cut), (0:O Cut)) ((1:Cut), (0:Cut), (0:O Cut))
  rw [htime] at h
  simp only [BvC, gFormC_zero_right', mul_one, mul_zero, sub_zero] at h
  linarith [h]

theorem timeFixing_xaxis_spatial_form {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    k ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (k ((0:Cut), (1:Cut), (0:O Cut))).2.1,
          (k ((0:Cut), (1:Cut), (0:O Cut))).2.2) := by
  have h0 := timeFixing_xaxis_time_zero hk htime
  apply Prod.ext
  · exact h0
  · rfl

theorem joinedIdQvC_of_timeFixing_SO9 {k : Module.End Cut STVC}
    (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1) :
    JoinedIdQvC k := by
  have himg := timeFixing_xaxis_spatial_form hk htime
  exact joinedIdQvC_of_timeFixing_evCOrth_SO9_aux hk htime himg hv hdet

/-! ## Helpers for the W8 witness. -/

-- deflate * inflate = 1 (the OTHER order to inflate_deflate_id; same-axis angle addition).
theorem deflate_inflate_id {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' * inflateNinth x' v' = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have he : gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 :=
    deflateNinth_axis_unit hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold deflateNinth inflateNinth
  rw [axisRotLin_comp_same_axis _ he x' (-r) x' r]
  rw [show x' * x' - (-r) * r = (1:Cut) by nlinarith [hnorm, hrr]]
  rw [show x' * r + (-r) * x' = (0:Cut) by ring]
  exact axisRotLin_one_zero _

-- vBlock of identity is identity.
theorem vBlockEndC_one : vBlockEndC (1 : Module.End Cut STVC) = LinearMap.id := by
  apply LinearMap.ext; intro v
  rw [vBlockEndC_apply]
  rfl

/-! ## W8 NON-VACUITY — a concrete time-fixing x-moving QvC-isometry is JoinedIdQvC by the EvC-free route. -/

theorem joinedIdQvC_timeFixingWitness :
    JoinedIdQvC (inflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))) := by
  set v' : O Cut := ((4:Cut)/5) • (CD.e2 : O Cut) with hv'def
  set k : Module.End Cut STVC := inflateNinth ((3:Cut)/5) v' with hkdef
  have hvne : v' ≠ 0 := deflate_witness_v_ne
  have hnorm : ((3:Cut)/5) ^ 2 + gFormC v' v' = 1 := deflate_witness_norm
  have hk : IsQvIsomC k := inflateNinth_isQvIsomC hvne hnorm
  -- k fixes the timelike axis (axisRotLin fixes the t-slot)
  have htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)) := by
    rw [hkdef]; unfold inflateNinth; rw [axisRotLin_apply]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show ((3:Cut)/5) * 0 - _ * gFormC (0:O Cut) _ = 0
      rw [gFormC_zero_left]; ring
    · show (0:O Cut) + (_ * 0 + _ * gFormC (0:O Cut) _) • _ = 0
      rw [gFormC_zero_left]; rw [mul_zero, mul_zero, add_zero, zero_smul, add_zero]
  -- k moves the x-axis to (0, 3/5, v')
  have kpole : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (3:Cut)/5, v') := by
    rw [hkdef]; exact inflateNinth_apply_pole hvne hnorm
  have hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0 := by rw [kpole]; exact hvne
  have hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1 := by
    rw [kpole]
    simp only
    rw [hkdef, deflate_inflate_id hvne hnorm, vBlockEndC_one, LinearMap.det_id]
  exact joinedIdQvC_of_timeFixing_SO9 hk htime hv hdet

end

end Phys.Algebra
