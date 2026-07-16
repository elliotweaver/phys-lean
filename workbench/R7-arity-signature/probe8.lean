import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Algebra.Algebra.NonUnitalSubalgebra
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

theorem assoc_add_right' (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel
theorem assoc_smul_right' (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]
theorem assoc_zero_left (y z : O ℚ) : assoc (0:O ℚ) y z = 0 := by
  simp only [assoc, zero_mul]; abel
theorem assoc_zero_mid (x z : O ℚ) : assoc x (0:O ℚ) z = 0 := by
  simp only [assoc, zero_mul, mul_zero]; abel
theorem assoc_zero_right (x y : O ℚ) : assoc x y (0:O ℚ) = 0 := by
  simp only [assoc, mul_zero]; abel
theorem obash_ab (a b : O ℚ) : assoc a b (a*b) = 0 := by
  unfold assoc; rw [sub_eq_zero]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;> ring
theorem asw12 (x y z : O ℚ) : assoc x y z = - assoc y x z :=
  eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
theorem asw23 (x y z : O ℚ) : assoc x y z = - assoc x z y :=
  eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)

-- slot-span extension in each slot
theorem assoc_slot1_span {S : Set (O ℚ)} {y z : O ℚ}
    (hgen : ∀ g ∈ S, assoc g y z = 0) {x : O ℚ} (hx : x ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hx using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_left y z
  | add p q _ _ hp hq => rw [assoc_add_left, hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_left, hp, smul_zero]
theorem assoc_slot2_span {S : Set (O ℚ)} {x z : O ℚ}
    (hgen : ∀ g ∈ S, assoc x g z = 0) {y : O ℚ} (hy : y ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hy using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_mid x z
  | add p q _ _ hp hq => rw [assoc_add_mid, hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_mid, hp, smul_zero]
theorem assoc_slot3_span {S : Set (O ℚ)} {x y : O ℚ}
    (hgen : ∀ g ∈ S, assoc x y g = 0) {z : O ℚ} (hz : z ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hz using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_right x y
  | add p q _ _ hp hq => rw [assoc_add_right', hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_right', hp, smul_zero]

-- the 4 generators
noncomputable def gen4 (a b : O ℚ) : Set (O ℚ) := {1, a, b, a*b}

-- base fact: assoc vanishes on any triple of generators
theorem assoc_gen_triple (a b : O ℚ) {p q r : O ℚ}
    (hp : p ∈ gen4 a b) (hq : q ∈ gen4 a b) (hr : r ∈ gen4 a b) :
    assoc p q r = 0 := by
  simp only [gen4, Set.mem_insert_iff, Set.mem_singleton_iff] at hp hq hr
  -- 64 cases; kill via: any 1-slot → assoc_one_*; repeats → alt_*; (a,b,ab) perms → obash_ab + swaps
  rcases hp with rfl|rfl|rfl|rfl <;> rcases hq with rfl|rfl|rfl|rfl <;>
    rcases hr with rfl|rfl|rfl|rfl <;>
    first
      | exact assoc_one_left _ _
      | exact assoc_one_mid _ _
      | exact assoc_one_right _ _
      | exact alt_left _ _
      | exact alt_right _ _
      | exact alt_flex _ _
      | exact obash_ab a b
      | (rw [asw12]; simp [obash_ab])
      | (rw [asw23]; simp [obash_ab])
      | (rw [asw12, asw23]; simp [obash_ab])
      | (rw [asw23, asw12]; simp [obash_ab])
      | skip

end Phys.Algebra
