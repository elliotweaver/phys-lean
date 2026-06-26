/-
  Phys.Algebra.LorentzContinuumOpSqrtBlock — N61: THE 2-BLOCK (NON-SCALAR) OPERATOR SQUARE ROOT
  over the DERIVED ℝ `Cut` — extending the N60 structured/SCALAR operator square root toward the
  FULL SPECTRUM via the first genuinely NON-scalar case: a diagonal operator that is scalar `a`
  on the EvC-orthogonal `(t,x)` plane and scalar `b` on the octonion block `v`. Its positive
  operator square root is the blockwise scalar root `(cutSqrt a)` on `(t,x)`, `(cutSqrt b)` on `v`.
  ===========================================================================
  THE NEXT FORCED NODE after the structured/scalar operator-square-root node (N60). N49–N60
  banked, over the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v`, the isometry monoid `qvIsomMonoidC`
      (N49), the Born composition law `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` + the
      infinitesimal boost `boostGenC` and rotation `rotGenC a` generators + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N52–N55), with the TWO-SIDED
      Moufang/`Spin(9)` generator `biMulFun u u'` (N55);
    • the BORN POSITIVITY foundation `gFormC_nonneg`/`gFormC_eq_zero_iff` + the (1,9) signature
      split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` over `Cut` with `cutSqrt_sq`/
      `cutSqrt_nonneg`/`cutSqrt_unique`/`cutSqrt_pos` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite Euclidean reference form
      `EvC`, `EvC_nonneg`/`EvC_eq_zero_iff`, the compact/noncompact split (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + EvC-positive-
      semidefinite (`comp_nonneg`) (N59);
    • THE POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt s g := IsEvCSymm s ∧
      (∀ p, 0 ≤ EvC (s p) p) ∧ s∘s = g`, with the STRUCTURED/SCALAR root `scalar_op_sqrt`
      ((cutSqrt c)·id is a positive operator square root of c·id) and the N59 consumption
      `comp_scalar_op_sqrt` (the polar positive part `√(g*g) = (cutSqrt c)·id` EXISTS when `g*g`
      acts as a scalar) (N60).

  ── THE TARGET (N61) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the FULL SPECTRAL operator square root over the 10-dim form space (a
  general non-scalar `g*g`) → the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the
  connected component `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion. The ROADMAP
  §N61 names, as the immediately-bankable MEASURE-FIRST sub-piece (priority (i)), the spectral
  root on a STRUCTURED DIAGONALIZABLE operator that is NOT a single scalar — extending N60's
  scalar case toward the full spectrum via eigenspace decomposition. The FULL spectral theorem
  (arbitrary `g*g`, simultaneous diagonalization of a self-adjoint operator over `Cut` with no
  Mathlib spectral theory) is the genuine HEAVY part and is a sub-node. So — the W3 pattern —
  THIS node banks the immediately-available, theory-native STRUCTURAL piece: the operator square
  root of a 2-BLOCK DIAGONAL operator that is genuinely NON-scalar (`a ≠ b`), the first true step
  off N60's one-eigenvalue case onto the spectrum; the full spectral root + the polar/KAK
  assembly + connectedness + the full `Spin(9)→SO(9)` exhaustion is childed (N62).

  ── THE TRUNK REFRAME (THE ONE LAW): the diagonal root IS `cutSqrt` applied eigenblock-wise ──
  The reference form `EvC p q = t·t' + x·x' + gFormC v v'` makes the time/`x` plane `(t,x)` and
  the octonion block `v` EvC-ORTHOGONAL (no cross terms). A diagonal operator `blockDiag a b`
  that scales `(t,x)` by `a` and `v` by `b` is therefore self-adjoint and diagonal in this banked
  splitting, and its positive operator square root is obtained by applying the SCALAR `cutSqrt`
  eigenvalue-by-eigenvalue: `(cutSqrt a)` on `(t,x)`, `(cutSqrt b)` on `v`. Three trunk facts make
  it THE positive square root with NO spectral theory: (1) `blockDiag a b` is EvC-symmetric
  (`blockDiag_isEvCSymm`, by the bilinearity of `EvC` blockwise); (2) for `a, b ≥ 0` it is
  EvC-positive-semidefinite (`EvC (blockDiag a b p) p = a·t² + a·x² + b·gFormC v v ≥ 0`, the sum
  of `cutSqrt_nonneg`-scaled coordinate squares and the N56 Born self-overlap `gFormC_nonneg` —
  THE TRUNK POSITIVITY); (3) it squares back (`blockDiag (cutSqrt a)(cutSqrt b) ∘ blockDiag
  (cutSqrt a)(cutSqrt b) = blockDiag (cutSqrt a · cutSqrt a)(cutSqrt b · cutSqrt b) = blockDiag a
  b`, by `blockDiag_comp` + `cutSqrt_sq`). The spectral root off the scalar case dissolves into the
  scalar `cutSqrt` applied to each eigenvalue on its EvC-orthogonal eigenblock — NO Mathlib
  spectral theorem, NO posited operator calculus, NO analysis beyond the order completeness banked.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    blockDiag a b       — THE 2-BLOCK DIAGONAL operator `(t,x,v) ↦ (a•t, a•x, b•v)`: scalar `a` on
                          the EvC-orthogonal `(t,x)` plane, scalar `b` on the octonion block `v`.
    blockDiag_apply     — its action.
    blockDiag_scalar    — the SCALAR COLLAPSE: `blockDiag c c = c·id` (so it genuinely EXTENDS the
                          N60 scalar case — the diagonal of equal eigenvalues is N60's homothety).
    blockDiag_isEvCSymm — `blockDiag a b` is EvC-SELF-ADJOINT (it is diagonal in the EvC-orthogonal
                          time/`x`/`v` splitting), by the bilinearity of the reference form.
    blockDiag_comp      — diagonal operators compose blockwise: `blockDiag a b ∘ blockDiag a' b' =
                          blockDiag (a·a')(b·b')`.
    blockDiag_a_read / blockDiag_b_read — the two eigenblock readers (the `a` block at `(1,0,0)`,
                          the `b` block via `gFormC (·) 1` at `(0,0,1)`).
    blockDiag_inj       — a diagonal operator is determined by its two eigenvalues.
    blockDiag_nonneg    — for `a, b ≥ 0`, `blockDiag a b` is EvC-positive-semidefinite — THE TRUNK
                          POSITIVITY blockwise.
    blockDiag_op_sqrt   — ★★ THE HEART: for `c₁, c₂ ≥ 0`, `blockDiag (cutSqrt c₁)(cutSqrt c₂)` is a
                          positive operator square root of `blockDiag c₁ c₂` — the FIRST genuinely
                          NON-scalar operator square root, the scalar `cutSqrt` applied
                          eigenblock-wise, NO spectral theory.
    blockDiag_op_sqrt_unique — a NONNEGATIVE diagonal operator square root of `blockDiag c₁ c₂` is
                          `blockDiag (cutSqrt c₁)(cutSqrt c₂)` (blockwise `cutSqrt_unique`).
    blockDiag_op_sqrt_witness — ★ NON-VACUITY (W8): a genuinely NON-scalar root — `blockDiag 2 3`
                          (`2 ≠ 3`) is the positive operator square root of `blockDiag 4 9`. Not a
                          homothety; off the N60 scalar diagonal.
    not_blockDiag_op_sqrt_2_3 — ★ NON-VACUITY (W8 teeth): `blockDiag 2 3` is NOT an operator square
                          root of `blockDiag 4 10` (it would force `9 = 10` at the `b` eigenblock);
                          the predicate has genuine content off the scalar case.

  ── THE W1 HEAVY REMAINDER (childed N62, an honest dissolution ticket, NOT closed here) ──
  The FULL spectral square root — a general EvC-self-adjoint EvC-positive-semidefinite operator
  over the 10-dim form space written as `s∘s = g` with `s` positive, where `g` is NOT block-
  diagonal in this fixed splitting — needs simultaneous diagonalization / a spectral decomposition
  that has no Mathlib analogue over `Cut`. With it: the polar/KAK assembly `g = k·exp(p)`
  extracting `exp(p) = √(g*g)` and the compact `k = g·exp(p)⁻¹`; the compact part `k` via
  CONNECTEDNESS of the isometry group over `Cut`; and the full `Spin(9)→SO(9)` exhaustion (every
  spacelike rotation a finite product of `biMulFun`). Those are the genuine HEAVY group-manifold
  core, childed onto the chain tail as an honest W1 dissolution ticket. THIS node banks the FIRST
  genuinely non-scalar (2-block diagonal) operator square root — the first step off N60's scalar
  case onto the spectrum.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive-semidefinite self-adjoint
  operator has a unique positive square root, computed eigenvalue-by-eigenvalue on its eigenspaces,
  is standard spectral theory (the spectral theorem / continuous functional calculus). Here the
  2-block diagonal root, its self-adjointness, its positive-semidefiniteness, and its squaring-back
  DESCEND from the banked scalar `cutSqrt` (N57, the order-completeness of the derived ℝ `Cut`) +
  the positive-definite reference form `EvC` (N58, the Born self-overlap positivity N56) over the
  DERIVED ℝ `Cut` — NO posited operator calculus, NO Mathlib spectral theory, NO posited inner
  product, NO Mathlib ℝ/ℂ as content. The W1 reframe (the diagonal root IS the scalar `cutSqrt`
  applied per eigenblock, the eigenblocks EvC-orthogonal by the trunk's reference form) is exactly
  what re-grounds the first non-scalar step of the operator spectral root over the continuum
  without any spectral analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / diagonal / block / Cartan / polar / KAK / square-root / self-adjoint /
  positive-semidefinite / isometry / Spin / SO(9)": what remains is the theorem that, over the
  derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric
  positive-definite bilinear form `EvC` and the `Cut`-linear self-map `blockDiag a b := (t,x,v) ↦
  (a•t, a•x, b•v)`, `blockDiag a b` is EvC-symmetric; for `a, b ≥ 0` it satisfies
  `0 ≤ EvC (blockDiag a b p) p`; `blockDiag a b ∘ blockDiag a' b' = blockDiag (a·a')(b·b')`; and so
  for every `c₁, c₂ ≥ 0`, `blockDiag (cutSqrt c₁)(cutSqrt c₂)` is EvC-symmetric, EvC-positive-
  semidefinite, and squares to `blockDiag c₁ c₂`; that it is the unique nonnegative diagonal with
  that square; that `blockDiag 2 3` squares to `blockDiag 4 9`; and that `blockDiag 2 3` does NOT
  square to `blockDiag 4 10`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumOpSqrt

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The 2-block diagonal operator — scalar `a` on `(t,x)`, scalar `b` on the octonion block. -/

/-- THE 2-BLOCK DIAGONAL operator `(t,x,v) ↦ (a•t, a•x, b•v)`: scalar `a` on the EvC-orthogonal
    time/`x` plane `(t,x)`, scalar `b` on the octonion block `v`. The first genuinely NON-scalar
    structured operator (when `a ≠ b`), extending the N60 scalar homothety `c·id` toward the full
    spectrum. -/
def blockDiag (a b : Cut) : Module.End Cut STVC where
  toFun := fun p => (a • p.1, a • p.2.1, b • p.2.2)
  map_add' := by
    intro p q
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a • (t + t') = a • t + a • t'; rw [smul_add]
    · show a • (x + x') = a • x + a • x'; rw [smul_add]
    · show b • (v + v') = b • v + b • v'; rw [smul_add]
  map_smul' := by
    intro r p
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a • (r • t) = r • (a • t); rw [smul_comm]
    · show a • (r • x) = r • (a • x); rw [smul_comm]
    · show b • (r • v) = r • (b • v); rw [smul_comm]

/-- The 2-block diagonal operator acts as `(t,x,v) ↦ (a•t, a•x, b•v)`. -/
theorem blockDiag_apply (a b : Cut) (p : STVC) :
    blockDiag a b p = (a • p.1, a • p.2.1, b • p.2.2) := rfl

/-- THE SCALAR COLLAPSE: `blockDiag c c = c·id`. The diagonal of two EQUAL eigenvalues is exactly
    the N60 scalar homothety `c·id` — so `blockDiag` genuinely EXTENDS the N60 scalar case (and the
    interesting content is the `a ≠ b` regime). -/
theorem blockDiag_scalar (c : Cut) :
    blockDiag c c = c • (LinearMap.id : Module.End Cut STVC) := by
  apply LinearMap.ext
  intro p
  rw [blockDiag_apply, cutSmul_id_apply]
  obtain ⟨t, x, v⟩ := p
  rfl

/-! ## Self-adjointness, composition, and the eigenblock readers. -/

/-- `blockDiag a b` is EvC-SELF-ADJOINT (`EvC (blockDiag a b p) q = EvC p (blockDiag a b q)`): it is
    diagonal in the EvC-orthogonal time/`x`/`v` splitting, so symmetric by the bilinearity of the
    reference form `EvC`. -/
theorem blockDiag_isEvCSymm (a b : Cut) : IsEvCSymm (blockDiag a b) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show EvC (a • t, a • x, b • v) (t', x', v') = EvC (t, x, v) (a • t', a • x', b • v')
  show (a • t) * t' + (a • x) * x' + gFormC (b • v) v' = t * (a • t') + x * (a • x') + gFormC v (b • v')
  rw [gFormC_smul_left, gFormC_smul_right]
  show a * t * t' + a * x * x' + b * gFormC v v' = t * (a * t') + x * (a * x') + b * gFormC v v'
  ring

/-- Diagonal operators compose blockwise: `blockDiag a b ∘ blockDiag a' b' = blockDiag (a·a')(b·b')`.
    The operator analogue of `cutSmul_comp` (N60), now per eigenblock. -/
theorem blockDiag_comp (a b a' b' : Cut) :
    (blockDiag a b).comp (blockDiag a' b') = blockDiag (a * a') (b * b') := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, blockDiag_apply, blockDiag_apply, blockDiag_apply]
  obtain ⟨t, x, v⟩ := p
  show (a • (a' • t), a • (a' • x), b • (b' • v)) = ((a * a') • t, (a * a') • x, (b * b') • v)
  rw [smul_smul, smul_smul, smul_smul]

/-- The `a`-eigenblock reader: at the unit time vector `(1,0,0)`, the first coordinate is `a`. -/
theorem blockDiag_a_read (a b : Cut) :
    (blockDiag a b ((1:Cut),(0:Cut),(0:O Cut))).1 = a := by
  rw [blockDiag_apply]; show a • (1:Cut) = a; rw [smul_eq_mul, mul_one]

/-- The `b`-eigenblock reader: at `(0,0,1)`, the Born self-overlap of the octonion component with
    `1` is `b` (via `gFormC_one`). -/
theorem blockDiag_b_read (a b : Cut) :
    gFormC (blockDiag a b ((0:Cut),(0:Cut),(1:O Cut))).2.2 (1:O Cut) = b := by
  rw [blockDiag_apply]
  show gFormC (b • (1:O Cut)) (1:O Cut) = b
  rw [gFormC_smul_left, gFormC_one, mul_one]

/-- A diagonal operator is determined by its two eigenvalues: `blockDiag a b = blockDiag a' b' ⟹
    a = a' ∧ b = b'` (read off each eigenblock). -/
theorem blockDiag_inj {a b a' b' : Cut} (h : blockDiag a b = blockDiag a' b') :
    a = a' ∧ b = b' := by
  refine ⟨?_, ?_⟩
  · have := congrArg (fun T => (T ((1:Cut),(0:Cut),(0:O Cut))).1) h
    simpa [blockDiag_a_read] using this
  · have := congrArg (fun T => gFormC (T ((0:Cut),(0:Cut),(1:O Cut))).2.2 (1:O Cut)) h
    simpa [blockDiag_b_read] using this

/-! ## Positive-semidefiniteness and the 2-block (non-scalar) operator square root. -/

/-- `blockDiag a b` is EvC-POSITIVE-SEMIDEFINITE for `a, b ≥ 0`: `EvC (blockDiag a b p) p =
    a·t² + a·x² + b·gFormC v v ≥ 0` — the sum of the nonneg-scaled coordinate squares and the N56
    Born self-overlap `gFormC_nonneg`. THE TRUNK POSITIVITY, now blockwise. -/
theorem blockDiag_nonneg {a b : Cut} (ha : 0 ≤ a) (hb : 0 ≤ b) (p : STVC) :
    0 ≤ EvC (blockDiag a b p) p := by
  obtain ⟨t, x, v⟩ := p
  rw [blockDiag_apply]
  show 0 ≤ EvC (a • t, a • x, b • v) (t, x, v)
  show 0 ≤ (a • t) * t + (a • x) * x + gFormC (b • v) v
  rw [gFormC_smul_left]
  show 0 ≤ a * t * t + a * x * x + b * gFormC v v
  have hg := gFormC_nonneg v
  nlinarith [sq_nonneg t, sq_nonneg x, mul_nonneg ha (sq_nonneg t), mul_nonneg hb hg]

/-- ★★ THE HEART — THE 2-BLOCK (NON-SCALAR) OPERATOR SQUARE ROOT: for `c₁, c₂ ≥ 0`,
    `blockDiag (cutSqrt c₁)(cutSqrt c₂)` is a positive operator square root of `blockDiag c₁ c₂`.
    The FIRST genuinely NON-scalar operator square root (when `c₁ ≠ c₂`), the scalar `cutSqrt`
    applied EIGENBLOCK-by-EIGENBLOCK on the EvC-orthogonal time/`x` and octonion blocks: it is
    EvC-self-adjoint (`blockDiag_isEvCSymm`), EvC-positive-semidefinite (`blockDiag_nonneg`, the
    trunk positivity, since each `cutSqrt cᵢ ≥ 0`), and squares back (`blockDiag_comp` +
    `cutSqrt_sq`). NO Mathlib spectral theory; the spectral root off the scalar case is `cutSqrt`
    per eigenvalue. -/
theorem blockDiag_op_sqrt {c₁ c₂ : Cut} (h₁ : 0 ≤ c₁) (h₂ : 0 ≤ c₂) :
    IsEvCOpSqrt (blockDiag (cutSqrt c₁) (cutSqrt c₂)) (blockDiag c₁ c₂) := by
  refine ⟨blockDiag_isEvCSymm _ _, blockDiag_nonneg (cutSqrt_nonneg c₁) (cutSqrt_nonneg c₂), ?_⟩
  rw [blockDiag_comp, cutSqrt_sq h₁, cutSqrt_sq h₂]

/-- Structured uniqueness for the 2-block case: a NONNEGATIVE diagonal operator square root of
    `blockDiag c₁ c₂` is `blockDiag (cutSqrt c₁)(cutSqrt c₂)`. From `blockDiag b₁ b₂ ∘ blockDiag
    b₁ b₂ = blockDiag c₁ c₂` we get `b₁·b₁ = c₁`, `b₂·b₂ = c₂` (`blockDiag_comp` + `blockDiag_inj`),
    and `cutSqrt_unique` (N57) pins each `bᵢ = cutSqrt cᵢ`. (The full spectral uniqueness over the
    10-dim space is childed N62.) -/
theorem blockDiag_op_sqrt_unique {b₁ b₂ c₁ c₂ : Cut} (hb₁ : 0 ≤ b₁) (hb₂ : 0 ≤ b₂)
    (hsqrt : IsEvCOpSqrt (blockDiag b₁ b₂) (blockDiag c₁ c₂)) :
    b₁ = cutSqrt c₁ ∧ b₂ = cutSqrt c₂ := by
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [blockDiag_comp] at hcomp
  obtain ⟨he₁, he₂⟩ := blockDiag_inj hcomp
  exact ⟨cutSqrt_unique hb₁ he₁, cutSqrt_unique hb₂ he₂⟩

/-! ## Non-vacuity (W8). -/

/-- ★ NON-VACUITY (W8): a genuinely NON-scalar positive operator square root — `blockDiag 2 3`
    (`2 ≠ 3`, so NOT a homothety, genuinely off the N60 scalar diagonal) is the positive operator
    square root of `blockDiag 4 9`. The 2-block root is non-vacuous and genuinely beyond the scalar
    case. -/
theorem blockDiag_op_sqrt_witness :
    IsEvCOpSqrt (blockDiag (2:Cut) (3:Cut)) (blockDiag (4:Cut) (9:Cut)) := by
  have h := blockDiag_op_sqrt (c₁ := (4:Cut)) (c₂ := (9:Cut)) (by norm_num) (by norm_num)
  rwa [show cutSqrt (4:Cut) = 2 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (9:Cut) = 3 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

/-- ★ NON-VACUITY (W8 teeth): `blockDiag 2 3` is NOT an operator square root of `blockDiag 4 10` —
    it squares to `blockDiag 4 9`, so at the `b` eigenblock it would force `9 = 10`. The
    operator-square-root predicate has genuine content off the scalar case: a WRONG block root
    fails, reducing to the false numeric `9 = 10`. -/
theorem not_blockDiag_op_sqrt_2_3 :
    ¬ IsEvCOpSqrt (blockDiag (2:Cut) (3:Cut)) (blockDiag (4:Cut) (10:Cut)) := by
  intro hsqrt
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [blockDiag_comp] at hcomp
  have : (3:Cut) * 3 = 10 := (blockDiag_inj hcomp).2
  norm_num at this

end

end Phys.Algebra
