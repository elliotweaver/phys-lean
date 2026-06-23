/-
  Phys.Algebra.HermitianJordan.PieceBdeg1 — N5j: the DEGREE-1 half of the pieceB
  polarization cross, closed by the UNIT-DIAGONAL dissolution.
  ===========================================================================
  The pieceB polarization cross splits (banked `polarCross_split`, `PolarFirst.lean`) into a
  degree-1 part `polarCross1` (the genuine octonionic ALTERNATIVITY kernel) and a degree-2
  part `polarCross2` (banked zero in `PieceBdeg2.lean`, by centrality alone). This module
  closes the degree-1 part's STRUCTURAL CORE — its value at the three UNIT diagonals:

      ★ polarCross1 (Duᵢ) (Xz a b c) (Xz p q r) = 0,  i = 0,1,2,

  where `Duᵢ = diagonal eᵢ` is the matrix unit on the diagonal (a single `1`, no `ocR`).

  WHY UNIT DIAGONALS (docs/STANDARD.md THE ONE LAW; docs/RUNBOOK.md W1 "BUILD it", W9).
  Eight prior runs (64–78) died grinding a per-entry `ocR`-canonicalizer on the FULL real
  diagonal `Dg d0 d1 d2`, whose entries are the OPAQUE central embeddings `ocR d_k` — every
  variant hit `maximum recursion depth`. That was the WRONG FRAME. `polarCross1` is ℚ-LINEAR
  in its diagonal argument (each of its six terms carries the diagonal exactly once), and the
  real diagonal decomposes over the ground ring as `Dg d0 d1 d2 = d0•Du0 + d1•Du1 + d2•Du2`
  (`PieceBfinal.lean`). So the whole opaque-`ocR` content reduces to the diagonal's value at
  the three UNIT positions — where the coordinate is a literal `1`, no `ocR` appears, and the
  octonionic alternativity kernel becomes a concrete Cayley–Dickson coordinate identity that
  `ring` discharges over the commutative ground ring. The looping `ocR`-rewriter (the measured
  instrument wall) never enters: there is nothing opaque to canonicalize.

  Stated over a general `[CommRing B] [StarRing B]` (so the octonion shape is `CD (CD B)`):
  the structural core is independent of the ground ring; it is instantiated at `B = Dbl ℚ`
  (i.e. `O ℚ`) in `PieceBfinal.lean` for the cap assembly.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: every statement is a pure
  structural matrix identity for the degree-1 part of the symmetrised-product polarization
  cross over the Cayley–Dickson double of a double. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]

attribute [local instance] CD.narCD CD.srCD

/-! ### The three unit diagonals (matrix units on the diagonal, NO `ocR`). -/

/-- The unit diagonal at position 0: `diagonal ![1,0,0]`. -/
noncomputable def Du0 : Matrix (Fin 3) (Fin 3) (CD (CD B)) := Matrix.diagonal ![1, 0, 0]
/-- The unit diagonal at position 1: `diagonal ![0,1,0]`. -/
noncomputable def Du1 : Matrix (Fin 3) (Fin 3) (CD (CD B)) := Matrix.diagonal ![0, 1, 0]
/-- The unit diagonal at position 2: `diagonal ![0,0,1]`. -/
noncomputable def Du2 : Matrix (Fin 3) (Fin 3) (CD (CD B)) := Matrix.diagonal ![0, 0, 1]

theorem Du0_00 : (Du0 (B := B)) 0 0 = 1 := by unfold Du0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du0_11 : (Du0 (B := B)) 1 1 = 0 := by unfold Du0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du0_22 : (Du0 (B := B)) 2 2 = 0 := by unfold Du0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du1_00 : (Du1 (B := B)) 0 0 = 0 := by unfold Du1; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du1_11 : (Du1 (B := B)) 1 1 = 1 := by unfold Du1; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du1_22 : (Du1 (B := B)) 2 2 = 0 := by unfold Du1; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du2_00 : (Du2 (B := B)) 0 0 = 0 := by unfold Du2; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du2_11 : (Du2 (B := B)) 1 1 = 0 := by unfold Du2; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du2_22 : (Du2 (B := B)) 2 2 = 1 := by unfold Du2; rw [Matrix.diagonal_apply_eq]; rfl

theorem Du0_01 : (Du0 (B := B)) 0 1 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_02 : (Du0 (B := B)) 0 2 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_10 : (Du0 (B := B)) 1 0 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_12 : (Du0 (B := B)) 1 2 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_20 : (Du0 (B := B)) 2 0 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_21 : (Du0 (B := B)) 2 1 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du1_01 : (Du1 (B := B)) 0 1 = 0 := by unfold Du1; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du1_02 : (Du1 (B := B)) 0 2 = 0 := by unfold Du1; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du1_10 : (Du1 (B := B)) 1 0 = 0 := by unfold Du1; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du1_12 : (Du1 (B := B)) 1 2 = 0 := by unfold Du1; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du1_20 : (Du1 (B := B)) 2 0 = 0 := by unfold Du1; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du1_21 : (Du1 (B := B)) 2 1 = 0 := by unfold Du1; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du2_01 : (Du2 (B := B)) 0 1 = 0 := by unfold Du2; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du2_02 : (Du2 (B := B)) 0 2 = 0 := by unfold Du2; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du2_10 : (Du2 (B := B)) 1 0 = 0 := by unfold Du2; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du2_12 : (Du2 (B := B)) 1 2 = 0 := by unfold Du2; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du2_20 : (Du2 (B := B)) 2 0 = 0 := by unfold Du2; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du2_21 : (Du2 (B := B)) 2 1 = 0 := by unfold Du2; exact Matrix.diagonal_apply_ne _ (by decide)

/-! ### The per-position entry expanders and the concrete-coordinate closer. -/

