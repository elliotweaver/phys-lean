/-
  Phys.Algebra.OctonionJordanInvariantTower — N216: THE COMPLETED INVARIANT TOWER on the
  exceptional Jordan algebra J₃(O) — the MISSING MIDDLE (quadratic-spur / second-elementary-
  symmetric) invariant, and THE GENERIC CHARACTERISTIC / MINIMAL POLYNOMIAL whose three
  coefficients ARE the three invariants (linear → quadratic → cubic).
  ===========================================================================
  THE NAMED-ASCENT FORWARD STEP (RUNBOOK W1 — the repeated-deferral signal), step 5. The
  invariants of `J₃(O)` climb by degree: the LINEAR trace `jTr = e₁` (N214), the CUBIC norm
  `jN = e₃` (the reduced determinant, N215). The tower was MISSING its middle rung `e₂` — the
  quadratic spur — AND the structural fact that binds the three together: the GENERIC
  CHARACTERISTIC (minimal) POLYNOMIAL of a Hermitian element, whose coefficients ARE the
  invariants and whose roots on the Cartan ARE the eigenvalues. This module banks both.

  N214 banked the linear trace; N215 banked the cubic norm
  `jN d0 d1 d2 a b c = d0·d1·d2 − d0·gForm c c − d1·gForm b b − d2·gForm a a + 2·reQ ((a·c)·star b)`
  (with `gForm v v = |v|²` the Born norm, N24, and `reQ` the real part, N17). This module adds
  the middle invariant and the polynomial relation.

  ★ THE QUADRATIC SPUR (the second elementary-symmetric invariant / trace of the adjugate)
      `jS d0 d1 d2 a b c := (d0·d1 + d0·d2 + d1·d2) − |a|² − |b|² − |c|²`.
  On the diagonal Cartan it is `e₂` of the three real eigenvalues
  `jS d0 d1 d2 0 0 0 = d0·d1 + d0·d2 + d1·d2` (`jS_diag`); the identity gives `jS 1 1 1 0 0 0 = 3`
  (`jS_one`, `= C(3,2)`); a primitive frame idempotent gives `jS 1 0 0 0 0 0 = 0` (`jS_frame0`,
  σ₂ of a rank-1 element vanishes). The off-diagonal enters NEGATIVELY (`−Σ|·|²`), exactly as in
  `jN` — this is the genuinely-new content the diagonal facts do not see.

  ★★★ THE HEADLINE — THE GENERIC MINIMAL POLYNOMIAL as a coefficient identity. Shifting the
  diagonal of the Hermitian element by `t·1` (which touches only the diagonal; the off-diagonal
  `a,b,c` are carried unchanged) produces the monic cubic in `t` whose coefficients are the three
  invariants:
      `jN (d0+t)(d1+t)(d2+t) a b c = t³ + e₁·t² + jS·t + jN`   (`jN_shift`),
  with `e₁ = d0+d1+d2`. The linear-in-`t` coefficient is EXACTLY `jS` WITH its off-diagonal
  `−Σ|·|²` term — the shift FORCES the middle invariant into existence as the second coefficient.

  ★★★ THE HEADLINE — THE CHARACTERISTIC POLYNOMIAL `det(λ·1 − A)` of the FULL Hermitian element:
      `jN (λ−d0)(λ−d1)(λ−d2) (−a)(−b)(−c) = λ³ − e₁·λ² + jS·λ − jN`   (`jN_charpoly`).
  The three invariants are the coefficients of the generic characteristic polynomial (Newton's
  identities packaged), and on the Cartan its roots are the eigenvalues `d0,d1,d2` (so
  `jN_charpoly_witness`: the element `Hm 0 0 0 1 1 1` has `λ = 2` as a root). This reproduces
  `jN`'s trilinear cross-term `2·reQ ((a·c)·star b)` — the term N215 proved is well-defined by
  octonion trace-associativity — as the constant coefficient, so the WHOLE tower rests on the
  same one-cause.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W1). Nothing bashes octonion coordinates: `jN`
  and `jS` are ℚ-polynomials in the ATOMS `{dᵢ, gForm ··, reQ (...)}`; `A + t·1` and `λ·1 − A`
  touch only the diagonal, so the coefficient identities are pure ℚ-polynomial identities closed
  by `ring` after `unfold` (plus, for the characteristic form, the two sign facts
  `gForm (−v)(−v) = gForm v v` and the negated-cross-term sign, both one-line rewrites through
  the banked `star`/`reQ_neg`). Default heartbeats.

  THE MOAT (docs/STANDARD.md §0). The division-algebra-physics field POSITS `J₃(O)` and writes
  its characteristic polynomial / generic minimal polynomial down by hand; here the carrier was
  DERIVED from the cascade (N5), the invariants from N214/N215, and the polynomial that binds
  them — with the middle coefficient forced to carry the off-diagonal norm and the constant
  coefficient forced to carry the well-defined trilinear cross-term — is DERIVED as a ℚ-algebraic
  identity. One cause (the diagonal shift of the derived carrier), the completed invariant tower,
  no posit.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'cubic-norm / determinant / Freudenthal /
  Albert / Jordan / eigenvalue / frame / idempotent / rank / characteristic-polynomial / spur /
  invariant / Cartan': what remains is — over the derived field ℚ and the Cayley–Dickson double
  `O ℚ = CD (H ℚ)`, for the ℚ-valued forms `jN` (N215) and
  `jS d0 d1 d2 a b c = (d0·d1 + d0·d2 + d1·d2) − gForm a a − gForm b b − gForm c c`,
  `jS d0 d1 d2 0 0 0 = d0·d1 + d0·d2 + d1·d2`, `jS 1 1 1 0 0 0 = 3`, `jS 1 0 0 0 0 0 = 0`,
  `jN (d0+t)(d1+t)(d2+t) a b c = t³ + (d0+d1+d2)·t² + jS ··· · t + jN ···`,
  `jN (λ−d0)(λ−d1)(λ−d2) (−a)(−b)(−c) = λ³ − (d0+d1+d2)·λ² + jS ··· · λ − jN ···`, and the numeric
  witnesses `jS 2 2 2 1 0 0 = 11`, `jN 2 2 2 (−1)(−1)(−1) = 0`; pure algebra over the derived
  field and the derived rung. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanCubicNorm
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ### The middle invariant — the quadratic spur (second elementary-symmetric invariant). -/

