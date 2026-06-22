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

/-- The Cayley–Dickson coordinate normal form for the octonion entry goals: project every
    `CD (CD B)` product / conjugation / sum down to the commutative ground ring `B`, and
    reduce the embedded zeros (`zero_re`/`zero_im` + the `mul_zero`/`add_zero` family) so a
    final `ring` sees a clean ground-ring identity. This is the same bounded route by which
    `ka` and every law of `Alternative.lean` are banked — adding the zero-projection lemmas
    lets it close the building-block entries (where `Xz`'s zero diagonal seeds `0 : CD (CD B)`
    subterms that must reduce before `ring`). -/
local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

set_option maxHeartbeats 4000000 in
/-- The `(2,2)` entry of the building block `jdef (Xz a b c) (Xz p 0 0)` vanishes. After
    the matrix-entry extraction, the octonion goal is `2·ka(c,a,p) + 2·ka(b, star a, star p)`
    — two instances of the associator-transport lever, combined additively. This is the
    structural witness that each entry is an alternative-algebra associator combination; the
    full building block below closes every entry uniformly by the same Cayley–Dickson
    coordinate route that banks `ka` and the whole `Alternative.lean` battery. -/
theorem e22 (a b c p : CD (CD B)) :
    (jdef (Xz a b c) (Xz p 0 0)) 2 2 = 0 := by
  unfold jdef jb Xz
  entrysimp
  have h1 := ka (B := B) c a p
  have h2 := ka (B := B) b (star a) (star p)
  simp only [star_star] at h2
  simp only [mul_add, add_mul] at *
  linear_combination (norm := abel) h1 + h1 + h2 + h2

/-! ### THE FIRST BUILDING BLOCK, every entry — `jdef (Xz a b c) (Xz p 0 0) = 0`.

    The `jdef_add_right` split (banked, `Linear.lean`) reduces the general zero-diagonal
    core `jdef (Xz a b c) (Xz p q r)` to three single-second-generator building blocks. This
    section closes the FIRST, `jdef (Xz a b c) (Xz p 0 0)`, entry by entry.

    Each entry vanishes by the SAME bounded Cayley–Dickson coordinate route that banks `ka`
    above and every law of `Alternative.lean`: extract the octonion entry (`entrysimp`),
    project the `CD (CD B)` identity to the commutative ground ring `B` (`cdsimp0`), and close
    with `ring`. This is NOT the dead brute route on the FULL core (all six generators, the
    measured >7 GB instrument wall): the `jdef_add_right` split caps each building-block entry
    at ≤ 20 octonion monomials — degree-4 in only the four generators `a, b, c, p` — small
    enough that the projection closes at ~3 GB / ~50 s per entry. The associator content `e22`
    exhibits via `ka` is exactly what the coordinate `ring` discharges once distribution is
    pushed to `B`. -/

set_option maxHeartbeats 4000000 in
/-- `(0,0)` entry of the first building block. -/
theorem bb1_e00 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(0,1)` entry of the first building block. -/
theorem bb1_e01 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 0 1 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(0,2)` entry of the first building block. -/
theorem bb1_e02 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 0 2 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(1,0)` entry of the first building block. -/
theorem bb1_e10 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 1 0 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(1,1)` entry of the first building block. -/
theorem bb1_e11 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 1 1 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(1,2)` entry of the first building block. -/
theorem bb1_e12 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 1 2 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(2,0)` entry of the first building block. -/
theorem bb1_e20 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 2 0 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
/-- `(2,1)` entry of the first building block. -/
theorem bb1_e21 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 2 1 = 0 := by
  unfold jdef jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

/-- `(2,2)` entry under the uniform `bb1_e**` naming (delegates to `e22`, the ka witness). -/
theorem bb1_e22 (a b c p : CD (CD B)) : (jdef (Xz a b c) (Xz p 0 0)) 2 2 = 0 :=
  e22 a b c p

/-- ★ THE FIRST BUILDING BLOCK VANISHES: `jdef (Xz a b c) (Xz p 0 0) = 0`. Assembled from
    the nine banked entry lemmas by `Matrix.ext` — the matrix defect is zero because every
    entry is. Light: it cites the per-entry oleans, re-elaborating no octonion arithmetic. -/
theorem bb1 (a b c p : CD (CD B)) : jdef (Xz a b c) (Xz p 0 0) = 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp only [Matrix.zero_apply]
  · exact bb1_e00 a b c p
  · exact bb1_e01 a b c p
  · exact bb1_e02 a b c p
  · exact bb1_e10 a b c p
  · exact bb1_e11 a b c p
  · exact bb1_e12 a b c p
  · exact bb1_e20 a b c p
  · exact bb1_e21 a b c p
  · exact bb1_e22 a b c p

end Phys.Algebra.HJ
