import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Tactic.NoncommRing

namespace Phys.Algebra.ProbeExch

open Phys.Cascade Phys.Cascade.CD
open scoped TensorProduct

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

abbrev Two := ImO ⊗[ℚ] ImO

def flipV : Module.End ℚ Two := (TensorProduct.comm ℚ ImO ImO).toLinearMap

theorem flipV_involutive : flipV * flipV = 1 := by
  ext x
  simp [flipV, Module.End.mul_apply]

theorem flipV_tmul (a b : ImO) : flipV (a ⊗ₜ b) = b ⊗ₜ a := by
  simp [flipV, TensorProduct.comm_tmul]

def symProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 + flipV)
def antisymProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 - flipV)

theorem sym_add_antisym : symProj + antisymProj = 1 := by
  unfold symProj antisymProj
  rw [← smul_add]
  have : (1 + flipV) + (1 - flipV) = (2 : ℚ) • (1 : Module.End ℚ Two) := by
    rw [two_smul]; abel
  rw [this, smul_smul]; norm_num

theorem symProj_idem : symProj * symProj = symProj := by
  have hsq : ((1 : Module.End ℚ Two) + flipV) * (1 + flipV) = (2:ℚ) • (1 + flipV) := by
    have hexp : ((1 : Module.End ℚ Two) + flipV) * (1 + flipV)
        = 1 + flipV + flipV + flipV * flipV := by noncomm_ring
    rw [hexp, flipV_involutive, two_smul]; abel
  unfold symProj
  rw [smul_mul_smul_comm, hsq, smul_smul, show (2⁻¹ * 2⁻¹ * 2 : ℚ) = 2⁻¹ by norm_num]

theorem exch_eigen_dichotomy (lam : ℚ) (x : Two) (hx : x ≠ 0)
    (h : flipV x = lam • x) : lam = 1 ∨ lam = -1 := by
  have hinv : flipV (flipV x) = x := by
    have hx2 : (flipV * flipV) x = (1 : Module.End ℚ Two) x := by rw [flipV_involutive]
    simpa [Module.End.mul_apply] using hx2
  have h2 : x = (lam * lam) • x := by
    calc x = flipV (flipV x) := hinv.symm
      _ = flipV (lam • x) := by rw [h]
      _ = lam • flipV x := by rw [map_smul]
      _ = lam • lam • x := by rw [h]
      _ = (lam * lam) • x := by rw [smul_smul]
  have h4 : lam * lam - 1 = 0 := by
    by_contra hne
    have h3 : (lam * lam - 1) • x = 0 := by
      have e : (lam * lam - 1) • x = (lam * lam) • x - (1 : ℚ) • x :=
        sub_smul (lam * lam) 1 x
      rw [e, one_smul, ← h2, sub_self]
    exact hx ((smul_eq_zero.1 h3).resolve_left hne)
  have h5 : lam * lam = 1 := by linarith
  have hfac : (lam - 1) * (lam + 1) = 0 := by ring_nf; linarith [h5]
  rcases mul_eq_zero.1 hfac with h | h
  · left; linarith
  · right; linarith

theorem pauli (v : ImO) : antisymProj (v ⊗ₜ v) = 0 := by
  unfold antisymProj
  rw [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.one_apply, flipV_tmul,
      sub_self, smul_zero]

end
end Phys.Algebra.ProbeExch
