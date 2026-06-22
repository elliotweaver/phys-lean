/-
  Phys.Algebra.HermitianJordan.Reduction — N5g: the CENTRAL-DIAGONAL REDUCTION of the
  order-3 Jordan identity, structural spine.
  ===========================================================================
  The full cap's positive edge is `jdef (Hm …) (Hm …) = 0` for the GENERAL Hermitian
  3×3 over `O ℚ = CD (CD B)`. `Core.lean` banked the ZERO-DIAGONAL core
  `jdef_Xz_core : jdef (Xz a b c) (Xz p q r) = 0`. What remains is to reduce the general
  Hermitian pair to its zero-diagonal core — to show the REAL CENTRAL DIAGONAL of either
  matrix contributes NOTHING to the order-3 defect. This module banks the structural
  SPINE of that reduction: the master identity below, plus the matrix-level associativity
  of a central-diagonal matrix.

  THE MASTER IDENTITY (`jdef_master`). Over ANY `NonAssocRing` coordinate algebra, for ANY
  matrix `A` and ANY matrix `E` that ASSOCIATES in all three positions (i.e. is nuclear):

      jdef A E = E · G − G · E,     G := A · {A,A} − {A,A} · A,

  where `{A,A} = jb A A`. That is: the order-3 Jordan-identity defect of `A` against a
  nuclear `E` is exactly the COMMUTATOR of `E` with `A`'s (un-normalised) cube-associator
  `G`. No alternativity, no coordinate expansion — pure additive-group + nuclearity
  rewriting. This is the clean structural lever the literature's coordinate bash hides:
  against a nuclear second argument the degree-3 Jordan defect collapses to a single
  commutator. (The confluence key in the proof is keeping the square `A·A` opaque while
  the three nuclearity rewrites fire.)

  THE DIAGONAL IS NUCLEAR (`Dg`, `Dg_assocL/M/R`). The real central diagonal
  `Dg e₀ e₁ e₂ = diag(ocR e₀, ocR e₁, ocR e₂)` satisfies the three matrix-level
  associativity laws, ENTRYWISE from the banked `ocR_assocL/M/R` (the real embedding `ocR`
  is central — `Helpers.lean`), with `ocR` kept OPAQUE (no coordinate expansion — that was
  the measured `whnf` instrument wall, run 62). So `Dg` is a legal `E` for `jdef_master`,
  and `jdef (A) (Dg …) = Dg·G_A − G_A·Dg` for every `A`.

  WHY STRUCTURAL, NOT COORDINATE (docs/RUNBOOK.md W9.4). The direct coordinate route on the
  full Hermitian pair is a measured instrument wall (run 62: `cdsimp0` overruns the simp
  step budget; `ocR`-unfold times out at `whnf`). The reduction must keep the diagonal
  abstract and central and rewrite by the nuclearity lemmas — exactly as `central_diag`
  closed the single-generator diagonal entries. This module is that route's spine.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Jordan / Albert / exceptional /
  generation": what remains is the theorem that, over a non-associative coordinate ring,
  the order-3 symmetrised-product defect of a matrix against a nuclear matrix is a
  commutator, and that a diagonal matrix of central-embedded scalars is nuclear. No
  theorem STATEMENT carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.JordanTower
import Phys.Algebra.HermitianJordan.Helpers
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ### THE MASTER IDENTITY — abstract over any `NonAssocRing`. -/

section Master
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 400000 in
/-- ★★ THE MASTER IDENTITY. Over any non-associative coordinate ring, the order-3
    Jordan-identity defect of a matrix `A` against a NUCLEAR matrix `E` (one that
    associates in all three positions) is the COMMUTATOR of `E` with `A`'s un-normalised
    cube-associator `G = A·{A,A} − {A,A}·A`:

        `jdef A E = E · G − G · E`.

    Proof: unfold the defect/bracket, keep the square `A·A` opaque (`generalize`), push the
    nuclearity rewrites through the distributed products, and cancel additively (`abel`).
    No alternativity, no coordinate expansion — the degree-3 defect collapses against a
    nuclear argument to a single commutator. -/
theorem jdef_master (A E : Matrix (Fin n) (Fin n) S)
    (LA : ∀ X Y : Matrix (Fin n) (Fin n) S, E * (X * Y) = (E * X) * Y)
    (MA : ∀ X Y : Matrix (Fin n) (Fin n) S, (X * E) * Y = X * (E * Y))
    (RA : ∀ X Y : Matrix (Fin n) (Fin n) S, (X * Y) * E = X * (Y * E)) :
    jdef A E = E * (A * (jb A A) - (jb A A) * A) - (A * (jb A A) - (jb A A) * A) * E := by
  unfold jdef jb
  generalize A * A = Q
  simp only [mul_add, add_mul, mul_sub, sub_mul, LA, MA, RA]
  abel

end Master

/-! ### THE REAL CENTRAL DIAGONAL IS NUCLEAR. -/

/-- The real (central) diagonal matrix `diag(ocR e₀, ocR e₁, ocR e₂)` over `O ℚ`,
    presented as a `Matrix.diagonal` of the central embeddings `ocR eᵢ`. This is the
    diagonal part of the general Hermitian `Hm` (`Setup.lean`); its entries are the
    self-conjugate central scalars `ocR eᵢ`, so it is NUCLEAR (associates everywhere). -/
noncomputable def Dg (e0 e1 e2 : ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.diagonal (fun i => ocR (![e0, e1, e2] i))

set_option maxHeartbeats 800000 in
/-- ★ THE DIAGONAL ASSOCIATES (left): `Dg * (X * Y) = (Dg * X) * Y`. Each entry reduces by
    `diagonal_mul` to a sum whose terms re-bracket by `ocR_assocL` — the diagonal scalar
    `ocR eᵢ` is central. `ocR` is kept OPAQUE (no coordinate expansion). -/
theorem Dg_assocL (e0 e1 e2 : ℚ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Dg e0 e1 e2 * (X * Y) = (Dg e0 e1 e2 * X) * Y := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.diagonal_mul, Matrix.mul_apply, Matrix.mul_apply, Finset.mul_sum]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [Matrix.diagonal_mul]
  exact ocR_assocL _ (X i k) (Y k j)

set_option maxHeartbeats 800000 in
/-- ★ THE DIAGONAL ASSOCIATES (middle): `(X * Dg) * Y = X * (Dg * Y)`. Each entry reduces by
    `mul_diagonal`/`diagonal_mul` to a sum whose terms re-bracket by `ocR_assocM`. -/
theorem Dg_assocM (e0 e1 e2 : ℚ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (X * Dg e0 e1 e2) * Y = X * (Dg e0 e1 e2 * Y) := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.mul_apply, Matrix.mul_apply]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [Matrix.mul_diagonal, Matrix.diagonal_mul]
  exact (ocR_assocM _ (X i k) (Y k j)).symm

set_option maxHeartbeats 800000 in
/-- ★ THE DIAGONAL ASSOCIATES (right): `(X * Y) * Dg = X * (Y * Dg)`. Each entry reduces by
    `mul_diagonal` to a sum whose terms re-bracket by `ocR_assocR`. -/
theorem Dg_assocR (e0 e1 e2 : ℚ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (X * Y) * Dg e0 e1 e2 = X * (Y * Dg e0 e1 e2) := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.mul_diagonal, Matrix.mul_apply, Matrix.mul_apply, Finset.sum_mul]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [Matrix.mul_diagonal]
  exact (ocR_assocR _ (X i k) (Y k j)).symm

end Phys.Algebra.HJ
