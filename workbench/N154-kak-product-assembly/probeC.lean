import Phys.Algebra.LorentzContinuumRotationPathConnected
import Phys.Algebra.LorentzContinuumGenerationConversePolar

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- assembly engine (copy)
theorem joined_id_of_factor_paths
    (p k : Module.End Cut STVC)
    (β : Cut → Module.End Cut STVC) (hβ : Continuous β) {b0 b1 : Cut}
    (hβ0 : β b0 = 1) (hβ1 : β b1 = p)
    (κ : Cut → Module.End Cut STVC) (hκ : Continuous κ) {k0 k1 : Cut}
    (hκ0 : κ k0 = 1) (hκ1 : κ k1 = k) :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      k * p ∈ Conn := by
  set A := β '' (Set.uIcc b0 b1) with hA
  have hApre : IsPreconnected A := (isPreconnected_uIcc).image _ hβ.continuousOn
  have h1A : (1 : Module.End Cut STVC) ∈ A := ⟨b0, Set.left_mem_uIcc, hβ0⟩
  have hpA : p ∈ A := ⟨b1, Set.right_mem_uIcc, hβ1⟩
  set B := (fun t => κ t * p) '' (Set.uIcc k0 k1) with hB
  have hBcont : Continuous (fun t => κ t * p) := continuous_mul_right_path p κ hκ
  have hBpre : IsPreconnected B := (isPreconnected_uIcc).image _ hBcont.continuousOn
  have hpB : p ∈ B := ⟨k0, Set.left_mem_uIcc, by simp only [hκ0, one_mul]⟩
  have hkpB : k * p ∈ B := ⟨k1, Set.right_mem_uIcc, by simp only [hκ1]⟩
  refine ⟨A ∪ B, hApre.union p hpA hpB hBpre, Set.mem_union_left _ h1A, Set.mem_union_right _ hkpB⟩

/-! ## Concrete affine boost path joining id to a concrete boost. -/

/-- An explicit boost path `t ↦ boostEndC (1 + (2/3)t) ((4/3)t)` — affine in the boost parameters,
    from `id` (`t = 0`) to the concrete boost `boostEndC (5/3) (4/3)` (`t = 1`). -/
def boostAffinePath (t : Cut) : Module.End Cut STVC :=
  boostEndC (1 + (2/3) * t) ((4/3) * t)

theorem boostAffinePath_cont : Continuous boostAffinePath := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun t => (boostAffinePath t) v)
      = (fun t => ((1 + (2/3)*t) * v.1 + ((4/3)*t) * v.2.1,
                   ((4/3)*t) * v.1 + (1 + (2/3)*t) * v.2.1, v.2.2)) := by
    funext t; rw [boostAffinePath, boostEndC_apply]
  rw [hrw]
  apply Continuous.prodMk
  · fun_prop
  · apply Continuous.prodMk _ continuous_const
    fun_prop

theorem boostAffinePath_zero : boostAffinePath 0 = 1 := by
  rw [boostAffinePath]
  rw [Module.End.one_eq_id]
  apply LinearMap.ext
  intro p
  rw [boostEndC_apply]
  show ((1 + (2/3)*0) * p.1 + ((4/3)*0) * p.2.1, ((4/3)*0) * p.1 + (1 + (2/3)*0) * p.2.1, p.2.2) = p
  simp only [mul_zero, add_zero, one_mul, zero_mul, zero_add]

theorem boostAffinePath_one : boostAffinePath 1 = boostEndC ((5:Cut)/3) ((4:Cut)/3) := by
  rw [boostAffinePath]
  congr 1 <;> ring

/-! ## The concrete unconditional KAK-product witness. -/

/-- ★ THE ENGINE FIRES UNCONDITIONALLY on a concrete rotation × boost product: the identity `1`
    and the genuine `SO⁺(1,9)` element `planeRotLin 0 1 * boostEndC (5/3) (4/3)` (quarter turn ×
    boost) lie in a single preconnected subset of `endOpC` — NO residual. -/
theorem kakProduct_concrete_joins_id :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      (planeRotLin 0 1 * boostEndC ((5:Cut)/3) ((4:Cut)/3)) ∈ Conn := by
  apply joined_id_of_factor_paths (boostEndC ((5:Cut)/3) ((4:Cut)/3)) (planeRotLin 0 1)
    boostAffinePath boostAffinePath_cont boostAffinePath_zero boostAffinePath_one
    rotPath rotPath_cont rotPath_zero
  -- rotPath 1 = planeRotLin (cayleyC 1) (cayleyS 1) = planeRotLin 0 1
  rw [rotPath, cayleyC_one]
  congr 1
  unfold cayleyS; norm_num

/-- ★ W8 NON-VACUITY READ-OFF: the concrete product `planeRotLin 0 1 * boostEndC (5/3) (4/3)`,
    applied to the timelike axis `(1,0,0)`, sends it to a vector whose real octonion component
    reads `4/3` — the boost's own `b`-parameter, riding through the quarter turn. A genuine
    nontrivial element, not vacuous. -/
theorem kakProduct_concrete_read :
    reQC ((planeRotLin 0 1 * boostEndC ((5:Cut)/3) ((4:Cut)/3))
      ((1:Cut), (0:Cut), (0:O Cut))).2.2 = 4/3 := by
  rw [Module.End.mul_apply, boostEndC_apply, planeRotLin_apply]
  show reQC ((0:O Cut) + ((1:Cut) * ((4:Cut)/3 * 1 + (5:Cut)/3 * 0)
      + ((0:Cut) - 1) * reQC (0:O Cut)) • (1 : O Cut)) = 4/3
  rw [reQC_zero, zero_add, reQC_smul, reQC_one]
  ring

end

end Phys.Algebra
