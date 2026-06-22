/-
  Phys.Algebra.HermitianJordan.PieceA — N5g: the CENTRAL-DIAGONAL DROP, second slot.
  ===========================================================================
  pieceA of the H₃(𝕆) Jordan-cap reduction. With `jdef_Xz_core` banked (the zero-diagonal
  core) the general-Hermitian `jdef (Hm …) (Hm …) = 0` splits, by the second-argument
  additivity `jdef_add_right` along `Hm₂ = Dg + Xz`, into

      jdef Hm₁ Hm₂  =  jdef Hm₁ (Dg e)  +  jdef Hm₁ (Xz …).
                       └──── pieceA ────┘    └──── pieceB ────┘

  THIS module closes pieceA: `jdef Hm₁ (Dg e) = 0`. The route is purely STRUCTURAL — the
  real central diagonal `ocR` is kept OPAQUE throughout (its coordinate expansion is the
  measured `whnf`/`isDefEq` instrument wall, run 62 / run 66) — and rests on the banked
  spine of `Reduction.lean`:

    • THE MASTER IDENTITY (`jdef_master`). Against a NUCLEAR second argument `E`,
      `jdef A E = E·G_A − G_A·E`, where `G_A = A·{A,A} − {A,A}·A` is `A`'s un-normalised
      cube-associator. `Dg e` is nuclear (`Dg_assocL/M/R`), so this applies with `A = Hm₁`.

    • THE CUBE-ASSOCIATOR DROPS ITS NUCLEAR PART (`gmat_drop_abstract`). `G_{E+X} = G_X`
      for any nuclear `E`: every monomial of `G` carrying `E` vanishes because the matrix
      associator `assoc P Q R := P·(Q·R) − (P·Q)·R` is zero whenever ANY slot is nuclear.
      With `Hm₁ = Dg + Xz` (`Hm_split`) this gives `G_{Hm₁} = G_{Xz}`.

    • THE ZERO-DIAGONAL CUBE-ASSOCIATOR IS OFF-DIAGONAL-FREE (`gxz_offdiag`). For the
      zero-diagonal Hermitian `Xz a b c`, every OFF-diagonal entry of `G_{Xz}` vanishes.
      This is the one place octonion alternativity enters pieceA — discharged by the
      bounded per-entry coordinate route on the octonion shape (ka-scale, the same route
      the building blocks use), NOT on the full Hermitian matrix.

    • A CENTRAL DIAGONAL COMMUTES WITH A DIAGONAL MATRIX (`diag_comm_offzero`). If `M` is
      off-diagonal-free then `Dg e · M − M · Dg e = 0` (diagonal entries commute by
      `ocR_comm`; off-diagonal entries are zero).

  Chaining: `jdef Hm₁ (Dg e) = Dg e · G_{Hm₁} − G_{Hm₁} · Dg e = Dg e · G_{Xz} − G_{Xz} · Dg e`
  and `G_{Xz}` is off-diagonal-free, so the commutator vanishes. pieceA = 0.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Jordan / Albert / exceptional /
  generation": what remains is the theorem that, over the Cayley–Dickson double of a double,
  the order-3 symmetrised-product defect of any self-adjoint matrix against a real-diagonal
  self-adjoint matrix vanishes, because that diagonal is nuclear and the matrix's
  cube-associator is off-diagonal-free. No theorem STATEMENT carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ### The matrix associator and the un-normalised cube-associator `Gmat`. -/

section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

/-- The matrix associator `assoc P Q R = P·(Q·R) − (P·Q)·R`. Trilinear; it vanishes
    whenever ANY of its three slots is nuclear (associates in that position). -/
