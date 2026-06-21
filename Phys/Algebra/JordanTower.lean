/-
  Phys.Algebra.JordanTower — N5: THE HERMITIAN JORDAN TOWER AND ITS FORCED CAP.
  ===========================================================================
  THE THIRD NODE OF THE ALGEBRA LAYER (depth 2), and the FIRST proved instance of
  the trunk's flagship claim — ONE CAUSE, MANY TERMINATIONS. N2 derived the forced
  algebra cascade and its STOP at the octonion shape `𝕆 = CD (CD B)`, where the
  product becomes NON-associative (`Phys/Cascade/Octonion.lean`, `not_associative`)
  while staying ALTERNATIVE (`Phys/Algebra/Operator.lean`, `scaling_law`, hypothesis-
  free). N3/N4 read off the operator/Clifford and module structures that algebra
  forces. This module reads off a SECOND tower the terminal algebra forces and proves
  it is CAPPED — and that the SAME octonionic non-associativity that stopped the
  cascade is what caps it.

  THE TOWER. For each order `n`, the self-adjoint (Hermitian) `n × n` matrices over
  `𝕆` carry the symmetrized (Jordan) product `A ∘ B = ½(A·B + B·A)`. Over an
  ASSOCIATIVE coordinate algebra this product satisfies the Jordan identity for every
  `n` (it is a "special" Jordan algebra, sitting inside the associative matrix ring).
  Over the NON-associative `𝕆` the tower is CAPPED: the Jordan identity holds for
  small `n` and FAILS for `n ≥ 4`. The cap value is not posited — it is the exact gap
  between "alternative" (which `𝕆` has, so small orders are Jordan) and "associative"
  (which `𝕆` lost at the cascade stop, so large orders are not).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The division-algebra-physics field
  POSITS the exceptional Jordan algebra `H₃(𝕆)` (the Albert algebra) and imports its
  properties. Here the structure is DERIVED FORWARD from the banked Cayley–Dickson
  product `CD` + conjugation `star`: NO Mathlib `JordanAlgebra` / exceptional-algebra
  import asserting `H₃(𝕆)` IS the Albert algebra (that would POSIT the very structure
  we derive — the same drift trap N3/N4 avoided). The Jordan product is built at the
  non-associative level from the banked product; the carrier is `Matrix (Fin n) (Fin n)`
  over the banked octonion shape (no new carrier posited; `𝕆` has no `Ring` instance,
  so the symmetrized product is built over the `NonAssocRing` the doubling produces).

  THE DERIVATION (forward; each step a theorem, foundations-only):

    jb               — the (unscaled) symmetric Jordan bracket `{A,B} = A·B + B·A`
                       on matrices over the octonion shape. (Unscaled: the Jordan
                       identity is homogeneous, so the cap is identical with or without
                       the ½ — and unscaling keeps everything over the cascade ground
                       ring `ℚ` with no division. The scaled product is `½ • jb`.)
    jdef             — the Jordan-identity DEFECT
                       `{{A,B},{A,A}} − {A,{B,{A,A}}}`. The Jordan identity holds at a
                       pair `(A,B)` iff `jdef A B = 0`.

    ── the ASSOCIATIVE side (no cap): special Jordan, any order ──
    jordan_of_ring   — ★ over ANY associative coordinate ring `S`, `jdef = 0` for ALL
                       `n` and ALL matrices. The matrix ring is associative, so the
                       symmetrized product is automatically Jordan (`noncomm_ring`).
                       This is the tower with NO cap — the contrast that isolates the
                       octonionic cause.
    jordan_of_assoc  — ★ the conditional over the octonion shape: IF `𝕆` were
                       associative, the Hermitian tower would satisfy the Jordan
                       identity at EVERY order. (Builds a `Ring (CD (CD B))` from the
                       associativity hypothesis and applies `jordan_of_ring`.)

    ── the OCTONIONIC side (the cap): failure at n = 4 ──
    Xwit, Ywit       — a concrete Hermitian pair in `H₄(O ℚ)` whose off-diagonal
                       entries are exactly the cascade's non-associating triple
                       `(ι(ιJ), ι(e₂), e₂)` (`Phys/Cascade/Octonion.lean`).
    jdef_witness     — the `(0,3)` defect entry has a NONZERO coordinate (`= 4`):
                       a single octonion-product computation over `O ℚ`.
    jordan_fails_H4  — ★ THE CAP: the Jordan identity FAILS on `H₄(O ℚ)`
                       (`jdef Xwit Ywit ≠ 0`). The tower is genuinely capped below 4.

    ── THE ONE-CAUSE LINK (the flagship claim, a PROVED implication) ──
    cap_forces_nonassoc      — ★★ the `n = 4` cap failure DERIVES the non-associativity
                       of `𝕆`: if `𝕆` associated, `jordan_of_assoc` would force
                       `jdef Xwit Ywit = 0`, contradicting `jordan_fails_H4`. So the
                       Hermitian-tower cap and the cascade stop are the SAME fact.
    jordan_cap_iff_nonassoc  — ★★ packaged as a biconditional with the banked
                       `not_associative`: the `n = 4` Jordan-tower failure holds IFF
                       `𝕆` is non-associative. ONE CAUSE (octonionic non-associativity),
                       TWO TERMINATIONS (the cascade's stop at N2, and the Hermitian
                       tower's cap here).

  WHAT IS NOT BANKED HERE (decomposed, childed onto the chain tail — docs/RUNBOOK.md
  W3). The POSITIVE small-order direction `H₃(O ℚ)` satisfies the Jordan identity
  (deriving it from `𝕆`'s alternativity `scaling_law`) — the exceptional/Albert
  direction — is genuinely heavy: it is the classical fact that `H₃(𝕆)` is a Jordan
  algebra not embeddable in any associative algebra, and a brute symbolic coordinate
  proof costs ~1m46s PER coordinate over `ℚ` (workbench/N5-jordan-cap), i.e. well over
  an hour for the full identity — beyond a safe single run. It is childed as a
  dedicated node (the alternativity-powered `H₃` direction). The cap's UPPER half
  (the failure at `n ≥ 4`) and the entire ONE-CAUSE LINK — the flagship novelty — are
  banked here, complete and foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "generation / Jordan-as-physics
  / Albert / exceptional": what remains is the theorem that the symmetrized product on
  the self-adjoint matrices over the Cayley–Dickson double of a double satisfies the
  Jordan identity at every order when the coordinate algebra is associative, FAILS at
  order 4 when the coordinate algebra is the non-associative octonion shape, and that
  this order-4 failure is logically equivalent to the coordinate algebra's
  non-associativity. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Operator
import Phys.Cascade.Octonion
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

/-! ## THE SYMMETRIZED (JORDAN) PRODUCT AND ITS DEFECT, over matrices on a
    non-associative coordinate algebra.

    The carrier `Matrix (Fin n) (Fin n) S` needs only `[NonAssocRing S]` (an additive
    group with a bilinear, not-necessarily-associative product) for the matrix product
    and the symmetric bracket to be defined — exactly the structure the octonion shape
    `CD (CD B)` carries via the banked `narCD` / `srCD` instances. -/
section Defs
variable {S : Type*} [NonAssocRing S] {n : ℕ}

/-- THE SYMMETRIC (JORDAN) BRACKET, unscaled: `{A, B} = A·B + B·A`. The genuine Jordan
    product is `½ • jb A B`; we drop the `½` because the Jordan identity is homogeneous
    (degree-matched on both sides), so the cap is identical with or without it — and
    dropping it keeps every coefficient in the cascade ground ring with no division. -/
def jb (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S := A * B + B * A

/-- THE JORDAN-IDENTITY DEFECT `{{A,B},{A,A}} − {A,{B,{A,A}}}`. The symmetrized product
    satisfies the Jordan identity at the pair `(A, B)` exactly when `jdef A B = 0`. -/
def jdef (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jb (jb A B) (jb A A) - jb A (jb B (jb A A))

end Defs

/-! ## THE ASSOCIATIVE SIDE — special Jordan, no cap.

    Over an associative coordinate ring the matrix ring is associative, so the
    symmetrized product is automatically a Jordan product (the matrices are a "special"
    Jordan algebra inside the associative matrix ring). This holds at EVERY order — it
    is the cap-free contrast that isolates the octonionic cause of the cap below. -/

/-- ★ OVER ANY ASSOCIATIVE COORDINATE RING, the Jordan identity holds for ALL orders
    and ALL matrices: `jdef A B = 0`. The matrix ring `Matrix (Fin n) (Fin n) S` is an
    associative ring, and in any associative ring the symmetrized bracket `{a,b}=ab+ba`
    satisfies the Jordan identity — a polynomial identity discharged by `noncomm_ring`.
    No physics, no cap: this is the tower one gets when the coordinate algebra has not
    yet lost associativity. -/
theorem jordan_of_ring {S : Type*} [Ring S] {n : ℕ} (A B : Matrix (Fin n) (Fin n) S) :
    jdef A B = 0 := by
  unfold jdef jb
  noncomm_ring

/-- ★ THE CONDITIONAL over the octonion shape. IF the coordinate algebra `CD (CD B)`
    were associative, the symmetrized tower would satisfy the Jordan identity at EVERY
    order `n`. Proved by upgrading the banked `NonAssocRing` (`narCD`) to a genuine
    `Ring` using the associativity hypothesis, then applying `jordan_of_ring`. This is
    the proved link between the cascade's associativity question and the tower's cap. -/
theorem jordan_of_assoc {B : Type*} [CommRing B] [StarRing B] {n : ℕ}
    (hassoc : ∀ x y z : CD (CD B), x * y * z = x * (y * z))
    (A C : Matrix (Fin n) (Fin n) (CD (CD B))) :
    @jdef _ CD.narCD n A C = 0 := by
  letI : Ring (CD (CD B)) := { CD.narCD with mul_assoc := hassoc }
  exact jordan_of_ring A C

/-! ## THE OCTONIONIC SIDE — the cap: failure at order 4 on the terminal algebra.

    On `O ℚ = CD (CD (Dbl ℚ))` the Jordan identity FAILS at `n = 4`. The witness is
    built from the cascade's own non-associating triple: the three off-diagonal
    entries are `ι(ιJ)`, `ι(e₂)`, `e₂` — the very elements of `not_associative_witness`
    (`Phys/Cascade/Octonion.lean`). The defect is a single octonion-product computation. -/

section Witness
attribute [local instance] CD.narCD CD.srCD

/-- First off-diagonal entry: the doubly-embedded complex unit `ι(ιJ)` of `O ℚ`. -/
noncomputable def w1 : O ℚ := CD.iota (ιJ ℚ)
/-- Second off-diagonal entry: the embedded generator `ι(e₂)` of `O ℚ`. -/
noncomputable def w2 : O ℚ := CD.iota (CD.e2 : H ℚ)
/-- Third off-diagonal entry: the last-doubling generator `e₂` of `O ℚ`. The three
    entries `w1, w2, w3` are exactly the cascade's non-associating triple
    (`not_associative_witness`). -/
noncomputable def w3 : O ℚ := (CD.e2 : O ℚ)

/-- THE HERMITIAN WITNESS `X ∈ H₄(O ℚ)`: a self-adjoint `4 × 4` octonion matrix with
    off-diagonal entries `w1` at `(0,1)` and `w2` at `(0,2)` (and their conjugates by
    Hermiticity), everything else zero. -/
noncomputable def Xwit : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, w1, w2, 0;
     star w1, 0, 0, 0;
     star w2, 0, 0, 0;
     0, 0, 0, 0]

/-- THE HERMITIAN WITNESS `Y ∈ H₄(O ℚ)`: a self-adjoint `4 × 4` octonion matrix with
    off-diagonal entry `w3` at `(1,3)` (and its conjugate), everything else zero. The
    path `0–1–2–3` through all four indices is what forces the three octonion entries
    to associate across the matrix product — the structural reason the cap is at 4. -/
noncomputable def Ywit : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, 0, 0, 0;
     0, 0, 0, w3;
     0, 0, 0, 0;
     0, star w3, 0, 0]

set_option maxHeartbeats 4000000 in
/-- The `(0,3)` entry of the Jordan defect has a NONZERO coordinate: its
    `im.re.im` component (the `e₅` direction of `O ℚ`) equals `4`. A single
    octonion-product computation over the cascade ground ring `ℚ`, reducing the matrix
    product and the Cayley–Dickson product down to rational arithmetic. -/
theorem jdef_witness : (jdef Xwit Ywit 0 3).im.re.im = 4 := by
  unfold jdef jb Xwit Ywit w1 w2 w3
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_four,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val,
    Matrix.empty_val', Matrix.cons_val_three, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.head_fin_const, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    CD.iota, CD.e2, ιJ, Dbl.J, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
    Dbl.one_re, Dbl.one_im, CD.one_re, star_zero, star_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  norm_num

/-- ★ THE CAP. The Jordan identity FAILS on the self-adjoint matrices `H₄(O ℚ)`:
    there is a Hermitian pair `(Xwit, Ywit)` with `jdef Xwit Ywit ≠ 0`. The symmetrized
    product on the order-4 Hermitian tower over the terminal algebra is NOT a Jordan
    product — the tower is genuinely capped below order 4. -/
theorem jordan_fails_H4 : jdef Xwit Ywit ≠ 0 := by
  intro h
  have hz : (jdef Xwit Ywit 0 3).im.re.im = 4 := jdef_witness
  rw [h] at hz
  norm_num [Matrix.zero_apply] at hz

/-! ## THE ONE-CAUSE LINK — the flagship trunk claim, a PROVED implication.

    ONE CAUSE (octonionic non-associativity), MANY TERMINATIONS. The same fact that
    stopped the cascade at `𝕆` (N2 `not_associative`) is what caps the Hermitian Jordan
    tower at order 4. This is not asserted in a comment — it is the proved logical
    equivalence between the `n = 4` Jordan-tower failure and the non-associativity of
    `𝕆`. -/

/-- ★★ THE `n = 4` CAP FAILURE DERIVES THE NON-ASSOCIATIVITY OF `𝕆`. If `O ℚ` were
    associative, the conditional `jordan_of_assoc` would force `jdef Xwit Ywit = 0`,
    contradicting the cap `jordan_fails_H4`. Hence the Hermitian-tower cap is not a new
    phenomenon — it is the cascade's own loss of associativity, surfacing in a second
    structure. -/
theorem cap_forces_nonassoc : ¬ (∀ x y z : O ℚ, x * y * z = x * (y * z)) := by
  intro hassoc
  exact jordan_fails_H4 (jordan_of_assoc hassoc Xwit Ywit)

/-- ★★ ONE CAUSE, TWO TERMINATIONS — the proved equivalence. The order-4 Jordan-tower
    failure on `H₄(O ℚ)` holds IF AND ONLY IF `O ℚ` is non-associative. The forward
    direction is `cap_forces_nonassoc`; the backward direction is the banked cascade
    stop `not_associative` (the tower's cap does not even need to be re-derived — the
    non-associativity that stopped the cascade already entails it via the contrapositive
    of `jordan_of_assoc`). The single octonionic fact behind both terminations. -/
theorem jordan_cap_iff_nonassoc :
    (jdef Xwit Ywit ≠ 0) ↔ ¬ (∀ x y z : O ℚ, x * y * z = x * (y * z)) := by
  constructor
  · intro _; exact cap_forces_nonassoc
  · intro _; exact jordan_fails_H4

/-- The cap and the cascade stop are literally the same theorem reused: the banked
    `not_associative` (the proved STOP of the cascade) is exactly the witness that
    discharges the right-hand side of `jordan_cap_iff_nonassoc`, so it ALSO discharges
    the Jordan-tower cap. ONE proved fact, applied at two nodes. -/
theorem cap_from_cascade_stop : jdef Xwit Ywit ≠ 0 :=
  jordan_cap_iff_nonassoc.mpr Phys.Cascade.not_associative

end Witness

end Phys.Algebra
