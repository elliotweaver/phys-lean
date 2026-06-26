/-
  Phys.Algebra.LorentzContinuumSpectralMix — N67: THE FIRST 10-DIMENSION-MIXING SPECTRAL SQUARE
  ROOT (an EvC-orthonormal eigenbasis that MIXES the `(t,x)` plane WITH the octonion block
  `O Cut`) + THE RANK-3 SPECTRAL OPERATOR `specOp3` (the structural lever rank-2 → rank-n toward
  the full n-dim spectral existence) over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the concrete polar/KAK assembly node (N66). N49–N66 banked, over the
  derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the 2-block diagonal root `blockDiag_op_sqrt` (N61), the octonion-internal coordinate-diagonal root (N62);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-2 rotated-basis spectral operator `specOp`
      + its composition law `specOp_comp` + the spectral square root `specOp_op_sqrt` (N63);
    • the general/equal-diagonal/full-unequal-diagonal `(t,x)`-plane eigenbasis `txOp` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` of a composite isometry `R∘boostC a b` (N66).

  ── THE TARGET (N67) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the GLOBAL polar/KAK assembly for an
  ARBITRARY `g ∈ qvIsomMonoidC` (the operator square root of an arbitrary `g*g` — the full n-dim
  spectral EXISTENCE), the compact part via CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and
  the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N67 priority (i)) confirms: the
  full n-dim spectral existence for an ARBITRARY `g*g` (no Mathlib analogue over `Cut`), and the
  connectedness / surjectivity / exhaustion, each need group-manifold machinery Mathlib lacks over
  `Cut` — those are the genuine HEAVY sub-nodes (childed N68). Every banked CONCRETE spectral
  witness so far (N63 `u35a/u35b`, N64 `uP/uM`, N65 `rotA/rotB`, N66 `boostC`/`R`) lives PURELY in
  the `(t,x)` plane or in block-SEPARATED coordinate blocks; the rotated-basis spectral root
  `specOp_op_sqrt` (N63) is general over any EvC-orthonormal PAIR, but the chain has no witness of
  an EvC-self-adjoint operator that genuinely MIXES the `(t,x)` plane with the octonion block, and
  no spectral object beyond rank 2. The immediately-bankable, theory-native structural pieces are
  exactly those two escalations:
    A. THE FIRST 10-DIMENSION-MIXING SPECTRAL SQUARE ROOT — a CONCRETE EvC-orthonormal eigenbasis
       `{mixA, mixB}` whose vectors mix the time component with the octonion block
       (`mixA = (3/5, 0, (4/5)·1₍O₎)`, `mixB = (4/5, 0, (−3/5)·1₍O₎)`), the spectral operator
       `specOp c₁ c₂ mixA mixB` shown GENUINELY 10-dim-mixing (the time axis maps INTO the octonion
       block: `specOp 4 9 mixA mixB (1,0,0)` has octonion component `(−12/5)·1₍O₎ ≠ 0`, impossible
       for any block-separated `coordDiag3`/`blockDiag`/`boostC`), and its positive operator square
       root `√(g) = specOp (cutSqrt c₁)(cutSqrt c₂) mixA mixB` read off via the banked `specOp_op_sqrt`.
    B. THE RANK-3 SPECTRAL OPERATOR `specOp3 l₁ l₂ l₃ u₁ u₂ u₃ := l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃`
       — EvC-self-adjoint, positive-semidefinite for `lᵢ ≥ 0`, with the composition law over an
       orthonormal TRIPLE (all three cross terms vanish, eigenvalues square independently), the
       eigenblock reader, and the square root via `cutSqrt` per eigenvalue. The genuine structural
       lever rank-2 → rank-3, the inductive step toward the full n-dim spectral existence, with a
       CONCRETE orthonormal TRIPLE `{mixA, mixB, mixW3}` mixing time / space / octonion.

  ── THE TRUNK REFRAME (THE ONE LAW): the spectral root IS `cutSqrt` per EvC-orthogonal projection ──
  The classical spectral theorem writes a positive self-adjoint operator as `g = Σ λᵢ Pᵢ` over its
  EvC-orthogonal eigenprojections and its positive square root as `√g = Σ √λᵢ Pᵢ`. The trunk
  supplies every ingredient with NO spectral analysis: the EvC-orthogonal projection `projC u`
  (N63), the rank-`n` spectral operator as a sum of scaled projections, EvC-self-adjointness closed
  under `•`/`+` (N63), positivity per projection (the order of the derived ℝ), the composition law
  from orthonormality (the cross terms vanish because `EvC uᵢ uⱼ = 0`), and the scalar `cutSqrt`
  applied per eigenvalue (N57). The octonion block enters only through the banked `gFormC` bilinear
  form (`gFormC_smul_left`/`gFormC_smul_right`/`gFormC_one`), so a `u` mixing time and the octonion
  unit `1₍O₎` is an ordinary EvC-orthonormal vector — the spectral machinery applies verbatim, and
  the 10-dim mixing is genuine, NOT an artifact of a block-restricted basis.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    mixA / mixB           — a CONCRETE EvC-orthonormal pair MIXING the time axis with the octonion unit.
    mixA_norm/mixB_norm/mix_orth — they are EvC-orthonormal (via `gFormC_smul`/`gFormC_one`).
    EvC_mixA_e0/EvC_mixB_e0 — their overlaps with the pure-time unit `(1,0,0)`.
    specOp_mix_octBlock   — ★ THE 10-DIM MIXING: `specOp 4 9 mixA mixB (1,0,0)` has octonion component
                            `(−12/5)·1₍O₎ ≠ 0` — the time axis maps INTO the octonion block (impossible
                            for any block-separated operator). The first time↔octonion-mixing witness.
    specOp_mix_op_sqrt    — ★★ THE FIRST 10-DIM-MIXING SPECTRAL SQUARE ROOT: for `c₁,c₂ ≥ 0`,
                            `specOp (cutSqrt c₁)(cutSqrt c₂) mixA mixB` is a positive operator square
                            root of `specOp c₁ c₂ mixA mixB`, an operator that mixes time and octonion.
    specOp_mix_witness    — ★ NON-VACUITY: `specOp 2 3 mixA mixB` is the positive operator square root
                            of `specOp 4 9 mixA mixB` (a genuinely 10-dim-mixing operator).
    not_specOp_mix_2_6    — ★ NON-VACUITY (W8 teeth): `specOp 2 6 mixA mixB` is NOT a root of
                            `specOp 4 9 mixA mixB` (forces `36 = 9` at the `mixB` eigenblock).
    specOp3 ...           — ★ THE RANK-3 SPECTRAL OPERATOR `l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃`.
    specOp3_apply         — its action.
    specOp3_isEvCSymm     — EvC-self-adjoint for EVERY `u₁,u₂,u₃`.
    specOp3_nonneg        — EvC-positive-semidefinite for `l₁,l₂,l₃ ≥ 0`, EVERY `u₁,u₂,u₃`.
    specOp3_comp          — ★ the COMPOSITION law over an orthonormal TRIPLE (all 3 cross terms vanish).
    specOp3_read₃         — the `u₃`-eigenblock reader.
    specOp3_op_sqrt       — ★★ THE RANK-3 SPECTRAL SQUARE ROOT: `cutSqrt` per eigenvalue, the rank-2→
                            rank-3 inductive step toward the full n-dim spectral existence.
    mixW3 / mixW3_norm / mixA_mixW3_orth / mixB_mixW3_orth — a CONCRETE pure-space unit, EvC-orthogonal to `mixA,mixB`.
    specOp3_mix_witness   — ★ NON-VACUITY: `specOp3 2 3 5 mixA mixB mixW3` is the positive operator square
                            root of `specOp3 4 9 25 mixA mixB mixW3` over the time/space/octonion-mixing triple.

  ── THE W1 HEAVY REMAINDER (childed N68, an honest dissolution ticket, NOT closed here) ──
  The FULL n-dim spectral EXISTENCE — that an ARBITRARY EvC-self-adjoint EvC-positive-semidefinite
  operator decomposes as `Σᵢ λᵢ Pᵢ` over an EvC-orthonormal eigenbasis (no Mathlib analogue over
  `Cut`) — + the GLOBAL polar/KAK assembly for an arbitrary `g` + the compact part via CONNECTEDNESS
  + the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`)
  + the full `Spin(9)→SO(9)` exhaustion are the genuine HEAVY group-manifold core, childed onto the
  chain tail. THIS node banks the FIRST 10-dim-mixing spectral square root + the rank-3 spectral
  operator — the two structural escalations (mixing eigenbasis + rank-2→rank-n) the full existence consumes.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive self-adjoint operator has a
  positive square root computed eigenvalue-by-eigenvalue over its orthogonal eigenprojections, in
  any orthonormal eigenbasis and at any finite rank, is standard spectral theory. Here the spectral
  operator at rank 3, its self-adjointness/positivity/composition/square-root, and the 10-dim-mixing
  eigenbasis DESCEND from the banked `projC` (N63) + scalar `cutSqrt` (N57) + reference form `EvC`
  (N58) + the octonion bilinear form `gFormC` over the DERIVED ℝ `Cut` and `O Cut` — NO posited
  operator calculus, NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenprojection / eigenbasis / diagonal / orthonormal / projection /
  square-root / self-adjoint / positive-semidefinite / isometry / Spin / SO(9) / KAK / polar /
  Cartan / mixing / dimension": what remains is the theorem that, over the derived complete ordered
  field `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric positive-definite bilinear
  form `EvC`, the `Cut`-linear `projC u := p ↦ (EvC u p)•u`, the rank-2 `specOp`, and the rank-3
  `specOp3 l₁ l₂ l₃ u₁ u₂ u₃ := l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃`: with the concrete vectors
  `mixA = (3/5,0,(4/5)·1)`, `mixB = (4/5,0,(−3/5)·1)`, `mixW3 = (0,1,0)` EvC-orthonormal,
  `specOp 4 9 mixA mixB (1,0,0)` has octonion component `(−12/5)·1`; `specOp (cutSqrt c₁)(cutSqrt c₂)
  mixA mixB` squares to `specOp c₁ c₂ mixA mixB`; `specOp3` is EvC-symmetric, nonneg for `lᵢ ≥ 0`,
  composes by squaring eigenvalues over an orthonormal triple, and `specOp3 (cutSqrt c₁)(cutSqrt c₂)
  (cutSqrt c₃) u₁ u₂ u₃` squares to `specOp3 c₁ c₂ c₃ u₁ u₂ u₃`; concretely `specOp3 2 3 5 mixA mixB mixW3`
  squares to `specOp3 4 9 25 mixA mixB mixW3`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumPolarKAK

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## A helper: the octonion form is zero in its right slot too. -/

/-- `gFormC v 0 = 0` (by symmetry from `gFormC_zero_left`). -/
theorem gFormC_zero_right' (v : O Cut) : gFormC v 0 = 0 := by
  rw [gFormC_symm, gFormC_zero_left]

/-! ## Part A — a concrete EvC-orthonormal pair MIXING the time axis with the octonion block. -/

/-- A concrete EvC-orthonormal vector `(3/5, 0, (4/5)·1₍O₎)` — MIXING the time component with the
    octonion unit. Genuinely off any single coordinate block: its `t`-component and its octonion
    component are both nonzero. -/
def mixA : STVC := ((3/5 : Cut), (0 : Cut), ((4/5 : Cut) • (1 : O Cut)))

/-- A concrete EvC-orthonormal vector `(4/5, 0, (−3/5)·1₍O₎)`, EvC-orthogonal to `mixA`, again
    mixing time with the octonion unit. -/
def mixB : STVC := ((4/5 : Cut), (0 : Cut), ((-3/5 : Cut) • (1 : O Cut)))

/-- `mixA` is an EvC-unit: `(3/5)² + (4/5)²·gFormC 1 1 = 9/25 + 16/25 = 1`. -/
theorem mixA_norm : EvC mixA mixA = 1 := by
  show (3/5 : Cut) * (3/5) + (0:Cut) * 0
      + gFormC ((4/5 : Cut) • (1 : O Cut)) ((4/5 : Cut) • (1 : O Cut)) = 1
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_one]; norm_num

/-- `mixB` is an EvC-unit: `(4/5)² + (−3/5)²·gFormC 1 1 = 16/25 + 9/25 = 1`. -/
theorem mixB_norm : EvC mixB mixB = 1 := by
  show (4/5 : Cut) * (4/5) + (0:Cut) * 0
      + gFormC ((-3/5 : Cut) • (1 : O Cut)) ((-3/5 : Cut) • (1 : O Cut)) = 1
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_one]; norm_num

/-- `mixA` and `mixB` are EvC-orthogonal: `(3/5)(4/5) + (4/5)(−3/5)·gFormC 1 1 = 12/25 − 12/25 = 0`. -/
theorem mix_orth : EvC mixA mixB = 0 := by
  show (3/5 : Cut) * (4/5) + (0:Cut) * 0
      + gFormC ((4/5 : Cut) • (1 : O Cut)) ((-3/5 : Cut) • (1 : O Cut)) = 0
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_one]; norm_num

/-- The overlap of `mixA` with the pure-time unit `(1,0,0)` is `3/5`. -/
theorem EvC_mixA_e0 : EvC mixA ((1:Cut),(0:Cut),(0:O Cut)) = 3/5 := by
  show (3/5 : Cut) * 1 + (0:Cut) * 0 + gFormC ((4/5 : Cut) • (1 : O Cut)) 0 = 3/5
  rw [gFormC_smul_left, gFormC_zero_right']; norm_num

/-- The overlap of `mixB` with the pure-time unit `(1,0,0)` is `4/5`. -/
theorem EvC_mixB_e0 : EvC mixB ((1:Cut),(0:Cut),(0:O Cut)) = 4/5 := by
  show (4/5 : Cut) * 1 + (0:Cut) * 0 + gFormC ((-3/5 : Cut) • (1 : O Cut)) 0 = 4/5
  rw [gFormC_smul_left, gFormC_zero_right']; norm_num

/-- ★ THE 10-DIMENSION MIXING: the spectral operator `specOp 4 9 mixA mixB` sends the pure-time
    unit `(1,0,0)` to a vector whose OCTONION component is `(−12/5)·1₍O₎ ≠ 0` — the time axis maps
    INTO the octonion block. This is IMPOSSIBLE for any block-separated operator (`coordDiag3`,
    `blockDiag`, `boostC` all fix the time/octonion split); the spectral operator over the mixing
    eigenbasis genuinely couples the two sectors. The first time↔octonion-mixing witness in the chain. -/
theorem specOp_mix_octBlock :
    (specOp (4:Cut) (9:Cut) mixA mixB ((1:Cut),(0:Cut),(0:O Cut))).2.2
      = ((-12/5 : Cut) • (1 : O Cut)) := by
  rw [specOp_apply, EvC_mixA_e0, EvC_mixB_e0]
  show (4 * (3/5) : Cut) • mixA.2.2 + (9 * (4/5) : Cut) • mixB.2.2 = ((-12/5 : Cut) • (1 : O Cut))
  show (4 * (3/5) : Cut) • ((4/5 : Cut) • (1 : O Cut))
      + (9 * (4/5) : Cut) • ((-3/5 : Cut) • (1 : O Cut)) = ((-12/5 : Cut) • (1 : O Cut))
  rw [smul_smul, smul_smul, ← add_smul]; norm_num

/-- ★★ THE FIRST 10-DIMENSION-MIXING SPECTRAL SQUARE ROOT: for `c₁,c₂ ≥ 0`,
    `specOp (cutSqrt c₁)(cutSqrt c₂) mixA mixB` is a positive operator square root of
    `specOp c₁ c₂ mixA mixB` — and `specOp c₁ c₂ mixA mixB` genuinely mixes the time axis with the
    octonion block (`specOp_mix_octBlock`). The banked rotated-basis spectral root `specOp_op_sqrt`
    (N63) realized on an eigenbasis that couples `(t,x)` to `O Cut`, NOT on a block-restricted basis. -/
theorem specOp_mix_op_sqrt {c₁ c₂ : Cut} (hc₁ : 0 ≤ c₁) (hc₂ : 0 ≤ c₂) :
    IsEvCOpSqrt (specOp (cutSqrt c₁) (cutSqrt c₂) mixA mixB) (specOp c₁ c₂ mixA mixB) :=
  specOp_op_sqrt hc₁ hc₂ mixA_norm mixB_norm mix_orth

/-- ★ NON-VACUITY: the concrete 10-dim-mixing spectral square root — `specOp 2 3 mixA mixB` is the
    positive operator square root of `specOp 4 9 mixA mixB` (the operator that maps the time axis
    into the octonion block, `specOp_mix_octBlock`). -/
theorem specOp_mix_witness :
    IsEvCOpSqrt (specOp (2:Cut) (3:Cut) mixA mixB) (specOp (4:Cut) (9:Cut) mixA mixB) := by
  have h := specOp_mix_op_sqrt (c₁ := (4:Cut)) (c₂ := (9:Cut)) (by norm_num) (by norm_num)
  rwa [show cutSqrt (4:Cut) = 2 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (9:Cut) = 3 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

/-- ★ NON-VACUITY (W8 teeth): `specOp 2 6 mixA mixB` is NOT an operator square root of
    `specOp 4 9 mixA mixB` — it squares to `specOp 4 36 mixA mixB`, so at the `mixB` eigenblock it
    forces `6·6 = 36 = 9`. The 10-dim-mixing spectral-square-root predicate has genuine content:
    a WRONG eigenvalue root fails, reducing to the false numeric `36 = 9`. -/
theorem not_specOp_mix_2_6 :
    ¬ IsEvCOpSqrt (specOp (2:Cut) (6:Cut) mixA mixB) (specOp (4:Cut) (9:Cut) mixA mixB) := by
  intro hsqrt
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [specOp_comp mixA_norm mixB_norm mix_orth] at hcomp
  have := congrArg (fun T => EvC (T mixB) mixB) hcomp
  simp only at this
  rw [specOp_read₂ mixB_norm mix_orth, specOp_read₂ mixB_norm mix_orth] at this
  norm_num at this

/-! ## Part B — the RANK-3 spectral operator: the structural lever rank-2 → rank-n. -/

/-- ★ THE RANK-3 SPECTRAL OPERATOR diagonal in an orthonormal eigen-TRIPLE `{u₁,u₂,u₃}`:
    `specOp3 l₁ l₂ l₃ u₁ u₂ u₃ := l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃` — eigenvalue `lᵢ` on the
    EvC-orthogonal eigenprojection `projC uᵢ`. The genuine generalization beyond N63's rank-2
    `specOp`, the inductive step toward the full n-dim spectral existence (rank-`n` as `n` scaled
    projections). -/
def specOp3 (l₁ l₂ l₃ : Cut) (u₁ u₂ u₃ : STVC) : Module.End Cut STVC :=
  l₁ • projC u₁ + l₂ • projC u₂ + l₃ • projC u₃

/-- The rank-3 spectral operator acts as `p ↦ (l₁·EvC u₁ p)•u₁ + (l₂·EvC u₂ p)•u₂ + (l₃·EvC u₃ p)•u₃`. -/
theorem specOp3_apply (l₁ l₂ l₃ : Cut) (u₁ u₂ u₃ p : STVC) :
    specOp3 l₁ l₂ l₃ u₁ u₂ u₃ p
      = (l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂ + (l₃ * EvC u₃ p) • u₃ := by
  show (l₁ • projC u₁ + l₂ • projC u₂ + l₃ • projC u₃) p = _
  rw [LinearMap.add_apply, LinearMap.add_apply, LinearMap.smul_apply, LinearMap.smul_apply,
    LinearMap.smul_apply, projC_apply, projC_apply, projC_apply, smul_smul, smul_smul, smul_smul]

/-- `specOp3 l₁ l₂ l₃ u₁ u₂ u₃` is EvC-SELF-ADJOINT for EVERY `u₁,u₂,u₃` (closure of `projC`'s
    symmetry under `•` and `+`). -/
theorem specOp3_isEvCSymm (l₁ l₂ l₃ : Cut) (u₁ u₂ u₃ : STVC) :
    IsEvCSymm (specOp3 l₁ l₂ l₃ u₁ u₂ u₃) :=
  IsEvCSymm_add (IsEvCSymm_add (IsEvCSymm_smul l₁ (projC_isEvCSymm u₁))
    (IsEvCSymm_smul l₂ (projC_isEvCSymm u₂))) (IsEvCSymm_smul l₃ (projC_isEvCSymm u₃))

/-- `specOp3 l₁ l₂ l₃ u₁ u₂ u₃` is EvC-POSITIVE-SEMIDEFINITE for `l₁,l₂,l₃ ≥ 0`, EVERY `u₁,u₂,u₃`:
    the trunk positivity per eigenprojection (`projC_nonneg`), summed with nonnegative weights. -/
theorem specOp3_nonneg {l₁ l₂ l₃ : Cut} (h₁ : 0 ≤ l₁) (h₂ : 0 ≤ l₂) (h₃ : 0 ≤ l₃)
    (u₁ u₂ u₃ p : STVC) : 0 ≤ EvC (specOp3 l₁ l₂ l₃ u₁ u₂ u₃ p) p := by
  show 0 ≤ EvC ((l₁ • projC u₁ + l₂ • projC u₂ + l₃ • projC u₃) p) p
  rw [LinearMap.add_apply, LinearMap.add_apply, EvC_add_left, EvC_add_left,
    LinearMap.smul_apply, LinearMap.smul_apply, LinearMap.smul_apply,
    EvC_smul_left, EvC_smul_left, EvC_smul_left]
  exact add_nonneg (add_nonneg (mul_nonneg h₁ (projC_nonneg u₁ p))
    (mul_nonneg h₂ (projC_nonneg u₂ p))) (mul_nonneg h₃ (projC_nonneg u₃ p))

/-- ★ THE COMPOSITION LAW — `specOp3 l₁ l₂ l₃ u₁ u₂ u₃ ∘ specOp3 l₁ l₂ l₃ u₁ u₂ u₃ =
    specOp3 (l₁²)(l₂²)(l₃²) u₁ u₂ u₃` — REQUIRES the eigen-triple `{u₁,u₂,u₃}` to be EvC-ORTHONORMAL.
    All three cross terms (`u₁·u₂`, `u₁·u₃`, `u₂·u₃`) vanish; the diagonal eigenvalues square
    independently — the spectral decomposition over an orthonormal eigen-triple. -/
theorem specOp3_comp {l₁ l₂ l₃ : Cut} {u₁ u₂ u₃ : STVC}
    (h11 : EvC u₁ u₁ = 1) (h22 : EvC u₂ u₂ = 1) (h33 : EvC u₃ u₃ = 1)
    (h12 : EvC u₁ u₂ = 0) (h13 : EvC u₁ u₃ = 0) (h23 : EvC u₂ u₃ = 0) :
    (specOp3 l₁ l₂ l₃ u₁ u₂ u₃).comp (specOp3 l₁ l₂ l₃ u₁ u₂ u₃)
      = specOp3 (l₁*l₁) (l₂*l₂) (l₃*l₃) u₁ u₂ u₃ := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOp3_apply, specOp3_apply, specOp3_apply]
  have e1 : EvC u₁ ((l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂ + (l₃ * EvC u₃ p) • u₃)
      = l₁ * EvC u₁ p := by
    rw [EvC_add_right, EvC_add_right, EvC_smul_right, EvC_smul_right, EvC_smul_right,
      h11, h12, h13]; ring
  have e2 : EvC u₂ ((l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂ + (l₃ * EvC u₃ p) • u₃)
      = l₂ * EvC u₂ p := by
    rw [EvC_add_right, EvC_add_right, EvC_smul_right, EvC_smul_right, EvC_smul_right,
      h22, EvC_symm u₂ u₁, h12, h23]; ring
  have e3 : EvC u₃ ((l₁ * EvC u₁ p) • u₁ + (l₂ * EvC u₂ p) • u₂ + (l₃ * EvC u₃ p) • u₃)
      = l₃ * EvC u₃ p := by
    rw [EvC_add_right, EvC_add_right, EvC_smul_right, EvC_smul_right, EvC_smul_right,
      h33, EvC_symm u₃ u₁, h13, EvC_symm u₃ u₂, h23]; ring
  rw [e1, e2, e3,
    show l₁ * (l₁ * EvC u₁ p) = l₁ * l₁ * EvC u₁ p from by ring,
    show l₂ * (l₂ * EvC u₂ p) = l₂ * l₂ * EvC u₂ p from by ring,
    show l₃ * (l₃ * EvC u₃ p) = l₃ * l₃ * EvC u₃ p from by ring]

/-- The `u₃`-eigenblock reader: for an EvC-orthonormal triple, `EvC (specOp3 l₁ l₂ l₃ u₁ u₂ u₃ u₃) u₃ = l₃`. -/
theorem specOp3_read₃ {l₁ l₂ l₃ : Cut} {u₁ u₂ u₃ : STVC}
    (h33 : EvC u₃ u₃ = 1) (h13 : EvC u₁ u₃ = 0) (h23 : EvC u₂ u₃ = 0) :
    EvC (specOp3 l₁ l₂ l₃ u₁ u₂ u₃ u₃) u₃ = l₃ := by
  rw [specOp3_apply, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left, EvC_smul_left,
    h33, h13, h23]
  ring

/-- ★★ THE RANK-3 SPECTRAL SQUARE ROOT: for an EvC-orthonormal triple `{u₁,u₂,u₃}` and `c₁,c₂,c₃ ≥ 0`,
    `specOp3 (cutSqrt c₁)(cutSqrt c₂)(cutSqrt c₃) u₁ u₂ u₃` is a positive operator square root of
    `specOp3 c₁ c₂ c₃ u₁ u₂ u₃` — the scalar `cutSqrt` applied per EvC-orthogonal eigenprojection.
    The rank-2 → rank-3 inductive step toward the full n-dim spectral existence, with NO Mathlib
    spectral theory; the spectral root is `cutSqrt` per eigenvalue on its EvC-orthogonal eigenprojection. -/
theorem specOp3_op_sqrt {c₁ c₂ c₃ : Cut} (hc₁ : 0 ≤ c₁) (hc₂ : 0 ≤ c₂) (hc₃ : 0 ≤ c₃)
    {u₁ u₂ u₃ : STVC}
    (h11 : EvC u₁ u₁ = 1) (h22 : EvC u₂ u₂ = 1) (h33 : EvC u₃ u₃ = 1)
    (h12 : EvC u₁ u₂ = 0) (h13 : EvC u₁ u₃ = 0) (h23 : EvC u₂ u₃ = 0) :
    IsEvCOpSqrt (specOp3 (cutSqrt c₁) (cutSqrt c₂) (cutSqrt c₃) u₁ u₂ u₃)
      (specOp3 c₁ c₂ c₃ u₁ u₂ u₃) := by
  refine ⟨specOp3_isEvCSymm _ _ _ _ _ _,
    specOp3_nonneg (cutSqrt_nonneg c₁) (cutSqrt_nonneg c₂) (cutSqrt_nonneg c₃) u₁ u₂ u₃, ?_⟩
  rw [specOp3_comp h11 h22 h33 h12 h13 h23, cutSqrt_sq hc₁, cutSqrt_sq hc₂, cutSqrt_sq hc₃]

/-! ## A concrete time/space/octonion-mixing orthonormal TRIPLE. -/

/-- A concrete pure-space unit `(0, 1, 0)`, EvC-orthogonal to both `mixA` and `mixB` (which live in
    the time/octonion plane), completing a time/space/octonion-mixing EvC-orthonormal triple. -/
def mixW3 : STVC := ((0 : Cut), (1 : Cut), (0 : O Cut))

/-- `mixW3` is an EvC-unit: `0 + 1·1 + gFormC 0 0 = 1`. -/
theorem mixW3_norm : EvC mixW3 mixW3 = 1 := by
  show (0 : Cut) * 0 + (1:Cut) * 1 + gFormC 0 0 = 1
  rw [gFormC_zero_left]; norm_num

/-- `mixA` is EvC-orthogonal to `mixW3`: `(3/5)·0 + 0·1 + gFormC ((4/5)·1) 0 = 0`. -/
theorem mixA_mixW3_orth : EvC mixA mixW3 = 0 := by
  show (3/5 : Cut) * 0 + (0:Cut) * 1 + gFormC ((4/5 : Cut) • (1 : O Cut)) 0 = 0
  rw [gFormC_smul_left, gFormC_zero_right']; norm_num

/-- `mixB` is EvC-orthogonal to `mixW3`: `(4/5)·0 + 0·1 + gFormC ((−3/5)·1) 0 = 0`. -/
theorem mixB_mixW3_orth : EvC mixB mixW3 = 0 := by
  show (4/5 : Cut) * 0 + (0:Cut) * 1 + gFormC ((-3/5 : Cut) • (1 : O Cut)) 0 = 0
  rw [gFormC_smul_left, gFormC_zero_right']; norm_num

/-- ★ NON-VACUITY: the concrete RANK-3 spectral square root over the time/space/octonion-mixing
    orthonormal triple `{mixA, mixB, mixW3}` — `specOp3 2 3 5 mixA mixB mixW3` is the positive operator
    square root of `specOp3 4 9 25 mixA mixB mixW3`. Three eigenvalues, an eigenbasis spanning all
    three sectors (time/octonion via `mixA,mixB`, space via `mixW3`), the spectral root read off per
    eigenvalue. -/
theorem specOp3_mix_witness :
    IsEvCOpSqrt (specOp3 (2:Cut) (3:Cut) (5:Cut) mixA mixB mixW3)
      (specOp3 (4:Cut) (9:Cut) (25:Cut) mixA mixB mixW3) := by
  have h := specOp3_op_sqrt (c₁ := (4:Cut)) (c₂ := (9:Cut)) (c₃ := (25:Cut))
    (by norm_num) (by norm_num) (by norm_num)
    mixA_norm mixB_norm mixW3_norm mix_orth mixA_mixW3_orth mixB_mixW3_orth
  rwa [show cutSqrt (4:Cut) = 2 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (9:Cut) = 3 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (25:Cut) = 5 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

end

end Phys.Algebra
