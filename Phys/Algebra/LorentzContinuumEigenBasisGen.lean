/-
  Phys.Algebra.LorentzContinuumEigenBasisGen — N65: THE FULL EIGENBASIS EXISTENCE FOR AN ARBITRARY
  (UNEQUAL-DIAGONAL) EvC-SELF-ADJOINT OPERATOR — the characteristic-polynomial roots / discriminant
  radical `√((a−d)²+4b²)` over the DERIVED ℝ `Cut` (now PARAMETER-DEPENDENT eigenvectors, NO fixed
  eigenbasis) — and the GENERAL operator square root in the constructed rotated eigenbasis. Over the
  DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the GENERAL (whole-family) EvC-orthonormal eigenbasis-existence node for
  the EQUAL-diagonal family (N64). N49–N64 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + `scalar_op_sqrt` (N60);
    • the 2-BLOCK operator square root `blockDiag_op_sqrt` (N61);
    • the OCTONION-INTERNAL (3-eigenvalue) COORDINATE-DIAGONAL operator square root `coordDiag3_op_sqrt` (N62);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the SPECTRAL SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS
      `specOp`/`specOp_op_sqrt`/`specOp_read₁`/`specOp_read₂` (the rotated-basis spectral object, N63);
    • ★ the GENERAL (WHOLE-FAMILY) EvC-orthonormal eigenbasis existence for the EQUAL-diagonal family
      `txOp a b a = specOp (a+b)(a−b) u₊ u₋` over the FIXED irrational 45° eigenbasis `uP`/`uM`
      (`txOp_eq_specOp`/`txOp_op_sqrt`/`boostGenC_sq_eq`), the equal-diagonal slice removing the
      discriminant radical entirely (N64).

  ── THE TARGET (N65) ──
  N64 banked the eigenbasis for the EQUAL-diagonal slice `txOp a b a`: there the
  characteristic-polynomial discriminant `√((a−d)²+4b²)` VANISHES (the diagonal entries are equal), so
  the eigenbasis is the PARAMETER-INDEPENDENT fixed 45° pair. THE GENUINE HEAVY CORE the ROADMAP §N65
  names is the UNEQUAL-DIAGONAL case `a ≠ d`: the eigenvalues are now the roots of the characteristic
  polynomial `λ² − (a+d)λ + (ad−b²)`, i.e. `λ± = (a+d)/2 ± √(((a−d)/2)²+b²)`, and — crucially — the
  EIGENVECTORS ROTATE with the parameters: there is NO fixed eigenbasis. This node EXHIBITS, for EVERY
  unequal-diagonal `txOp a b d` with `b ≠ 0`, an EXPLICIT EvC-orthonormal eigenbasis built from the
  discriminant radical `cutSqrt(δ²+b²)` (the trunk scalar root N57), proves `txOp a b d` diagonalizes
  in it, and reads off its operator square root via N63 `specOp_op_sqrt`. NO Mathlib spectral theory
  over `Cut`.

  ── THE TRUNK REFRAME (THE ONE LAW): the discriminant radical IS the banked scalar `cutSqrt` ──
  The classical eigenproblem for the symmetric `[[a,b],[b,d]]` needs the discriminant radical
  `√((a−d)²+4b²)` — no Mathlib analogue over the derived ℝ `Cut`. The trunk supplies it as the banked
  positive-definite scalar square root `cutSqrt` (N57, the order-completeness of `Cut`). Write
  `m = (a+d)/2`, `δ = (a−d)/2`, `R = cutSqrt(δ²+b²)` (the half-discriminant radical). The eigenvalues
  are `λ± = m ± R`. For `b ≠ 0`, `R² = δ²+b² > δ²` and `R > 0` force `R − δ > 0`, so the two
  eigenvector directions `(b, R−δ)` and `(−(R−δ), b)` have a common POSITIVE squared EvC-norm
  `N = b² + (R−δ)² = 2R(R−δ)` (using `R² = δ²+b²`), and normalizing by `nrm = cutSqrt N` (well-defined
  and nonzero, `N > 0`) gives the EvC-ORTHONORMAL eigenbasis `u± = (1/nrm)·(b, ±…)`. Then
  `txOp a b d = specOp (m+R) (m−R) u₊ u₋` (`txOp_eq_specOp_rot`) — the FULL arbitrary-unequal-diagonal
  eigendecomposition, the eigenbasis ROTATING with the parameters through the discriminant `cutSqrt`,
  NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    rotA c s / rotB c s — the rotation eigenbasis pair `(c,s,0)`, `(−s,c,0)` (parameter-dependent).
    rotA_norm/rotB_norm/rotAB_orth — for `c²+s²=1` it is EvC-orthonormal (always EvC-orthogonal).
    specOp_rot_eq_txOp — ★★ THE FORWARD DECOMPOSITION: for ALL `l₁,l₂,c,s`,
                         `specOp l₁ l₂ (rotA c s)(rotB c s) = txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)`
                         — the WHOLE parametrized family of (in general UNEQUAL-diagonal) symmetric
                         operators presented in its rotated eigenbasis (escalating N64's fixed 45° pair).
    rotEig_normalized — the constructed eigenbasis is EvC-normalized: `(b/nrm)²+((R−δ)/nrm)² = 1`.
    txOp_eq_specOp_rot — ★★ THE CROWN — THE FULL ARBITRARY-UNEQUAL-DIAGONAL EIGENBASIS EXISTENCE: for
                         EVERY `a,b,d` with `b ≠ 0`, `txOp a b d = specOp (m+R)(m−R) u₊ u₋` over the
                         constructed EvC-orthonormal eigenbasis `u±` built from the discriminant radical
                         `R = cutSqrt(δ²+b²)` and `nrm = cutSqrt(2R(R−δ))` — the eigenvectors ROTATE with
                         the parameters, NO fixed eigenbasis, NO Mathlib spectral theory.
    txOp_op_sqrt_gen — ★★ THE GENERAL OPERATOR SQUARE ROOT: for `b ≠ 0` and the positive-semidefinite
                         slice `m − R ≥ 0`, `specOp (cutSqrt(m+R))(cutSqrt(m−R)) u₊ u₋` is a positive
                         operator square root of `txOp a b d` — N63 `specOp_op_sqrt` through the
                         CROWN eigendecomposition, the arbitrary-unequal-diagonal analogue of N64
                         `txOp_op_sqrt` (which needed equal diagonal).
    txOp_73_36_52_diag — NON-VACUITY (W8): a concrete UNEQUAL-diagonal member `txOp 73 36 52`
                         (diagonal `73 ≠ 52`, off-diagonal `36 ≠ 0`) `= specOp 100 25` over the
                         concrete rational rotation `rotA (4/5)(3/5)`/`rotB (4/5)(3/5)` (eigenvalues
                         `100,25`; the clean rational-discriminant case `R = 75/2`).
    txOp_73_36_52_witness — NON-VACUITY (W8): `specOp 10 5` over that eigenbasis is the positive
                         operator square root of `txOp 73 36 52` — a concrete unequal-diagonal operator
                         rooted in its explicit (NON-45°) EvC-orthonormal eigenbasis.

  ── THE W1 HEAVY REMAINDER (childed N66, an honest dissolution ticket, NOT closed here) ──
  With the full unequal-diagonal eigenbasis existence in hand, the remaining genuine HEAVY group-manifold
  core is: the polar/KAK assembly `g = k·exp(p)` extracting `exp(p) = √(g*g)` and the compact
  `k = g·exp(p)⁻¹`; the compact part `k` via CONNECTEDNESS of the isometry group over `Cut` (no Mathlib
  topology of `SO⁺(1,9)`); the global reverse KAK surjectivity (`qvIsomMonoidC` on the connected
  component `≤ genIsomMonoidC2`); and the full `Spin(9)→SO(9)` exhaustion (every spacelike rotation a
  finite product of `biMulFun` bimultiplications, the `2:1` cover). Those are childed onto the chain tail.
  THIS node banks the FULL ARBITRARY-UNEQUAL-DIAGONAL eigenbasis existence — the discriminant radical
  over the derived ℝ, the parameter-dependent rotating eigenbasis — closing the eigenbasis-existence
  question for the `(t,x)`-plane symmetric family that N64 opened for the equal-diagonal slice.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a 2×2 symmetric matrix is diagonalized by an
  orthogonal rotation, with eigenvalues `(a+d)/2 ± √(((a−d)/2)²+b²)`, is standard linear algebra. Here
  the operator, the parameter-dependent rotating eigenbasis (its amplitude the trunk discriminant radical
  `cutSqrt(δ²+b²)`), the eigendecomposition, and its family of operator square roots DESCEND from the
  banked scalar `cutSqrt` (N57, the order-completeness of the derived ℝ `Cut`) + the positive-definite
  reference form `EvC` (N58, itself the Born self-overlap positivity N56) + the N63 spectral machinery
  (`specOp`/`specOp_op_sqrt`) + the N64 operator `txOp` over the DERIVED ℝ `Cut` — NO posited operator
  calculus, NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content. The W1
  reframe (the discriminant radical IS the banked scalar `cutSqrt`; the eigenvector norm `2R(R−δ)` is
  positive exactly when `b ≠ 0`) is what banks a FULLY GENERAL unequal-diagonal eigenbasis existence
  without any spectral analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenbasis / eigenprojection / diagonal / orthonormal / projection /
  square-root / self-adjoint / positive-semidefinite / isometry / Spin / SO(9) / KAK / polar / Cartan /
  discriminant": what remains is the theorem that, over the derived complete ordered field `Cut` and the
  Cayley–Dickson double³ `O Cut`, for the symmetric positive-definite bilinear form `EvC`, the
  `Cut`-linear map `txOp a b d := (t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)`, and the pair
  `rotA c s := (c,s,0)`, `rotB c s := (−s,c,0)`: for `c²+s²=1` `{rotA,rotB}` is EvC-orthonormal; for ALL
  `l₁,l₂,c,s`, `specOp l₁ l₂ (rotA c s)(rotB c s) = txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)`; and for
  `b ≠ 0`, with `R := cutSqrt(((a−d)/2)²+b²)` and `nrm := cutSqrt(2R(R−(a−d)/2))`,
  `txOp a b d = specOp ((a+d)/2+R)((a+d)/2−R) (rotA (b/nrm)((R−(a−d)/2)/nrm)) (rotB …)`; and for the
  slice `(a+d)/2 − R ≥ 0`, `specOp (cutSqrt((a+d)/2+R))(cutSqrt((a+d)/2−R)) …` squares to `txOp a b d`;
  and concretely `txOp 73 36 52 = specOp 100 25 (rotA (4/5)(3/5))(rotB (4/5)(3/5))` with positive square
  root `specOp 10 5 …`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumEigenBasis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The rotation eigenbasis pair — parameter-dependent, NO fixed eigenbasis. -/

/-- The first rotation eigenbasis vector `(c,s,0)` — a parameter-DEPENDENT direction in the `(t,x)`
    plane (escalating N64's FIXED 45° pair `u₊`). For a unit `(c,s)` it is an EvC-unit. -/
def rotA (c s : Cut) : STVC := (c, s, (0 : O Cut))

/-- The second rotation eigenbasis vector `(−s,c,0)` — EvC-orthogonal to `rotA c s` for ALL `c,s`. -/
def rotB (c s : Cut) : STVC := (-s, c, (0 : O Cut))

/-- `rotA c s` is an EvC-unit when `c² + s² = 1`. -/
theorem rotA_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (rotA c s) (rotA c s) = 1 := by
  show c * c + s * s + gFormC 0 0 = 1
  rw [gFormC_zero_left, add_zero]; exact h

/-- `rotB c s` is an EvC-unit when `c² + s² = 1`. -/
theorem rotB_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (rotB c s) (rotB c s) = 1 := by
  show (-s) * (-s) + c * c + gFormC 0 0 = 1
  rw [gFormC_zero_left, add_zero]; linear_combination h

/-- `rotA c s` and `rotB c s` are EvC-orthogonal for ALL `c,s`: `c(−s) + s·c = 0`. -/
theorem rotAB_orth (c s : Cut) : EvC (rotA c s) (rotB c s) = 0 := by
  show c * (-s) + s * c + gFormC 0 0 = 0
  rw [gFormC_zero_left, add_zero]; ring

/-! ## The forward decomposition — the whole parametrized family in its rotated eigenbasis. -/

/-- ★★ THE FORWARD DECOMPOSITION: for ALL `l₁,l₂,c,s`, the rotated-basis spectral operator
    `specOp l₁ l₂ (rotA c s)(rotB c s)` equals the `(t,x)`-plane symmetric operator
    `txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)` — the eigenvalues `l₁,l₂` on the rotation eigenbasis
    produce a symmetric operator whose diagonal entries are in general UNEQUAL (escalating N64's fixed
    45° pair, where the form was forced to equal diagonal). Holds for EVERY `c,s` (the eigendecomposition
    FORM needs no orthonormality; orthonormality enters only for the composition / square-root laws). -/
theorem specOp_rot_eq_txOp (l₁ l₂ c s : Cut) :
    specOp l₁ l₂ (rotA c s) (rotB c s)
      = txOp (l₁*c*c + l₂*s*s) ((l₁-l₂)*c*s) (l₁*s*s + l₂*c*c) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [specOp_apply, txOp_apply]
  have eA : EvC (rotA c s) (t, x, v) = c*t + s*x := by
    show c * t + s * x + gFormC 0 v = c*t + s*x
    rw [gFormC_zero_left, add_zero]
  have eB : EvC (rotB c s) (t, x, v) = -s*t + c*x := by
    show (-s) * t + c * x + gFormC 0 v = -s*t + c*x
    rw [gFormC_zero_left, add_zero]
  rw [eA, eB]
  simp only [rotA, rotB, Prod.smul_mk, smul_eq_mul, Prod.mk_add_mk, smul_zero, add_zero]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show l₁ * (c*t + s*x) * c + l₂ * (-s*t + c*x) * -s = (l₁*c*c + l₂*s*s) * t + (l₁-l₂)*c*s * x
    ring
  · show l₁ * (c*t + s*x) * s + l₂ * (-s*t + c*x) * c = (l₁-l₂)*c*s * t + (l₁*s*s + l₂*c*c) * x
    ring
  · show (0 : O Cut) = 0; rfl

/-- The constructed eigenbasis is EvC-normalized: with `R² = δ²+b²` and `nrm² = 2R(R−δ)`,
    `(b/nrm)² + ((R−δ)/nrm)² = 1`. The shared squared norm `b²+(R−δ)² = 2R(R−δ)` of the two
    eigenvector directions normalizes to `1`. -/
theorem rotEig_normalized (b R δ nrm : Cut)
    (hRR : R * R = δ*δ + b*b) (hN : nrm * nrm = 2*R*(R-δ)) (hnrm : nrm ≠ 0) :
    (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 := by
  have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
  have key : b*b + (R-δ)*(R-δ) = nrm*nrm := by rw [hN]; linear_combination -hRR
  calc (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm)
      = (b*b + (R-δ)*(R-δ))/(nrm*nrm) := by ring
    _ = (nrm*nrm)/(nrm*nrm) := by rw [key]
    _ = 1 := div_self hN2

/-! ## THE CROWN — the full arbitrary-unequal-diagonal eigenbasis existence (the discriminant radical). -/

/-- ★★ THE CROWN — THE FULL ARBITRARY-UNEQUAL-DIAGONAL EIGENBASIS EXISTENCE: for EVERY `a,b,d` with
    `b ≠ 0`, the `(t,x)`-plane symmetric operator `txOp a b d` (in general UNEQUAL diagonal `a ≠ d`)
    is diagonalized by the EvC-orthonormal eigenbasis `u± = rotA/B (b/nrm)((R−δ)/nrm)` built from the
    discriminant radical `R = cutSqrt(δ²+b²)` (the trunk scalar root N57) and `nrm = cutSqrt(2R(R−δ))`,
    with eigenvalues `λ± = (a+d)/2 ± R`:
        `txOp a b d = specOp ((a+d)/2 + R) ((a+d)/2 − R) u₊ u₋`.
    The eigenvectors ROTATE with the parameters through the discriminant `cutSqrt` — there is NO fixed
    eigenbasis (N64's fixed 45° pair was the special equal-diagonal slice where the discriminant
    vanished). NO Mathlib spectral theory over `Cut`; the discriminant radical is the banked scalar
    `cutSqrt`, the eigenvector norm `2R(R−δ)` is positive exactly because `b ≠ 0` forces `R − δ > 0`. -/
theorem txOp_eq_specOp_rot (a b d : Cut) (hb : b ≠ 0) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    txOp a b d = specOp ((a+d)/2 + R) ((a+d)/2 - R) (rotA (b/nrm) ((R-δ)/nrm))
                                                     (rotB (b/nrm) ((R-δ)/nrm)) := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  rw [specOp_rot_eq_txOp]
  congr 1
  · -- eigenvalue identity for the `t,t` diagonal entry `a`
    symm
    have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
    have key : ((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-δ)*(R-δ) = a*(nrm*nrm) := by
      rw [hN]; linear_combination (-((a+d)/2 + R)) * hRR
    calc ((a+d)/2 + R) * (b/nrm) * (b/nrm) + ((a+d)/2 - R) * ((R-δ)/nrm) * ((R-δ)/nrm)
        = (((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-δ)*(R-δ))/(nrm*nrm) := by ring
      _ = (a*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = a := by rw [mul_div_assoc, div_self hN2, mul_one]
  · -- off-diagonal identity `b`
    symm
    have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
    have key : (((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-δ) = b*(nrm*nrm) := by rw [hN]; ring
    calc (((a+d)/2 + R) - ((a+d)/2 - R)) * (b/nrm) * ((R-δ)/nrm)
        = ((((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-δ))/(nrm*nrm) := by ring
      _ = (b*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = b := by rw [mul_div_assoc, div_self hN2, mul_one]
  · -- eigenvalue identity for the `x,x` diagonal entry `d`
    symm
    have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
    have key : ((a+d)/2 + R)*(R-δ)*(R-δ) + ((a+d)/2 - R)*b*b = d*(nrm*nrm) := by
      rw [hN]; linear_combination (-((a+d)/2 - R)) * hRR
    calc ((a+d)/2 + R) * ((R-δ)/nrm) * ((R-δ)/nrm) + ((a+d)/2 - R) * (b/nrm) * (b/nrm)
        = (((a+d)/2 + R)*(R-δ)*(R-δ) + ((a+d)/2 - R)*b*b)/(nrm*nrm) := by ring
      _ = (d*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = d := by rw [mul_div_assoc, div_self hN2, mul_one]

/-! ## The general operator square root — N63 `specOp_op_sqrt` through the CROWN eigendecomposition. -/

/-- ★★ THE GENERAL OPERATOR SQUARE ROOT: for `b ≠ 0` and the positive-semidefinite slice
    `(a+d)/2 − R ≥ 0` (the smaller eigenvalue `λ₋ = m − R ≥ 0`, hence `λ₊ = m + R ≥ 0` too),
    `specOp (cutSqrt((a+d)/2+R)) (cutSqrt((a+d)/2−R)) u₊ u₋` is a positive operator square root of the
    arbitrary unequal-diagonal `txOp a b d`. N63 `specOp_op_sqrt` applied through the CROWN
    eigendecomposition `txOp_eq_specOp_rot` — the arbitrary-unequal-diagonal analogue of N64
    `txOp_op_sqrt` (which required equal diagonal so the eigenbasis was the fixed 45° pair). The scalar
    `cutSqrt` applied per eigenvalue on the parameter-dependent EvC-orthogonal eigenprojection, NO
    Mathlib spectral theory. -/
theorem txOp_op_sqrt_gen (a b d : Cut) (hb : b ≠ 0)
    (hpos : 0 ≤ (a+d)/2 - cutSqrt ((a-d)/2*((a-d)/2) + b*b)) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    IsEvCOpSqrt (specOp (cutSqrt ((a+d)/2 + R)) (cutSqrt ((a+d)/2 - R))
                  (rotA (b/nrm) ((R-δ)/nrm)) (rotB (b/nrm) ((R-δ)/nrm)))
                (txOp a b d) := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  have hn1 : (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 :=
    rotEig_normalized b R δ nrm hRR hN hnrm
  have hpos' : 0 ≤ (a+d)/2 - R := hpos
  have hpos2 : 0 ≤ (a+d)/2 + R := by linarith [hpos', hRpos]
  have h := specOp_op_sqrt (c₁ := (a+d)/2 + R) (c₂ := (a+d)/2 - R) hpos2 hpos'
    (rotA_norm hn1) (rotB_norm hn1) (rotAB_orth (b/nrm) ((R-δ)/nrm))
  rwa [← txOp_eq_specOp_rot a b d hb] at h

/-! ## Non-vacuity (W8) — a concrete UNEQUAL-diagonal member and its operator square root. -/

/-- NON-VACUITY (W8): a concrete UNEQUAL-diagonal member — `txOp 73 36 52` (diagonal `73 ≠ 52`,
    off-diagonal `36 ≠ 0`) equals `specOp 100 25` over the concrete rational rotation eigenbasis
    `rotA (4/5)(3/5)`/`rotB (4/5)(3/5)` (eigenvalues `100,25`; the clean rational-discriminant case,
    half-discriminant `R = 75/2`). The costume target. -/
theorem txOp_73_36_52_diag :
    txOp (73:Cut) 36 52 = specOp 100 25 (rotA (4/5) (3/5)) (rotB (4/5) (3/5)) := by
  rw [specOp_rot_eq_txOp]; norm_num

/-- ★ NON-VACUITY (W8): the general operator square root, concretely — `specOp 10 5` over the rotated
    eigenbasis `rotA (4/5)(3/5)`/`rotB (4/5)(3/5)` (a genuinely UNEQUAL-diagonal symmetric operator,
    eigenvalues `10,5`) is the positive operator square root of the unequal-diagonal `txOp 73 36 52`
    (eigenvalues `100,25`). A concrete unequal-diagonal operator rooted in its explicit NON-45°
    EvC-orthonormal eigenbasis — beyond N64's fixed 45° equal-diagonal family. -/
theorem txOp_73_36_52_witness :
    IsEvCOpSqrt (specOp (10:Cut) 5 (rotA (4/5) (3/5)) (rotB (4/5) (3/5))) (txOp 73 36 52) := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  have h := specOp_op_sqrt (c₁ := (100:Cut)) (c₂ := (25:Cut)) (by norm_num) (by norm_num)
    (rotA_norm hn) (rotB_norm hn) (rotAB_orth (4/5) (3/5))
  rw [txOp_73_36_52_diag]
  rwa [show cutSqrt (100:Cut) = 10 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (25:Cut) = 5 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

end

end Phys.Algebra
