/-
  Phys.Algebra.HermitianJordan.Building2 — N5f: the SECOND multi-generator building block
  of the order-3 Jordan identity on the Hermitian 3×3 core over `O ℚ = CD (CD B)`.
  ===========================================================================
  `Building.lean` closed the FIRST building block `jdef (Xz a b c) (Xz p 0 0) = 0`. The
  `jdef_add_right` split (banked, `Linear.lean`) reduces the general zero-diagonal core
      `jdef (Xz a b c) (Xz p q r)
         = jdef (Xz a b c) (Xz p 0 0) + jdef (Xz a b c) (Xz 0 q 0) + jdef (Xz a b c) (Xz 0 0 r)`
  into three single-second-generator building blocks. This module closes the SECOND,
  `jdef (Xz a b c) (Xz 0 q 0)`, entry by entry, by the SAME bounded Cayley–Dickson
  coordinate route that banks `ka` and every law of `Alternative.lean`
  (`entrysimp; ext <;> cdsimp0 <;> ring`) — NOT the dead brute route on the FULL six-
  generator core (the measured >7 GB instrument wall). The split caps each entry at ≤ 20
  octonion monomials. Lives in its OWN file so the per-block compile RSS resets (the three
  blocks in one file would stack past the memory rail).

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]

attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

set_option maxHeartbeats 4000000 in
/-- `(0,0)` entry of the second building block `jdef (Xz a b c) (Xz 0 q 0)`. -/
theorem bb2_e00 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 0 0 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(0,1)` entry of the second building block. -/
theorem bb2_e01 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 0 1 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(0,2)` entry of the second building block. -/
theorem bb2_e02 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 0 2 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(1,0)` entry of the second building block. -/
theorem bb2_e10 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 1 0 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(1,1)` entry of the second building block. -/
theorem bb2_e11 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 1 1 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(1,2)` entry of the second building block. -/
theorem bb2_e12 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 1 2 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(2,0)` entry of the second building block. -/
theorem bb2_e20 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 2 0 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(2,1)` entry of the second building block. -/
theorem bb2_e21 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 2 1 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(2,2)` entry of the second building block. -/
theorem bb2_e22 (a b c q : CD (CD B)) : (jdef (Xz a b c) (Xz 0 q 0)) 2 2 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

/-- ★ THE SECOND BUILDING BLOCK VANISHES: `jdef (Xz a b c) (Xz 0 q 0) = 0`. Assembled from
    the nine banked entry lemmas by `Matrix.ext`. -/
theorem bb2 (a b c q : CD (CD B)) : jdef (Xz a b c) (Xz 0 q 0) = 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp only [Matrix.zero_apply]
  · exact bb2_e00 a b c q
  · exact bb2_e01 a b c q
  · exact bb2_e02 a b c q
  · exact bb2_e10 a b c q
  · exact bb2_e11 a b c q
  · exact bb2_e12 a b c q
  · exact bb2_e20 a b c q
  · exact bb2_e21 a b c q
  · exact bb2_e22 a b c q

end Phys.Algebra.HJ
