/-
  Phys.Algebra.LorentzContinuumPolarKAK — N66: THE POLAR / KAK ASSEMBLY `g = k·exp(p)` OF A
  CONCRETE ISOMETRY over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)` —
  exhibiting, for the composite of a banked hyperbolic boost operator and the octonion-block
  reflection, the form-adjoint composite `g*∘g` as a banked positive operator, the positive part
  `exp(p) = √(g*g)` delivered by the banked operator square root, and BOTH factors NONTRIVIAL.
  The first concrete polar-decomposition WITNESS in the chain — the structural lever toward the
  global reverse KAK surjectivity.
  ===========================================================================
  THE NEXT FORCED NODE after the full arbitrary-unequal-diagonal EvC-orthonormal eigenbasis-
  existence node (N65). N49–N65 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the boost isometry `boostFunC`/`boostC_isom`, the isometry
      monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite reference form `EvC` (N58);
    • ★ the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + `comp_nonneg` (N59);
    • ★ the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the 2-BLOCK diagonal root `blockDiag`/`blockDiag_comp`/`blockDiag_isEvCSymm`/`blockDiag_scalar` (N61);
    • the octonion-internal coordinate-diagonal root (N62);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rotated-basis spectral root `specOp`/`specOp_op_sqrt` (N63);
    • the GENERAL (whole-family) EvC-orthonormal eigenbasis `txOp`/`uP`/`uM`/`txOp_eq_specOp` (N64);
    • the FULL arbitrary-unequal-diagonal eigenbasis `txOp_eq_specOp_rot`/`txOp_op_sqrt_gen`/`rotA`/`rotB` (N65).

  ── THE TARGET (N66) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the polar/KAK assembly `g = k·exp(p)`, the
  compact part `k` via CONNECTEDNESS, the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the
  connected component `≤ genIsomMonoidC2`), and the full `Spin(9)→SO(9)` exhaustion. The full
  polar assembly for an ARBITRARY `g ∈ qvIsomMonoidC` needs the operator square root of an
  arbitrary `g*g` (the full n-dim spectral existence — no Mathlib analogue over `Cut`), and the
  compact-part / connectedness / surjectivity each need Lie-group machinery Mathlib lacks over
  `Cut`. MEASURE-FIRST (ROADMAP §N66 priority (i)) confirms: those are the genuine HEAVY sub-nodes
  (childed N67). The immediately-bankable, theory-native STRUCTURAL piece — escalating N59's
  `g*∘g`-is-positive to a complete CONCRETE polar decomposition with BOTH factors nontrivial — is
  the polar factorization of a concrete composite isometry, with the positive part delivered by
  the now-banked operator square root.

  ── THE TRUNK REFRAME (THE ONE LAW): the polar positive part IS the Born-positive boost factor ──
  The polar decomposition `g = k·exp(p)` splits an isometry into a compact part `k` (`k*k = id`)
  and a positive part `exp(p) = √(g*g)`. Across N56–N65 the trunk banked EXACTLY the positivity
  the positive part needs: the Born self-overlap positivity (N56), the operator form-adjoint with
  `g*∘g` self-adjoint + positive-semidefinite (N59), and the operator square root of a positive
  operator (N60–N65). Take the concrete `g := R∘B` where:
    • `B := boostC a b : (t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` is the boost operator — EvC-SELF-ADJOINT
      (`boostC_isEvCSymm`), and for `a ≥ |b|` EvC-POSITIVE-SEMIDEFINITE (`boostC_nonneg`, the trunk
      Born positivity as a sum of squares `(a+b)/2·(t+x)² + (a−b)/2·(t−x)² + gFormC v v ≥ 0`). It is
      its own square root structure: `B∘B = boostC (a²+b²)(2ab)` (`boostC_sq`), so `B` IS the
      banked positive operator square root of `B²` (`boostC_op_sqrt`).
    • `R := blockDiag 1 (−1)` is the octonion-block reflection — EvC-SELF-ADJOINT (N61
      `blockDiag_isEvCSymm`) and an EvC-ORTHOGONAL INVOLUTION `R∘R = id` (`R_orthogonal`, via N61
      `blockDiag_comp`/`blockDiag_scalar`), the compact factor `k` with `k*∘k = id`.
  Then `g = R∘B` has form-adjoint `g* = B∘R` (`polG_adjoint`, both factors self-adjoint), the
  positive operator `g*∘g = B∘B = boostC (a²+b²)(2ab)` (`polG_starComp`, since `R∘R = id`), and the
  positive part `exp(p) = √(g*g) = B` is the banked operator square root (`polG_pos_part`). The
  polar decomposition DISSOLVES into the banked operator adjoint + the banked operator square root
  over the ordered continuum — NO Mathlib polar decomposition, NO spectral theory, NO analysis.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    boostC a b          — THE BOOST OPERATOR `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` (the N49 `boostFunC`
                          as a `Module.End`), octonion block fixed.
    boostC_apply        — its action.
    boostC_isEvCSymm    — ★ the boost is EvC-SELF-ADJOINT (`B* = B`), the noncompact factor.
    boostC_comp         — boosts compose: `boostC a b ∘ boostC a' b' = boostC (aa'+bb')(ab'+a'b)`.
    boostC_sq           — `boostC a b ∘ boostC a b = boostC (a²+b²)(2ab)`.
    boostC_nonneg       — ★ for `a+b ≥ 0 ∧ a−b ≥ 0`, the boost is EvC-POSITIVE-SEMIDEFINITE — the
                          trunk Born positivity as a sum of squares.
    boostC_op_sqrt      — ★★ `boostC a b` is THE positive operator square root of `boostC (a²+b²)(2ab)`.
    boostC_uP / boostC_uP_read — `uP` (N64) is an eigenvector of `boostC a b` (eigenvalue `a+b`),
                          giving the eigenblock reading `EvC (boostC a b uP) uP = a+b`.
    boostC_isQvIsomC    — ★ for `a²−b²=1`, `boostC a b` preserves the Minkowski form `QvC` — the
                          boost operator IS a banked continuum isometry (`boostC_isom`, lifted).
    R_orthogonal        — ★ the compact factor `R := blockDiag 1 (−1)` is an EvC-orthogonal
                          INVOLUTION: `R∘R = id` (`k*∘k = id`).
    polG_adjoint        — ★ the form-adjoint of the polar composite `g = R∘B` is `g* = B∘R`.
    polG_starComp       — ★★ `g*∘g = B∘B = boostC (a²+b²)(2ab)` — the polar positive operator.
    polG_pos_part       — ★★ THE POLAR POSITIVE PART: `exp(p) = √(g*g) = boostC a b` is the banked
                          positive operator square root of `g*∘g` — the heart of the assembly
                          (`g = k·exp(p)` with `k = R` compact and `exp(p) = boostC a b`, both nontrivial).
    boostC_witness_isom — ★ NON-VACUITY: the concrete `boostC (5/3)(4/3)` (`a²−b² = 1`) is a banked
                          continuum isometry — a genuine boost, off-diagonal `4/3 ≠ 0`.
    R_ne_id             — ★ NON-VACUITY (W8 teeth): the compact factor `R ≠ id` (it reflects the
                          octonion block) — the compact part is genuinely nontrivial.
    boostC_ne_id        — ★ NON-VACUITY (W8 teeth): the positive part `boostC (5/3)(4/3) ≠ id` — a
                          genuine time–space mix; BOTH polar factors are nontrivial.
    polG_starComp_witness — ★ the concrete polar positive operator `g*∘g = boostC (41/9)(40/9)` with
                          uP-eigenblock reading `9` (the costume target).

  ── THE W1 HEAVY REMAINDER (childed N67, an honest dissolution ticket, NOT closed here) ──
  The GLOBAL polar/KAK assembly — that EVERY `g ∈ qvIsomMonoidC` factors as `k·exp(p)` (the
  operator square root of an ARBITRARY `g*g`, the full n-dim spectral existence) — + the compact
  part `k` via CONNECTEDNESS of the isometry group over `Cut` + the GLOBAL reverse KAK surjectivity
  (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)`
  exhaustion (every spacelike rotation a finite product of `biMulFun`) are the genuine HEAVY
  group-manifold core, with no Mathlib analogue over `Cut`, childed onto the chain tail. THIS node
  banks the FIRST concrete polar-decomposition witness `g = k·exp(p)` with both factors nontrivial
  and the positive part delivered by the banked operator square root — the structural lever the
  global assembly consumes.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a connected Lie-group element factors as
  a compact part times the exponential of a positive self-adjoint generator, the positive part
  being `√(g*g)`, is standard (Helgason, Knapp, the KAK/Cartan literature). Here the boost
  operator, its self-adjointness, its positive-semidefiniteness, its being its own square root
  structure, the compact involution `R`, the form-adjoint of the composite, and the polar positive
  part DESCEND from the banked operator form-adjoint `IsEvCAdjoint` (N59) + the operator square
  root predicate `IsEvCOpSqrt` (N60) + the 2-block diagonal operator `blockDiag` (N61) + the Born
  positivity `gFormC_nonneg` (N56) + the reference form `EvC` (N58) over the DERIVED ℝ `Cut` — NO
  posited Lie group, NO posited polar decomposition, NO Mathlib spectral theory, NO posited inner
  product, NO Mathlib ℝ/ℂ as content. The W1 reframe (the polar positive part IS the Born-positive
  boost factor, its existence the banked operator square root) is exactly what assembles a concrete
  polar decomposition over the continuum without any Lie-group machinery.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / reflection /
  polar / KAK / Cartan / compact / noncompact / positive-semidefinite / self-adjoint / adjoint /
  square-root / spectral / isometry / Spin / SO(9) / SO⁺(1,9) / connectedness / surjectivity":
  what remains is the theorem that, over the derived complete ordered field `Cut` and the
  Cayley–Dickson double³ `O Cut`, for the symmetric positive-definite bilinear form `EvC` and the
  `Cut`-linear maps `boostC a b := (t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` and `R := blockDiag 1 (−1)`:
  `boostC a b` is EvC-symmetric, composes as `boostC a b ∘ boostC a' b' = boostC (aa'+bb')(ab'+a'b)`,
  is EvC-nonneg for `a+b ≥ 0 ∧ a−b ≥ 0`, and is the EvC-positive operator square root of
  `boostC (a²+b²)(2ab)`; `R∘R = id`; the composite `R∘boostC a b` has EvC-adjoint `boostC a b ∘ R`,
  its self-composite equals `boostC (a²+b²)(2ab)`, and `boostC a b` is its EvC-positive operator
  square root; for `a²−b²=1`, `boostC a b` preserves `t²−x²−gFormC v v`; concretely `boostC (5/3)(4/3)`
  preserves the form, `R ≠ id`, `boostC (5/3)(4/3) ≠ id`, and `(R∘boostC (5/3)(4/3))*∘(R∘boostC (5/3)(4/3))`
  reads `9` at `uP`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited polar decomposition / spectral theory, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumEigenBasisGen

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The boost operator (the N49 `boostFunC` as a `Module.End`) — the noncompact factor. -/

/-- THE BOOST OPERATOR `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` as a `Cut`-linear self-map: the N49
    hyperbolic boost `boostFunC` lifted to a `Module.End`, leaving the octonion block `v` fixed.
    For `a ≥ |b|` it is the positive-definite factor (the "boost part") of a polar decomposition. -/
def boostC (a b : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (t + t') + b * (x + x') = (a * t + b * x) + (a * t' + b * x'); ring
    · show b * (t + t') + a * (x + x') = (b * t + a * x) + (b * t' + a * x'); ring
    · show v + v' = v + v'; rfl
  map_smul' c p := by
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (c • t) + b * (c • x) = c • (a * t + b * x); simp only [smul_eq_mul]; ring
    · show b * (c • t) + a * (c • x) = c • (b * t + a * x); simp only [smul_eq_mul]; ring
    · show c • v = c • v; rfl

/-- The boost operator acts as `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)`. -/
theorem boostC_apply (a b : Cut) (p : STVC) :
    boostC a b p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2) := rfl

/-- ★ The boost operator is EvC-SELF-ADJOINT (`B* = B`): the symmetric off-diagonal `b` makes the
    `(t,x)` block symmetric, the octonion block is the identity, so symmetric by the bilinearity of
    `EvC`. The noncompact/self-adjoint factor of the Cartan/polar split. -/
theorem boostC_isEvCSymm (a b : Cut) : IsEvCSymm (boostC a b) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (a * t + b * x) * t' + (b * t + a * x) * x' + gFormC v v'
     = t * (a * t' + b * x') + x * (b * t' + a * x') + gFormC v v'
  ring

/-- Boosts compose: `boostC a b ∘ boostC a' b' = boostC (a·a'+b·b') (a·b'+a'·b)` — the hyperbolic
    addition law as operator composition. -/
theorem boostC_comp (a b a' b' : Cut) :
    (boostC a b).comp (boostC a' b') = boostC (a*a' + b*b') (a*b' + a'*b) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [LinearMap.comp_apply, boostC_apply, boostC_apply, boostC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * (a' * t + b' * x) + b * (b' * t + a' * x) = (a*a' + b*b') * t + (a*b' + a'*b) * x; ring
  · show b * (a' * t + b' * x) + a * (b' * t + a' * x) = (a*b' + a'*b) * t + (a*a' + b*b') * x; ring
  · rfl

/-- The square of a boost: `boostC a b ∘ boostC a b = boostC (a²+b²) (2ab)`. -/
theorem boostC_sq (a b : Cut) :
    (boostC a b).comp (boostC a b) = boostC (a^2 + b^2) (2*a*b) := by
  rw [boostC_comp]; congr 1 <;> ring

/-- ★ The boost is EvC-POSITIVE-SEMIDEFINITE for `a+b ≥ 0 ∧ a−b ≥ 0` (i.e. `a ≥ |b|`): the diagonal
    value `a·t² + 2b·tx + a·x² + gFormC v v` is the sum of squares
    `(a+b)/2·(t+x)² + (a−b)/2·(t−x)² + gFormC v v ≥ 0` — the trunk Born positivity (N56
    `gFormC_nonneg`) plus the nonneg-scaled `(t,x)`-block squares. The positivity the polar boost
    part rests on, as ordered-field arithmetic over the derived ℝ. -/
theorem boostC_nonneg {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) (p : STVC) :
    0 ≤ EvC (boostC a b p) p := by
  obtain ⟨t, x, v⟩ := p
  show 0 ≤ (a * t + b * x) * t + (b * t + a * x) * x + gFormC v v
  have hg := gFormC_nonneg v
  nlinarith [mul_nonneg hab (sq_nonneg (t + x)), mul_nonneg hab' (sq_nonneg (t - x)), hg]

/-- ★★ THE BOOST IS ITS OWN SQUARE-ROOT STRUCTURE: for `a+b ≥ 0 ∧ a−b ≥ 0`, `boostC a b` is THE
    positive operator square root of `boostC (a²+b²)(2ab)`. It is EvC-self-adjoint
    (`boostC_isEvCSymm`), EvC-positive-semidefinite (`boostC_nonneg`), and squares to the target
    (`boostC_sq`). The banked operator square root (N60 `IsEvCOpSqrt`) realized on the boost
    family — the polar positive part delivered without any spectral theory. -/
theorem boostC_op_sqrt {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) :
    IsEvCOpSqrt (boostC a b) (boostC (a^2 + b^2) (2*a*b)) :=
  ⟨boostC_isEvCSymm a b, boostC_nonneg hab hab', boostC_sq a b⟩

/-! ## The boost eigenblock reading (via the N64 fixed 45° eigenbasis `uP`). -/

/-- `uP` (the N64 fixed 45° eigenbasis vector `(s,s,0)`) is an eigenvector of `boostC a b` with
    eigenvalue `a+b`: `boostC a b uP = (a+b)·uP`. -/
theorem boostC_uP (a b : Cut) : boostC a b uP = (a + b) • uP := by
  rw [boostC_apply]
  show (a * s2 + b * s2, b * s2 + a * s2, (0:O Cut)) = (a + b) • uP
  simp only [uP, Prod.smul_mk, smul_eq_mul, smul_zero]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * s2 + b * s2 = (a + b) * s2; ring
  · show b * s2 + a * s2 = (a + b) * s2; ring
  · rfl

/-- The `uP`-eigenblock reading of `boostC a b`: `EvC (boostC a b uP) uP = a+b` (via the
    eigenvalue `a+b` and the EvC-unit `uP`, N64 `uP_norm`). -/
theorem boostC_uP_read (a b : Cut) : EvC (boostC a b uP) uP = a + b := by
  rw [boostC_uP, EvC_smul_left, uP_norm, mul_one]

/-! ## The boost operator IS a banked continuum isometry (connecting to `qvIsomMonoidC`). -/

/-- ★ For `a²−b²=1`, the boost operator `boostC a b` preserves the continuum Minkowski form `QvC`
    — i.e. it IS a banked continuum isometry (the N49 `boostC_isom` for the operator form). The
    polar composite's noncompact factor is a genuine form-isometry. -/
theorem boostC_isQvIsomC {a b : Cut} (h : a^2 - b^2 = 1) : IsQvIsomC (boostC a b) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  show QvC (boostC a b (t, x, v)) = QvC (t, x, v)
  rw [boostC_apply]
  show QformC (a * t + b * x) (b * t + a * x) v = QformC t x v
  unfold QformC
  linear_combination (t^2 - x^2) * h

/-! ## The compact factor: the octonion-block reflection `R = blockDiag 1 (−1)`. -/

/-- ★ THE COMPACT FACTOR is an EvC-ORTHOGONAL INVOLUTION: `R := blockDiag 1 (−1)` satisfies
    `R∘R = id` (`k*∘k = id`, since `R` is EvC-self-adjoint, N61 `blockDiag_isEvCSymm`). The
    octonion-block reflection — `(t,x,v) ↦ (t,x,−v)` — fixing the `(t,x)` plane and negating the
    nine space directions. The compact part `k` of the polar decomposition. -/
theorem R_orthogonal : (blockDiag (1:Cut) (-1)).comp (blockDiag (1:Cut) (-1))
    = (LinearMap.id : Module.End Cut STVC) := by
  rw [blockDiag_comp]
  rw [show (1:Cut)*1 = 1 from by norm_num, show (-1:Cut)*(-1) = 1 from by norm_num]
  rw [blockDiag_scalar, one_smul]

/-! ## THE POLAR / KAK ASSEMBLY `g = k·exp(p)` of the concrete composite isometry `g = R∘B`. -/

/-- ★ THE FORM-ADJOINT of the polar composite `g = R∘B` is `g* = B∘R` — both factors are
    EvC-self-adjoint (`blockDiag_isEvCSymm` for `R`, `boostC_isEvCSymm` for `B`), so the adjoint of
    a composite is the reversed composite of adjoints. -/
theorem polG_adjoint (a b : Cut) :
    IsEvCAdjoint ((blockDiag (1:Cut) (-1)).comp (boostC a b))
      ((boostC a b).comp (blockDiag (1:Cut) (-1))) := by
  intro p q
  rw [LinearMap.comp_apply, LinearMap.comp_apply]
  rw [(blockDiag_isEvCSymm 1 (-1)) (boostC a b p) q]
  rw [(boostC_isEvCSymm a b) p (blockDiag (1:Cut) (-1) q)]

/-- ★★ THE POLAR POSITIVE OPERATOR `g*∘g = B∘R∘R∘B = B∘B = boostC (a²+b²)(2ab)` — the compact
    involution `R∘R = id` (`R_orthogonal`) collapses, leaving `B²` (`boostC_sq`). The
    self-adjoint positive-semidefinite operator whose square root is the polar boost part. -/
theorem polG_starComp (a b : Cut) :
    ((boostC a b).comp (blockDiag (1:Cut) (-1))).comp
      ((blockDiag (1:Cut) (-1)).comp (boostC a b))
    = boostC (a^2 + b^2) (2*a*b) := by
  have hR : (blockDiag (1:Cut) (-1)).comp (blockDiag (1:Cut) (-1))
      = (LinearMap.id : Module.End Cut STVC) := R_orthogonal
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, LinearMap.comp_apply, LinearMap.comp_apply,
      ← LinearMap.comp_apply (blockDiag (1:Cut) (-1)), hR, LinearMap.id_apply,
      ← LinearMap.comp_apply, boostC_sq]

/-- ★★ THE POLAR POSITIVE PART: `exp(p) = √(g*g) = boostC a b` is the banked positive operator
    square root of `g*∘g` (for `a+b ≥ 0 ∧ a−b ≥ 0`). The heart of the polar assembly: the positive
    factor of `g = R∘B` is exactly the boost `B`, recovered as `√(g*g)` through the banked operator
    square root (`boostC_op_sqrt` through `polG_starComp`) — NO spectral theory. -/
theorem polG_pos_part {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) :
    IsEvCOpSqrt (boostC a b)
      (((boostC a b).comp (blockDiag (1:Cut) (-1))).comp
        ((blockDiag (1:Cut) (-1)).comp (boostC a b))) := by
  rw [polG_starComp]
  exact boostC_op_sqrt hab hab'

/-! ## Non-vacuity (W8) — BOTH polar factors genuinely nontrivial, a concrete isometry. -/

/-- ★ NON-VACUITY: the concrete boost `boostC (5/3)(4/3)` has `a²−b² = 25/9 − 16/9 = 1`, so it IS a
    banked continuum isometry (a genuine hyperbolic boost, off-diagonal `4/3 ≠ 0`). -/
theorem boostC_witness_isom : IsQvIsomC (boostC ((5:Cut)/3) (4/3)) := by
  apply boostC_isQvIsomC
  norm_num

/-- ★ NON-VACUITY (W8 teeth): the compact factor `R = blockDiag 1 (−1) ≠ id` — it reflects the
    octonion block (sends `(0,0,1) ↦ (0,0,−1)`), so the compact part of the polar decomposition is
    genuinely nontrivial. -/
theorem R_ne_id : (blockDiag (1:Cut) (-1)) ≠ (LinearMap.id : Module.End Cut STVC) := by
  intro h
  have hb : gFormC ((blockDiag (1:Cut) (-1)) ((0:Cut),(0:Cut),(1:O Cut))).2.2 (1:O Cut)
      = gFormC ((LinearMap.id : Module.End Cut STVC) ((0:Cut),(0:Cut),(1:O Cut))).2.2 (1:O Cut) := by
    rw [h]
  rw [blockDiag_b_read] at hb
  simp only [LinearMap.id_apply] at hb
  rw [gFormC_one] at hb
  norm_num at hb

/-- ★ NON-VACUITY (W8 teeth): the positive part `boostC (5/3)(4/3) ≠ id` — it sends the pure-time
    vector `(1,0,0)` to `(5/3, 4/3, 0)`, a genuine time–space mix (space component `4/3 ≠ 0`). So
    BOTH factors of the polar decomposition `g = R·boostC (5/3)(4/3)` are nontrivial. -/
theorem boostC_ne_id : (boostC ((5:Cut)/3) (4/3)) ≠ (LinearMap.id : Module.End Cut STVC) := by
  intro h
  have hb : ((boostC ((5:Cut)/3) (4/3)) ((1:Cut),(0:Cut),(0:O Cut))).2.1
      = ((LinearMap.id : Module.End Cut STVC) ((1:Cut),(0:Cut),(0:O Cut))).2.1 := by
    rw [h]
  rw [boostC_apply] at hb
  simp only [LinearMap.id_apply] at hb
  -- hb : 4/3 * 1 + 5/3 * 0 = 0
  norm_num at hb

/-- ★ The concrete polar positive operator `g*∘g = boostC (41/9)(40/9)` (for the witness boost
    `a=5/3, b=4/3`: `a²+b² = 41/9`, `2ab = 40/9`), with `uP`-eigenblock reading
    `a+b = 5/3+4/3 = 3`, so the reading is `(5/3)+(4/3) = 3` and its square (the `g*g` reading) is
    `9`. The costume target. -/
theorem polG_starComp_witness :
    EvC ((boostC ((41:Cut)/9) (40/9)) uP) uP = 9 := by
  rw [boostC_uP_read]; norm_num

end

end Phys.Algebra
