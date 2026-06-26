/-
  Phys.Algebra.LorentzContinuumOpSqrtCoord — N62: THE OCTONION-INTERNAL (3-EIGENVALUE)
  COORDINATE-DIAGONAL OPERATOR SQUARE ROOT over the DERIVED ℝ `Cut` — the first diagonalization
  WITHIN the octonion block `O Cut = CD (H Cut)`, extending the N61 2-block (which kept the whole
  8-dim octonion `v` as ONE eigenblock) toward the FULL SPECTRUM by splitting the octonion into its
  Cayley–Dickson re-half and im-half eigenspaces.
  ===========================================================================
  THE NEXT FORCED NODE after the 2-block (non-scalar) operator-square-root node (N61). N49–N61
  banked, over the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v`, the isometry monoid `qvIsomMonoidC`
      (N49), the Born composition law `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` + the
      infinitesimal boost `boostGenC` and rotation `rotGenC a` generators + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N52–N55), with the TWO-SIDED
      Moufang/`Spin(9)` generator `biMulFun u u'` (N55);
    • the BORN POSITIVITY foundation `gFormC_nonneg`/`gFormC_eq_zero_iff` + the (1,9) signature
      split (N56); the polarized coordinate sum-of-squares `gFormC_sumOfSquares`;
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` over `Cut` with `cutSqrt_sq`/
      `cutSqrt_nonneg`/`cutSqrt_unique`/`cutSqrt_pos` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite Euclidean reference form
      `EvC`, `EvC_nonneg`/`EvC_eq_zero_iff`, the compact/noncompact split (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + EvC-positive-
      semidefinite (`comp_nonneg`) (N59);
    • THE POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt s g := IsEvCSymm s ∧
      (∀ p, 0 ≤ EvC (s p) p) ∧ s∘s = g`, with the STRUCTURED/SCALAR root `scalar_op_sqrt`
      ((cutSqrt c)·id is a positive operator square root of c·id) and the N59 consumption
      `comp_scalar_op_sqrt` (N60);
    • ★ the 2-BLOCK (NON-SCALAR) operator square root `blockDiag_op_sqrt`: `blockDiag a b :
      (t,x,v) ↦ (a•t, a•x, b•v)`, the scalar `cutSqrt` applied eigenblock-by-eigenblock on the
      EvC-orthogonal `(t,x)` plane and the (whole) octonion block `v` (N61).

  ── THE TARGET (N62) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the FULL SPECTRAL operator square root over the 10-dim form space (a
  GENERAL non-block-diagonal `g*g`) → the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the
  connected component `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST
  (ROADMAP §N62 priority (i)) confirms the immediately-bankable, theory-native STRUCTURAL piece:
  N61 kept the WHOLE 8-dim octonion block `v` as a single eigenblock; the genuinely-NEW next step
  is to DIAGONALIZE WITHIN that octonion block — the first decomposition of `O Cut` itself into
  EvC-orthogonal eigenspaces. The FULL spectral theorem for an ARBITRARY (non-coordinate-diagonal)
  `g*g` — needing the change-of-basis / simultaneous diagonalization of an arbitrary
  EvC-self-adjoint operator over `Cut`, with no Mathlib spectral theory — remains the genuine
  HEAVY sub-node (childed N63), together with the polar/KAK assembly, connectedness, and the full
  `Spin(9)→SO(9)` exhaustion.

  ── THE TRUNK REFRAME (THE ONE LAW): the octonion-internal root IS `cutSqrt` per re/im half ──
  `O Cut = CD (H Cut)`, so an octonion `v = ⟨v.re, v.im⟩` has two `H Cut` halves. The Born
  self-overlap polarizes to the SUM of the re-half dot product and the im-half dot product
  (`gFormC_coordExpand`: the 8-coordinate dot product, the polarization of N56's
  `gFormC_sumOfSquares`), with NO cross terms — so the re-half and im-half are EvC-ORTHOGONAL. The
  octonion-internal 2-block `octBlock b₁ b₂ : v ↦ ⟨b₁•v.re, b₂•v.im⟩` (scale the re-half by `b₁`,
  the im-half by `b₂`) is therefore self-adjoint and diagonal in this banked Cayley–Dickson
  splitting, and its positive operator square root is the SCALAR `cutSqrt` applied half-by-half.
  Lifting to the 10-dim form space gives `coordDiag3 a b₁ b₂ : (t,x,v) ↦ (a•t, a•x, octBlock b₁ b₂ v)`
  — a GENUINELY THREE-distinct-eigenvalue diagonal operator (vs N61's two: the `(t,x)` plane, the
  octonion re-half, the octonion im-half). Three trunk facts make `coordDiag3 (cutSqrt c)(cutSqrt a₁)
  (cutSqrt a₂)` THE positive square root of `coordDiag3 c a₁ a₂` with NO spectral theory:
  EvC-self-adjoint (`coordDiag3_isEvCSymm`, via `octBlock_gForm_symm` — the re/im EvC-orthogonality),
  EvC-positive-semidefinite for nonneg eigenvalues (`coordDiag3_nonneg`, via `octBlock_gForm_nonneg`
  — the re/im split of the trunk Born positivity into two nonneg-scaled sums of squares), and
  squaring back (`coordDiag3_comp` + N57 `cutSqrt_sq`). The spectral root WITHIN the octonion
  dissolves into the scalar `cutSqrt` applied to each eigenvalue on its EvC-orthogonal eigenblock.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    gFormC_coordExpand  — the polarized 8-coordinate dot-product expansion of the Born form `gFormC v w`
                          (the polarization of N56 `gFormC_sumOfSquares`).
    octBlock a b        — THE OCTONION-INTERNAL 2-BLOCK `v ↦ ⟨a•v.re, b•v.im⟩` (scale the
                          Cayley–Dickson re-half by `a`, the im-half by `b`).
    octBlock_re/_im     — its action on each half.
    octBlock_scalar     — the SCALAR COLLAPSE within the octonion: `octBlock c c = c • ·`.
    octBlock_one/_e2    — readers: `octBlock a b 1 = a•1`, `octBlock a b e2 = b•e2` (the re-half
                          unit `1` and the im-half unit `e2`).
    octBlock_gForm_symm — ★ THE CRUX: `gFormC (octBlock a b v) w = gFormC v (octBlock a b w)` — the
                          re-half and im-half are EvC-ORTHOGONAL, so independent scaling is
                          form-symmetric. Diagonalizing WITHIN the octonion preserves self-adjointness.
    octBlock_comp       — `octBlock a b (octBlock a' b' v) = octBlock (a·a')(b·b') v`.
    octBlock_gForm_nonneg — for `a,b ≥ 0`, `0 ≤ gFormC (octBlock a b v) v` — the re/im split of the
                          trunk Born positivity into two nonneg-scaled sums of squares.
    coordDiag3 a b₁ b₂  — THE 3-EIGENVALUE COORDINATE-DIAGONAL operator `(t,x,v) ↦
                          (a•t, a•x, octBlock b₁ b₂ v)` on the 10-dim form space.
    coordDiag3_apply    — its action.
    coordDiag3_scalar   — `coordDiag3 c c c = c·id` (so it genuinely EXTENDS N60's scalar AND
                          N61's 2-block — equal eigenvalues collapse to the homothety).
    coordDiag3_isEvCSymm — EvC-self-adjoint (diagonal in the `(t,x)`/re-half/im-half splitting).
    coordDiag3_comp     — composes coordinatewise: `coordDiag3 a b₁ b₂ ∘ coordDiag3 a' b₁' b₂' =
                          coordDiag3 (a·a')(b₁·b₁')(b₂·b₂')`.
    coordDiag3_nonneg   — for `a,b₁,b₂ ≥ 0`, EvC-positive-semidefinite (the trunk positivity
                          coordinatewise).
    coordDiag3_a_read / _b1_read / _b2_read — the THREE eigenblock readers (the `(t,x)` block at
                          `(1,0,0)`, the re-half via `gFormC (·) 1` at `(0,0,1)`, the im-half via
                          `gFormC (·) e2` at `(0,0,e2)`).
    coordDiag3_inj      — a coordinate-diagonal operator is determined by its three eigenvalues.
    coordDiag3_op_sqrt  — ★★ THE HEART: for `c,a₁,a₂ ≥ 0`, `coordDiag3 (cutSqrt c)(cutSqrt a₁)
                          (cutSqrt a₂)` is a positive operator square root of `coordDiag3 c a₁ a₂` —
                          the first diagonalization WITHIN the octonion, the scalar `cutSqrt` applied
                          per re/im eigenspace, NO Mathlib spectral theory.
    coordDiag3_op_sqrt_unique — a NONNEGATIVE coordinate-diagonal root is `coordDiag3 (cutSqrt c)
                          (cutSqrt a₁)(cutSqrt a₂)` (coordinatewise `cutSqrt_unique`).
    coordDiag3_op_sqrt_witness — ★ NON-VACUITY (W8): `coordDiag3 1 2 3` (three DISTINCT eigenvalues)
                          is the positive operator square root of `coordDiag3 1 4 9` — a genuinely
                          octonion-internal-diagonal root, beyond N61's 2-block.
    not_coordDiag3_op_sqrt_1_2_3 — ★ NON-VACUITY (W8 teeth): `coordDiag3 1 2 3` is NOT a root of
                          `coordDiag3 1 4 11` (it would force `9 = 11` at the im-half eigenblock).

  ── THE W1 HEAVY REMAINDER (childed N63, an honest dissolution ticket, NOT closed here) ──
  The FULL spectral square root — a GENERAL EvC-self-adjoint EvC-positive-semidefinite operator
  over the 10-dim form space written as `s∘s = g` with `s` positive, where `g` is NOT diagonal in
  the fixed coordinate basis — needs the change-of-basis / simultaneous diagonalization of an
  arbitrary self-adjoint operator over `Cut`, which has no Mathlib analogue. With it: the polar/KAK
  assembly `g = k·exp(p)` extracting `exp(p) = √(g*g)` and the compact `k = g·exp(p)⁻¹`; the compact
  part `k` via CONNECTEDNESS of the isometry group over `Cut`; and the full `Spin(9)→SO(9)`
  exhaustion (every spacelike rotation a finite product of `biMulFun`). Those are the genuine HEAVY
  group-manifold core, childed onto the chain tail as an honest W1 dissolution ticket. THIS node
  banks the FIRST diagonalization WITHIN the octonion block — the full DIAGONAL case of the spectral
  square root in the standard coordinate basis.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive-semidefinite self-adjoint
  operator has a unique positive square root, computed eigenvalue-by-eigenvalue on its eigenspaces,
  is standard spectral theory (the spectral theorem / continuous functional calculus). Here the
  octonion-internal diagonal root, its self-adjointness, its positive-semidefiniteness, and its
  squaring-back DESCEND from the banked scalar `cutSqrt` (N57, the order-completeness of the derived
  ℝ `Cut`) + the Born self-overlap positivity (N56) + the Cayley–Dickson re/im structure of the
  terminal algebra `O Cut = CD (H Cut)` over the DERIVED ℝ `Cut` — NO posited operator calculus, NO
  Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content. The W1 reframe (the
  octonion-internal diagonal root IS the scalar `cutSqrt` applied per re/im half, the halves
  EvC-orthogonal by the polarized Born self-overlap) is exactly what re-grounds the first
  within-the-octonion diagonalization of the spectral root over the continuum without any spectral
  analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / diagonal / block / Cartan / polar / KAK / square-root / self-adjoint /
  positive-semidefinite / isometry / Spin / SO(9)": what remains is the theorem that, over the
  derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut = CD (H Cut)`, for the
  symmetric positive-definite bilinear form `EvC` and the `Cut`-linear self-map `coordDiag3 a b₁ b₂
  := (t,x,v) ↦ (a•t, a•x, ⟨b₁•v.re, b₂•v.im⟩)`: it is EvC-symmetric; `coordDiag3 c c c = c·id`;
  `coordDiag3 a b₁ b₂ ∘ coordDiag3 a' b₁' b₂' = coordDiag3 (a·a')(b₁·b₁')(b₂·b₂')`; for `a,b₁,b₂ ≥ 0`
  it satisfies `0 ≤ EvC (coordDiag3 a b₁ b₂ p) p`; and so for every `c,a₁,a₂ ≥ 0`,
  `coordDiag3 (cutSqrt c)(cutSqrt a₁)(cutSqrt a₂)` is EvC-symmetric, EvC-positive-semidefinite, and
  squares to `coordDiag3 c a₁ a₂`; that it is the unique nonnegative coordinate-diagonal with that
  square; that `coordDiag3 1 2 3` squares to `coordDiag3 1 4 9`; and that `coordDiag3 1 2 3` does NOT
  square to `coordDiag3 1 4 11`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumOpSqrtBlock
import Phys.Algebra.LorentzContinuumRotationSubgroup

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The polarized coordinate expansion of the Born self-overlap form. -/

/-- The polarized 8-coordinate dot-product expansion of the continuum Born self-overlap `gFormC v w`
    (the polarization of N56 `gFormC_sumOfSquares`, where `v = w`). Through the banked generic
    Cayley–Dickson product (`CD.mul_re`/`Dbl.mul_re`) and conjugation, `reQC (v · star w)` collapses
    to the standard dot product of the eight nested `re`/`im` coordinates — no posited inner product;
    pure structural unfolding + `ring`. -/
theorem gFormC_coordExpand (v w : O Cut) :
    gFormC v w =
      v.re.re.re * w.re.re.re + v.re.re.im * w.re.re.im
    + v.re.im.re * w.re.im.re + v.re.im.im * w.re.im.im
    + v.im.re.re * w.im.re.re + v.im.re.im * w.im.re.im
    + v.im.im.re * w.im.im.re + v.im.im.im * w.im.im.im := by
  show reQC (v * star w) = _
  simp only [reQC, CD.mul_re, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.neg_re, Dbl.neg_im]
  ring

/-! ## The octonion-internal 2-block — scale the Cayley–Dickson re-half and im-half independently. -/

/-- THE OCTONION-INTERNAL 2-BLOCK `v ↦ ⟨a•v.re, b•v.im⟩`: scale the Cayley–Dickson re-half of
    `O Cut = CD (H Cut)` (a copy of `H Cut`) by `a`, the im-half by `b`. The FIRST diagonalization
    WITHIN the octonion block — N61 kept the whole octonion as ONE eigenblock. -/
def octBlock (a b : Cut) : O Cut → O Cut := fun v => ⟨a • v.re, b • v.im⟩

@[simp] theorem octBlock_re (a b : Cut) (v : O Cut) : (octBlock a b v).re = a • v.re := rfl
@[simp] theorem octBlock_im (a b : Cut) (v : O Cut) : (octBlock a b v).im = b • v.im := rfl

/-- THE SCALAR COLLAPSE within the octonion: `octBlock c c = c • ·` (equal half-eigenvalues are the
    uniform scalar action — so `octBlock` genuinely EXTENDS the scalar octonion block). -/
theorem octBlock_scalar (c : Cut) (v : O Cut) : octBlock c c v = c • v := by
  apply CD.ext <;> rfl

/-- Re-half reader: `octBlock a b 1 = a • 1` (the unit `1 : O Cut` lies in the re-half). -/
theorem octBlock_one (a b : Cut) : octBlock a b (1 : O Cut) = a • (1 : O Cut) := by
  apply CD.ext
  · rw [octBlock_re, CD.genSmul_re]
  · rw [octBlock_im, CD.genSmul_im, CD.one_im, smul_zero, smul_zero]

/-- Im-half reader: `octBlock a b e2 = b • e2` (the imaginary unit `e2 = ⟨0,1⟩ : O Cut` lies in the
    im-half). -/
theorem octBlock_e2 (a b : Cut) : octBlock a b (CD.e2 : O Cut) = b • (CD.e2 : O Cut) := by
  apply CD.ext
  · rw [octBlock_re, CD.genSmul_re, CD.e2_re, smul_zero, smul_zero]
  · rw [octBlock_im, CD.genSmul_im]

/-- ★ THE CRUX — `octBlock` is `gFormC`-self-adjoint: `gFormC (octBlock a b v) w =
    gFormC v (octBlock a b w)`. The Cayley–Dickson re-half and im-half are EvC-ORTHOGONAL under the
    Born self-overlap (`gFormC_coordExpand` has NO cross terms between re-coords and im-coords), so
    scaling the two halves independently is symmetric in the form. Diagonalizing WITHIN the octonion
    preserves self-adjointness. -/
theorem octBlock_gForm_symm (a b : Cut) (v w : O Cut) :
    gFormC (octBlock a b v) w = gFormC v (octBlock a b w) := by
  rw [gFormC_coordExpand, gFormC_coordExpand]
  simp only [octBlock_re, octBlock_im, CD.genSmul_re, CD.genSmul_im, Dbl.smul_re, Dbl.smul_im]
  ring

/-- The octonion-internal 2-block composes halfwise: `octBlock a b (octBlock a' b' v) =
    octBlock (a·a')(b·b') v`. -/
theorem octBlock_comp (a b a' b' : Cut) (v : O Cut) :
    octBlock a b (octBlock a' b' v) = octBlock (a * a') (b * b') v := by
  apply CD.ext
  · show a • (a' • v.re) = (a * a') • v.re; rw [smul_smul]
  · show b • (b' • v.im) = (b * b') • v.im; rw [smul_smul]

/-- The octonion-internal 2-block is `gFormC`-positive-semidefinite for `a,b ≥ 0`:
    `0 ≤ gFormC (octBlock a b v) v` — the re/im split of the trunk Born self-overlap into two
    nonneg-scaled sums of (four) coordinate squares each. THE TRUNK POSITIVITY, now WITHIN the
    octonion. -/
theorem octBlock_gForm_nonneg {a b : Cut} (ha : 0 ≤ a) (hb : 0 ≤ b) (v : O Cut) :
    0 ≤ gFormC (octBlock a b v) v := by
  rw [gFormC_coordExpand]
  simp only [octBlock_re, octBlock_im, CD.genSmul_re, CD.genSmul_im, Dbl.smul_re, Dbl.smul_im]
  nlinarith [mul_nonneg ha (sq_nonneg v.re.re.re), mul_nonneg ha (sq_nonneg v.re.re.im),
    mul_nonneg ha (sq_nonneg v.re.im.re), mul_nonneg ha (sq_nonneg v.re.im.im),
    mul_nonneg hb (sq_nonneg v.im.re.re), mul_nonneg hb (sq_nonneg v.im.re.im),
    mul_nonneg hb (sq_nonneg v.im.im.re), mul_nonneg hb (sq_nonneg v.im.im.im)]

/-! ## The 3-eigenvalue coordinate-diagonal operator on the 10-dim form space. -/

/-- THE 3-EIGENVALUE COORDINATE-DIAGONAL operator `(t,x,v) ↦ (a•t, a•x, octBlock b₁ b₂ v)`: scalar
    `a` on the EvC-orthogonal `(t,x)` plane, `b₁` on the octonion re-half, `b₂` on the octonion
    im-half. Genuinely THREE distinct eigenblocks — the first to split the octonion internally,
    extending N61's two-block (which kept the whole octonion as ONE block) toward the full spectrum. -/
def coordDiag3 (a b₁ b₂ : Cut) : Module.End Cut STVC where
  toFun := fun p => (a • p.1, a • p.2.1, octBlock b₁ b₂ p.2.2)
  map_add' := by
    intro p q
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a • (t + t') = a • t + a • t'; rw [smul_add]
    · show a • (x + x') = a • x + a • x'; rw [smul_add]
    · show octBlock b₁ b₂ (v + v') = octBlock b₁ b₂ v + octBlock b₁ b₂ v'
      apply CD.ext
      · show b₁ • (v + v').re = b₁ • v.re + b₁ • v'.re
        rw [CD.add_re, smul_add]
      · show b₂ • (v + v').im = b₂ • v.im + b₂ • v'.im
        rw [CD.add_im, smul_add]
  map_smul' := by
    intro r p
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a • (r • t) = r • (a • t); rw [smul_comm]
    · show a • (r • x) = r • (a • x); rw [smul_comm]
    · show octBlock b₁ b₂ (r • v) = r • octBlock b₁ b₂ v
      apply CD.ext
      · show b₁ • (r • v).re = (r • octBlock b₁ b₂ v).re
        rw [CD.genSmul_re, CD.genSmul_re]
        show b₁ • (r • v.re) = r • (b₁ • v.re)
        rw [smul_comm]
      · show b₂ • (r • v).im = (r • octBlock b₁ b₂ v).im
        rw [CD.genSmul_im, CD.genSmul_im]
        show b₂ • (r • v.im) = r • (b₂ • v.im)
        rw [smul_comm]

/-- The 3-eigenvalue coordinate-diagonal operator acts as `(t,x,v) ↦ (a•t, a•x, octBlock b₁ b₂ v)`. -/
theorem coordDiag3_apply (a b₁ b₂ : Cut) (p : STVC) :
    coordDiag3 a b₁ b₂ p = (a • p.1, a • p.2.1, octBlock b₁ b₂ p.2.2) := rfl

/-- THE SCALAR COLLAPSE: `coordDiag3 c c c = c·id`. Equal eigenvalues collapse to the homothety, so
    `coordDiag3` genuinely EXTENDS both N60's scalar case and N61's 2-block case. -/
theorem coordDiag3_scalar (c : Cut) :
    coordDiag3 c c c = c • (LinearMap.id : Module.End Cut STVC) := by
  apply LinearMap.ext
  intro p
  rw [coordDiag3_apply, cutSmul_id_apply]
  obtain ⟨t, x, v⟩ := p
  show (c • t, c • x, octBlock c c v) = c • (t, x, v)
  rw [octBlock_scalar]
  rfl

/-! ## Self-adjointness, composition, positivity, eigenblock readers. -/

/-- `coordDiag3 a b₁ b₂` is EvC-SELF-ADJOINT: it is diagonal in the EvC-orthogonal `(t,x)` /
    octonion-re-half / octonion-im-half splitting (via `octBlock_gForm_symm`). -/
theorem coordDiag3_isEvCSymm (a b₁ b₂ : Cut) : IsEvCSymm (coordDiag3 a b₁ b₂) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (a • t) * t' + (a • x) * x' + gFormC (octBlock b₁ b₂ v) v'
     = t * (a • t') + x * (a • x') + gFormC v (octBlock b₁ b₂ v')
  rw [octBlock_gForm_symm]
  show a * t * t' + a * x * x' + gFormC v (octBlock b₁ b₂ v')
     = t * (a * t') + x * (a * x') + gFormC v (octBlock b₁ b₂ v')
  ring

/-- Coordinate-diagonal operators compose coordinatewise: `coordDiag3 a b₁ b₂ ∘ coordDiag3 a' b₁' b₂'
    = coordDiag3 (a·a')(b₁·b₁')(b₂·b₂')`. -/
theorem coordDiag3_comp (a b₁ b₂ a' b₁' b₂' : Cut) :
    (coordDiag3 a b₁ b₂).comp (coordDiag3 a' b₁' b₂')
      = coordDiag3 (a * a') (b₁ * b₁') (b₂ * b₂') := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, coordDiag3_apply, coordDiag3_apply, coordDiag3_apply]
  obtain ⟨t, x, v⟩ := p
  show (a • (a' • t), a • (a' • x), octBlock b₁ b₂ (octBlock b₁' b₂' v))
     = ((a * a') • t, (a * a') • x, octBlock (b₁ * b₁') (b₂ * b₂') v)
  rw [smul_smul, smul_smul, octBlock_comp]

/-- `coordDiag3 a b₁ b₂` is EvC-POSITIVE-SEMIDEFINITE for `a, b₁, b₂ ≥ 0`: the trunk positivity
    coordinatewise (`mul_nonneg` on the `(t,x)` squares + `octBlock_gForm_nonneg` on the octonion). -/
theorem coordDiag3_nonneg {a b₁ b₂ : Cut} (ha : 0 ≤ a) (h₁ : 0 ≤ b₁) (h₂ : 0 ≤ b₂) (p : STVC) :
    0 ≤ EvC (coordDiag3 a b₁ b₂ p) p := by
  obtain ⟨t, x, v⟩ := p
  rw [coordDiag3_apply]
  show 0 ≤ (a • t) * t + (a • x) * x + gFormC (octBlock b₁ b₂ v) v
  have hg := octBlock_gForm_nonneg h₁ h₂ v
  simp only [smul_eq_mul]
  nlinarith [mul_nonneg ha (sq_nonneg t), mul_nonneg ha (sq_nonneg x), hg]

/-- The `(t,x)`-eigenblock reader: at the unit time vector `(1,0,0)`, the first coordinate is `a`. -/
theorem coordDiag3_a_read (a b₁ b₂ : Cut) :
    (coordDiag3 a b₁ b₂ ((1:Cut),(0:Cut),(0:O Cut))).1 = a := by
  rw [coordDiag3_apply]; show a • (1:Cut) = a; rw [smul_eq_mul, mul_one]

/-- The octonion re-half eigenblock reader: at `(0,0,1)`, the self-overlap of the octonion component
    with `1` is `b₁` (via `octBlock_one` + `gFormC_one`). -/
theorem coordDiag3_b1_read (a b₁ b₂ : Cut) :
    gFormC (coordDiag3 a b₁ b₂ ((0:Cut),(0:Cut),(1:O Cut))).2.2 (1:O Cut) = b₁ := by
  rw [coordDiag3_apply]
  show gFormC (octBlock b₁ b₂ (1:O Cut)) (1:O Cut) = b₁
  rw [octBlock_one, gFormC_smul_left, gFormC_one, mul_one]

/-- The octonion im-half eigenblock reader: at `(0,0,e2)`, the self-overlap of the octonion
    component with `e2` is `b₂` (via `octBlock_e2` + `e2_gFormC_self`). -/
theorem coordDiag3_b2_read (a b₁ b₂ : Cut) :
    gFormC (coordDiag3 a b₁ b₂ ((0:Cut),(0:Cut),(CD.e2:O Cut))).2.2 (CD.e2:O Cut) = b₂ := by
  rw [coordDiag3_apply]
  show gFormC (octBlock b₁ b₂ (CD.e2:O Cut)) (CD.e2:O Cut) = b₂
  rw [octBlock_e2, gFormC_smul_left, e2_gFormC_self, mul_one]

/-- A coordinate-diagonal operator is determined by its three eigenvalues (read off each eigenblock:
    the `(t,x)` block, the octonion re-half via `1`, the octonion im-half via `e2`). -/
theorem coordDiag3_inj {a b₁ b₂ a' b₁' b₂' : Cut} (h : coordDiag3 a b₁ b₂ = coordDiag3 a' b₁' b₂') :
    a = a' ∧ b₁ = b₁' ∧ b₂ = b₂' := by
  refine ⟨?_, ?_, ?_⟩
  · have := congrArg (fun T => (T ((1:Cut),(0:Cut),(0:O Cut))).1) h
    simpa [coordDiag3_a_read] using this
  · have := congrArg (fun T => gFormC (T ((0:Cut),(0:Cut),(1:O Cut))).2.2 (1:O Cut)) h
    simpa [coordDiag3_b1_read] using this
  · have := congrArg (fun T => gFormC (T ((0:Cut),(0:Cut),(CD.e2:O Cut))).2.2 (CD.e2:O Cut)) h
    simpa [coordDiag3_b2_read] using this

/-! ## The octonion-internal (3-eigenvalue) coordinate-diagonal operator square root. -/

/-- ★★ THE HEART — THE OCTONION-INTERNAL (3-EIGENVALUE) COORDINATE-DIAGONAL OPERATOR SQUARE ROOT:
    for `c, a₁, a₂ ≥ 0`, `coordDiag3 (cutSqrt c)(cutSqrt a₁)(cutSqrt a₂)` is a positive operator
    square root of `coordDiag3 c a₁ a₂`. The first diagonalization WITHIN the octonion block, the
    scalar `cutSqrt` applied per `(t,x)` / re-half / im-half eigenspace: it is EvC-self-adjoint
    (`coordDiag3_isEvCSymm`), EvC-positive-semidefinite (`coordDiag3_nonneg`, since each `cutSqrt ≥
    0`), and squares back (`coordDiag3_comp` + `cutSqrt_sq`). NO Mathlib spectral theory; the
    spectral root within the octonion is `cutSqrt` per eigenvalue on its EvC-orthogonal eigenblock. -/
theorem coordDiag3_op_sqrt {c a₁ a₂ : Cut} (hc : 0 ≤ c) (h₁ : 0 ≤ a₁) (h₂ : 0 ≤ a₂) :
    IsEvCOpSqrt (coordDiag3 (cutSqrt c) (cutSqrt a₁) (cutSqrt a₂)) (coordDiag3 c a₁ a₂) := by
  refine ⟨coordDiag3_isEvCSymm _ _ _,
    coordDiag3_nonneg (cutSqrt_nonneg c) (cutSqrt_nonneg a₁) (cutSqrt_nonneg a₂), ?_⟩
  rw [coordDiag3_comp, cutSqrt_sq hc, cutSqrt_sq h₁, cutSqrt_sq h₂]

/-- Structured uniqueness for the coordinate-diagonal case: a NONNEGATIVE coordinate-diagonal
    operator square root of `coordDiag3 c a₁ a₂` is `coordDiag3 (cutSqrt c)(cutSqrt a₁)(cutSqrt a₂)`.
    From `coordDiag3 b b₁' b₂' ∘ (itself) = coordDiag3 c a₁ a₂` we get `b·b = c`, `b₁'·b₁' = a₁`,
    `b₂'·b₂' = a₂` (`coordDiag3_comp` + `coordDiag3_inj`), and `cutSqrt_unique` (N57) pins each.
    (The full spectral uniqueness over an arbitrary self-adjoint operator is childed N63.) -/
theorem coordDiag3_op_sqrt_unique {b b₁' b₂' c a₁ a₂ : Cut} (hb : 0 ≤ b) (hb₁ : 0 ≤ b₁')
    (hb₂ : 0 ≤ b₂') (hsqrt : IsEvCOpSqrt (coordDiag3 b b₁' b₂') (coordDiag3 c a₁ a₂)) :
    b = cutSqrt c ∧ b₁' = cutSqrt a₁ ∧ b₂' = cutSqrt a₂ := by
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [coordDiag3_comp] at hcomp
  obtain ⟨he, he₁, he₂⟩ := coordDiag3_inj hcomp
  exact ⟨cutSqrt_unique hb he, cutSqrt_unique hb₁ he₁, cutSqrt_unique hb₂ he₂⟩

/-! ## Non-vacuity (W8). -/

/-- ★ NON-VACUITY (W8): a genuinely octonion-internal-diagonal positive operator square root —
    `coordDiag3 1 2 3` (THREE distinct eigenvalues, splitting the octonion re-half `2` from the
    im-half `3`) is the positive operator square root of `coordDiag3 1 4 9`. Beyond N61's 2-block:
    the octonion is internally diagonalized. -/
theorem coordDiag3_op_sqrt_witness :
    IsEvCOpSqrt (coordDiag3 (1:Cut) (2:Cut) (3:Cut)) (coordDiag3 (1:Cut) (4:Cut) (9:Cut)) := by
  have h := coordDiag3_op_sqrt (c := (1:Cut)) (a₁ := (4:Cut)) (a₂ := (9:Cut))
    (by norm_num) (by norm_num) (by norm_num)
  rwa [show cutSqrt (1:Cut) = 1 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (4:Cut) = 2 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (9:Cut) = 3 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

/-- ★ NON-VACUITY (W8 teeth): `coordDiag3 1 2 3` is NOT an operator square root of
    `coordDiag3 1 4 11` — it squares to `coordDiag3 1 4 9`, so at the octonion im-half eigenblock it
    would force `9 = 11`. The coordinate-diagonal operator-square-root predicate has genuine content
    within the octonion: a WRONG im-half root fails, reducing to the false numeric `9 = 11`. -/
theorem not_coordDiag3_op_sqrt_1_2_3 :
    ¬ IsEvCOpSqrt (coordDiag3 (1:Cut) (2:Cut) (3:Cut)) (coordDiag3 (1:Cut) (4:Cut) (11:Cut)) := by
  intro hsqrt
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [coordDiag3_comp] at hcomp
  have : (3:Cut) * 3 = 11 := (coordDiag3_inj hcomp).2.2
  norm_num at this

end

end Phys.Algebra
