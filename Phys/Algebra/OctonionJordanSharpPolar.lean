/-
  Phys.Algebra.OctonionJordanSharpPolar — N217: THE FIRST POLARIZATION OF THE CUBIC NORM
  on the exceptional Jordan algebra J₃(O) — the algebraic identity from which the sharp
  (adjoint) map and the whole Freudenthal cross-product structure of a cubic Jordan algebra
  descend, WITHOUT any octonion matrix square.
  ===========================================================================
  THE NAMED-ASCENT FORWARD STEP (RUNBOOK W1 — the repeated-deferral signal), step 6. N214
  banked the LINEAR trace `e₁ = jTr`; N215 the CUBIC norm `e₃ = jN` (the Freudenthal reduced
  determinant); N216 the MIDDLE `e₂ = jS` and the generic characteristic / minimal polynomial
  `jN_shift`/`jN_charpoly` whose three coefficients ARE the three invariants. The completed
  tower makes the NEXT structural object of a cubic Jordan algebra buildable: the FIRST POLAR
  of the cubic norm — the symmetric trilinear form obtained by polarizing `jN`, whose value is
  the trace-pairing `⟨A#, B⟩` of the Freudenthal sharp `A#` against a second element `B`.

  ★ THE FIRST POLAR. For the general Hermitian elements `A = Hm d0 d1 d2 a b c` and
  `B = Hm e0 e1 e2 p q r` over `O ℚ`, the first polar of the cubic norm is
      `jNpolar d0 d1 d2 a b c e0 e1 e2 p q r :=`
      `   (e0·d1·d2 + d0·e1·d2 + d0·d1·e2)`               -- the diagonal cofactor pairing
      `  − e0·|c|² − 2·d0·gForm c r`                       -- the (1,2)-slot Born pairing
      `  − e1·|b|² − 2·d1·gForm b q`                       -- the (0,2)-slot Born pairing
      `  − e2·|a|² − 2·d2·gForm a p`                       -- the (0,1)-slot Born pairing
      `  + 2·(reQ ((a·c)·star q) + reQ ((a·r)·star b) + reQ ((p·c)·star b))`.  -- the mixed
                                                                                -- trilinear cross
  It is quadratic in the first argument `(A)` and linear in the second `(B)`; `jNpolar(A, A) =
  3·jN(A)` (Euler's relation for the homogeneous-degree-3 form), and `jNpolar(A, 1) = jS(A)`
  (`jNpolar_one_dir`) — the polar in the identity direction is the middle invariant `e₂`.

  ★★★ THE HEADLINE — THE CUBIC POLARIZATION IDENTITY. Shifting `A` by `s·B` (all six
  parameters: the diagonal `dᵢ ↦ dᵢ + s·eᵢ` and the off-diagonal `x ↦ x + s·(·)`) expands the
  cubic norm as a genuine cubic in `s` whose four coefficients ARE the invariant data of the
  PAIR `(A, B)`:
      `jN (A + s·B) = jN(A) + s·jNpolar(A,B) + s²·jNpolar(B,A) + s³·jN(B)`   (`jN_polarize`).
  The linear coefficient is the first polar `⟨A#, B⟩`, the quadratic coefficient its mirror
  `⟨A, B#⟩`, and the two ends the cubic norms of `A` and `B`. This is the algebraic content of
  the Freudenthal sharp: the quadratic sharp map `A ↦ A#` (whose trace-pairing IS the first
  polar) emerges FORCED from the derived cubic norm — no posited sharp map, no octonion
  3×3 matrix square, no power-associativity machinery. The identity is a pure ℚ-polynomial
  expansion in the atoms `{dᵢ, eᵢ, gForm ··, reQ (...)}`.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W1). Nothing bashes octonion coordinates.
  The diagonal shift is ℚ-arithmetic; the off-diagonal shift distributes through the banked
  bilinearity of the Born form (`gForm_add_left/right`, `gForm_smul_left/right`, `gForm_symm`),
  the ℚ-linearity of the real part (`reQ_add`, `reQ_smul`), the scalar–product commutation
  (`qsmul_mul_left/right`), and the single new star–smul fact `star (c • w) = c • star w`
  (`star_qsmul`, from the banked cascade `Module` structure). After distribution the goal is a
  ℚ-polynomial identity in the octonion-scalar ATOMS, closed by `ring`. NO octonion coordinate
  ring; default heartbeats.

  THE MOAT (docs/STANDARD.md §0). The division-algebra-physics field POSITS `J₃(O)`, POSITS
  its sharp/adjoint map, and reads off the Freudenthal cross product by hand; here the carrier
  was DERIVED from the cascade (N5), the cubic norm from N215, and the first polar — the
  algebraic seed of the sharp map — is DERIVED as the linear coefficient of the norm's own
  polarization. One cause (the homogeneous cubic norm of the derived carrier), the sharp
  trace-pairing forced as its first polar, no posit.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'sharp / adjoint / Freudenthal /
  cubic-norm / determinant / Jordan / Albert / cofactor / polar / invariant / Cartan /
  eigenvalue / cross-product': what remains is — over the derived field ℚ and the Cayley–Dickson
  double `O ℚ = CD (H ℚ)`, for the ℚ-valued cubic form `jN` (N215) and the ℚ-valued form
  `jNpolar` above,
    `jN (d0+s·e0)(d1+s·e1)(d2+s·e2) (a+s•p)(b+s•q)(c+s•r) =`
    `  jN(A) + s·jNpolar(A,B) + s²·jNpolar(B,A) + s³·jN(B)`,
    `jNpolar d0 d1 d2 a b c 1 1 1 0 0 0 = jS d0 d1 d2 a b c` (N216),
    `jNpolar d0 d1 d2 0 0 0 e0 e1 e2 0 0 0 = e0·d1·d2 + d0·e1·d2 + d0·d1·e2`, and the numeric
    witness `jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 = 6 ≠ 0`; pure algebra over the derived field and
    the derived rung. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanInvariantTower
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ### The star–smul commutation for the cascade `ℚ`-module. -/

