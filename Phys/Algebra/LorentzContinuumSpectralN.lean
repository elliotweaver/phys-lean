/-
  Phys.Algebra.LorentzContinuumSpectralN — N68: THE GENERAL RANK-`n` SPECTRAL OPERATOR `specOpN`
  (the inductive backbone of the full n-dim spectral existence) over the DERIVED ℝ `Cut` and the
  terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the 10-dimension-mixing spectral square root + rank-3 spectral operator
  node (N67). N49–N67 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the 2-block / octonion-internal coordinate-diagonal operator square roots (N61–N62);
    • ★ the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the RANK-2 rotated-basis spectral operator `specOp`
      + `specOp_comp` + the spectral square root `specOp_op_sqrt` (N63);
    • the general/equal-diagonal/full-unequal-diagonal `(t,x)`-plane eigenbasis `txOp` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` of a composite isometry (N66);
    • ★ the FIRST 10-dim-MIXING spectral square root (`mixA`/`mixB`/`specOp_mix_op_sqrt`) + the
      RANK-3 spectral operator `specOp3` (the rank-2 → rank-3 lever) (N67).

  ── THE TARGET (N68) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE (that an
  ARBITRARY EvC-self-adjoint EvC-positive-semidefinite operator decomposes as `Σᵢ λᵢ Pᵢ` over an
  EvC-orthonormal eigenbasis), the GLOBAL polar/KAK assembly for an arbitrary `g`, connectedness, the
  GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP
  §N68 priority (i)) confirms: the EXISTENCE of an eigenbasis for an ARBITRARY self-adjoint operator
  over `Cut`, the connectedness/surjectivity/exhaustion, each need group-manifold machinery Mathlib
  lacks over `Cut` — those are the genuine HEAVY sub-nodes (childed N69). N63 / N67 banked the spectral
  operator `Σᵢ λᵢ Pᵢ` and its `cutSqrt`-per-eigenprojection square root only at the FIXED ranks 2 and
  3 (`specOp`, `specOp3`), each a hand-written sum of a fixed number of scaled projections. The
  immediately-bankable, theory-native STRUCTURAL escalation the full existence consumes is exactly the
  step from a fixed-rank sum to the GENERAL rank-`n` spectral operator — a `Fin n`-indexed
  `∑ i, (l i) • projC (u i)`, with its self-adjointness, positivity, the composition law over a
  mutually-EvC-orthonormal FAMILY, and the `cutSqrt`-per-eigenvalue square root, ALL at arbitrary
  finite rank. With it the diagonal `Σᵢ λᵢ Pᵢ` and its root hold at EVERY finite rank — the diagonal
  spectral backbone of the existence proof — and the banked `specOp` (n=2) and `specOp3` (n=3) are its
  n=2,3 instances (`specOpN_eq_specOp`/`specOpN_eq_specOp3`).

  ── THE TRUNK REFRAME (THE ONE LAW): the spectral root IS `cutSqrt` per EvC-orthogonal projection ──
  The classical spectral theorem writes a positive self-adjoint operator as `g = Σ λᵢ Pᵢ` over its
  EvC-orthogonal eigenprojections and its positive square root as `√g = Σ √λᵢ Pᵢ`. The trunk supplies
  every ingredient with NO spectral analysis at ANY rank: the EvC-orthogonal projection `projC u`
  (N63); the rank-`n` spectral operator as a `Finset`-sum of scaled projections; EvC-self-adjointness
  closed under `•`/`+` and now `∑` (the reference form `EvC` is bilinear, so it commutes with finite
  sums via `map_sum` — `EvC_sum_left`/`EvC_sum_right`); positivity per projection (the order of the
  derived ℝ, summed by `Finset.sum_nonneg`); the composition law from mutual orthonormality (every
  off-diagonal cross term `EvC (u i) (u j) = 0` for `i ≠ j` collapses the double sum to the diagonal
  via `Finset.sum_ite_eq` — `specOpN_EvC_read`); and the scalar `cutSqrt` applied per eigenvalue (N57).
  The eigenbasis enters ONLY through the abstract orthonormality matrix `EvC (u i) (u j) = δᵢⱼ`, so the
  rank-`n` law is fully general — the octonion block, the time/space mixing, any finite eigenbasis.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    EvCRight/EvCLeft     — the reference form bundled as a `Cut`-linear map in each slot (for `map_sum`).
    EvC_sum_right/_left  — `EvC` commutes with finite sums in each slot (bilinearity → `Finset.sum`).
    specOpN l u          — ★ THE GENERAL RANK-`n` SPECTRAL OPERATOR `∑ i, (l i) • projC (u i)` — eigenvalue
                           `l i` on the EvC-orthogonal eigenprojection `projC (u i)`. The genuine
                           generalization of N63 `specOp` (n=2) and N67 `specOp3` (n=3) to arbitrary `n`.
    specOpN_apply        — its action `p ↦ ∑ i, (l i · EvC (u i) p) • u i`.
    specOpN_isEvCSymm    — EvC-self-adjoint for EVERY family `u` (closure of `projC`'s symmetry under `∑`).
    specOpN_nonneg       — EvC-positive-semidefinite for `∀ i, 0 ≤ l i`, EVERY family (the trunk positivity, summed).
    specOpN_EvC_read     — the family eigenblock reader: for an EvC-orthonormal family,
                           `EvC (u k) (specOpN l u q) = l k · EvC (u k) q` (the off-diagonal collapse).
    specOpN_comp         — ★ THE COMPOSITION LAW over a mutually-EvC-orthonormal FAMILY:
                           `specOpN l u ∘ specOpN l u = specOpN (l·l) u` — all off-diagonal cross terms vanish.
    specOpN_read         — the diagonal eigenblock reader `EvC (specOpN l u (u k)) (u k) = l k`.
    specOpN_op_sqrt      — ★★ THE GENERAL n-DIM SPECTRAL SQUARE ROOT: for an EvC-orthonormal family and
                           `∀ i, 0 ≤ c i`, `specOpN (cutSqrt ∘ c) u` is a positive operator square root of
                           `specOpN c u` — `cutSqrt` per EvC-orthogonal eigenprojection, at ARBITRARY rank `n`.
    mixW4 ...            — a CONCRETE octonion-imaginary EvC-unit `(0,0,e₂)`, EvC-orthogonal to `mixA`/`mixB`
                           (octonion-real) and `mixW3` (pure-space), completing a 4-frame.
    mix4 / mix4_orthonormal — the concrete time/space/octonion-real/octonion-im EvC-orthonormal 4-frame.
    specOpN_mix4_witness — ★ NON-VACUITY: the RANK-4 spectral square root over `{mixA,mixB,mixW3,mixW4}` —
                           `specOpN ![2,3,5,8] mix4` is the positive operator square root of `specOpN ![4,9,25,64] mix4`.
    specOpN_eq_specOp/_eq_specOp3 — ★ SUBSUMPTION: the general rank-`n` law RECOVERS the banked rank-2 `specOp`
                           (N63) and rank-3 `specOp3` (N67) as its `n=2,3` instances — one law, the prior
                           spectral objects are its special cases.

  ── THE W1 HEAVY REMAINDER (childed N69, an honest dissolution ticket, NOT closed here) ──
  The FULL n-dim spectral EXISTENCE — that an ARBITRARY EvC-self-adjoint EvC-positive-semidefinite
  operator HAS an EvC-orthonormal eigenbasis so it equals `specOpN c u` for some `c,u` (no Mathlib
  analogue over `Cut`) — + the GLOBAL polar/KAK assembly for an arbitrary `g` + the compact part via
  CONNECTEDNESS + the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component
  `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion are the genuine HEAVY group-manifold core,
  childed onto the chain tail. THIS node banks the GENERAL rank-`n` spectral operator — the diagonal
  `Σᵢ λᵢ Pᵢ` and its square root at EVERY finite rank, the inductive backbone the existence proof assembles.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive self-adjoint operator decomposes
  diagonally over its orthogonal eigenprojections at any finite rank and its positive square root is
  computed eigenvalue-by-eigenvalue, is standard spectral theory. Here the rank-`n` spectral operator,
  its self-adjointness/positivity/composition/square-root, and the concrete rank-4 mixing eigenbasis
  DESCEND from the banked `projC` (N63) + scalar `cutSqrt` (N57) + reference form `EvC` (N58) + the
  octonion bilinear `gFormC` over the DERIVED ℝ `Cut` and `O Cut` — NO posited operator calculus, NO
  Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content. `Finset.sum`,
  `Module.End`, `LinearMap`, `map_sum` are standard Mathlib MACHINERY operating on the DERIVED objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenprojection / eigenbasis / diagonal / orthonormal / projection /
  square-root / self-adjoint / positive-semidefinite / isometry / Spin / SO(9) / KAK / polar / Cartan /
  mixing / dimension / rank": what remains is the theorem that, over the derived complete ordered field
  `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric positive-definite bilinear form `EvC`,
  the `Cut`-linear `projC u := p ↦ (EvC u p)•u`, and the `Fin n`-indexed `specOpN l u := ∑ i, (l i)•projC (u i)`:
  `specOpN l u` is `EvC`-symmetric, `0 ≤ EvC (specOpN l u p) p` for `∀ i, 0 ≤ l i`, and for a family with
  `EvC (u i) (u j) = δᵢⱼ` composes to `specOpN (l·l) u`; hence for `∀ i, 0 ≤ c i`, `specOpN (cutSqrt ∘ c) u`
  squares to `specOpN c u`; concretely over `{mixA,mixB,mixW3,mixW4}`, `specOpN ![2,3,5,8] mix4` squares
  to `specOpN ![4,9,25,64] mix4`; and `specOpN` at `n=2,3` equals `specOp`/`specOp3`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumSpectralMix

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The reference form bundled as a `Cut`-linear map in each slot — for `map_sum`. -/

/-- The reference form `EvC q ·` bundled as a `Cut`-linear map (right slot). The bilinearity of `EvC`
    (N63 `EvC_add_right`/N58 `EvC_smul_right`) makes it a `LinearMap`, so it commutes with finite sums. -/
def EvCRight (q : STVC) : STVC →ₗ[Cut] Cut where
  toFun := fun p => EvC q p
  map_add' := EvC_add_right q
  map_smul' := fun c p => by simpa using EvC_smul_right c q p

/-- The reference form `EvC · q` bundled as a `Cut`-linear map (left slot). -/
def EvCLeft (q : STVC) : STVC →ₗ[Cut] Cut where
  toFun := fun p => EvC p q
  map_add' := fun p₁ p₂ => EvC_add_left p₁ p₂ q
  map_smul' := fun c p => by simpa using EvC_smul_left c p q

/-- `EvC` commutes with finite sums in the right slot: `EvC q (∑ i, f i) = ∑ i, EvC q (f i)`. The
    bilinearity of the reference form, lifted to `Finset.sum` via `map_sum`. -/
theorem EvC_sum_right (q : STVC) {ι : Type*} (s : Finset ι) (f : ι → STVC) :
    EvC q (∑ i ∈ s, f i) = ∑ i ∈ s, EvC q (f i) :=
  map_sum (EvCRight q) f s

/-- `EvC` commutes with finite sums in the left slot: `EvC (∑ i, f i) q = ∑ i, EvC (f i) q`. -/
theorem EvC_sum_left (q : STVC) {ι : Type*} (s : Finset ι) (f : ι → STVC) :
    EvC (∑ i ∈ s, f i) q = ∑ i ∈ s, EvC (f i) q :=
  map_sum (EvCLeft q) f s

/-! ## The general rank-`n` spectral operator. -/

/-- ★ THE GENERAL RANK-`n` SPECTRAL OPERATOR diagonal in an EvC-orthonormal eigen-FAMILY `{u i}`:
    `specOpN l u := ∑ i, (l i) • projC (u i)` — eigenvalue `l i` on the EvC-orthogonal eigenprojection
    `projC (u i)`. The genuine generalization beyond N63's rank-2 `specOp` and N67's rank-3 `specOp3`:
    here the eigenbasis is a `Fin n`-indexed family of arbitrary finite length — the inductive backbone
    of the full n-dim spectral existence (rank-`n` as `n` scaled projections). -/
def specOpN {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) : Module.End Cut STVC :=
  ∑ i, l i • projC (u i)

/-- The rank-`n` spectral operator acts as `p ↦ ∑ i, (l i · EvC (u i) p) • u i`. -/
theorem specOpN_apply {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (p : STVC) :
    specOpN l u p = ∑ i, (l i * EvC (u i) p) • u i := by
  show (∑ i, l i • projC (u i)) p = _
  rw [LinearMap.sum_apply]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [LinearMap.smul_apply, projC_apply, smul_smul]

/-- `specOpN l u` is EvC-SELF-ADJOINT for EVERY family `u` (closure of `projC`'s symmetry under the
    finite sum — `EvC` commutes with `∑` in both slots, `EvC_sum_left`/`EvC_sum_right`). -/
theorem specOpN_isEvCSymm {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) :
    IsEvCSymm (specOpN l u) := by
  intro p q
  rw [specOpN_apply, specOpN_apply, EvC_sum_left, EvC_sum_right]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [EvC_smul_left, EvC_smul_right, EvC_symm p (u i)]
  ring

/-- `specOpN l u` is EvC-POSITIVE-SEMIDEFINITE for `∀ i, 0 ≤ l i`, EVERY family `u`: the trunk
    positivity per eigenprojection (`(EvC (u i) p)²·l i ≥ 0`), summed by `Finset.sum_nonneg`. -/
theorem specOpN_nonneg {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 ≤ l i) (u : Fin n → STVC) (p : STVC) :
    0 ≤ EvC (specOpN l u p) p := by
  rw [specOpN_apply, EvC_sum_left]
  apply Finset.sum_nonneg
  intro i _
  rw [EvC_smul_left, mul_assoc]
  exact mul_nonneg (hl i) (mul_self_nonneg _)

/-- The FAMILY eigenblock reader: for a mutually-EvC-orthonormal family (`EvC (u i) (u j) = δᵢⱼ`),
    `EvC (u k) (specOpN l u q) = l k · EvC (u k) q`. Every off-diagonal term vanishes — the double
    sum collapses to the diagonal via `Finset.sum_ite_eq`. The orthonormality lever at arbitrary rank. -/
theorem specOpN_EvC_read {n : ℕ} {l : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (q : STVC) (k : Fin n) :
    EvC (u k) (specOpN l u q) = l k * EvC (u k) q := by
  rw [specOpN_apply, EvC_sum_right]
  rw [Finset.sum_congr rfl (g := fun i => if k = i then l i * EvC (u i) q else 0)
    (fun i _ => by rw [EvC_smul_right, horth k i]; split <;> simp_all)]
  rw [Finset.sum_ite_eq Finset.univ k (fun i => l i * EvC (u i) q)]
  simp

/-- ★ THE COMPOSITION LAW — `specOpN l u ∘ specOpN l u = specOpN (l·l) u` — REQUIRES the eigen-family
    `{u i}` to be mutually EvC-ORTHONORMAL (`EvC (u i) (u j) = δᵢⱼ`). All off-diagonal cross terms vanish
    (`specOpN_EvC_read`); the diagonal eigenvalues square independently — the spectral decomposition over
    an orthonormal eigen-family at arbitrary rank. -/
theorem specOpN_comp {n : ℕ} {l : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN l u).comp (specOpN l u) = specOpN (fun i => l i * l i) u := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOpN_apply l u (specOpN l u p),
    specOpN_apply (fun i => l i * l i) u p]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [specOpN_EvC_read horth p i]
  congr 1
  ring

/-- The diagonal eigenblock reader: for an EvC-orthonormal family, `EvC (specOpN l u (u k)) (u k) = l k`. -/
theorem specOpN_read {n : ℕ} {l : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) :
    EvC (specOpN l u (u k)) (u k) = l k := by
  rw [EvC_symm, specOpN_EvC_read horth (u k) k, horth k k]
  simp

/-- ★★ THE GENERAL n-DIM SPECTRAL SQUARE ROOT: for a mutually-EvC-orthonormal eigen-family `{u i}` and
    `∀ i, 0 ≤ c i`, `specOpN (fun i => cutSqrt (c i)) u` is a positive operator square root of
    `specOpN c u` — the scalar `cutSqrt` applied per EvC-orthogonal eigenprojection, at ARBITRARY finite
    rank `n`. The inductive backbone of the full n-dim spectral existence: it is EvC-self-adjoint
    (`specOpN_isEvCSymm`), EvC-positive-semidefinite (`specOpN_nonneg`, each `cutSqrt ≥ 0`), and squares
    back (`specOpN_comp` + `cutSqrt_sq`). NO Mathlib spectral theory; the spectral root is `cutSqrt` per
    eigenvalue on its EvC-orthogonal eigenprojection, at every finite rank. -/
theorem specOpN_op_sqrt {n : ℕ} {c : Fin n → Cut} (hc : ∀ i, 0 ≤ c i) {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) u) (specOpN c u) := by
  refine ⟨specOpN_isEvCSymm _ _, specOpN_nonneg (fun i => cutSqrt_nonneg (c i)) u, ?_⟩
  rw [specOpN_comp horth]
  congr 1
  funext i
  rw [cutSqrt_sq (hc i)]

/-! ## Concrete rank-4 witness over a time/space/octonion-real/octonion-im orthonormal 4-frame. -/

/-- A concrete EvC-unit `(0,0,e₂)` — the octonion IMAGINARY unit `e₂`, EvC-orthogonal to the
    octonion-real `1₍O₎` used by `mixA,mixB` (`e2_gFormC_one`) and to the pure-space `mixW3`.
    Completes a time/space/octonion-real/octonion-im EvC-orthonormal 4-frame. -/
def mixW4 : STVC := ((0 : Cut), (0 : Cut), (CD.e2 : O Cut))

/-- `mixW4` is an EvC-unit: `0 + 0 + gFormC e₂ e₂ = 1` (via the banked `e2_gFormC_self`). -/
theorem mixW4_norm : EvC mixW4 mixW4 = 1 := by
  show (0 : Cut) * 0 + (0:Cut) * 0 + gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = 1
  rw [e2_gFormC_self]; norm_num

/-- `mixA` is EvC-orthogonal to `mixW4`: `(3/5)·0 + 0 + (4/5)·gFormC 1 e₂ = 0` (`e2_gFormC_one`). -/
theorem mixA_mixW4_orth : EvC mixA mixW4 = 0 := by
  show (3/5 : Cut) * 0 + (0:Cut) * 0 + gFormC ((4/5 : Cut) • (1 : O Cut)) (CD.e2 : O Cut) = 0
  rw [gFormC_smul_left, e2_gFormC_one]; norm_num

/-- `mixB` is EvC-orthogonal to `mixW4`: `(4/5)·0 + 0 + (−3/5)·gFormC 1 e₂ = 0`. -/
theorem mixB_mixW4_orth : EvC mixB mixW4 = 0 := by
  show (4/5 : Cut) * 0 + (0:Cut) * 0 + gFormC ((-3/5 : Cut) • (1 : O Cut)) (CD.e2 : O Cut) = 0
  rw [gFormC_smul_left, e2_gFormC_one]; norm_num

/-- `mixW3` is EvC-orthogonal to `mixW4`: `0 + 1·0 + gFormC 0 e₂ = 0`. -/
theorem mixW3_mixW4_orth : EvC mixW3 mixW4 = 0 := by
  show (0 : Cut) * 0 + (1:Cut) * 0 + gFormC (0 : O Cut) (CD.e2 : O Cut) = 0
  rw [gFormC_zero_left]; norm_num

/-- The concrete time/space/octonion-real/octonion-im 4-frame `![mixA, mixB, mixW3, mixW4]`. -/
def mix4 : Fin 4 → STVC := ![mixA, mixB, mixW3, mixW4]

/-- The orthonormality matrix of the concrete 4-frame: `EvC (mix4 i) (mix4 j) = δᵢⱼ`. All sixteen
    pairings reduce to the banked unit/orthogonality facts of `{mixA,mixB,mixW3,mixW4}`. -/
theorem mix4_orthonormal (i j : Fin 4) : EvC (mix4 i) (mix4 j) = if i = j then 1 else 0 := by
  fin_cases i <;> fin_cases j
  · show EvC mixA mixA = 1; rw [mixA_norm]
  · show EvC mixA mixB = 0; rw [mix_orth]
  · show EvC mixA mixW3 = 0; rw [mixA_mixW3_orth]
  · show EvC mixA mixW4 = 0; rw [mixA_mixW4_orth]
  · show EvC mixB mixA = 0; rw [EvC_symm, mix_orth]
  · show EvC mixB mixB = 1; rw [mixB_norm]
  · show EvC mixB mixW3 = 0; rw [mixB_mixW3_orth]
  · show EvC mixB mixW4 = 0; rw [mixB_mixW4_orth]
  · show EvC mixW3 mixA = 0; rw [EvC_symm, mixA_mixW3_orth]
  · show EvC mixW3 mixB = 0; rw [EvC_symm, mixB_mixW3_orth]
  · show EvC mixW3 mixW3 = 1; rw [mixW3_norm]
  · show EvC mixW3 mixW4 = 0; rw [mixW3_mixW4_orth]
  · show EvC mixW4 mixA = 0; rw [EvC_symm, mixA_mixW4_orth]
  · show EvC mixW4 mixB = 0; rw [EvC_symm, mixB_mixW4_orth]
  · show EvC mixW4 mixW3 = 0; rw [EvC_symm, mixW3_mixW4_orth]
  · show EvC mixW4 mixW4 = 1; rw [mixW4_norm]

/-- ★ NON-VACUITY: the RANK-4 spectral square root over the time/space/octonion-real/octonion-im
    EvC-orthonormal 4-frame `{mixA, mixB, mixW3, mixW4}` — `specOpN ![2,3,5,8] mix4` is the positive
    operator square root of `specOpN ![4,9,25,64] mix4`. Four eigenvalues, an eigenbasis spanning all
    four sectors, the spectral root read off per eigenvalue at rank 4. -/
theorem specOpN_mix4_witness :
    IsEvCOpSqrt (specOpN ![(2:Cut),3,5,8] mix4) (specOpN ![(4:Cut),9,25,64] mix4) := by
  have h := specOpN_op_sqrt (c := ![(4:Cut),9,25,64]) (by
    intro i; fin_cases i <;> norm_num) mix4_orthonormal
  have e : (fun i => cutSqrt (![(4:Cut),9,25,64] i)) = ![(2:Cut),3,5,8] := by
    funext i
    fin_cases i
    · show cutSqrt (4:Cut) = 2; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (9:Cut) = 3; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (25:Cut) = 5; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (64:Cut) = 8; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
  rwa [e] at h

/-! ## Subsumption: the general rank-`n` law recovers the banked rank-2 / rank-3 operators. -/

/-- ★ SUBSUMPTION — the general rank-`n` `specOpN` at `n = 2` IS the banked rank-2 `specOp` (N63):
    `specOpN ![l₁,l₂] ![u₁,u₂] = specOp l₁ l₂ u₁ u₂`. The prior rank-2 spectral object is the `n=2`
    instance of one general law. -/
theorem specOpN_eq_specOp (l₁ l₂ : Cut) (u₁ u₂ : STVC) :
    specOpN ![l₁,l₂] ![u₁,u₂] = specOp l₁ l₂ u₁ u₂ := by
  show ∑ i, (![l₁,l₂] i) • projC (![u₁,u₂] i) = l₁ • projC u₁ + l₂ • projC u₂
  rw [Fin.sum_univ_two]; rfl

/-- ★ SUBSUMPTION — the general rank-`n` `specOpN` at `n = 3` IS the banked rank-3 `specOp3` (N67):
    `specOpN ![l₁,l₂,l₃] ![u₁,u₂,u₃] = specOp3 l₁ l₂ l₃ u₁ u₂ u₃`. The prior rank-3 spectral object is
    the `n=3` instance of one general law — the rank-1/2/3 spectral objects of the chain are now the
    `n=1,2,3` cases of a single rank-`n` derivation. -/
theorem specOpN_eq_specOp3 (l₁ l₂ l₃ : Cut) (u₁ u₂ u₃ : STVC) :
    specOpN ![l₁,l₂,l₃] ![u₁,u₂,u₃] = specOp3 l₁ l₂ l₃ u₁ u₂ u₃ := by
  show ∑ i, (![l₁,l₂,l₃] i) • projC (![u₁,u₂,u₃] i)
      = l₁ • projC u₁ + l₂ • projC u₂ + l₃ • projC u₃
  rw [Fin.sum_univ_three]; rfl

end

end Phys.Algebra
