/-
  Phys.Algebra.HermitianJordan.SinglePair — N5e: the order-3 Jordan identity on the
  single-generator Hermitian core, closed by composition-centrality alone.
  ===========================================================================
  The first PROVED instance of the cap's positive edge `jdef_H3 = 0` — the smallest
  non-trivial sub-case of the order-3 Jordan identity for Hermitian matrices over the
  terminal algebra `O ℚ = CD (CD B)`. N5 Part 1 proved the cap FAILS at order `n ≥ 4`
  (`jordan_fails_H4`) and tied that, by a proved equivalence, to the loss of
  associativity. This module opens the complementary direction: the Hermitian tower IS
  Jordan at order 3. It does the smallest honest piece of that — the zero-diagonal core
  with a SINGLE off-diagonal generator — and proves it closes WITHOUT alternativity,
  by the involution's composition-centrality (`CompCentral.lean`) alone.

  THE STRUCTURAL FACT. For a Hermitian matrix carrying a single off-diagonal octonion
  `a` (entry `(0,1)`, conjugate `(1,0)`), the symmetric square `jb X X` puts the central
  norm `N_a = a · star a` on the diagonal. The order-3 Jordan defect of two such matrices
  therefore reduces, entry by entry, to a polynomial in which every product against `N_a`
  can be re-bracketed freely (`N_a` commutes and associates in every position — banked
  `nrm_comm`/`nrm_assocM`/`nrm_assocR`, with the two orders identified by `nrm_symm`).
  The defect then cancels by additive-group algebra. NO octonion-coordinate `ring`, NO
  associator machinery: this single-generator case is the part of the cap that the
  composition-centrality half of the Jacobson/Schafer condition closes by itself.

  WHY THIS, AND WHY NOW (docs/RUNBOOK.md W9.7 — reconnaissance is not the deliverable).
  The brute coordinate route to the full `jdef_H3 = 0` is a measured instrument-wall
  casualty at every layer (see workbench/N5-jordan-cap/FINDINGS.md), and the flat
  certificate route is refuted; the honest route is a hand-built structural rewrite per
  entry. This module EXECUTES that route on the smallest sub-case and banks it, rather
  than re-measuring whether it is needed (the route is already settled). The remaining
  multi-generator entries — whose cross terms genuinely require the alternating-form laws
  of `Phys/Algebra/Alternative.lean` — are the heavy remainder, childed onto the chain
  tail.

  WHAT IS DERIVED (forward; each a theorem, foundations-only):

    central_diag       — ★ THE GENERIC DIAGONAL-ENTRY WORKHORSE. Over any `NonAssocRing`,
                         if `n` commutes and associates in every position then the
                         single-generator Jordan-defect diagonal combination
                         `(a·sp + p·sa)·(n+n) + (n+n)·(a·sp + p·sa)
                            − (a·(sp·(n+n)+(n+n)·sp) + (p·(n+n)+(n+n)·p)·sa)`
                         vanishes. The centrality of `n` is the ONLY hypothesis — this is
                         the diagonal half of the Jacobson nuclearity condition, isolated
                         as a pure ring identity.
    jdef_single_pair   — ★ THE SMALLEST POSITIVE-EDGE CASE. For the zero-diagonal
                         Hermitian core carrying a single off-diagonal generator
                         (`Xz a 0 0`), the order-3 Jordan identity holds:
                         `jdef (Xz a 0 0) (Xz p 0 0) = 0`. The two non-trivial diagonal
                         entries close by `central_diag` with `n = a·star a` (banked
                         `nrm_*`); the off-diagonal and third-index entries vanish
                         arithmetically.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Jordan / Albert / exceptional /
  generation": what remains is the theorem that, over the Cayley–Dickson double of a
  double, the order-3 symmetrized-product defect of two self-adjoint matrices carrying a
  single off-diagonal element vanishes, because the norm of that element is central. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.JordanTower
import Phys.Algebra.HermitianJordan.CompCentral
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

/-- ★ THE GENERIC DIAGONAL-ENTRY WORKHORSE. Over any non-associative ring, if `n`
    COMMUTES (`hc`) and ASSOCIATES in the middle (`hAM`) and right (`hAR`) positions with
    everything, then the single-generator order-3 Jordan-defect diagonal combination
    vanishes. The proof is a two-step re-bracketing (move `n` past `a·sp` and rewrite
    `p·n·sa = p·sa·n`) followed by additive cancellation. This isolates the diagonal half
    of the involution-nuclearity condition as a pure ring identity — the only hypothesis
    is the centrality of `n`. -/
theorem central_diag {R : Type*} [NonAssocRing R] (n a sp p sa : R)
    (hc : ∀ x : R, n * x = x * n)
    (hAM : ∀ x y : R, (x * n) * y = x * (n * y))
    (hAR : ∀ x y : R, (x * y) * n = x * (y * n)) :
    (a * sp + p * sa) * (n + n) + (n + n) * (a * sp + p * sa)
      + -(a * (sp * (n + n) + (n + n) * sp) + (p * (n + n) + (n + n) * p) * sa) = 0 := by
  have e2 : p * n * sa = p * sa * n := by rw [hAM p sa, hc sa, ← hAR p sa]
  simp only [mul_add, add_mul, hc]
  rw [← hAR a sp, e2]
  abel

/-- THE ZERO-DIAGONAL HERMITIAN CORE over `O ℚ = CD (CD B)`: real (zero) diagonal and
    arbitrary octonion off-diagonals `a, b, c` with their conjugates below. By the
    central-diagonal reduction (workbench/N5-jordan-cap, run 50) the order-3 Jordan
    defect of the general Hermitian `Hm` equals that of this zero-diagonal core, so the
    cap's positive edge lives entirely here. -/
noncomputable def Xz (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

set_option maxHeartbeats 1000000 in
/-- ★ THE SMALLEST POSITIVE-EDGE CASE. For the zero-diagonal Hermitian core carrying a
    SINGLE off-diagonal generator `a` at `(0,1)` (and its conjugate), the order-3 Jordan
    identity holds: `jdef (Xz a 0 0) (Xz p 0 0) = 0`. Every entry of the matrix defect
    vanishes — the two non-trivial diagonal entries `(0,0)`/`(1,1)` by `central_diag`
    with the central norm `n = a·star a` (banked `nrm_comm`/`nrm_assocM`/`nrm_assocR`,
    both orders identified by `nrm_symm`); the remaining entries arithmetically. This is
    the part of the order-3 cap that composition-centrality closes WITHOUT alternativity. -/
theorem jdef_single_pair (a p : CD (CD B)) : jdef (Xz a 0 0) (Xz p 0 0) = 0 := by
  apply Matrix.ext; intro i j
  unfold jdef jb Xz
  fin_cases i <;> fin_cases j <;>
  simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero]
  -- (0,0): the central norm is `a · star a`; unify `star a · a → a · star a` first.
  · simp only [← nrm_symm a]
    exact central_diag (a * star a) a (star p) p (star a)
      (nrm_comm a) (nrm_assocM a) (nrm_assocR a)
  -- (1,1): same central norm `a · star a` after unifying the conjugate order.
  · simp only [← nrm_symm a]
    exact central_diag (a * star a) (star a) p (star p) a
      (nrm_comm a) (nrm_assocM a) (nrm_assocR a)

end Phys.Algebra.HJ
