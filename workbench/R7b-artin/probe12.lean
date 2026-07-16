import Phys.Algebra.StandpointArity
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

theorem o_quad_rel (a : O ℚ) :
    a * a = (2 * reQ a) • a - (reQ (a * star a)) • (1 : O ℚ) := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem o_ba_formula (a b : O ℚ) :
    b * a = (2 * reQ (a * b) - 4 * reQ a * reQ b) • (1 : O ℚ)
      + (2 * reQ b) • a + (2 * reQ a) • b - a * b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem o_a_mul_ab (a b : O ℚ) :
    a * (a * b) = (2 * reQ a) • (a * b) - (reQ (a * star a)) • b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem o_ab_mul_b (a b : O ℚ) :
    (a * b) * b = (2 * reQ b) • (a * b) - (reQ (b * star b)) • a := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem o_ab_mul_a (a b : O ℚ) :
    (a * b) * a = (2 * reQ (a * b)) • a - (2 * reQ b * reQ (a * star a)) • (1 : O ℚ)
      + (reQ (a * star a)) • b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem o_b_mul_ab (a b : O ℚ) :
    b * (a * b) = (2 * reQ (a * b)) • b - (2 * reQ a * reQ (b * star b)) • (1 : O ℚ)
      + (reQ (b * star b)) • a := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore
theorem o_ab_mul_ab (a b : O ℚ) :
    (a * b) * (a * b)
      = (2 * reQ (a * b)) • (a * b) - (reQ ((a * b) * star (a * b))) • (1 : O ℚ) :=
  o_quad_rel (a * b)

noncomputable def twoGenContent (a b : O ℚ) : Submodule ℚ (O ℚ) :=
  Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ))

theorem twoGenContent_one_mem (a b : O ℚ) : (1 : O ℚ) ∈ twoGenContent a b :=
  Submodule.subset_span (by simp)
theorem twoGenContent_a_mem (a b : O ℚ) : a ∈ twoGenContent a b :=
  Submodule.subset_span (by simp)
theorem twoGenContent_b_mem (a b : O ℚ) : b ∈ twoGenContent a b :=
  Submodule.subset_span (by simp)
theorem twoGenContent_ab_mem (a b : O ℚ) : a * b ∈ twoGenContent a b :=
  Submodule.subset_span (by simp)

theorem twoGenContent_mul_mem (a b : O ℚ) {x y : O ℚ}
    (hx : x ∈ twoGenContent a b) (hy : y ∈ twoGenContent a b) : x * y ∈ twoGenContent a b := by
  have h1 := twoGenContent_one_mem a b; have ha := twoGenContent_a_mem a b
  have hb := twoGenContent_b_mem a b; have hab := twoGenContent_ab_mem a b
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
      · rw [one_mul]; exact h1
      · rw [one_mul]; exact ha
      · rw [one_mul]; exact hb
      · rw [one_mul]; exact hab
      · rw [mul_one]; exact ha
      · rw [o_quad_rel]
        exact Submodule.sub_mem _ (Submodule.smul_mem _ _ ha) (Submodule.smul_mem _ _ h1)
      · exact hab
      · rw [o_a_mul_ab]
        exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hab) (Submodule.smul_mem _ _ hb)
      · rw [mul_one]; exact hb
      · rw [o_ba_formula]
        exact Submodule.sub_mem _ (Submodule.add_mem _ (Submodule.add_mem _
          (Submodule.smul_mem _ _ h1) (Submodule.smul_mem _ _ ha)) (Submodule.smul_mem _ _ hb)) hab
      · rw [o_quad_rel]
        exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hb) (Submodule.smul_mem _ _ h1)
      · rw [o_b_mul_ab]
        exact Submodule.add_mem _ (Submodule.sub_mem _ (Submodule.smul_mem _ _ hb)
          (Submodule.smul_mem _ _ h1)) (Submodule.smul_mem _ _ ha)
      · rw [mul_one]; exact hab
      · rw [o_ab_mul_a]
        exact Submodule.add_mem _ (Submodule.sub_mem _ (Submodule.smul_mem _ _ ha)
          (Submodule.smul_mem _ _ h1)) (Submodule.smul_mem _ _ hb)
      · rw [o_ab_mul_b]
        exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hab) (Submodule.smul_mem _ _ ha)
      · rw [o_ab_mul_ab]
        exact Submodule.sub_mem _ (Submodule.smul_mem _ _ hab) (Submodule.smul_mem _ _ h1)

noncomputable def twoGenSubalg (a b : O ℚ) : NonUnitalSubalgebra ℚ (O ℚ) :=
  (twoGenContent a b).toNonUnitalSubalgebra (fun _ _ hx hy => twoGenContent_mul_mem a b hx hy)

theorem adjoin_pair_mem_content (a b : O ℚ) {x : O ℚ}
    (hx : x ∈ NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ))) : x ∈ twoGenContent a b := by
  have hle : NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ)) ≤ twoGenSubalg a b := by
    apply NonUnitalAlgebra.adjoin_le
    intro y hy
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hy
    show y ∈ twoGenContent a b
    rcases hy with hy | hy <;> rw [hy]
    · exact twoGenContent_a_mem a b
    · exact twoGenContent_b_mem a b
  exact hle hx

/-- ★ THE ARTIN COROLLARY. -/
theorem twoGenerated_associates (a b : O ℚ) {x y z : O ℚ}
    (hx : x ∈ NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ)))
    (hy : y ∈ NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ)))
    (hz : z ∈ NonUnitalAlgebra.adjoin ℚ ({a, b} : Set (O ℚ))) :
    assoc x y z = 0 :=
  assoc_span4_vanishes a b (adjoin_pair_mem_content a b hx)
    (adjoin_pair_mem_content a b hy) (adjoin_pair_mem_content a b hz)

#print axioms o_quad_rel
#print axioms o_ba_formula
#print axioms o_a_mul_ab
#print axioms o_ab_mul_b
#print axioms o_ab_mul_a
#print axioms o_b_mul_ab
#print axioms o_ab_mul_ab
#print axioms twoGenContent_mul_mem
#print axioms adjoin_pair_mem_content
#print axioms twoGenerated_associates

end Phys.Algebra
