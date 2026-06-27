import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators

-- ============ the composition law + identity rotation ============
theorem axisRotLin_comp_same_axis (e : O Cut) (he : gFormC e e = 1) (c1 s1 c2 s2 : Cut) :
    axisRotLin e c1 s1 * axisRotLin e c2 s2
      = axisRotLin e (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, axisRotLin_apply, axisRotLin_apply, axisRotLin_apply]
  have hread : gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e
      = c2 * gFormC v e + s2 * x := by
    rw [gFormC_add_left, gFormC_smul_left, he]; ring
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c1 * (c2 * x - s2 * gFormC v e) - s1 * gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e
        = (c1 * c2 - s1 * s2) * x - (c1 * s2 + s1 * c2) * gFormC v e
    rw [hread]; ring
  · show (v + (s2 * x + (c2 - 1) * gFormC v e) • e)
          + (s1 * (c2 * x - s2 * gFormC v e)
             + (c1 - 1) * gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e) • e
        = v + ((c1 * s2 + s1 * c2) * x + ((c1 * c2 - s1 * s2) - 1) * gFormC v e) • e
    rw [hread, add_assoc, ← add_smul]
    congr 2
    ring

theorem axisRotLin_one_zero (e : O Cut) : axisRotLin e (1:Cut) (0:Cut) = 1 := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [axisRotLin_apply]
  show (t, (1:Cut) * x - (0:Cut) * gFormC v e, v + ((0:Cut) * x + ((1:Cut) - 1) * gFormC v e) • e)
      = (t, x, v)
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · ring
  · rw [show (0:Cut) * x + ((1:Cut) - 1) * gFormC v e = 0 by ring, zero_smul, add_zero]

-- ============ inflateNinth = the inverse rotation ============
def inflateNinth (x' : Cut) (v' : O Cut) : Module.End Cut STVC :=
  axisRotLin ((cutSqrt (gFormC v' v'))⁻¹ • v') x' (cutSqrt (gFormC v' v'))

theorem inflateNinth_circle {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    x' ^ 2 + (cutSqrt (gFormC v' v')) ^ 2 = 1 := by
  have hrr : cutSqrt (gFormC v' v') * cutSqrt (gFormC v' v') = gFormC v' v' :=
    cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  nlinarith [hnorm, hrr]

theorem inflateNinth_mem {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    inflateNinth x' v' ∈ genIsomMonoidLinFamily :=
  axisRotLin_mem_genIsomMonoidLinFamily _ _ _ (deflateNinth_axis_unit hv)
    (inflateNinth_circle hv hnorm)

theorem inflateNinth_isQvIsomC {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    IsQvIsomC (inflateNinth x' v') :=
  genIsomMonoidLinFamily_isQvIsomC (inflateNinth_mem hv hnorm)

-- ============ the inverse / group law ============
theorem inflate_deflate_id {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    inflateNinth x' v' * deflateNinth x' v' = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have he : gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 :=
    deflateNinth_axis_unit hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold inflateNinth deflateNinth
  rw [axisRotLin_comp_same_axis _ he x' r x' (-r)]
  -- composed c = x'*x' - r*(-r) = x'² + r*r = 1 ; composed s = x'*(-r) + r*x' = 0
  rw [show x' * x' - r * (-r) = (1:Cut) by nlinarith [hnorm, hrr]]
  rw [show x' * (-r) + r * x' = (0:Cut) by ring]
  exact axisRotLin_one_zero _

-- ============ inflate re-moves the pole (dual of deflateNinth_apply_image) ============
theorem inflateNinth_apply_pole {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    inflateNinth x' v' ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v') := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold inflateNinth
  rw [axisRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show x' * 1 - r * gFormC (0:O Cut) ((r)⁻¹ • v') = x'
    rw [gFormC_zero_left]; ring
  · show (0:O Cut) + (r * 1 + (x' - 1) * gFormC (0:O Cut) ((r)⁻¹ • v')) • ((r)⁻¹ • v') = v'
    rw [gFormC_zero_left]
    rw [show r * 1 + (x' - 1) * 0 = r by ring]
    rw [smul_smul, zero_add]
    rw [show r * r⁻¹ = (1:Cut) by field_simp, one_smul]

-- ============ THE FACTORIZATION ============
theorem deflate_factorization {T : Module.End Cut STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut}
    (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0) :
    T = inflateNinth x' v' * (deflateNinth x' v' * T) := by
  have hnorm := isom_xaxis_image_norm hT hTimg
  rw [← mul_assoc, inflate_deflate_id hv hnorm, one_mul]

theorem deflate_factorization_stabilizer {T : Module.End Cut STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut}
    (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0) :
    (deflateNinth x' v' * T) ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)) ∧
    T = inflateNinth x' v' * (deflateNinth x' v' * T) :=
  ⟨deflateNinth_step hT hTimg hv, deflate_factorization hT hTimg hv⟩

-- ============ W8 witness ============
theorem inflate_witness_x_val :
    (inflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))
        ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (3:Cut)/5 := by
  rw [inflateNinth_apply_pole deflate_witness_v_ne deflate_witness_norm]

#print axioms Phys.Algebra.axisRotLin_comp_same_axis
#print axioms Phys.Algebra.inflate_deflate_id
#print axioms Phys.Algebra.inflateNinth_apply_pole
#print axioms Phys.Algebra.deflate_factorization
#print axioms Phys.Algebra.deflate_factorization_stabilizer
#print axioms Phys.Algebra.inflate_witness_x_val

end
end Phys.Algebra
