import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- linearity slot 3
theorem assoc_add_right' (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel
theorem assoc_smul_right' (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]
theorem assoc_zero_left (y z : O ℚ) : assoc (0:O ℚ) y z = 0 := by simp only [assoc, zero_mul]; abel
theorem assoc_zero_mid (x z : O ℚ) : assoc x (0:O ℚ) z = 0 := by simp only [assoc, zero_mul, mul_zero]; abel
theorem assoc_zero_right (x y : O ℚ) : assoc x y (0:O ℚ) = 0 := by simp only [assoc, mul_zero]; abel

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

-- assume assoc_gen_triple banked (probe11):
axiom assoc_gen_triple (a b : O ℚ) {p q r : O ℚ}
    (hp : p ∈ ({1, a, b, a*b} : Set (O ℚ))) (hq : q ∈ ({1, a, b, a*b} : Set (O ℚ)))
    (hr : r ∈ ({1, a, b, a*b} : Set (O ℚ))) : assoc p q r = 0

-- ★ THE full span-vanishing: assoc vanishes for any three elements of span{1,a,b,ab}
theorem assoc_span4_vanishes (a b : O ℚ) {x y z : O ℚ}
    (hx : x ∈ Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ)))
    (hy : y ∈ Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ)))
    (hz : z ∈ Submodule.span ℚ ({1, a, b, a*b} : Set (O ℚ))) :
    assoc x y z = 0 := by
  refine assoc_slot1_span (S := ({1,a,b,a*b} : Set (O ℚ))) ?_ hx
  intro g hg
  refine assoc_slot2_span (S := ({1,a,b,a*b} : Set (O ℚ))) ?_ hy
  intro g' hg'
  refine assoc_slot3_span (S := ({1,a,b,a*b} : Set (O ℚ))) ?_ hz
  intro g'' hg''
  exact assoc_gen_triple a b hg hg' hg''

#print axioms Phys.Algebra.assoc_span4_vanishes

end Phys.Algebra