local macro "du0simp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Du0_00, Du0_11, Du0_22, Du0_01, Du0_02, Du0_10, Du0_12, Du0_20, Du0_21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one, star_one,
    sub_eq_add_neg])

local macro "du1simp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Du1_00, Du1_11, Du1_22, Du1_01, Du1_02, Du1_10, Du1_12, Du1_20, Du1_21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one, star_one,
    sub_eq_add_neg])

local macro "du2simp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Du2_00, Du2_11, Du2_22, Du2_01, Du2_02, Du2_10, Du2_12, Du2_20, Du2_21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one, star_one,
    sub_eq_add_neg])

/-- Project a single Cayley–Dickson coordinate down to the commutative ground ring `B` and
    close the resulting concrete polynomial identity by `ring`. With a UNIT diagonal there is
    no `ocR` and no opaque scalar — the octonionic alternativity kernel becomes a literal
    coordinate identity over `B`. -/
local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_eq_add_neg,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

local macro "pc1u0" : tactic =>
  `(tactic| (unfold polarCross1; simp only [Matrix.add_apply, Matrix.sub_apply]; du0simp; ext <;> cdsimp0 <;> ring))
local macro "pc1u1" : tactic =>
  `(tactic| (unfold polarCross1; simp only [Matrix.add_apply, Matrix.sub_apply]; du1simp; ext <;> cdsimp0 <;> ring))
local macro "pc1u2" : tactic =>
  `(tactic| (unfold polarCross1; simp only [Matrix.add_apply, Matrix.sub_apply]; du2simp; ext <;> cdsimp0 <;> ring))

/-! ### Position 0: the nine entries of `polarCross1 (Du0)`. -/
set_option maxHeartbeats 2000000 in
theorem pc1u0_00 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 0 0 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_01 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 0 1 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_02 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 0 2 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_10 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 1 0 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_11 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 1 1 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_12 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 1 2 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_20 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 2 0 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_21 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 2 1 = 0 := by pc1u0
set_option maxHeartbeats 2000000 in
theorem pc1u0_22 (a b c p q r : CD (CD B)) : (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 2 2 = 0 := by pc1u0

/-! ### Position 1: the nine entries of `polarCross1 (Du1)`. -/
set_option maxHeartbeats 2000000 in
theorem pc1u1_00 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 0 0 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_01 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 0 1 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_02 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 0 2 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_10 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 1 0 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_11 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 1 1 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_12 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 1 2 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_20 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 2 0 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_21 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 2 1 = 0 := by pc1u1
set_option maxHeartbeats 2000000 in
theorem pc1u1_22 (a b c p q r : CD (CD B)) : (polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r)) 2 2 = 0 := by pc1u1

/-! ### Position 2: the nine entries of `polarCross1 (Du2)`. -/
set_option maxHeartbeats 2000000 in
theorem pc1u2_00 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 0 0 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_01 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 0 1 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_02 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 0 2 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_10 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 1 0 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_11 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 1 1 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_12 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 1 2 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_20 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 2 0 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_21 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 2 1 = 0 := by pc1u2
set_option maxHeartbeats 2000000 in
theorem pc1u2_22 (a b c p q r : CD (CD B)) : (polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r)) 2 2 = 0 := by pc1u2

/-! ### Assemble the three unit-diagonal matrices to zero. -/

/-- ★ `polarCross1` vanishes at the position-0 unit diagonal. -/
theorem polarCross1_Du0 (a b c p q r : CD (CD B)) :
    polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r) = 0 := by
  apply Matrix.ext; intro i j
  simp only [Matrix.zero_apply]
  fin_cases i <;> fin_cases j
  · exact pc1u0_00 a b c p q r
  · exact pc1u0_01 a b c p q r
  · exact pc1u0_02 a b c p q r
  · exact pc1u0_10 a b c p q r
  · exact pc1u0_11 a b c p q r
  · exact pc1u0_12 a b c p q r
  · exact pc1u0_20 a b c p q r
  · exact pc1u0_21 a b c p q r
  · exact pc1u0_22 a b c p q r

/-- ★ `polarCross1` vanishes at the position-1 unit diagonal. -/
theorem polarCross1_Du1 (a b c p q r : CD (CD B)) :
    polarCross1 (Du1 (B := B)) (Xz a b c) (Xz p q r) = 0 := by
  apply Matrix.ext; intro i j
  simp only [Matrix.zero_apply]
  fin_cases i <;> fin_cases j
  · exact pc1u1_00 a b c p q r
  · exact pc1u1_01 a b c p q r
  · exact pc1u1_02 a b c p q r
  · exact pc1u1_10 a b c p q r
  · exact pc1u1_11 a b c p q r
  · exact pc1u1_12 a b c p q r
  · exact pc1u1_20 a b c p q r
  · exact pc1u1_21 a b c p q r
  · exact pc1u1_22 a b c p q r

/-- ★ `polarCross1` vanishes at the position-2 unit diagonal. -/
theorem polarCross1_Du2 (a b c p q r : CD (CD B)) :
    polarCross1 (Du2 (B := B)) (Xz a b c) (Xz p q r) = 0 := by
  apply Matrix.ext; intro i j
  simp only [Matrix.zero_apply]
  fin_cases i <;> fin_cases j
  · exact pc1u2_00 a b c p q r
  · exact pc1u2_01 a b c p q r
  · exact pc1u2_02 a b c p q r
  · exact pc1u2_10 a b c p q r
  · exact pc1u2_11 a b c p q r
  · exact pc1u2_12 a b c p q r
  · exact pc1u2_20 a b c p q r
  · exact pc1u2_21 a b c p q r
  · exact pc1u2_22 a b c p q r

end Phys.Algebra.HJ
