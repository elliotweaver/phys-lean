import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationSkew
import Phys.Cascade.ForcedStop
import Mathlib.Algebra.Algebra.NonUnitalSubalgebra
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable local instance oIsScalarTower : IsScalarTower ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_left]⟩
noncomputable local instance oSMulCommClass : SMulCommClass ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_right]⟩

set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

macro "obashcore" : tactic =>
  `(tactic| (ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im,
      Dbl.smul_re, Dbl.smul_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
      Dbl.one_re, Dbl.one_im, Dbl.zero_re, Dbl.zero_im,
      Dbl.star_re', Dbl.star_im',
      mul_re, mul_im, star_re, star_im, zero_re, zero_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul,
      mul_one, mul_zero] <;> ring))

theorem quad_rel (a : O ℚ) :
    a * a = (2 * reQ a) • a - (reQ (a * star a)) • (1 : O ℚ) := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem ba_formula (a b : O ℚ) :
    b * a = (2 * reQ (a * b) - 4 * reQ a * reQ b) • (1 : O ℚ)
      + (2 * reQ b) • a + (2 * reQ a) • b - a * b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem a_ab (a b : O ℚ) :
    a * (a * b) = (2 * reQ a) • (a * b) - (reQ (a * star a)) • b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem ab_b (a b : O ℚ) :
    (a * b) * b = (2 * reQ b) • (a * b) - (reQ (b * star b)) • a := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem ab_a (a b : O ℚ) :
    (a * b) * a = (2 * reQ (a * b)) • a - (2 * reQ b * reQ (a * star a)) • (1 : O ℚ)
      + (reQ (a * star a)) • b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem b_ab (a b : O ℚ) :
    b * (a * b) = (2 * reQ (a * b)) • b - (2 * reQ a * reQ (b * star b)) • (1 : O ℚ)
      + (reQ (b * star b)) • a := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
-- (ab)*(ab) via quad_rel with x = a*b
theorem abab (a b : O ℚ) :
    (a * b) * (a * b) = (2 * reQ (a * b)) • (a * b) - (reQ ((a * b) * star (a * b))) • (1 : O ℚ) :=
  quad_rel (a * b)

noncomputable def V (a b : O ℚ) : Submodule ℚ (O ℚ) :=
  Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ))

theorem one_mem_V (a b : O ℚ) : (1 : O ℚ) ∈ V a b := Submodule.subset_span (by simp)
theorem a_mem_V (a b : O ℚ) : a ∈ V a b := Submodule.subset_span (by simp)
theorem b_mem_V (a b : O ℚ) : b ∈ V a b := Submodule.subset_span (by simp)
theorem ab_mem_V (a b : O ℚ) : a * b ∈ V a b := Submodule.subset_span (by simp)

theorem V_mul_mem (a b : O ℚ) {x y : O ℚ} (hx : x ∈ V a b) (hy : y ∈ V a b) :
    x * y ∈ V a b := by
  have h1 := one_mem_V a b; have ha := a_mem_V a b
  have hb := b_mem_V a b; have hab := ab_mem_V a b
  induction hx using Submodule.span_induction with
  | zero => rw [zero_mul]; exact Submodule.zero_mem _
  | add p q _ _ hp hq => rw [add_mul]; exact Submodule.add_mem _ hp hq
  | smul c p _ hp => rw [smul_mul_assoc]; exact Submodule.smul_mem _ _ hp
  | mem g hg =>
    induction hy using Submodule.span_induction with
    | zero => rw [mul_zero]; exact Submodule.zero_mem _
    | add p q _ _ hp hq => rw [mul_add]; exact Submodule.add_mem _ hp hq
    | smul c p _ hp => rw [mul_smul_comm]; exact Submodule.smul_mem _ _ hp
    | mem h hh =>
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hg hh
      rcases hg with rfl | rfl | rfl | rfl <;> rcases hh with rfl | rfl | rfl | rfl
      · -- 1*1
        rw [one_mul]; exact h1
      · rw [one_mul]; exact ha
      · rw [one_mul]; exact hb
      · rw [one_mul]; exact hab
      · rw [mul_one]; exact ha
      · rw [quad_rel]; exact Submodule.sub_mem _ (Submodule.smul_mem _ _ ha) (Submodule.smul_mem _ _ h1)
      · exact hab
      · rw [a_ab]; exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hab) (Submodule.smul_mem _ _ hb)
      · rw [mul_one]; exact hb
      · rw [ba_formula]
        exact Submodule.sub_mem _ (Submodule.add_mem _ (Submodule.add_mem _
          (Submodule.smul_mem _ _ h1) (Submodule.smul_mem _ _ ha)) (Submodule.smul_mem _ _ hb)) hab
      · rw [quad_rel]; exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hb) (Submodule.smul_mem _ _ h1)
      · rw [b_ab]
        refine Submodule.add_mem _ (Submodule.sub_mem _ (Submodule.smul_mem _ _ hb)
          (Submodule.smul_mem _ _ h1)) (Submodule.smul_mem _ _ ha)
      · rw [mul_one]; exact hab
      · rw [ab_a]
        refine Submodule.add_mem _ (Submodule.sub_mem _ (Submodule.smul_mem _ _ ha)
          (Submodule.smul_mem _ _ h1)) (Submodule.smul_mem _ _ hb)
      · rw [ab_b]; exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hab) (Submodule.smul_mem _ _ ha)
      · rw [abab]; exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hab) (Submodule.smul_mem _ _ h1)

#print axioms V_mul_mem

end Phys.Algebra
