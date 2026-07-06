import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.TensorProduct.Basic

namespace Phys.Algebra.ProbeExch

open Phys.Cascade Phys.Cascade.CD
open scoped TensorProduct

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The two-quantum state space and the EXCHANGE operator (flip of the tensor factors).
abbrev Two := ImO ⊗[ℚ] ImO

def flipV : Module.End ℚ Two := (TensorProduct.comm ℚ ImO ImO).toLinearMap

-- (1) exchange is an INVOLUTION (double swap = identity).
theorem flipV_involutive : flipV * flipV = 1 := by
  ext x
  simp [flipV, LinearMap.mul_apply]

theorem flipV_tmul (a b : ImO) : flipV (a ⊗ₜ b) = b ⊗ₜ a := by
  simp [flipV, TensorProduct.comm_tmul]

-- (2) the two projectors
def symProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 + flipV)
def antisymProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 - flipV)

theorem sym_add_antisym : symProj + antisymProj = 1 := by
  unfold symProj antisymProj
  rw [← smul_add]
  have : (1 + flipV) + (1 - flipV) = (2 : ℚ) • (1 : Module.End ℚ Two) := by
    rw [two_smul]; abel
  rw [this, smul_smul]; norm_num

theorem symProj_idem : symProj * symProj = symProj := by
  unfold symProj
  rw [smul_mul_smul_comm, mul_add, add_mul, add_mul, one_mul, mul_one, mul_one,
      flipV_involutive]
  -- ¼ • (1 + f + f + 1) = ½ • (1 + f)
  sorry

-- (3) DICHOTOMY: every eigenvalue of exchange is ±1 (no third statistics class).
theorem exch_eigen_dichotomy (lam : ℚ) (x : Two) (hx : x ≠ 0)
    (h : flipV x = lam • x) : lam = 1 ∨ lam = -1 := by
  have h2 : (lam * lam) • x = x := by
    have := congrArg flipV h
    rw [map_smul] at this
    rw [h] at this
    -- flipV (flipV x) = x
    have hinv : flipV (flipV x) = x := by
      have := flipV_involutive
      have hx2 : (flipV * flipV) x = (1 : Module.End ℚ Two) x := by rw [this]
      simpa [LinearMap.mul_apply] using hx2
    rw [← this] at hinv
    rw [smul_smul] at hinv
    exact hinv
  have h3 : (lam * lam - 1) • x = 0 := by
    rw [sub_smul, h2, one_smul, sub_self]
  have h4 : lam * lam - 1 = 0 := by
    by_contra hne
    exact hx ((smul_eq_zero.1 h3).resolve_left hne)
  have h5 : lam * lam = 1 := by linarith
  have : (lam - 1) * (lam + 1) = 0 := by ring_nf; linarith [h5]
  rcases mul_eq_zero.1 this with h | h
  · left; linarith
  · right; linarith

-- (4) PAULI: the antisymmetric projector kills the identical pair.
theorem pauli (v : ImO) : antisymProj (v ⊗ₜ v) = 0 := by
  unfold antisymProj
  rw [LinearMap.smul_apply, LinearMap.sub_apply, LinearMap.one_apply, flipV_tmul,
      sub_self, smul_zero]

end
end Phys.Algebra.ProbeExch
