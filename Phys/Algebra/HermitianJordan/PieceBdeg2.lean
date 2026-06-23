/-
  Phys.Algebra.HermitianJordan.PieceBdeg2 — N5j: the DEGREE-2 half of the pieceB
  polarization cross, closed by the SCALAR-MODULE dissolution.
  ===========================================================================
  The pieceB polarization cross splits (banked `polarCross_split`, `PolarFirst.lean`) into a
  degree-1 part `polarCross1` (the alternativity kernel) and a degree-2 part `polarCross2`.
  This module closes the degree-2 part:

      ★ polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r) = 0.

  THE DISSOLUTION (docs/RUNBOOK.md W1 "Mathlib lacks it → BUILD it"; docs/STANDARD.md THE ONE
  LAW). Eight prior runs (64–78) died grinding a simp-based canonicalizer that pushed the real
  embeddings `ocR d_k` to a canonical position so `abel` could cancel — every variant hit
  `maximum recursion depth`. That was the WRONG FRAME. `ocR` is the embedding of the SCALAR
  ring ℚ onto the CENTER of `O ℚ`; the `ocR d_k` are SCALARS, not ring elements to be glued by
  `*` and canonicalized. So we BUILD the missing structure: the `ℚ`-module action `r • x :=
  ocR r * x` on `O ℚ` (`qMod`, no such instance existed in Mathlib). Its axioms are exactly the
  banked centrality/nuclearity of `ocR` (`ocR_mul`/`ocR_add`/`ocR_assocL`, `Helpers.lean` +
  `PieceBscale.lean`). With the action in place every `ocR d_k`-factor becomes a `ℚ`-scalar
  action that is CENTRAL, ASSOCIATIVE, and DISTRIBUTIVE BY THE MODULE AXIOMS — so after the
  diagonal bracket is read as central-scalar Hadamard scaling (`jbDg_scale`), each `polarCross2`
  entry is `∑ ± (c:ℚ) • (octonion 2-monomial) = 0`, closed by Mathlib's `module` with NO
  hand-rolled canonicalizer. The degree-2 cancellation is purely additive in the central
  scalars — exactly what `module` discharges (the degree-2 part needs CENTRALITY, not
  alternativity; verified exact, 40/40, in the faithful octonion model).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: every statement is a pure
  structural matrix identity for the symmetrised-product polarization cross over the
  Cayley–Dickson double of a double, plus the ground-ring scalar action it factors through.
  Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ### THE ℚ-MODULE ACTION on `O ℚ` (the dissolution's built structure). -/

/-- ★ THE GROUND-RING SCALAR ACTION. `O ℚ` is a `ℚ`-module under `r • x := ocR r * x`: the real
    embedding `ocR` acts by central left-multiplication. Every module axiom is a banked
    centrality/nuclearity fact of `ocR` (`ocR_one_mul`, `ocR_mul` + `ocR_assocL`, `ocR_zero`,
    `ocR_add`, `mul_add`). This is the structure the eight prior coordinate runs missed: the
    `ocR d_k` are SCALARS, and a scalar action canonicalizes itself by the module axioms — no
    looping ad-hoc `ocR`-rewriter. -/
@[reducible] noncomputable def qMod : Module ℚ (O ℚ) where
  smul r x := ocR r * x
  one_smul x := ocR_one_mul x
  mul_smul r s x := by
    show ocR (r * s) * x = ocR r * (ocR s * x); rw [← ocR_mul, ocR_assocL]
  smul_zero r := by show ocR r * 0 = 0; rw [mul_zero]
  smul_add r x y := by show ocR r * (x + y) = ocR r * x + ocR r * y; rw [mul_add]
  add_smul r s x := by show ocR (r + s) * x = ocR r * x + ocR s * x; rw [← ocR_add, add_mul]
  zero_smul x := by show ocR 0 * x = 0; rw [ocR_zero, zero_mul]

attribute [local instance] qMod

