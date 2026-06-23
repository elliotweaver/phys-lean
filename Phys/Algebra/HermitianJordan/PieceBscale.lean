/-
  Phys.Algebra.HermitianJordan.PieceBscale — N5j: the SCALAR building blocks for the
  pieceB polarization-cross close.
  ===========================================================================
  The remaining octonionic content of the cap's first-slot drop is the single matrix
  `polarCross (Dg) (Xz) (Xz)` (banked `jdef_Hm_Xz_polar`, `PolarFirst.lean`), which splits
  (banked `polarCross_split`) into a degree-2 part `polarCross2` (closed by CENTRALITY +
  NUCLEARITY of the diagonal alone) and a degree-1 part `polarCross1` (the alternativity
  kernel). Both halves are central-scalar polynomials in the real diagonal embeddings
  `ocR d_k`, which behave as the SCALAR ring ℚ acting on `O ℚ`.

  This module banks the trunk-native frame the prior coordinate runs missed: the real
  diagonal embedding `ocR : ℚ → O ℚ` is a ring homomorphism onto the CENTER, so it MULTIPLIES
  and ADDS like ℚ (`ocR_mul`/`ocR_add`/`ocR_zero`/`ocR_one`), the diagonal matrix `Dg`'s
  entries are exactly these central scalars (`Dg00..Dg22 = ocR d_i`, off-diagonals zero), and
  the Jordan bracket against `Dg` is a central-scalar HADAMARD SCALING of each entry
  (`jbDg_scale`). These are pure, bounded, ground-ring identities — `ocR` kept opaque, no
  looping canonicalizer.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: every statement is a pure
  algebraic identity about the central ground-ring embedding `ocR` and the diagonal matrix it
  builds. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.Helpers
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The bounded Cayley–Dickson coordinate route that banks every `ocR` ground-ring identity:
    project the `O ℚ` product/conjugation/sum down to the commutative ground ring `ℚ`, reduce
    the embedded zeros, and close by `ring`. `ocR` is fully transparent here (it is a numeric
    constant in the deepest-real slot), so this is a small, cheap identity — never the looping
    ocR-canonicalizer of the dead per-entry route. -/
local macro "ocrext" : tactic =>
  `(tactic| ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add,
      zero_mul, mul_zero, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;> ring)

/-! ### `ocR` is the ground-ring ℚ embedded onto the center. -/

/-- ★ `ocR` IS MULTIPLICATIVE: `ocR r * ocR s = ocR (r * s)`. The real embedding is a ring
    hom on products — the two central scalars merge into one. -/
theorem ocR_mul (r s : ℚ) : ocR r * ocR s = ocR (r * s) := by ocrext

/-- ★ `ocR` IS ADDITIVE: `ocR r + ocR s = ocR (r + s)`. -/
theorem ocR_add (r s : ℚ) : ocR r + ocR s = ocR (r + s) := by
  simp only [ocR]; ext <;> simp [Dbl.add_re, Dbl.add_im]

/-- `ocR 0 = 0`: the embedding preserves zero. -/
theorem ocR_zero : ocR (0 : ℚ) = 0 := by
  simp only [ocR]; ext <;> simp

/-- ★ `ocR 1` is a LEFT IDENTITY: `ocR 1 * x = x`. The embedded unit acts trivially. -/
theorem ocR_one_mul (x : O ℚ) : ocR 1 * x = x := by ocrext

/-! ### The real diagonal matrix `Dg`'s entries are exactly the central scalars `ocR d_i`. -/

theorem Dg00 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 0 = ocR d0 := by
  unfold Dg; rw [Matrix.diagonal_apply_eq]; rfl
theorem Dg11 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 1 1 = ocR d1 := by
  unfold Dg; rw [Matrix.diagonal_apply_eq]; rfl
theorem Dg22 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 2 2 = ocR d2 := by
  unfold Dg; rw [Matrix.diagonal_apply_eq]; rfl
theorem Dg01 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 1 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg02 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 2 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg10 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 1 0 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg12 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 1 2 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg20 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 2 0 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg21 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 2 1 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)

/-- ★ THE DIAGONAL BRACKET IS A CENTRAL-SCALAR HADAMARD SCALING. The Jordan bracket of the
    real diagonal `Dg` against any matrix `M` scales each entry `(i,j)` by the single central
    scalar `ocR (d_i + d_j)`:

        `(jb (Dg d0 d1 d2) M) i j = ocR (![d0,d1,d2] i + ![d0,d1,d2] j) * M i j`.

    Because `ocR d_i` is central (`ocR_comm`), the two one-sided products `ocR d_i · M_ij` and
    `M_ij · ocR d_j` merge into one scaled entry. This is the trunk-native frame: `jb Dg` is
    not an octonion-coordinate object but a scalar weighting. -/
theorem jbDg_scale (d0 d1 d2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (jb (Dg d0 d1 d2) M) i j = ocR (![d0,d1,d2] i + ![d0,d1,d2] j) * M i j := by
  unfold jb Dg
  rw [Matrix.add_apply, Matrix.diagonal_mul, Matrix.mul_diagonal,
      ← ocR_comm (![d0,d1,d2] j) (M i j), ← add_mul, ocR_add]

end Phys.Algebra.HJ
