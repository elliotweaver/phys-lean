/-
  Phys.Algebra.HermitianJordan.Linear — N5e: additivity of the Jordan bracket and
  defect in their matrix arguments (structural reduction infrastructure).
  ===========================================================================
  Banked progress toward the order-3 Jordan-identity assembly (`jdef_H3 = 0`). The
  Jordan bracket `jb A B = A·B + B·A` is BIADDITIVE, and the Jordan-identity defect
  `jdef A B = {{A,B},{A,A}} − {A,{B,{A,A}}}` is ADDITIVE in its SECOND argument `B`
  (it is constant-degree in `B`: every `B`-occurrence sits linearly inside one bracket).
  These are pure structural matrix identities over a `NonAssocRing` coordinate algebra —
  no octonion-coordinate expansion, no `ring` on the Cayley–Dickson product — proved from
  matrix distributivity (`Matrix.mul_add`/`Matrix.add_mul`) and additive-group algebra
  (`abel`) alone.

  WHY THESE, AND WHY NOW (the run-50 reframe — docs/RUNBOOK.md W1/W9). The brute coordinate
  route to `jdef_H3 = 0` is a measured instrument-wall casualty at EVERY layer (concrete-ℚ
  `ring` 16min/9GB; abstract-`B` `ring` 357s/6GB; and — NEW run 50 — even the reduced
  zero-diagonal core blows to >7 GB under `ring` and the bare coordinate `simp` alone times
  out at 43 s/3.4 GB; see workbench/N5-jordan-cap/FINDINGS.md). The honest route is
  STRUCTURAL. The decisive structural fact found run 50 (workbench/central_split.py,
  central_B.py, exact Zorn, 200 samples): the general Hermitian `Hm = D + X` splits into its
  REAL CENTRAL diagonal `D` and its zero-diagonal off-part `X`, and

      jdef (D + X) (E + Y) = jdef X Y        — the central diagonal contributes NOTHING,

  reducing the full cap `jdef_H3 = 0` to the smaller ZERO-DIAGONAL CORE `jdef X Y = 0`
  (40–48 octonion monomials/entry vs 216). The additivity in `B` derived here is the first
  lever of that reduction: with `jdef_add_right`, `jdef A (E + Y) = jdef A E + jdef A Y`, so
  the central-diagonal second argument peels off as a separate (centrally-vanishing) summand.

  WHAT IS DERIVED (forward; each a theorem, foundations-only):

    jb_add_left   — ★ `jb (A + B) C = jb A C + jb B C` (left-additivity of the bracket).
    jb_add_right  — ★ `jb A (B + C) = jb A B + jb A C` (right-additivity of the bracket).
    jdef_add_right— ★ `jdef A (B + C) = jdef A B + jdef A C` (the defect is ADDITIVE in its
                    second argument — the reduction lever).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: every statement is a pure
  additive-distributivity identity for the symmetrized matrix bracket and its Jordan-identity
  defect over a non-associative coordinate ring. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Algebra
open Matrix

variable {S : Type*} [NonAssocRing S] {n : ℕ}

/-- ★ LEFT-ADDITIVITY of the symmetric Jordan bracket: `{A + B, C} = {A, C} + {B, C}`.
    Pure matrix distributivity; no coordinate expansion. -/
theorem jb_add_left (A B C : Matrix (Fin n) (Fin n) S) :
    jb (A + B) C = jb A C + jb B C := by
  unfold jb; simp [Matrix.mul_add, Matrix.add_mul]; abel

/-- ★ RIGHT-ADDITIVITY of the symmetric Jordan bracket: `{A, B + C} = {A, B} + {A, C}`. -/
theorem jb_add_right (A B C : Matrix (Fin n) (Fin n) S) :
    jb A (B + C) = jb A B + jb A C := by
  unfold jb; simp [Matrix.mul_add, Matrix.add_mul]; abel

/-- ★ THE JORDAN-IDENTITY DEFECT IS ADDITIVE IN ITS SECOND ARGUMENT:
    `jdef A (B + C) = jdef A B + jdef A C`. Every occurrence of the second argument sits
    linearly inside exactly one bracket, so the defect splits additively in `B`. This is the
    reduction lever (docs/RUNBOOK.md W1): the real central diagonal of a Hermitian matrix,
    when it appears as the second argument, peels off as a separate summand whose defect
    vanishes centrally — collapsing the cap to its zero-diagonal core. Derived structurally
    from `jb_add_left`/`jb_add_right`; no octonion-coordinate `ring`. -/
theorem jdef_add_right (A B C : Matrix (Fin n) (Fin n) S) :
    jdef A (B + C) = jdef A B + jdef A C := by
  unfold jdef
  rw [jb_add_right A B C, jb_add_left (jb A B) (jb A C) (jb A A),
      jb_add_left B C (jb A A),
      jb_add_right A (jb B (jb A A)) (jb C (jb A A))]
  abel

end Phys.Algebra.HJ
