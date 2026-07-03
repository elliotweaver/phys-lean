import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Cascade.Sedenion

open scoped Classical
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem probe_star_selfMul (w : O ℚ) : star w * w = (gForm w w) • (1 : O ℚ) := by
  have h := selfMul_eq_smul (star w)
  rw [star_star] at h
  have hg : gForm (star w) (star w) = gForm w w := by
    unfold gForm; rw [star_star, reQ_mul_comm]
  rw [hg] at h; exact h

theorem probe_im_mem (w : O ℚ) : (star w - (reQ w) • (1 : O ℚ)) ∈ ImO := by
  rw [ImO, LinearMap.mem_ker, map_sub, map_smul,
      starL_add_one_apply, starL_add_one_apply, reQ_star, reQ_one]
  module

theorem probe_worldMap_irreducible
    (W : Submodule ℚ (O ℚ))
    (hinv : ∀ a : ImO, ∀ z ∈ W, leftReg a z ∈ W)
    {w : O ℚ} (hw : w ∈ W) (hw0 : w ≠ 0) : W = ⊤ := by
  have hxx : gForm w w ≠ 0 := fun h => hw0 (gForm_self_eq_zero.mp h)
  set p : O ℚ := star w - (reQ w) • (1 : O ℚ) with hp
  have hpmem : p ∈ ImO := probe_im_mem w
  have hstarw : star w = (reQ w) • (1 : O ℚ) + p := by rw [hp]; abel
  have hsm : star w * w = (gForm w w) • (1 : O ℚ) := probe_star_selfMul w
  have hpw : p * w ∈ W := by
    have := hinv ⟨p, hpmem⟩ w hw
    simpa [leftReg, LeftMul] using this
  have hrw : (reQ w) • w ∈ W := W.smul_mem _ hw
  have hsplit : star w * w = (reQ w) • w + p * w := by
    rw [hstarw, add_mul, qsmul_mul_left, one_mul]
  have honeW : (gForm w w) • (1 : O ℚ) ∈ W := by
    rw [← hsm, hsplit]; exact W.add_mem hrw hpw
  have hone : (1 : O ℚ) ∈ W := by
    have := W.smul_mem (gForm w w)⁻¹ honeW
    rwa [smul_smul, inv_mul_cancel₀ hxx, one_smul] at this
  rw [eq_top_iff]
  intro z _
  set q : O ℚ := z - (reQ z) • (1 : O ℚ) with hq
  have hqmem : q ∈ ImO := by
    rw [hq, ImO, LinearMap.mem_ker, map_sub, map_smul,
        starL_add_one_apply, starL_add_one_apply, reQ_one]
    module
  have hqW : q * (1 : O ℚ) ∈ W := by
    have := hinv ⟨q, hqmem⟩ (1 : O ℚ) hone
    simpa [leftReg, LeftMul] using this
  have hzsplit : z = (reQ z) • (1 : O ℚ) + q * (1 : O ℚ) := by
    rw [hq, mul_one]; abel
  rw [hzsplit]
  exact W.add_mem (W.smul_mem _ hone) hqW

#print axioms probe_star_selfMul
#print axioms probe_im_mem
#print axioms probe_worldMap_irreducible

end
end Phys.Algebra
