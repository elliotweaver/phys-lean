/-
  Phys.Algebra.HermitianJordan.Building — N5f: the multi-generator building block of
  the order-3 Jordan identity on the Hermitian 3×3 core over `O ℚ = CD (CD B)`.
  ===========================================================================
  N5e (`SinglePair.lean`) closed the SINGLE-off-diagonal-generator core
  `jdef (Xz a 0 0) (Xz p 0 0) = 0` by composition-centrality alone (Artin: one generator
  and its conjugate generate an associative subalgebra). This module opens the heavy
  remainder: the MULTI-generator entries, whose cross terms bridge across distinct
  octonion generators and genuinely require the alternating-form (associator-transport)
  laws of `Phys/Algebra/Alternative.lean`.

  THE REDUCTION LEVER (banked `jdef_add_right`, `Linear.lean`). The order-3 defect is
  additive in its second argument, so the general zero-diagonal core pair splits
      `jdef (Xz a b c) (Xz p q r)
         = jdef (Xz a b c) (Xz p 0 0) + jdef (Xz a b c) (Xz 0 q 0) + jdef (Xz a b c) (Xz 0 0 r)`
  into three "building blocks", each carrying a SINGLE generator in the second matrix.
  This is the run-57 efficiency win: each building-block entry is ≤ 20 octonion monomials,
  versus the ~384 of the fully-general pair. This module closes the first building block
  `jdef (Xz a b c) (Xz p 0 0)` entry by entry.

  THE ASSOCIATOR-TRANSPORT LEVER `ka`. The decisive new structural identity, valid in any
  alternative algebra (here `CD (CD B)` with the local alternative instances):
      `(star x * star w) * (y * x) − star x * (star w * (y * x))
         = ((star x * star y) * w) * x − (star x * star y) * (w * x)`.
  This is the associator `[star x, star w, y·x]` rewritten as `[star x · star y, w, x]` —
  an instance of the alternating/Moufang transport, isolated as a bounded coordinate
  identity (it closes by projecting through the two Cayley–Dickson layers and `ring`, the
  same bounded route by which `Alternative.lean` banks `mul_swap*`/Moufang). It is NOT a
  brute coordinate `ring` on the full defect (that is the measured instrument wall); it is
  a small degree-3 lever, assembled into the entry defects by additive (`abel`) algebra.

  WHAT IS DERIVED (forward; each a theorem, foundations-only):
    ka   — the associator-transport lever (above), valid over `CD (CD B)`.
    e22  — the `(2,2)` entry of the building block `jdef (Xz a b c) (Xz p 0 0)` vanishes,
           closed as `2·ka(c,a,p) + 2·ka(b, star a, star p)`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Jordan / Albert / exceptional /
  generation": what remains is the theorem that, over the Cayley–Dickson double of a
  double, a specific entry of the order-3 symmetrized-product defect of two self-adjoint
  matrices vanishes, by an alternative-algebra associator-transport identity. No theorem
  STATEMENT carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Phys.Algebra.HermitianJordan.CompCentral
import Phys.Algebra.HermitianJordan.SinglePair
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]

attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 4000000 in
/-- ★ THE ASSOCIATOR-TRANSPORT LEVER. Over `CD (CD B)` (alternative), the associator
    `[star x, star w, y·x]` equals `[star x · star y, w, x]`:
      `(star x * star w) * (y * x) − star x * (star w * (y * x))
         = ((star x * star y) * w) * x − (star x * star y) * (w * x)`.
    Proved by projecting through the two Cayley–Dickson layers and `ring` — the same
    bounded coordinate route by which `Alternative.lean` banks its alternating laws; this
    is a small degree-3 lever, not a brute coordinate `ring` on the full Jordan defect. -/
theorem ka (x y w : CD (CD B)) :
    (star x * star w) * (y * x) - star x * (star w * (y * x))
      = ((star x * star y) * w) * x - (star x * star y) * (w * x) := by
  simp only [sub_eq_add_neg]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add] <;>
    ring

/-- The matrix-entry extraction tactic for the zero-diagonal Hermitian core: unfold the
    defect/bracket/carrier and simplify the matrix arithmetic down to a clean octonion
    goal (run-52 plumbing). -/
local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

set_option maxHeartbeats 4000000 in
/-- The `(2,2)` entry of the building block `jdef (Xz a b c) (Xz p 0 0)` vanishes. After
    the matrix-entry extraction, the octonion goal is `2·ka(c,a,p) + 2·ka(b, star a, star p)`
    — two instances of the associator-transport lever, combined additively. -/
theorem e22 (a b c p : CD (CD B)) :
    (jdef (Xz a b c) (Xz p 0 0)) 2 2 = 0 := by
  unfold jdef jb Xz
  entrysimp
  have h1 := ka (B := B) c a p
  have h2 := ka (B := B) b (star a) (star p)
  simp only [star_star] at h2
  simp only [mul_add, add_mul] at *
  linear_combination (norm := abel) h1 + h1 + h2 + h2

end Phys.Algebra.HJ
