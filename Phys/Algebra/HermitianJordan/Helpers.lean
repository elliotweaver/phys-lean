/-
  Phys.Algebra.HermitianJordan.Helpers — N5c: centrality of the real diagonal.
  ===========================================================================
  Banked progress toward the order-3 Jordan-identity assembly (`jdef_H3 = 0`). The
  general Hermitian 3×3 carrier `Hm` (`Phys/Algebra/HermitianJordan/Setup.lean`) has REAL
  diagonal entries `ocR r`. In the Jordan-defect computation those real entries must move
  freely past every octonion factor: they COMMUTE and ASSOCIATE with all of `O ℚ`. This
  module derives that NUCLEAR/CENTRAL behaviour of `ocR r` forward from the banked
  Cayley–Dickson product — it is one half of the exact relation set the entrywise
  assembly consumes (the other half being the alternating-form laws of
  `Phys/Algebra/Alternative.lean`).

  WHY THESE, AND WHY NOW (the corrected N5c relation set). The structural numerics in
  workbench/N5-jordan-cap establish that the alternating-form laws ALONE are NOT enough to
  kill the entrywise Jordan defect: `cert_span_broad.py` shows every off-diagonal entry of
  `jdef (Hm A) (Hm B)` is NOT in the ℚ-span of alternating-law instances (even over a
  129 600-instance pool — NO-SOLUTION, residual 52 monomials). The faithful split-octonion
  model (`cert_confirm.py`) confirms the defect vanishes for the real-diagonal Hermitian
  3×3 once one ALSO has the involution's composition centrality (trace `a + star a` and
  norm `a · star a` central) — i.e. the classical Jacobson/Schafer statement: `H₃(A)` is
  Jordan iff `A` is alternative AND its involution is nuclear. So the assembly needs
  alternativity (banked) + composition-centrality + the centrality of `ocR` derived here.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: every statement is a
  pure algebraic identity asserting that the ground-ring embedding `ocR r` is central in
  the Cayley–Dickson double of a double. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Setup
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 400000 in
/-- ★ THE REAL DIAGONAL COMMUTES: `ocR r * x = x * ocR r`. The ground-ring embedding is
    central in `O ℚ`. Proved by reducing the `CD` product to the commutative ground ring. -/
theorem ocR_comm (r : ℚ) (x : O ℚ) : ocR r * x = x * ocR r := by
  ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;>
    ring

set_option maxHeartbeats 400000 in
/-- ★ THE REAL DIAGONAL ASSOCIATES (left): `ocR r * (x * y) = (ocR r * x) * y`. -/
theorem ocR_assocL (r : ℚ) (x y : O ℚ) : ocR r * (x * y) = (ocR r * x) * y := by
  ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;>
    ring

set_option maxHeartbeats 400000 in
/-- ★ THE REAL DIAGONAL ASSOCIATES (middle): `x * (ocR r * y) = (x * ocR r) * y`. -/
theorem ocR_assocM (r : ℚ) (x y : O ℚ) : x * (ocR r * y) = (x * ocR r) * y := by
  ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;>
    ring

set_option maxHeartbeats 400000 in
/-- ★ THE REAL DIAGONAL ASSOCIATES (right): `x * (y * ocR r) = (x * y) * ocR r`. -/
theorem ocR_assocR (r : ℚ) (x y : O ℚ) : x * (y * ocR r) = (x * y) * ocR r := by
  ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;>
    ring

set_option maxHeartbeats 400000 in
/-- ★ THE REAL DIAGONAL IS SELF-ADJOINT: `star (ocR r) = ocR r`. So `ocR r` is exactly the
    kind of element that may sit on the diagonal of a Hermitian matrix. -/
theorem ocR_star (r : ℚ) : star (ocR r) = ocR r := by
  ext <;>
    simp only [ocR, star_re, star_im, neg_re, neg_im, Dbl.star_re', Dbl.star_im',
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im, neg_zero]

end Phys.Algebra.HJ