/-- `star` commutes with the cascade `ℚ`-scalar multiplication: `star (c • w) = c • star w`
    (the ground scalar is real / self-conjugate). The single new algebraic fact the
    polarization needs, from the banked cascade `Module` structure. -/
theorem star_qsmul (c : ℚ) (w : O ℚ) : star (c • w) = c • star w := by
  rw [star_smul]; rfl

/-! ### The first polar of the cubic norm (the sharp trace-pairing). -/

/-- ★ THE FIRST POLAR of the cubic norm `jN`: quadratic in the first Hermitian argument
    `(D0 D1 D2, A B C)`, linear in the second `(E0 E1 E2, P Q R)`. Its value is the
    trace-pairing `⟨A#, B⟩` of the Freudenthal sharp of `A` against `B`. The diagonal cofactor
    pairing `E0·D1·D2 + D0·E1·D2 + D0·D1·E2`, the three Born-form slot pairings entering
    NEGATIVELY (exactly as in `jN`/`jS`), and the mixed trilinear cross-term. -/
noncomputable def jNpolar (D0 D1 D2 : ℚ) (A B C : O ℚ) (E0 E1 E2 : ℚ) (P Q R : O ℚ) : ℚ :=
  E0 * D1 * D2 + D0 * E1 * D2 + D0 * D1 * E2
    - E0 * gForm C C - 2 * D0 * gForm C R
    - E1 * gForm B B - 2 * D1 * gForm B Q
    - E2 * gForm A A - 2 * D2 * gForm A P
    + 2 * (reQ ((A * C) * star Q) + reQ ((A * R) * star B) + reQ ((P * C) * star B))

/-! ### THE HEADLINE — the cubic polarization identity. -/