/-- The scalar action unfolds to central left-multiplication by the embedding. -/
theorem qsmul_def (r : ℚ) (x : O ℚ) : r • x = ocR r * x := rfl

/-! ### Scalar-transport: pull every `ocR`-factor out to a `ℚ`-scalar action.

    These four directed rewrites move each `ocR d_k` out of an octonion product and turn it
    into a `•`-action; combined with `smul_smul` they collapse every nested scalar. After them
    the goal is a `ℚ`-linear combination of octonion monomials, closed by `module`. -/

/-- A left `ocR`-factor is the scalar action. -/
theorem tr_l (r : ℚ) (x : O ℚ) : ocR r * x = r • x := rfl
/-- A right `ocR`-factor is the scalar action (`ocR` central). -/
theorem tr_r (r : ℚ) (x : O ℚ) : x * ocR r = r • x := by rw [qsmul_def, ocR_comm]
/-- A scalar action pulls out of a left product (`ocR` associates). -/
theorem tr_sl (r : ℚ) (x y : O ℚ) : (r • x) * y = r • (x * y) := by
  rw [qsmul_def, qsmul_def, ocR_assocL]
/-- A scalar action pulls out of a right product (`ocR` central + associates). -/
theorem tr_sr (r : ℚ) (x y : O ℚ) : x * (r • y) = r • (x * y) := by
  rw [qsmul_def, qsmul_def, ocR_assocM, ← ocR_comm, ocR_assocL]

/-! ### The degree-2 polarization cross vanishes, entry by entry. -/

/-- Expand the diagonal entries of `Dg` and the off-part `Xz` to a flat central-scalar
    polynomial: each `polarCross2` entry becomes a sum of `ocR d_k`-weighted octonion
    2-monomials. -/
local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

/-- THE DISSOLUTION CLOSER (per entry). Expand the diagonal scaling, distribute the octonion
    products into a flat monomial sum, transport every `ocR`-factor out to a `ℚ`-scalar action
    (merging nested scalars via `smul_smul`), then close the `ℚ`-linear octonion-monomial
    identity by `module`. No looping `ocR` canonicalizer — the scalars canonicalize themselves
    by the module axioms. -/
local macro "dissolve" : tactic =>
  `(tactic|
    (unfold polarCross2
     simp only [Matrix.add_apply, Matrix.sub_apply]
     dgsimp
     simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
     simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]
     module))

set_option maxHeartbeats 2000000 in
theorem pc2_00 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 0 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_01 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 1 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_02 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 2 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_10 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 1 0 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_11 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 1 1 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_12 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 1 2 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_20 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 2 0 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_21 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 2 1 = 0 := by dissolve
set_option maxHeartbeats 2000000 in
theorem pc2_22 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 2 2 = 0 := by dissolve

/-- ★★ THE DEGREE-2 POLARIZATION CROSS VANISHES. For the real central diagonal `Dg` and any
    two zero-diagonal Hermitian off-parts, the degree-2 part of the pieceB polarization cross
    is zero — assembled entrywise from the nine `pc2_ij`. This is the "cheap structural half"
    of pieceB: it closes by CENTRALITY of the diagonal alone (the `ℚ`-module action), no
    alternativity. -/
theorem polarCross2_Dg_Xz (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r) = 0 := by
  apply Matrix.ext; intro i j
  simp only [Matrix.zero_apply]
  fin_cases i <;> fin_cases j
  · exact pc2_00 d0 d1 d2 a b c p q r
  · exact pc2_01 d0 d1 d2 a b c p q r
  · exact pc2_02 d0 d1 d2 a b c p q r
  · exact pc2_10 d0 d1 d2 a b c p q r
  · exact pc2_11 d0 d1 d2 a b c p q r
  · exact pc2_12 d0 d1 d2 a b c p q r
  · exact pc2_20 d0 d1 d2 a b c p q r
  · exact pc2_21 d0 d1 d2 a b c p q r
  · exact pc2_22 d0 d1 d2 a b c p q r

end Phys.Algebra.HJ