def assoc (P Q R : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  P * (Q * R) - (P * Q) * R

/-- The un-normalised cube-associator `Gmat A = A·{A,A} − {A,A}·A` of a matrix, the object
    the master identity (`Reduction.jdef_master`) pairs the nuclear second argument against. -/
def Gmat (A : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  A * (jb A A) - (jb A A) * A

/-- `Gmat A = assoc A A A + assoc A A A`: the cube-associator is twice the diagonal
    matrix associator. Pure distributivity (`{A,A} = A·A + A·A`). -/
theorem gmat_eq_assoc (A : Matrix (Fin n) (Fin n) S) :
    Gmat A = assoc A A A + assoc A A A := by
  unfold Gmat assoc jb
  simp only [Matrix.mul_add, Matrix.add_mul]; abel

/-- Additivity of the associator in its first slot. -/
theorem assoc_add1 (P P' Q R : Matrix (Fin n) (Fin n) S) :
    assoc (P + P') Q R = assoc P Q R + assoc P' Q R := by
  unfold assoc; simp only [Matrix.add_mul]; abel

/-- Additivity of the associator in its second slot. -/
theorem assoc_add2 (P Q Q' R : Matrix (Fin n) (Fin n) S) :
    assoc P (Q + Q') R = assoc P Q R + assoc P Q' R := by
  unfold assoc; simp only [Matrix.add_mul, Matrix.mul_add]; abel

/-- Additivity of the associator in its third slot. -/
theorem assoc_add3 (P Q R R' : Matrix (Fin n) (Fin n) S) :
    assoc P Q (R + R') = assoc P Q R + assoc P Q R' := by
  unfold assoc; simp only [Matrix.mul_add]; abel

set_option maxHeartbeats 400000 in
/-- ★ THE CUBE-ASSOCIATOR DROPS ITS NUCLEAR PART. For any matrix `E` that associates in all
    three positions (nuclear) and any `X`, `Gmat (E + X) = Gmat X`. Expanding the trilinear
    `assoc` over `E + X`, every monomial carrying `E` is an associator with a nuclear slot,
    hence zero; only the pure-`X` associator survives. No coordinate expansion, no
    alternativity — just nuclearity of `E` and additive cancellation. -/
theorem gmat_drop_abstract (E X : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    Gmat (E + X) = Gmat X := by
  have hL : ∀ Q R, assoc E Q R = 0 := by intro Q R; unfold assoc; rw [LA]; abel
  have hM : ∀ P R, assoc P E R = 0 := by intro P R; unfold assoc; rw [MA]; abel
  have hR : ∀ P Q, assoc P Q E = 0 := by intro P Q; unfold assoc; rw [RA]; abel
  have key : assoc (E + X) (E + X) (E + X) = assoc X X X := by
    rw [assoc_add1, hL, zero_add, assoc_add2, hM, zero_add, assoc_add3, hR, zero_add]
  rw [gmat_eq_assoc, gmat_eq_assoc, key]

end Abstract

/-! ### pieceA over the octonion shape `O ℚ`. -/

/-- `Hm` splits as its real central diagonal plus its zero-diagonal off-part:
    `Hm d0 d1 d2 a b c = Dg d0 d1 d2 + Xz a b c`. Entrywise matrix arithmetic. -/
theorem Hm_split (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    Hm d0 d1 d2 a b c = Dg d0 d1 d2 + Xz a b c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Hm, Dg, Xz, Matrix.diagonal, Matrix.add_apply, Matrix.of_apply, Matrix.cons_val',
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one,
      Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

/-- `Gmat (Hm …) = Gmat (Xz …)`: the real central diagonal of a general Hermitian matrix
    contributes nothing to its cube-associator, because the diagonal is nuclear
    (`Dg_assocL/M/R`). Instantiates `gmat_drop_abstract` at `E = Dg`, `X = Xz`. -/
theorem gmat_Hm (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    Gmat (Hm d0 d1 d2 a b c) = Gmat (Xz a b c) := by
  rw [Hm_split]
  exact gmat_drop_abstract (Dg d0 d1 d2) (Xz a b c)
    (Dg_assocL d0 d1 d2) (Dg_assocM d0 d1 d2) (Dg_assocR d0 d1 d2)

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

set_option maxHeartbeats 1600000 in
/-- ★ THE ZERO-DIAGONAL CUBE-ASSOCIATOR IS OFF-DIAGONAL-FREE. Every off-diagonal entry of
    `Gmat (Xz a b c)` vanishes. This is the single point where octonion alternativity enters
    pieceA: the off-diagonal cube-associator of a zero-diagonal Hermitian matrix is killed by
    the alternating-form structure of `O ℚ`, discharged here by the bounded per-entry
    coordinate route on the octonion shape (the building-block route — NOT the dead full-Hm
    route, since `Xz` carries no `ocR`). -/
theorem gxz_offdiag (a b c : O ℚ) :
    ∀ i j, i ≠ j → Gmat (Xz a b c) i j = 0 := by
  intro i j hij
  unfold Gmat jb Xz
  fin_cases i <;> fin_cases j <;>
    first
    | (exact absurd rfl hij)
    | (entrysimp; ext <;> cdsimp0 <;> ring)

set_option maxHeartbeats 400000 in
/-- ★ A CENTRAL DIAGONAL COMMUTES WITH AN OFF-DIAGONAL-FREE MATRIX. If `M i j = 0` for all
    `i ≠ j` then `Dg e · M − M · Dg e = 0`: diagonal entries commute by `ocR_comm`,
    off-diagonal entries are zero. `ocR` kept opaque. -/
theorem diag_comm_offzero (e0 e1 e2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (hoff : ∀ i j, i ≠ j → M i j = 0) :
    Dg e0 e1 e2 * M - M * Dg e0 e1 e2 = 0 := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.sub_apply, Matrix.diagonal_mul, Matrix.mul_diagonal, Matrix.zero_apply]
  rcases eq_or_ne i j with h | h
  · subst h; rw [ocR_comm]; abel
  · rw [hoff i j h]; simp [mul_zero, zero_mul]

set_option maxHeartbeats 400000 in
/-- ★★ pieceA: `jdef (Hm …) (Dg e) = 0`. The order-3 Jordan defect of any general Hermitian
    matrix against a real-diagonal Hermitian matrix vanishes. By the master identity it is
    the commutator `Dg e · G_{Hm} − G_{Hm} · Dg e`; the cube-associator `G_{Hm}` equals
    `G_{Xz}` (nuclear diagonal drops) and is off-diagonal-free, so a central diagonal
    commutes with it. Structural throughout; `ocR` opaque. -/
theorem jdef_Hm_Dg (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) :
    jdef (Hm d0 d1 d2 a b c) (Dg e0 e1 e2) = 0 := by
  have hmaster := jdef_master (Hm d0 d1 d2 a b c) (Dg e0 e1 e2)
    (Dg_assocL e0 e1 e2) (Dg_assocM e0 e1 e2) (Dg_assocR e0 e1 e2)
  rw [show Hm d0 d1 d2 a b c * jb (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)
        - jb (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c) * Hm d0 d1 d2 a b c
      = Gmat (Hm d0 d1 d2 a b c) from rfl] at hmaster
  rw [hmaster, gmat_Hm]
  exact diag_comm_offzero e0 e1 e2 (Gmat (Xz a b c)) (gxz_offdiag a b c)

end Phys.Algebra.HJ
