import Phys.Algebra.MaxEntArrowOfTime
import Phys.Algebra.UniversalityCriticalExponent
import Phys.Algebra.ScaleTowerNumeratorLock
import Mathlib.Tactic

namespace Phys.Algebra.PathIntegralProbe2

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt
open Phys.Algebra.Universality
open Phys.Algebra
open Matrix
open scoped BigOperators

noncomputable section

/-- chanProj v = (Σv/N)·all-ones — the projection lands in the 1-dim relevant (all-ones) direction. -/
theorem chanProj_image_scalar (N : ℕ) (v : Fin N → ℚ) :
    (chanProj N).mulVec v = fun _ => (∑ j, v j) / (N : ℚ) := by
  unfold chanProj
  rw [Matrix.smul_mulVec, chanTot_mulVec]
  funext i
  simp only [Pi.smul_apply, smul_eq_mul, smul_eq_mul]
  rw [mul_comm, ← div_eq_mul_one_div]

/-- the residual v − chanProj v is in the codimension-1 irrelevant (sum-zero) subspace. -/
theorem chanProj_residual_sumZero (N : ℕ) (hN : 1 ≤ N) (v : Fin N → ℚ) :
    ∑ i, (v i - (chanProj N).mulVec v i) = 0 := by
  have hNpos : (N : ℚ) ≠ 0 := by
    have h : 0 < N := by omega
    exact_mod_cast h.ne'
  rw [chanProj_image_scalar]
  rw [Finset.sum_sub_distrib]
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  rw [mul_div_cancel₀ _ hNpos, sub_self]

end

end Phys.Algebra.PathIntegralProbe2
