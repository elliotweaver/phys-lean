/-
  Phys.Algebra.LorentzContinuumPolarPositive — N86: THE GLOBAL POLAR POSITIVE PART — the
  form-adjoint composite `g*g` is EvC-self-adjoint AND positive, so by the FULL spectral
  existence (N85) it equals `specOpN c u` for an EvC-ORTHONORMAL eigen-family with EVERY
  eigenvalue `0 ≤ c i`, and its POSITIVE OPERATOR SQUARE ROOT exists and is
  `specOpN (cutSqrt ∘ c) u` (N68) — the `p^{1/2}` factor of the polar decomposition
  `g = k · p^{1/2}` — over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the FULL n-DIM SPECTRAL EXISTENCE node (N85). N49–N85 banked, over
  the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint (`comp_isEvCSymm`) +
      EvC-positive-semidefinite (`comp_nonneg`) (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-`n` spectral operator `specOpN`
      + its action/symmetry/positivity/composition + the spectral square root `specOpN_op_sqrt` (N63/N68);
    • the FULL n-DIM SPECTRAL EXISTENCE `stvc_selfadj_specExists`: every EvC-self-adjoint `g`
      equals `specOpN l u` for an EvC-ORTHONORMAL eigen-family (N85).

  ── THE TARGET (N86) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the GLOBAL polar/KAK assembly
  `g = k · p^{1/2}` for an arbitrary `g ∈ qvIsomMonoidC`, the compact part via CONNECTEDNESS,
  the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component
  `≤ genIsomMonoidC2`), and the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N86
  priority (i)) confirms: the GLOBAL POSITIVE PART of the polar decomposition is now LIGHT — the
  spectral input it needs is banked (N85), the operator square root is banked (N68), the
  form-adjoint positivity is banked (N59). THIS node banks the global positive part: the operator
  `g*g` decomposes spectrally with nonneg eigenvalues and ALWAYS has a positive operator square
  root, plus the strict-positivity-via-injectivity lever (the invertibility prerequisite the
  inverse `(p^{1/2})⁻¹` and the compact part `k := g·(p^{1/2})⁻¹` consume). The remaining HEAVY
  remainder — the resolution-of-identity `∑ projC u_i = id`, the operator inverse `(p^{1/2})⁻¹`,
  the compact part `k` with `k*k = 1`, CONNECTEDNESS, the GLOBAL reverse surjectivity, and the
  `Spin(9)→SO(9)` exhaustion — is the genuine group-manifold core, childed onto the chain tail.

  ── THE TRUNK REFRAME (THE ONE LAW): the positive part IS the spectral existence + cutSqrt ──
  The classical polar decomposition writes an arbitrary operator `g = k · p^{1/2}` with
  `p = g*g` positive and `k` orthogonal. The hard input — that `p = g*g` HAS a positive operator
  square root — is precisely the spectral theorem applied to the positive-semidefinite `g*g`:
  diagonalize `g*g = ∑ c_i P_i` over its EvC-orthonormal eigenprojections, take `√c_i ≥ 0` per
  eigenvalue. The trunk supplies every ingredient with NO spectral analysis: `g*g` is
  EvC-self-adjoint and positive because `EvC (g p)(g p) ≥ 0` is the Born self-overlap positivity
  (N56→N58→N59); the eigen-decomposition is N85; the per-eigenvalue root is `cutSqrt` (N57). The
  eigenvalues are nonneg because the diagonal reader `specOpN_read` reads `c_k = EvC (g*g u_k) u_k
  ≥ 0`. The positive square root `specOpN (cutSqrt ∘ c) u` then exists by N68 `specOpN_op_sqrt`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    specOpN_eigenvector       — the eigenvector action `specOpN c u (u k) = c k • u k` over an
                                EvC-orthonormal family (the off-diagonal collapse to one term).
    specOpN_orth_ne_zero      — a unit eigenvector (`EvC (u k)(u k) = 1`) is nonzero.
    specExists_eigen_nonneg   — an EvC-positive-semidefinite `specOpN c u` has every `0 ≤ c k`
                                (the diagonal reader `specOpN_read` evaluated at the eigenvector).
    specExists_eigen_ne_zero  — an INJECTIVE `specOpN c u` has every `c k ≠ 0` (a zero eigenvalue
                                kills its nonzero eigenvector — `specOpN c u (u k) = 0 = specOpN c u 0`).
    specExists_eigen_pos      — ★ STRICT POSITIVITY: positive-semidefinite + injective ⟹ `0 < c k`
                                (the invertibility lever toward `(p^{1/2})⁻¹` and the compact part `k`).
    comp_specExists_nonneg    — ★★ THE GLOBAL POSITIVE PART (existence form): for `IsEvCAdjoint g h`,
                                `g*g = h∘g = specOpN c u` over an EvC-orthonormal family with every
                                `0 ≤ c i` (N85 on the EvC-self-adjoint `g*g`, positivity per N59).
    comp_op_sqrt_exists       — ★★★ THE GLOBAL POSITIVE OPERATOR SQUARE ROOT: for `IsEvCAdjoint g h`,
                                `g*g` ALWAYS has a positive operator square root (the `p^{1/2}` factor),
                                `specOpN (cutSqrt ∘ c) u` via N68 — for an ARBITRARY operator `g`, no
                                block/structured hypothesis (the N66 concrete polar lifted to GLOBAL).
    boostGenC_comp_op_sqrt_exists — ★ NON-VACUITY (W8): the self-adjoint boost generator's `g*g`
                                has a positive operator square root — the global theorem applied to a
                                concrete banked operator, not a vacuous existence statement.

  ── THE W1 HEAVY REMAINDER (childed N87, an honest dissolution ticket, NOT closed here) ──
  The resolution-of-identity `∑ projC u_i = id` (so `specOpN c u` is invertible iff every `c i ≠ 0`),
  the operator inverse `(p^{1/2})⁻¹ = specOpN (c⁻¹) u`, the compact part `k := g·(p^{1/2})⁻¹` with
  `k*k = 1`, CONNECTEDNESS of the isometry group over `Cut`, the GLOBAL reverse KAK surjectivity
  (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`), and the full `Spin(9)→SO(9)`
  exhaustion are the genuine HEAVY group-manifold core, childed onto the chain tail. THIS node banks
  the GLOBAL positive part — the `p^{1/2}`-via-existence step the full assembly consumes.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That an arbitrary `g*g` has a positive operator
  square root is the operator polar decomposition's hard half; here it is DERIVED from the fold's
  Born positivity (N56) + the spectral existence (N85) + the scalar root `cutSqrt` (N57), with NO
  Mathlib spectral theory, NO Mathlib ℝ/ℂ as content, NO posited Lorentz group, NO bridge.

  Words-removable: delete "Lorentz/polar/KAK/positive part/square-root/spectral/eigen*/self-adjoint/
  orthonormal/isometry/compact/orthogonal/Spin/SO(9)/boost" → over the derived complete ordered field
  `Cut` and the positive-definite symmetric form `EvC`, for any `Cut`-endomorphisms `g, h` of `STVC`
  with `∀ p q, EvC (g p) q = EvC p (h q)`, the composite `h∘g` equals `∑ i, (c i)•projC (u i)` for a
  family with `EvC (u i)(u j) = δᵢⱼ` and every `0 ≤ c i`, and `∑ i, cutSqrt (c i)•projC (u i)` squares
  to it; pure linear-algebra math.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumSpectralExistFull

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-- THE EIGENVECTOR ACTION: for an EvC-ORTHONORMAL eigen-family `{u i}`, the rank-`n` spectral
    operator acts diagonally, `specOpN c u (u k) = c k • u k`. The double sum in `specOpN_apply`
    collapses to the single `i = k` term — every off-diagonal `EvC (u i)(u k) = 0`. -/
theorem specOpN_eigenvector {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) :
    specOpN c u (u k) = c k • u k := by
  rw [specOpN_apply]
  rw [Finset.sum_eq_single k]
  · rw [horth k k]; simp
  · intro i _ hik
    rw [horth i k, if_neg hik, mul_zero, zero_smul]
  · intro hk; exact absurd (Finset.mem_univ k) hk

/-- A unit vector of the eigen-family (`EvC (u k)(u k) = 1`) is nonzero — else the positive-definite
    reference form `EvC` would read `1 = EvC 0 0 = 0` (N58 `EvC_eq_zero_iff`). -/
theorem specOpN_orth_ne_zero {n : ℕ} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) : u k ≠ 0 := by
  intro h0
  have hkk : EvC (u k) (u k) = 1 := by rw [horth k k]; simp
  rw [(EvC_eq_zero_iff (u k)).mpr h0] at hkk
  exact one_ne_zero hkk.symm

/-- THE EIGENVALUE NON-NEGATIVITY: if `specOpN c u` is EvC-positive-semidefinite over an
    EvC-orthonormal family, every eigenvalue `0 ≤ c k`. The diagonal reader `specOpN_read`
    (N68) reads `c k = EvC (specOpN c u (u k))(u k) ≥ 0` directly. -/
theorem specExists_eigen_nonneg {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p) (k : Fin n) : 0 ≤ c k := by
  have hk := hpos (u k)
  rwa [specOpN_read horth k] at hk

/-- THE EIGENVALUE NON-VANISHING under injectivity: if `specOpN c u` is INJECTIVE, every
    eigenvalue `c k ≠ 0`. A zero eigenvalue kills its (nonzero) unit eigenvector
    (`specOpN c u (u k) = 0 = specOpN c u 0`), contradicting injectivity. -/
theorem specExists_eigen_ne_zero {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hinj : Function.Injective (specOpN c u)) (k : Fin n) : c k ≠ 0 := by
  intro hck
  have hev : specOpN c u (u k) = specOpN c u 0 := by
    rw [specOpN_eigenvector horth k, hck, zero_smul, map_zero]
  exact specOpN_orth_ne_zero horth k (hinj hev)

/-- ★ STRICT EIGENVALUE POSITIVITY: positive-semidefinite AND injective ⟹ every `0 < c k`.
    The invertibility lever toward the operator inverse `(p^{1/2})⁻¹` and the compact part
    `k := g·(p^{1/2})⁻¹`: a positive-definite operator's eigenvalues are strictly positive. -/
theorem specExists_eigen_pos {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p) (hinj : Function.Injective (specOpN c u)) (k : Fin n) :
    0 < c k :=
  lt_of_le_of_ne (specExists_eigen_nonneg horth hpos k)
    (Ne.symm (specExists_eigen_ne_zero horth hinj k))

/-- ★★ THE GLOBAL POSITIVE PART (existence form): for an arbitrary operator `g` with an EvC-adjoint
    `h` (`IsEvCAdjoint g h`), the form-adjoint composite `g*g = h∘g` equals `specOpN c u` for an
    EvC-ORTHONORMAL eigen-family `{u i}` with EVERY eigenvalue `0 ≤ c i`. The spectral existence N85
    on the EvC-self-adjoint `g*g` (N59 `comp_isEvCSymm`), with eigenvalue-positivity from N59
    `comp_nonneg` (the Born self-overlap positivity at the operator level) read off per eigenvector. -/
theorem comp_specExists_nonneg (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 ≤ c i) ∧ h.comp g = specOpN c u := by
  obtain ⟨n, c, u, horth, heq⟩ := stvc_selfadj_specExists H.comp_isEvCSymm
  refine ⟨n, c, u, horth, ?_, heq⟩
  intro k
  apply specExists_eigen_nonneg horth ?_ k
  intro p
  rw [← heq]
  exact H.comp_nonneg p

/-- ★★★ THE GLOBAL POSITIVE OPERATOR SQUARE ROOT — the `p^{1/2}` factor of the polar decomposition.
    For an ARBITRARY operator `g` with an EvC-adjoint `h`, the positive-semidefinite `g*g = h∘g`
    ALWAYS has a positive operator square root `specOpN (cutSqrt ∘ c) u` (N68 `specOpN_op_sqrt` on
    the nonneg-eigenvalue spectral decomposition of `g*g`). The N66 concrete polar positive part
    lifted to the GLOBAL case — no block/structured hypothesis, an arbitrary `g`. This is the
    `p^{1/2}`-via-existence step the global polar/KAK assembly `g = k·p^{1/2}` consumes. -/
theorem comp_op_sqrt_exists (H : IsEvCAdjoint g h) :
    ∃ s : Module.End Cut STVC, IsEvCOpSqrt s (h.comp g) := by
  obtain ⟨n, c, u, horth, hc, heq⟩ := comp_specExists_nonneg H
  refine ⟨specOpN (fun i => cutSqrt (c i)) u, ?_⟩
  rw [heq]
  exact specOpN_op_sqrt hc horth

/-- ★ NON-VACUITY (W8): the global positive operator square root applied to a CONCRETE banked
    operator — the self-adjoint boost generator's `g*g = boostGenC∘boostGenC` (N59
    `boostGenC_self_adjoint`) has a positive operator square root. The existence theorem is not
    vacuous: it produces a genuine root of a genuine banked positive operator. -/
theorem boostGenC_comp_op_sqrt_exists :
    ∃ s : Module.End Cut STVC, IsEvCOpSqrt s (boostGenC.comp boostGenC) :=
  comp_op_sqrt_exists boostGenC_self_adjoint

end

end Phys.Algebra