/-- ★ THE QUADRATIC SPUR (the second elementary-symmetric invariant / trace of the adjugate) of
    the general Hermitian matrix `Hm d0 d1 d2 a b c` over the terminal algebra `O ℚ` — the MIDDLE
    rung of the invariant tower between the linear trace (N214) and the cubic norm (N215). Like
    the cubic norm, the off-diagonal enters through the Born norm `gForm v v = |v|²` with a
    NEGATIVE sign. -/
noncomputable def jS (d0 d1 d2 : ℚ) (a b c : O ℚ) : ℚ :=
  (d0 * d1 + d0 * d2 + d1 * d2)
    - gForm a a - gForm b b - gForm c c

/-- `jS` on the diagonal Cartan is the second elementary-symmetric function of the three real
    eigenvalues `d0·d1 + d0·d2 + d1·d2`. -/
theorem jS_diag (d0 d1 d2 : ℚ) : jS d0 d1 d2 0 0 0 = d0 * d1 + d0 * d2 + d1 * d2 := by
  unfold jS gForm reQ; simp

/-- The identity matrix has quadratic spur `jS 1 1 1 0 0 0 = 3` (`= C(3,2)`). -/
theorem jS_one : jS 1 1 1 0 0 0 = 3 := by
  unfold jS gForm reQ; simp; norm_num

/-- A primitive frame idempotent `E0` has vanishing quadratic spur `jS 1 0 0 0 0 0 = 0` (σ₂ of a
    rank-1 element vanishes). -/
theorem jS_frame0 : jS 1 0 0 0 0 0 = 0 := by
  unfold jS gForm reQ; simp

/-! ### Sign helpers for the diagonal-negated (characteristic-polynomial) form. -/

/-- The Born self-overlap form is invariant under negation of its (diagonal) argument:
    `gForm (−v)(−v) = gForm v v`. -/
theorem gForm_neg_neg (v : O ℚ) : gForm (-v) (-v) = gForm v v := by
  unfold gForm
  rw [star_neg, neg_mul_neg]