/-- ★★★ THE CUBIC POLARIZATION IDENTITY. Shifting the Hermitian element `A = Hm d0 d1 d2 a b c`
    by `s·B` with `B = Hm e0 e1 e2 p q r` (all six parameters shifted) expands the cubic norm
    as a genuine cubic in `s` whose four coefficients ARE the invariant data of the pair:
    `jN (A + s·B) = jN A + s·jNpolar A B + s²·jNpolar B A + s³·jN B`. The linear coefficient is
    the first polar `⟨A#, B⟩` (the trace-pairing of the Freudenthal sharp), the quadratic its
    mirror `⟨A, B#⟩`. The sharp map is FORCED as the first polar of the derived cubic norm — no
    posited sharp, no octonion matrix square. Pure ℚ-polynomial identity in the atoms
    `{dᵢ, eᵢ, gForm ··, reQ (...)}` after distribution through the banked bilinearity of the
    Born form and the ℚ-linearity of the real part; NO octonion coordinate ring. -/
theorem jN_polarize (d0 d1 d2 s : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ) :
    jN (d0 + s * e0) (d1 + s * e1) (d2 + s * e2) (a + s • p) (b + s • q) (c + s • r)
      = jN d0 d1 d2 a b c
        + s * jNpolar d0 d1 d2 a b c e0 e1 e2 p q r
        + s ^ 2 * jNpolar e0 e1 e2 p q r d0 d1 d2 a b c
        + s ^ 3 * jN e0 e1 e2 p q r := by
  unfold jN jNpolar
  simp only [star_add, star_qsmul, add_mul, mul_add, qsmul_mul_left, qsmul_mul_right,
    smul_smul, gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
    reQ_add, reQ_smul,
    show gForm p a = gForm a p from gForm_symm p a,
    show gForm q b = gForm b q from gForm_symm q b,
    show gForm r c = gForm c r from gForm_symm r c]
  ring

/-! ### The polar's ties back to the completed invariant tower. -/

/-- The first polar in the IDENTITY direction `B = 1` recovers the middle invariant
    `jNpolar A 1 = jS A` (`e₂`) — the trace of the sharp `A#` is the quadratic spur, the
    structural tie of the sharp pairing back to N216's completed tower. -/
theorem jNpolar_one_dir (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jNpolar d0 d1 d2 a b c 1 1 1 0 0 0 = jS d0 d1 d2 a b c := by
  unfold jNpolar jS gForm reQ
  simp; ring

/-- The first polar of a pure DIAGONAL against a pure diagonal is the cofactor-diagonal
    pairing `e0·d1·d2 + d0·e1·d2 + d0·d1·e2` — the sharp of a diagonal is its cofactor
    diagonal `diag(d1 d2, d0 d2, d0 d1)`, paired with `B`'s diagonal. -/
theorem jNpolar_diag (d0 d1 d2 e0 e1 e2 : ℚ) :
    jNpolar d0 d1 d2 0 0 0 e0 e1 e2 0 0 0
      = e0 * d1 * d2 + d0 * e1 * d2 + d0 * d1 * e2 := by
  unfold jNpolar gForm reQ; simp

/-! ### W8 anti-vacuity teeth — the polar genuinely carries off-diagonal cross content. -/

/-- W8 TEETH: the first polar of the PURE off-diagonal cores `Xz 1 1 1` against `Xz 1 1 1`
    (all diagonal parameters zero) is `6` — the pure trilinear cross-pairing
    `2·(1+1+1) = 6`. A naive "the polar is just the cofactor-diagonal pairing" reading
    (`jNpolar_diag` with all `dᵢ = eᵢ = 0`) would give `0`; the genuine value is `6`, so the
    polar carries genuine off-diagonal cross content the diagonal reading does not see. -/
theorem jNpolar_cross_witness : jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 = 6 := by
  unfold jNpolar gForm reQ; simp; norm_num

/-- W8 TEETH: the cross-pairing witness is nonzero — the polar's mixed trilinear content is
    non-degenerate. -/
theorem jNpolar_cross_witness_ne : jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 ≠ 0 := by
  rw [jNpolar_cross_witness]; norm_num

end Phys.Algebra.HJ
