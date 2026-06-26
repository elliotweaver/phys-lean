/-
  Phys.Algebra.LorentzContinuumEigenProj — N63: THE EvC-ORTHOGONAL EIGENPROJECTION + THE SPECTRAL
  SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS over the DERIVED ℝ `Cut` — the FIRST rotated-basis
  spectral object in the chain, the change-of-basis lever that turns an arbitrary self-adjoint
  operator into a diagonal one in its OWN EvC-orthonormal eigenbasis (NOT the fixed standard
  coordinate basis of N60–N62).
  ===========================================================================
  THE NEXT FORCED NODE after the octonion-internal (3-eigenvalue) coordinate-diagonal
  operator-square-root node (N62). N49–N62 banked, over the derived ℝ `Cut` and the terminal
  algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg`/`gFormC_eq_zero_iff` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` with `cutSqrt_sq`/`cutSqrt_nonneg`/
      `cutSqrt_unique`/`cutSqrt_pos` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite Euclidean reference form `EvC`,
      `EvC_nonneg`/`EvC_eq_zero_iff`, the compact/noncompact split (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt s g := IsEvCSymm s ∧
      (∀ p, 0 ≤ EvC (s p) p) ∧ s∘s = g`, the STRUCTURED/SCALAR root `scalar_op_sqrt` (N60);
    • the 2-BLOCK (non-scalar) operator square root `blockDiag_op_sqrt` (N61);
    • ★ the OCTONION-INTERNAL (3-eigenvalue) COORDINATE-DIAGONAL operator square root
      `coordDiag3_op_sqrt` — the scalar `cutSqrt` applied per `(t,x)`/octonion-re-half/octonion-im-half
      eigenspace, the full DIAGONAL case of the spectral square root in the STANDARD coordinate basis (N62).

  ── THE TARGET (N63) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the FULL SPECTRAL operator square root over an ARBITRARY (non-coordinate-
  diagonal) `g*g` → the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component
  `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion. N60–N62 banked the operator square
  root for operators DIAGONAL IN THE FIXED STANDARD BASIS (scalar / 2-block / octonion-internal
  3-eigenvalue). MEASURE-FIRST (ROADMAP §N63 priority (i)) confirms: the genuine remaining HEAVY
  core is the CHANGE OF BASIS — an arbitrary self-adjoint operator brought to diagonal form by an
  EvC-ORTHOGONAL rotation. The immediately-bankable, theory-native, genuinely-NEW structural lever
  is the EvC-ORTHOGONAL EIGENPROJECTION and the SPECTRAL SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS
  — the first spectral object diagonal in a basis OTHER than the standard coordinate frame. The full
  spectral theorem for an ARBITRARY self-adjoint operator (the EXISTENCE of an EvC-orthonormal
  eigenbasis, that every such operator decomposes as `Σ λᵢ Pᵢ` — no Mathlib spectral theory over
  `Cut`), together with the polar/KAK assembly, connectedness, and the full `Spin(9)→SO(9)`
  exhaustion, remains the genuine HEAVY sub-node (childed N64).

  ── THE TRUNK REFRAME (THE ONE LAW): the spectral root IS `cutSqrt` per EvC-orthogonal projection ──
  The classical spectral theorem writes a positive self-adjoint operator as `g = Σ λᵢ Pᵢ` over its
  EvC-orthogonal eigenprojections `Pᵢ`, and its positive square root as `√g = Σ √λᵢ Pᵢ`. The trunk
  supplies every ingredient with NO spectral analysis: the EvC-orthogonal projection onto a line
  `span(u)` is `projC u : p ↦ (EvC u p) • u` (the positive-definite reference form `EvC`, N58, IS
  the inner product that makes "orthogonal projection" meaningful — it is itself the Born self-overlap
  positivity, N56); a spectral operator `specOp λ₁ λ₂ u₁ u₂ := λ₁ • projC u₁ + λ₂ • projC u₂` is
  EvC-self-adjoint (`projC` is, and EvC-self-adjointness is closed under `•`/`+`), EvC-positive-
  semidefinite for `λᵢ ≥ 0` (`EvC (projC u p) p = (EvC u p)² ≥ 0`, the order of the continuum), and —
  WHEN `{u₁,u₂}` IS EvC-ORTHONORMAL — composes by squaring eigenvalues (`specOp_comp`). So the
  positive square root of `specOp c₁ c₂ u₁ u₂` is `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂` — the scalar
  `cutSqrt` applied per eigenprojection (`specOp_op_sqrt`), the rotated-basis analogue of N62, with NO
  Mathlib spectral theorem, NO posited inner product, NO posited operator calculus.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    EvC_add_left/_right — the reference form's additivity in each slot (the bilinearity `projC`/`specOp` need).
    IsEvCSymm_add/_smul — EvC-self-adjointness is closed under `+` and scalar `•` (the operator structure).
    projC u             — ★ THE EvC-ORTHOGONAL PROJECTION onto `span(u)`: `p ↦ (EvC u p) • u`. NEW — the
                          first projection in the chain (N60–N62 were all diagonal in the fixed basis).
    projC_apply         — its action.
    projC_isEvCSymm     — `projC u` is EvC-SELF-ADJOINT for EVERY `u` (the orthogonal projector is symmetric).
    projC_idem          — for an EvC-UNIT `u` (`EvC u u = 1`), `projC u` is IDEMPOTENT (`projC u ∘ projC u = projC u`).
    projC_orth          — for EvC-ORTHOGONAL `u₁,u₂` (`EvC u₁ u₂ = 0`), `projC u₁ ∘ projC u₂ = 0`.
    projC_nonneg        — `projC u` is EvC-POSITIVE-SEMIDEFINITE: `EvC (projC u p) p = (EvC p u)² ≥ 0`. THE TRUNK
                          POSITIVITY (the order of the derived ℝ), for EVERY `u`.
    specOp λ₁ λ₂ u₁ u₂  — ★ THE SPECTRAL OPERATOR in a ROTATED eigenbasis: `λ₁ • projC u₁ + λ₂ • projC u₂`.
    specOp_apply        — its action `p ↦ (λ₁·EvC u₁ p)•u₁ + (λ₂·EvC u₂ p)•u₂`.
    specOp_isEvCSymm    — EvC-self-adjoint for EVERY `u₁,u₂` (closure of `projC`'s symmetry).
    specOp_nonneg       — EvC-positive-semidefinite for `λ₁,λ₂ ≥ 0`, EVERY `u₁,u₂` (the trunk positivity).
    specOp_comp         — ★ the COMPOSITION law `specOp λ₁ λ₂ ∘ specOp λ₁ λ₂ = specOp (λ₁²)(λ₂²)` — REQUIRES
                          EvC-ORTHONORMALITY (`EvC u₁ u₁ = EvC u₂ u₂ = 1`, `EvC u₁ u₂ = 0`).
    specOp_read₁/_read₂ — the eigenblock readers `EvC (specOp .. uᵢ) uᵢ = λᵢ` (need orthonormality).
    specOp_op_sqrt      — ★★ THE HEART: for an EvC-orthonormal `{u₁,u₂}` and `c₁,c₂ ≥ 0`,
                          `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂` is a positive operator square root of
                          `specOp c₁ c₂ u₁ u₂` — THE SPECTRAL SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS,
                          the scalar `cutSqrt` per EvC-orthogonal eigenprojection, NO Mathlib spectral theory.
    u35a/u35b           — a CONCRETE EvC-orthonormal pair `(3/5,4/5,0)`, `(4/5,−3/5,0)` (the Pythagorean
                          rotation), genuinely OFF the standard coordinate axes.
    u35a_norm/u35b_norm/u35_orth — it is EvC-orthonormal.
    specOp_4_9_offdiag  — ★ `specOp 4 9 u35a u35b` is GENUINELY NON-COORDINATE-DIAGONAL: its
                          `(x ↦ t)` off-diagonal entry is `−12/5 ≠ 0` (so it is NOT any `coordDiag3`).
    specOp_witness      — ★ NON-VACUITY (W8): the rotated-basis spectral square root, concretely —
                          `specOp 2 3 u35a u35b` (a genuinely non-coordinate-diagonal symmetric operator)
                          is the positive operator square root of `specOp 4 9 u35a u35b`.
    not_specOp_2_4_op_sqrt_4_15 — ★ NON-VACUITY (W8 teeth): `specOp 2 4 u35a u35b` is NOT a root of
                          `specOp 4 15 u35a u35b` (it would force `16 = 15` at the `u₂` eigenblock).

  ── THE W1 HEAVY REMAINDER (childed N64, an honest dissolution ticket, NOT closed here) ──
  The FULL spectral square root for an ARBITRARY EvC-self-adjoint EvC-positive-semidefinite operator
  needs the EXISTENCE of an EvC-orthonormal eigenbasis — that every such operator decomposes as
  `Σ λᵢ Pᵢ` over EvC-orthogonal eigenprojections — which has no Mathlib analogue over `Cut`. With it:
  the polar/KAK assembly `g = k·exp(p)` extracting `exp(p) = √(g*g)`, the compact `k` via
  CONNECTEDNESS of the isometry group over `Cut`, and the full `Spin(9)→SO(9)` exhaustion. Those are
  the genuine HEAVY group-manifold core, childed onto the chain tail as an honest W1 dissolution
  ticket. THIS node banks the FIRST rotated-basis spectral object — the EvC-orthogonal eigenprojection
  and the spectral square root in an EvC-orthonormal eigenbasis, the change-of-basis lever the full
  spectral root will assemble.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive-semidefinite self-adjoint operator
  has a unique positive square root, computed eigenvalue-by-eigenvalue over its orthogonal
  eigenprojections, is standard spectral theory (the spectral theorem / continuous functional
  calculus). Here the orthogonal projection, its self-adjointness/idempotence/positivity, the rotated-
  basis spectral operator, its composition law, and its square root DESCEND from the banked scalar
  `cutSqrt` (N57, the order-completeness of the derived ℝ `Cut`) + the positive-definite reference form
  `EvC` (N58, itself the Born self-overlap positivity N56) over the DERIVED ℝ `Cut` — NO posited
  operator calculus, NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content.
  The W1 reframe (the spectral root IS `cutSqrt` per EvC-orthogonal eigenprojection, the projection
  orthogonality the trunk's positive-definite reference form) is exactly what re-grounds the change-of-
  basis spectral root over the continuum without any spectral analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenprojection / eigenbasis / diagonal / orthonormal / projection /
  square-root / self-adjoint / positive-semidefinite / isometry / Spin / SO(9) / KAK / polar / Cartan":
  what remains is the theorem that, over the derived complete ordered field `Cut` and the Cayley–Dickson
  double³ `O Cut`, for the symmetric positive-definite bilinear form `EvC` and the `Cut`-linear maps
  `projC u := p ↦ (EvC u p)•u` and `specOp λ₁ λ₂ u₁ u₂ := λ₁•projC u₁ + λ₂•projC u₂`: `projC u` is
  EvC-symmetric, idempotent when `EvC u u = 1`, and `0 ≤ EvC (projC u p) p`; `specOp λ₁ λ₂ u₁ u₂` is
  EvC-symmetric, `0 ≤ EvC (specOp λ₁ λ₂ u₁ u₂ p) p` for `λ₁,λ₂ ≥ 0`, and for EvC-orthonormal `{u₁,u₂}`
  composes to `specOp (λ₁²)(λ₂²) u₁ u₂`; and so for `c₁,c₂ ≥ 0`, `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂`
  squares to `specOp c₁ c₂ u₁ u₂`; that `specOp 4 9 u35a u35b` has off-diagonal entry `−12/5`; that
  `specOp 2 3 u35a u35b` squares to `specOp 4 9 u35a u35b`; and that `specOp 2 4 u35a u35b` does NOT
  square to `specOp 4 15 u35a u35b`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumOpSqrtCoord

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The reference form's additivity in each slot — the bilinearity `projC`/`specOp` need. -/

/-- `EvC` is additive in the left slot: `EvC (p₁ + p₂) q = EvC p₁ q + EvC p₂ q`. -/
theorem EvC_add_left (p₁ p₂ q : STVC) : EvC (p₁ + p₂) q = EvC p₁ q + EvC p₂ q := by
  obtain ⟨t₁, x₁, v₁⟩ := p₁; obtain ⟨t₂, x₂, v₂⟩ := p₂; obtain ⟨t, x, v⟩ := q
  show (t₁ + t₂) * t + (x₁ + x₂) * x + gFormC (v₁ + v₂) v
     = (t₁ * t + x₁ * x + gFormC v₁ v) + (t₂ * t + x₂ * x + gFormC v₂ v)
  rw [gFormC_add_left]; ring

/-- `EvC` is additive in the right slot: `EvC p (q₁ + q₂) = EvC p q₁ + EvC p q₂` (by symmetry). -/
theorem EvC_add_right (p q₁ q₂ : STVC) : EvC p (q₁ + q₂) = EvC p q₁ + EvC p q₂ := by
  rw [EvC_symm p (q₁ + q₂), EvC_add_left, EvC_symm q₁ p, EvC_symm q₂ p]

/-- EvC-self-adjointness is closed under sum: `IsEvCSymm S → IsEvCSymm T → IsEvCSymm (S + T)`. -/
theorem IsEvCSymm_add {S T : Module.End Cut STVC} (hS : IsEvCSymm S) (hT : IsEvCSymm T) :
    IsEvCSymm (S + T) := by
  intro p q
  rw [LinearMap.add_apply, LinearMap.add_apply, EvC_add_left, EvC_add_right, hS, hT]

/-- EvC-self-adjointness is closed under scalar multiple: `IsEvCSymm T → IsEvCSymm (c • T)`. -/
theorem IsEvCSymm_smul {T : Module.End Cut STVC} (c : Cut) (hT : IsEvCSymm T) :
    IsEvCSymm (c • T) := by
  intro p q
  rw [LinearMap.smul_apply, LinearMap.smul_apply, EvC_smul_left, EvC_smul_right, hT]

/-! ## The EvC-orthogonal projection onto a line — the first projection in the chain. -/

/-- ★ THE EvC-ORTHOGONAL PROJECTION onto the line `span(u)`: `projC u : p ↦ (EvC u p) • u`. The
    first projection in the chain — N60–N62 were all diagonal in the FIXED standard coordinate basis;
    `projC u` is the spectral building block diagonal in an ARBITRARY direction `u` (in particular a
    `u` NOT on the coordinate axes), the change-of-basis lever. The positive-definite reference form
    `EvC` (N58) IS the inner product that makes "orthogonal projection" meaningful. -/
def projC (u : STVC) : Module.End Cut STVC where
  toFun := fun p => (EvC u p) • u
  map_add' := by
    intro p q
    rw [EvC_add_right, add_smul]
  map_smul' := by
    intro r p
    rw [EvC_smul_right, RingHom.id_apply, smul_smul]

/-- The orthogonal projection acts as `projC u p = (EvC u p) • u`. -/
theorem projC_apply (u p : STVC) : projC u p = (EvC u p) • u := rfl

/-- `projC u` is EvC-SELF-ADJOINT for EVERY `u`: `EvC (projC u p) q = EvC u p · EvC u q =
    EvC p (projC u q)`. The orthogonal projector is symmetric (the trunk reference form is symmetric). -/
theorem projC_isEvCSymm (u : STVC) : IsEvCSymm (projC u) := by
  intro p q
  rw [projC_apply, projC_apply, EvC_smul_left, EvC_smul_right, EvC_symm u p, EvC_symm u q]
  ring

/-- For an EvC-UNIT `u` (`EvC u u = 1`), `projC u` is IDEMPOTENT: `projC u (projC u p) = projC u p`.
    A genuine projection onto its unit line. -/
theorem projC_idem {u : STVC} (h : EvC u u = 1) (p : STVC) :
    projC u (projC u p) = projC u p := by
  rw [projC_apply, projC_apply, EvC_smul_right, h, mul_one]

/-- For EvC-ORTHOGONAL `u₁,u₂` (`EvC u₁ u₂ = 0`), the projections annihilate: `projC u₁ ∘ projC u₂ = 0`.
    Orthogonal eigenprojections are mutually annihilating — the spectral decomposition's orthogonality. -/
theorem projC_orth {u₁ u₂ : STVC} (h : EvC u₁ u₂ = 0) (p : STVC) :
    projC u₁ (projC u₂ p) = 0 := by
  rw [projC_apply, projC_apply, EvC_smul_right, h, mul_zero, zero_smul]

/-- `projC u` is EvC-POSITIVE-SEMIDEFINITE for EVERY `u`: `EvC (projC u p) p = (EvC p u)² ≥ 0`. THE
    TRUNK POSITIVITY — a square is nonnegative by the order structure of the derived ℝ `Cut`. -/
theorem projC_nonneg (u p : STVC) : 0 ≤ EvC (projC u p) p := by
  rw [projC_apply, EvC_smul_left, EvC_symm u p]
  exact mul_self_nonneg (EvC p u)

/-! ## The spectral operator in a rotated EvC-orthonormal eigenbasis. -/

/-- ★ THE SPECTRAL OPERATOR diagonal in a ROTATED EvC-orthonormal eigenbasis `{u₁,u₂}`:
    `specOp λ₁ λ₂ u₁ u₂ := λ₁ • projC u₁ + λ₂ • projC u₂` — eigenvalue `λᵢ` on the EvC-orthogonal
    eigenprojection `projC uᵢ`. The genuine generalization beyond N62's `coordDiag3` (which was
    diagonal only in the FIXED standard coordinate basis): here the eigenbasis `{u₁,u₂}` is ARBITRARY. -/
def specOp (l₁ l₂ : Cut) (u₁ u₂ : STVC) : Module.End Cut STVC :=
  l₁ • projC u₁ + l₂ • projC u₂

/-- The spectral operator acts as `p ↦ (λ₁·EvC u₁ p)•u₁ + (λ₂·EvC u₂ p)•u₂`. -/
theorem specOp_apply (l₁ l₂ : Cut) (u₁ u₂ p : STVC) :
    specOp l₁ l₂ u₁ u₂ p = (l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂ := by
  show (l₁ • projC u₁ + l₂ • projC u₂) p = _
  rw [LinearMap.add_apply, LinearMap.smul_apply, LinearMap.smul_apply,
    projC_apply, projC_apply, smul_smul, smul_smul]

/-- `specOp λ₁ λ₂ u₁ u₂` is EvC-SELF-ADJOINT for EVERY `u₁,u₂` (closure of `projC`'s symmetry under
    `•` and `+`). The spectral operator is diagonal hence self-adjoint in its own eigenbasis. -/
theorem specOp_isEvCSymm (l₁ l₂ : Cut) (u₁ u₂ : STVC) : IsEvCSymm (specOp l₁ l₂ u₁ u₂) :=
  IsEvCSymm_add (IsEvCSymm_smul l₁ (projC_isEvCSymm u₁)) (IsEvCSymm_smul l₂ (projC_isEvCSymm u₂))

/-- `specOp λ₁ λ₂ u₁ u₂` is EvC-POSITIVE-SEMIDEFINITE for `λ₁,λ₂ ≥ 0`, EVERY `u₁,u₂`: the trunk
    positivity per eigenprojection (`projC_nonneg`), summed with nonnegative weights. -/
theorem specOp_nonneg {l₁ l₂ : Cut} (h₁ : 0 ≤ l₁) (h₂ : 0 ≤ l₂) (u₁ u₂ p : STVC) :
    0 ≤ EvC (specOp l₁ l₂ u₁ u₂ p) p := by
  show 0 ≤ EvC ((l₁ • projC u₁ + l₂ • projC u₂) p) p
  rw [LinearMap.add_apply, EvC_add_left, LinearMap.smul_apply, LinearMap.smul_apply,
    EvC_smul_left, EvC_smul_left]
  exact add_nonneg (mul_nonneg h₁ (projC_nonneg u₁ p)) (mul_nonneg h₂ (projC_nonneg u₂ p))

/-- ★ THE COMPOSITION LAW — `specOp λ₁ λ₂ u₁ u₂ ∘ specOp λ₁ λ₂ u₁ u₂ = specOp (λ₁²)(λ₂²) u₁ u₂` —
    REQUIRES the eigenbasis `{u₁,u₂}` to be EvC-ORTHONORMAL (`EvC u₁ u₁ = EvC u₂ u₂ = 1`,
    `EvC u₁ u₂ = 0`). The orthonormality is exactly what makes the cross terms vanish and the diagonal
    eigenvalues square independently — the spectral decomposition over an orthonormal eigenbasis. -/
theorem specOp_comp {l₁ l₂ : Cut} {u₁ u₂ : STVC}
    (h11 : EvC u₁ u₁ = 1) (h22 : EvC u₂ u₂ = 1) (h12 : EvC u₁ u₂ = 0) :
    (specOp l₁ l₂ u₁ u₂).comp (specOp l₁ l₂ u₁ u₂) = specOp (l₁ * l₁) (l₂ * l₂) u₁ u₂ := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOp_apply, specOp_apply, specOp_apply]
  have e1 : EvC u₁ ((l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂) = l₁ * EvC u₁ p := by
    rw [EvC_add_right, EvC_smul_right, EvC_smul_right, h11, h12]; ring
  have e2 : EvC u₂ ((l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂) = l₂ * EvC u₂ p := by
    rw [EvC_add_right, EvC_smul_right, EvC_smul_right, h22, EvC_symm u₂ u₁, h12]; ring
  rw [e1, e2,
    show l₁ * (l₁ * EvC u₁ p) = l₁ * l₁ * EvC u₁ p from by ring,
    show l₂ * (l₂ * EvC u₂ p) = l₂ * l₂ * EvC u₂ p from by ring]

/-- The `u₂`-eigenblock reader: for an EvC-orthonormal pair, `EvC (specOp λ₁ λ₂ u₁ u₂ u₂) u₂ = λ₂`. -/
theorem specOp_read₂ {l₁ l₂ : Cut} {u₁ u₂ : STVC}
    (h22 : EvC u₂ u₂ = 1) (h12 : EvC u₁ u₂ = 0) :
    EvC (specOp l₁ l₂ u₁ u₂ u₂) u₂ = l₂ := by
  rw [specOp_apply, EvC_add_left, EvC_smul_left, EvC_smul_left, h22, h12]
  ring

/-- The `u₁`-eigenblock reader: for an EvC-orthonormal pair, `EvC (specOp λ₁ λ₂ u₁ u₂ u₁) u₁ = λ₁`. -/
theorem specOp_read₁ {l₁ l₂ : Cut} {u₁ u₂ : STVC}
    (h11 : EvC u₁ u₁ = 1) (h12 : EvC u₁ u₂ = 0) :
    EvC (specOp l₁ l₂ u₁ u₂ u₁) u₁ = l₁ := by
  rw [specOp_apply, EvC_add_left, EvC_smul_left, EvC_smul_left, h11, EvC_symm u₂ u₁, h12]
  ring

/-! ## THE HEART — the spectral square root in a rotated EvC-orthonormal basis. -/

/-- ★★ THE HEART — THE SPECTRAL SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS: for an EvC-orthonormal
    eigenbasis `{u₁,u₂}` and `c₁,c₂ ≥ 0`, `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂` is a positive
    operator square root of `specOp c₁ c₂ u₁ u₂`. The scalar `cutSqrt` applied per EvC-orthogonal
    eigenprojection — the rotated-basis analogue of N62's `coordDiag3_op_sqrt`, now over an ARBITRARY
    EvC-orthonormal eigenbasis (NOT the standard coordinate frame): it is EvC-self-adjoint
    (`specOp_isEvCSymm`), EvC-positive-semidefinite (`specOp_nonneg`, since each `cutSqrt ≥ 0`), and
    squares back (`specOp_comp` + `cutSqrt_sq`). NO Mathlib spectral theory; the spectral root is
    `cutSqrt` per eigenvalue on its EvC-orthogonal eigenprojection. -/
theorem specOp_op_sqrt {c₁ c₂ : Cut} (hc₁ : 0 ≤ c₁) (hc₂ : 0 ≤ c₂) {u₁ u₂ : STVC}
    (h11 : EvC u₁ u₁ = 1) (h22 : EvC u₂ u₂ = 1) (h12 : EvC u₁ u₂ = 0) :
    IsEvCOpSqrt (specOp (cutSqrt c₁) (cutSqrt c₂) u₁ u₂) (specOp c₁ c₂ u₁ u₂) := by
  refine ⟨specOp_isEvCSymm _ _ _ _,
    specOp_nonneg (cutSqrt_nonneg c₁) (cutSqrt_nonneg c₂) u₁ u₂, ?_⟩
  rw [specOp_comp h11 h22 h12, cutSqrt_sq hc₁, cutSqrt_sq hc₂]

/-! ## A concrete EvC-orthonormal pair OFF the coordinate axes — genuinely non-coordinate-diagonal. -/

/-- A concrete EvC-orthonormal vector `(3/5, 4/5, 0)` — the Pythagorean rotation, genuinely OFF the
    standard coordinate axes (both `t`- and `x`-components nonzero). -/
def u35a : STVC := ((3/5 : Cut), (4/5 : Cut), (0 : O Cut))

/-- A concrete EvC-orthonormal vector `(4/5, −3/5, 0)`, EvC-orthogonal to `u35a`. -/
def u35b : STVC := ((4/5 : Cut), (-3/5 : Cut), (0 : O Cut))

/-- `u35a` is an EvC-unit: `EvC u35a u35a = (3/5)² + (4/5)² = 1`. -/
theorem u35a_norm : EvC u35a u35a = 1 := by
  show (3/5 : Cut) * (3/5) + (4/5) * (4/5) + gFormC 0 0 = 1
  rw [gFormC_zero_left]; norm_num

/-- `u35b` is an EvC-unit: `EvC u35b u35b = (4/5)² + (−3/5)² = 1`. -/
theorem u35b_norm : EvC u35b u35b = 1 := by
  show (4/5 : Cut) * (4/5) + (-3/5) * (-3/5) + gFormC 0 0 = 1
  rw [gFormC_zero_left]; norm_num

/-- `u35a` and `u35b` are EvC-orthogonal: `EvC u35a u35b = (3/5)(4/5) + (4/5)(−3/5) = 0`. -/
theorem u35_orth : EvC u35a u35b = 0 := by
  show (3/5 : Cut) * (4/5) + (4/5) * (-3/5) + gFormC 0 0 = 0
  rw [gFormC_zero_left]; norm_num

/-- ★ `specOp 4 9 u35a u35b` is GENUINELY NON-COORDINATE-DIAGONAL: its `(x ↦ t)` off-diagonal matrix
    entry (the second component of the image of the unit `t`-vector) is `−12/5 ≠ 0`. So this spectral
    operator is NOT equal to any `coordDiag3` (those are diagonal in the standard basis, off-diagonal
    entry `0`) — the rotated-basis spectral object genuinely extends N60–N62. -/
theorem specOp_4_9_offdiag :
    (specOp (4:Cut) (9:Cut) u35a u35b ((1:Cut),(0:Cut),(0:O Cut))).2.1 = -12/5 := by
  rw [specOp_apply]
  show ((4 * EvC u35a ((1:Cut),(0:Cut),(0:O Cut))) • u35a
      + (9 * EvC u35b ((1:Cut),(0:Cut),(0:O Cut))) • u35b).2.1 = -12/5
  have ea : EvC u35a ((1:Cut),(0:Cut),(0:O Cut)) = 3/5 := by
    show (3/5 : Cut) * 1 + (4/5) * 0 + gFormC 0 0 = 3/5
    rw [gFormC_zero_left]; norm_num
  have eb : EvC u35b ((1:Cut),(0:Cut),(0:O Cut)) = 4/5 := by
    show (4/5 : Cut) * 1 + (-3/5) * 0 + gFormC 0 0 = 4/5
    rw [gFormC_zero_left]; norm_num
  rw [ea, eb]
  show (4 * (3/5)) * (4/5) + (9 * (4/5)) * (-3/5) = (-12/5 : Cut)
  norm_num

/-! ## Non-vacuity (W8). -/

/-- ★ NON-VACUITY (W8): THE ROTATED-BASIS SPECTRAL SQUARE ROOT, concretely — `specOp 2 3 u35a u35b`
    (a genuinely NON-coordinate-diagonal symmetric operator, eigenvalues `2,3` on the rotated
    eigenbasis) is the positive operator square root of `specOp 4 9 u35a u35b`. Beyond N62's
    standard-basis `coordDiag3`: the eigenbasis is OFF the coordinate axes. -/
theorem specOp_witness :
    IsEvCOpSqrt (specOp (2:Cut) (3:Cut) u35a u35b) (specOp (4:Cut) (9:Cut) u35a u35b) := by
  have h := specOp_op_sqrt (c₁ := (4:Cut)) (c₂ := (9:Cut)) (by norm_num) (by norm_num)
    u35a_norm u35b_norm u35_orth
  rwa [show cutSqrt (4:Cut) = 2 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (9:Cut) = 3 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

/-- ★ NON-VACUITY (W8 teeth): `specOp 2 4 u35a u35b` is NOT an operator square root of
    `specOp 4 15 u35a u35b` — it squares to `specOp 4 16 u35a u35b`, so at the `u₂` eigenblock it
    would force `4·4 = 16 = 15`. The rotated-basis spectral-square-root predicate has genuine content:
    a WRONG eigenvalue root fails, reducing to the false numeric `16 = 15`. -/
theorem not_specOp_2_4_op_sqrt_4_15 :
    ¬ IsEvCOpSqrt (specOp (2:Cut) (4:Cut) u35a u35b) (specOp (4:Cut) (15:Cut) u35a u35b) := by
  intro hsqrt
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [specOp_comp u35a_norm u35b_norm u35_orth] at hcomp
  have := congrArg (fun T => EvC (T u35b) u35b) hcomp
  simp only at this
  rw [specOp_read₂ u35b_norm u35_orth, specOp_read₂ u35b_norm u35_orth] at this
  norm_num at this

end

end Phys.Algebra