/-- The trilinear cross-term flips sign when all three octonion factors are negated:
    `reQ (((−a)·(−c))·star (−b)) = − reQ ((a·c)·star b)`. -/
theorem reQ_cross_neg (a b c : O ℚ) :
    reQ (((-a) * (-c)) * star (-b)) = - reQ ((a * c) * star b) := by
  rw [neg_mul_neg, star_neg, mul_neg, reQ_neg]

/-! ### THE HEADLINE — the generic minimal / characteristic polynomial. -/

/-- ★★★ THE GENERIC MINIMAL-POLYNOMIAL COEFFICIENT IDENTITY. Shifting the diagonal of the
    Hermitian element by `t·1` (touching only the diagonal; the off-diagonal `a,b,c` are carried)
    yields the monic cubic in `t` whose coefficients are the three invariants of the tower:
    `jN (d0+t)(d1+t)(d2+t) a b c = t³ + (d0+d1+d2)·t² + jS ··· · t + jN ···`. The linear-in-`t`
    coefficient is EXACTLY the quadratic spur `jS` WITH its off-diagonal `−Σ|·|²` term — the shift
    FORCES the middle invariant as the second coefficient. Pure ℚ-polynomial identity in the atoms
    `{dᵢ, gForm ··, reQ (...)}`; NO octonion coordinate ring. -/
theorem jN_shift (d0 d1 d2 t : ℚ) (a b c : O ℚ) :
    jN (d0 + t) (d1 + t) (d2 + t) a b c
      = t ^ 3 + (d0 + d1 + d2) * t ^ 2 + jS d0 d1 d2 a b c * t + jN d0 d1 d2 a b c := by
  unfold jN jS
  ring

/-- ★★★ THE CHARACTERISTIC POLYNOMIAL `det(λ·1 − A)` of the FULL Hermitian element — the three
    invariants ARE its coefficients, and on the Cartan its roots ARE the eigenvalues:
    `jN (λ−d0)(λ−d1)(λ−d2) (−a)(−b)(−c) = λ³ − (d0+d1+d2)·λ² + jS ··· · λ − jN ···`. The constant
    coefficient reproduces `jN`'s trilinear cross-term `2·reQ ((a·c)·star b)` — the term proved
    well-defined by octonion trace-associativity (N215) — so the whole invariant tower rests on
    the same one-cause. Closed by `ring` after the two sign rewrites `gForm_neg_neg`/`reQ_cross_neg`;
    NO octonion coordinate ring. -/
theorem jN_charpoly (d0 d1 d2 lam : ℚ) (a b c : O ℚ) :
    jN (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c)
      = lam ^ 3 - (d0 + d1 + d2) * lam ^ 2 + jS d0 d1 d2 a b c * lam - jN d0 d1 d2 a b c := by
  unfold jN jS
  rw [gForm_neg_neg, gForm_neg_neg, gForm_neg_neg, reQ_cross_neg]
  ring

/-! ### W8 anti-vacuity teeth — the middle invariant genuinely depends on the off-diagonal. -/

/-- W8 TEETH: the off-diagonal genuinely lowers the quadratic spur from the diagonal
    `2·2 + 2·2 + 2·2 = 12` to `12 − |1|² = 11`. The middle invariant is NOT the trivial diagonal
    σ₂; it carries genuine off-diagonal content. -/
theorem jS_witness : jS 2 2 2 1 0 0 = 11 := by
  unfold jS gForm reQ; simp; norm_num

/-- W8 TEETH: the characteristic polynomial of the Hermitian element `Hm 0 0 0 1 1 1` vanishes at
    `λ = 2` — i.e. `jN (2−0)(2−0)(2−0) (−1)(−1)(−1) = jN 2 2 2 (−1)(−1)(−1) = 0`, so `λ = 2` is a
    genuine root (eigenvalue). A nonzero off-diagonal produces a nontrivial characteristic root. -/
theorem jN_charpoly_witness : jN 2 2 2 (-1) (-1) (-1) = 0 := by
  unfold jN gForm reQ; simp; norm_num

/-- W8 TEETH: the quadratic-spur witness value is nonzero — the middle invariant is
    non-degenerate. -/
theorem jS_witness_ne : jS 2 2 2 1 0 0 ≠ 0 := by
  rw [jS_witness]; norm_num

end Phys.Algebra.HJ
