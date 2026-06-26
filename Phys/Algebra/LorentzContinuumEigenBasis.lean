/-
  Phys.Algebra.LorentzContinuumEigenBasis — N64: THE GENERAL (WHOLE-FAMILY) EvC-ORTHONORMAL
  EIGENBASIS EXISTENCE FOR A 2-PARAMETER SYMMETRIC FAMILY, WITH AN IRRATIONAL OFF-AXIS EIGENBASIS,
  AND THE ISOMETRY-DERIVED DIAGONALIZATION — over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`. The first GENERAL eigenbasis-existence result in the chain: N63 banked the
  rotated-basis spectral square root for a GIVEN EvC-orthonormal eigenbasis; this node EXHIBITS, for
  a whole 2-parameter family of symmetric operators, an EXPLICIT FIXED EvC-orthonormal eigenbasis
  (the `cutSqrt`-valued 45° pair, genuinely OFF the coordinate axes and IRRATIONAL — escalating
  N63's rational `u35a/u35b`), so N63 `specOp_op_sqrt` delivers each member's positive operator
  square root, and SHOWS a banked isometry generator's square (`boostGenC∘boostGenC`) IS a member.
  ===========================================================================
  THE NEXT FORCED NODE after the EvC-orthogonal-eigenprojection + rotated-basis spectral-square-root
  node (N63). N49–N63 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root `scalar_op_sqrt` (N60);
    • the 2-BLOCK (non-scalar) operator square root `blockDiag_op_sqrt` (N61);
    • the OCTONION-INTERNAL (3-eigenvalue) COORDINATE-DIAGONAL operator square root `coordDiag3_op_sqrt` (N62);
    • ★ the EvC-ORTHOGONAL EIGENPROJECTION `projC u : p ↦ (EvC u p)•u` + the SPECTRAL SQUARE ROOT IN A
      ROTATED ORTHONORMAL BASIS `specOp_op_sqrt` (the first rotated-basis spectral object, diagonal in an
      ARBITRARY GIVEN EvC-orthonormal eigenbasis `{u₁,u₂}`), with a concrete RATIONAL Pythagorean pair
      `u35a/u35b` off the coordinate axes (N63).

  ── THE TARGET (N64) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the FULL SPECTRAL operator square root over an ARBITRARY EvC-self-adjoint
  EvC-positive-semidefinite operator — now reduced (by N63) to the EXISTENCE of an EvC-orthonormal
  eigenbasis (`g = Σ λᵢ Pᵢ`) → the polar/KAK assembly → connectedness → the full `Spin(9)→SO(9)`
  exhaustion. MEASURE-FIRST (ROADMAP §N64 priority (i)) confirms: the FULL eigenbasis existence for an
  ARBITRARY (unequal-diagonal) self-adjoint operator needs the characteristic-polynomial discriminant
  radical — the genuine HEAVY part, with no Mathlib spectral theory over `Cut` (childed N65). The
  immediately-bankable, theory-native, genuinely-NEW structural lever — escalating N63 from a SINGLE
  given eigenbasis to a WHOLE PARAMETRIZED FAMILY of operators sharing one FIXED IRRATIONAL eigenbasis
  — is the GENERAL eigendecomposition of the EQUAL-DIAGONAL 2-parameter symmetric family.

  ── THE TRUNK REFRAME (THE ONE LAW): the eigenbasis is the FIXED 45° pair, NO discriminant radical ──
  A symmetric operator in the `(t,x)` plane with EQUAL diagonal entries — `txOp a b a : (t,x,v) ↦
  (a·t+b·x, b·t+a·x, 0)` for FREE parameters `a,b` — is, for EVERY `a,b`, diagonalized by ONE fixed
  EvC-orthonormal eigenbasis: the 45° pair `u₊ = (s,s,0)`, `u₋ = (s,−s,0)` with `s = cutSqrt (1/2)`
  (so `s² = 1/2` and `{u₊,u₋}` is EvC-orthonormal), with eigenvalues `a+b` and `a−b`:
      `txOp a b a = specOp (a+b) (a−b) u₊ u₋`           (`txOp_eq_specOp`, EVERY `a,b`).
  The classical eigenvector problem for an unequal-diagonal symmetric matrix needs the discriminant
  `√((a−d)² + 4b²)`; the EQUAL-diagonal slice removes the radical entirely — the eigenbasis is the
  PARAMETER-INDEPENDENT 45° rotation, supplied by the trunk `cutSqrt` (N57). So, for `a ≥ |b|`
  (`a+b ≥ 0 ∧ a−b ≥ 0`), N63 `specOp_op_sqrt` delivers each member's positive operator square root
  `specOp (cutSqrt (a+b)) (cutSqrt (a−b)) u₊ u₋` (`txOp_op_sqrt`) — a WHOLE 2-parameter family of
  rotated-basis operator square roots over an IRRATIONAL off-axis eigenbasis, NO Mathlib spectral
  theory, NO discriminant, NO posited inner product, NO Mathlib ℝ/ℂ as content.

  ── THE ISOMETRY-DERIVED CONNECTION (the ticket's named concrete case) ──
  `boostGenC∘boostGenC = txOp 1 0 1` (`boostGenC_sq_eq`): the square of the banked tangent isometry
  generator IS a member of the family (eigenvalues `1,1` on the 45° eigenbasis — the `(t,x)`-plane
  identity). So a banked ISOMETRY-derived self-adjoint operator is exhibited concretely in its
  EvC-orthonormal eigenbasis, the structural lever the full reverse-KAK assembly consumes.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    txOp a b d        — the `(t,x)`-plane symmetric operator `(t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)`.
    txOp_apply        — its action.
    s2 := cutSqrt (1/2), s2_sq — the irrational 45° amplitude, `s2² = 1/2`.
    uP/uM             — the FIXED 45° EvC-orthonormal eigenbasis `(s2,s2,0)`, `(s2,−s2,0)`, IRRATIONAL.
    uP_norm/uM_norm/uPM_orth — it is EvC-orthonormal (escalating N63's rational `u35a/u35b`).
    txOp_eq_specOp    — ★★ THE GENERAL EIGENDECOMPOSITION: for EVERY `a,b`,
                        `txOp a b a = specOp (a+b)(a−b) u₊ u₋` — the whole family diagonalized in ONE
                        fixed eigenbasis, NO discriminant radical.
    boostGenC_sq_eq   — ★ `boostGenC∘boostGenC = txOp 1 0 1`: a banked isometry generator's square IS
                        a family member (the isometry-derived diagonalization the ticket names).
    txOp_op_sqrt      — ★★ THE GENERAL FAMILY ROOT: for `a+b ≥ 0 ∧ a−b ≥ 0`,
                        `specOp (cutSqrt (a+b))(cutSqrt (a−b)) u₊ u₋` is a positive operator square root
                        of `txOp a b a` — the whole 2-parameter family rooted in its IRRATIONAL eigenbasis.
    txOp_5_4_5_witness — ★ NON-VACUITY (W8): a concrete member `txOp 5 4 5 = specOp 9 1 u₊ u₋` (clean
                        eigenvalues `9,1`) with positive operator square root `specOp 3 1 u₊ u₋`.
    txOp_5_4_5_diag    — the concrete diagonalization `txOp 5 4 5 = specOp 9 1 u₊ u₋` (costume target).

  ── THE W1 HEAVY REMAINDER (childed N65, an honest dissolution ticket, NOT closed here) ──
  The FULL eigenbasis existence for an ARBITRARY (unequal-diagonal) EvC-self-adjoint operator needs the
  characteristic-polynomial roots / discriminant radical over `Cut` — no Mathlib analogue. With it: the
  polar/KAK assembly `g = k·exp(p)` extracting `exp(p) = √(g*g)`, the compact `k` via CONNECTEDNESS of
  the isometry group over `Cut`, and the full `Spin(9)→SO(9)` exhaustion. Those are the genuine HEAVY
  group-manifold core, childed onto the chain tail. THIS node banks the FIRST GENERAL (whole-family)
  eigenbasis-existence result with an IRRATIONAL off-axis eigenbasis, and the isometry-derived
  diagonalization — the change-of-basis lever the full spectral root will assemble.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a 2×2 symmetric matrix with equal diagonal is
  diagonalized by the fixed 45° rotation, with eigenvalues `a±b`, is standard linear algebra. Here the
  operator, the IRRATIONAL eigenbasis (its amplitude the trunk `cutSqrt (1/2)`), the eigendecomposition,
  and its family of operator square roots DESCEND from the banked scalar `cutSqrt` (N57, the
  order-completeness of the derived ℝ `Cut`) + the positive-definite reference form `EvC` (N58, itself
  the Born self-overlap positivity N56) + the N63 spectral machinery (`specOp`/`specOp_op_sqrt`) over the
  DERIVED ℝ `Cut` — NO posited operator calculus, NO Mathlib spectral theory, NO posited inner product,
  NO Mathlib ℝ/ℂ as content. The W1 reframe (the equal-diagonal slice removes the discriminant; the
  eigenbasis is the parameter-independent 45° rotation supplied by `cutSqrt`) is exactly what banks a
  GENERAL family eigenbasis existence without any spectral analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenbasis / eigenprojection / diagonal / orthonormal / projection /
  square-root / self-adjoint / positive-semidefinite / isometry / Spin / SO(9) / KAK / polar / Cartan":
  what remains is the theorem that, over the derived complete ordered field `Cut` and the Cayley–Dickson
  double³ `O Cut`, for the symmetric positive-definite bilinear form `EvC`, the `Cut`-linear map
  `txOp a b d := (t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)`, and the fixed pair `u₊ := (s,s,0)`, `u₋ := (s,−s,0)`
  with `s := cutSqrt (1/2)`: `{u₊,u₋}` is EvC-orthonormal; for EVERY `a,b`,
  `txOp a b a = specOp (a+b)(a−b) u₊ u₋`; `boostGenC∘boostGenC = txOp 1 0 1`; for `a+b ≥ 0 ∧ a−b ≥ 0`,
  `specOp (cutSqrt (a+b))(cutSqrt (a−b)) u₊ u₋` squares to `txOp a b a`; and concretely
  `txOp 5 4 5 = specOp 9 1 u₊ u₋` with positive square root `specOp 3 1 u₊ u₋`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumEigenProj

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The `(t,x)`-plane symmetric operator — a 2-parameter family of self-adjoint maps. -/

/-- THE `(t,x)`-PLANE SYMMETRIC OPERATOR `(t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)` — a symmetric (the
    off-diagonal `b` shared) `Cut`-linear map acting in the time–space plane, annihilating the nine
    space directions. The equal-diagonal slice `txOp a b a` is the 2-parameter family diagonalized by
    ONE fixed EvC-orthonormal eigenbasis below. -/
def txOp (a b d : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + d * p.2.1, 0)
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    show (a * (t + t') + b * (x + x'), b * (t + t') + d * (x + x'), (0 : O Cut))
       = (a * t + b * x, b * t + d * x, 0) + (a * t' + b * x', b * t' + d * x', 0)
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (t + t') + b * (x + x') = (a * t + b * x) + (a * t' + b * x'); ring
    · show b * (t + t') + d * (x + x') = (b * t + d * x) + (b * t' + d * x'); ring
    · show (0 : O Cut) = 0 + 0; rw [add_zero]
  map_smul' c p := by
    obtain ⟨t, x, v⟩ := p
    show (a * (c * t) + b * (c * x), b * (c * t) + d * (c * x), (0 : O Cut))
       = c • (a * t + b * x, b * t + d * x, (0 : O Cut))
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (c * t) + b * (c * x) = c * (a * t + b * x); ring
    · show b * (c * t) + d * (c * x) = c * (b * t + d * x); ring
    · show (0 : O Cut) = c • (0 : O Cut); rw [smul_zero]

/-- The `(t,x)`-plane symmetric operator acts as `p ↦ (a·t+b·x, b·t+d·x, 0)`. -/
theorem txOp_apply (a b d : Cut) (p : STVC) :
    txOp a b d p = (a * p.1 + b * p.2.1, b * p.1 + d * p.2.1, 0) := rfl

/-! ## The fixed 45° EvC-orthonormal eigenbasis — IRRATIONAL, off the coordinate axes. -/

/-- The irrational 45° amplitude `s := cutSqrt (1/2)` — the trunk scalar square root (N57) of `1/2`. -/
def s2 : Cut := cutSqrt (1/2)

/-- The defining property `s² = 1/2` — from `cutSqrt_sq` (N57), the order-completeness of `Cut`. -/
theorem s2_sq : s2 * s2 = 1/2 := cutSqrt_sq (by norm_num)

/-- The first fixed eigenbasis vector `u₊ := (s,s,0)` — the 45° direction, IRRATIONAL (its components
    are the trunk `cutSqrt (1/2)`), genuinely OFF the standard coordinate axes. -/
def uP : STVC := (s2, s2, (0 : O Cut))

/-- The second fixed eigenbasis vector `u₋ := (s,−s,0)` — EvC-orthogonal to `u₊`, also IRRATIONAL. -/
def uM : STVC := (s2, -s2, (0 : O Cut))

/-- `u₊` is an EvC-unit: `EvC u₊ u₊ = s² + s² = 1/2 + 1/2 = 1`. -/
theorem uP_norm : EvC uP uP = 1 := by
  show s2 * s2 + s2 * s2 + gFormC 0 0 = 1
  rw [gFormC_zero_left]; linear_combination (2:Cut) * s2_sq

/-- `u₋` is an EvC-unit: `EvC u₋ u₋ = s² + (−s)² = 1/2 + 1/2 = 1`. -/
theorem uM_norm : EvC uM uM = 1 := by
  show s2 * s2 + (-s2) * (-s2) + gFormC 0 0 = 1
  rw [gFormC_zero_left]; linear_combination (2:Cut) * s2_sq

/-- `u₊` and `u₋` are EvC-orthogonal: `EvC u₊ u₋ = s² − s² = 0`. -/
theorem uPM_orth : EvC uP uM = 0 := by
  show s2 * s2 + s2 * (-s2) + gFormC 0 0 = 0
  rw [gFormC_zero_left]; ring

/-! ## THE GENERAL EIGENDECOMPOSITION — the whole 2-parameter family in ONE fixed eigenbasis. -/

/-- ★★ THE GENERAL EIGENDECOMPOSITION: for EVERY `a,b`, the equal-diagonal symmetric operator
    `txOp a b a` equals the spectral operator `specOp (a+b)(a−b) u₊ u₋` — diagonalized in the SINGLE
    fixed EvC-orthonormal 45° eigenbasis `{u₊,u₋}`, eigenvalues `a+b` and `a−b`. The equal-diagonal
    slice removes the discriminant radical entirely: the eigenbasis is PARAMETER-INDEPENDENT, supplied
    by the trunk `cutSqrt (1/2)`. The first WHOLE-FAMILY eigenbasis-existence result in the chain
    (N63 banked the root for a SINGLE given eigenbasis; this exhibits one eigenbasis for a 2-parameter
    family). -/
theorem txOp_eq_specOp (a b : Cut) :
    txOp a b a = specOp (a + b) (a - b) uP uM := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [txOp_apply, specOp_apply]
  have eP : EvC uP (t, x, v) = s2 * t + s2 * x := by
    show s2 * t + s2 * x + gFormC 0 v = s2 * t + s2 * x
    rw [gFormC_zero_left, add_zero]
  have eM : EvC uM (t, x, v) = s2 * t - s2 * x := by
    show s2 * t + (-s2) * x + gFormC 0 v = s2 * t - s2 * x
    rw [gFormC_zero_left, add_zero]; ring
  rw [eP, eM]
  simp only [uP, uM, Prod.smul_mk, smul_eq_mul, Prod.mk_add_mk, smul_zero, add_zero]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * t + b * x
       = (a + b) * (s2 * t + s2 * x) * s2 + (a - b) * (s2 * t - s2 * x) * s2
    linear_combination (-(2:Cut) * (a * t + b * x)) * s2_sq
  · show b * t + a * x
       = (a + b) * (s2 * t + s2 * x) * s2 + (a - b) * (s2 * t - s2 * x) * (-s2)
    linear_combination (-(2:Cut) * (a * x + b * t)) * s2_sq
  · show (0 : O Cut) = 0; rfl

/-! ## The isometry-derived diagonalization — a banked generator's square IS a family member. -/

/-- ★ THE ISOMETRY-DERIVED DIAGONALIZATION: the square of the banked tangent isometry generator
    `boostGenC` (N51, `(t,x,v) ↦ (x,t,0)`) is the family member `txOp 1 0 1` — the `(t,x)`-plane
    identity, eigenvalues `1,1` on the fixed 45° eigenbasis. A banked ISOMETRY-derived self-adjoint
    operator exhibited concretely in its EvC-orthonormal eigenbasis (the structural lever toward the
    full reverse-KAK assembly the ticket names). -/
theorem boostGenC_sq_eq : boostGenC.comp boostGenC = txOp 1 0 1 := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [LinearMap.comp_apply, txOp_apply]
  show boostGenC (x, t, (0:O Cut)) = (1 * t + 0 * x, 0 * t + 1 * x, 0)
  show ((t, x, (0:O Cut)) : STVC) = (1 * t + 0 * x, 0 * t + 1 * x, 0)
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show t = 1 * t + 0 * x; ring
  · show x = 0 * t + 1 * x; ring
  · rfl

/-! ## THE GENERAL FAMILY OPERATOR SQUARE ROOT — the whole family rooted in its IRRATIONAL eigenbasis. -/

/-- ★★ THE GENERAL FAMILY OPERATOR SQUARE ROOT: for `a+b ≥ 0` and `a−b ≥ 0` (i.e. `a ≥ |b|`, the
    positive-semidefinite slice), `specOp (cutSqrt (a+b))(cutSqrt (a−b)) u₊ u₋` is a positive operator
    square root of `txOp a b a`. The whole 2-parameter family rooted at once in its FIXED IRRATIONAL
    EvC-orthonormal eigenbasis — N63 `specOp_op_sqrt` applied through the general eigendecomposition
    `txOp_eq_specOp`, NO Mathlib spectral theory, NO discriminant. -/
theorem txOp_op_sqrt (a b : Cut) (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) :
    IsEvCOpSqrt (specOp (cutSqrt (a + b)) (cutSqrt (a - b)) uP uM) (txOp a b a) := by
  rw [txOp_eq_specOp]
  exact specOp_op_sqrt hab hab' uP_norm uM_norm uPM_orth

/-! ## Non-vacuity (W8) — a concrete member and its clean operator square root. -/

/-- The concrete diagonalization `txOp 5 4 5 = specOp 9 1 u₊ u₋` (eigenvalues `9,1` on the fixed 45°
    eigenbasis). The costume target. -/
theorem txOp_5_4_5_diag : txOp (5:Cut) 4 5 = specOp 9 1 uP uM := by
  rw [txOp_eq_specOp]; norm_num

/-- ★ NON-VACUITY (W8): the general family operator square root, concretely — `specOp 3 1 u₊ u₋`
    (a genuinely NON-coordinate-diagonal symmetric operator, eigenvalues `3,1` on the IRRATIONAL 45°
    eigenbasis) is the positive operator square root of `txOp 5 4 5` (the member with eigenvalues
    `9,1`). A banked-isometry-style self-adjoint operator rooted via its explicit eigenbasis. -/
theorem txOp_5_4_5_witness :
    IsEvCOpSqrt (specOp (3:Cut) (1:Cut) uP uM) (txOp 5 4 5) := by
  have h := txOp_op_sqrt 5 4 (by norm_num) (by norm_num)
  rwa [show (5:Cut) + 4 = 9 from by norm_num, show (5:Cut) - 4 = 1 from by norm_num,
       show cutSqrt (9:Cut) = 3 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (1:Cut) = 1 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

end

end Phys.Algebra
