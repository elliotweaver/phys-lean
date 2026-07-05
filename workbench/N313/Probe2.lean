import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.TowerGatherIsometry
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

set_option linter.unusedSimpArgs false

-- the ONE build (full simp set — the working version from Probe.lean)
theorem imParseval (w : O ℚ) (hw : w ∈ ImO) :
    gForm w w = ∑ i : Fin 7, (gForm (imBasis i) w)^2 := by
  have hr : reQ w = 0 := reQ_ImO_zero hw
  rw [Fin.sum_univ_seven]
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := w
  simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val, gForm, reQ, u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] at hr ⊢
  nlinarith [hr, sq_nonneg a]

-- per-pair inner sum: Σ_i (assoc3 eᵢ eⱼ eₖ)^2 = 1 - δ_jk
theorem innerSum (j k : Fin 7) :
    (∑ i : Fin 7, (assoc3 (imBasis i) (imBasis j) (imBasis k))^2)
      = 1 - (if j = k then (1:ℚ) else 0) := by
  set w := octCross (imBasis j) (imBasis k) with hw
  have hwmem : w ∈ ImO := octCross_mem_ImO (imBasis_mem_ImO k)
  have hpar := imParseval w hwmem
  have hrw : (∑ i : Fin 7, (assoc3 (imBasis i) (imBasis j) (imBasis k))^2)
      = ∑ i : Fin 7, (gForm (imBasis i) w)^2 := by
    apply Finset.sum_congr rfl; intro i _; rfl
  rw [hrw, ← hpar, hw,
      octCross_lagrange (imBasis_mem_ImO j) (imBasis_mem_ImO k),
      gForm_imBasis j j, gForm_imBasis k k, gForm_imBasis j k]
  simp only [if_pos rfl]
  by_cases hjk : j = k <;> simp [hjk]

-- the total: Σ_{i,j,k} (assoc3 eᵢ eⱼ eₖ)^2 = 42
theorem phiNormSq_eq_42 :
    (∑ i : Fin 7, ∑ j : Fin 7, ∑ k : Fin 7,
        (assoc3 (imBasis i) (imBasis j) (imBasis k))^2) = 42 := by
  rw [Finset.sum_comm]
  have hstep : (∑ j : Fin 7, ∑ i : Fin 7, ∑ k : Fin 7,
        (assoc3 (imBasis i) (imBasis j) (imBasis k))^2)
      = ∑ j : Fin 7, ∑ k : Fin 7, (1 - (if j = k then (1:ℚ) else 0)) := by
    apply Finset.sum_congr rfl; intro j _
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl; intro k _
    exact innerSum j k
  rw [hstep]
  simp only [Finset.sum_sub_distrib, Finset.sum_ite_eq', Finset.mem_univ, if_true,
    Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  norm_num

end

end Phys.Algebra
