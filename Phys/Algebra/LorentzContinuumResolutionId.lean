/-
  Phys.Algebra.LorentzContinuumResolutionId — N87: THE RESOLUTION-OF-IDENTITY → THE OPERATOR
  INVERSE `(p^{1/2})⁻¹`. For the EvC-ORTHONORMAL eigen-family that the FULL spectral existence
  (N85) returns on the identity operator, the projector sum `∑ i, projC (u i)` equals
  `LinearMap.id` — the resolution-of-identity, the completeness of the spectral basis read off
  the identity with NO separate spanning argument. From it, the TWO-family spectral composition
  law `specOpN l u ∘ specOpN m u = specOpN (l·m) u` and the reciprocal-eigenvalue OPERATOR
  INVERSE `specOpN c u ∘ specOpN (c⁻¹) u = id` (when no eigenvalue vanishes) — the `(p^{1/2})⁻¹`
  step of the polar/KAK assembly `g = k·p^{1/2}`, `k := g·(p^{1/2})⁻¹` — over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the GLOBAL POLAR POSITIVE PART node (N86). N49–N86 banked, over
  the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + positive (N59);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-`n` spectral operator `specOpN`
      + its action/symmetry/positivity/composition/diagonal-reader `specOpN_read` + the spectral
      square root `specOpN_op_sqrt` (N63/N68);
    • the FULL n-DIM SPECTRAL EXISTENCE `stvc_selfadj_specExists`: every EvC-self-adjoint `g`
      equals `specOpN l u` for an EvC-ORTHONORMAL eigen-family (N85);
    • the GLOBAL POSITIVE PART: `g*g` is positive-self-adjoint, has a positive operator square
      root `specOpN (cutSqrt ∘ c) u`, plus the strict eigenvalue positivity `specExists_eigen_pos`
      (positive-semidefinite + injective ⟹ `0 < c i`, the invertibility lever) (N86).

  ── THE TARGET (N87) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the remaining HEAVY group-manifold core toward `g = k·p^{1/2}`: the
  resolution-of-identity, the operator inverse `(p^{1/2})⁻¹`, the compact part `k` with `k*k = 1`,
  CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion.
  MEASURE-FIRST (ROADMAP §N87 priority (i)) confirms: the RESOLUTION-OF-IDENTITY and the OPERATOR
  INVERSE are now LIGHT — the spectral existence (N85) applied to the IDENTITY operator yields a
  complete orthonormal family whose projector sum IS the identity, with NO spanning argument; the
  inverse is the reciprocal-eigenvalue spectral operator (N68 composition generalized to two
  eigenvalue families). THIS node banks the resolution-of-identity, the two-family composition
  law, and the operator inverse — the immediately-bankable structural pieces the compact part
  `k := g·(p^{1/2})⁻¹` consumes. The remaining HEAVY remainder — the concrete `(p^{1/2})⁻¹` for
  the `g*g`-family (needing the family to span, the genuine spanning lemma), the compact part `k`
  with `k*k = 1`, CONNECTEDNESS, the GLOBAL reverse surjectivity, and the `Spin(9)→SO(9)`
  exhaustion — is childed onto the chain tail.

  ── THE TRUNK REFRAME (THE ONE LAW): the resolution-of-identity IS spectral existence on `id` ──
  The classical resolution-of-identity `∑ P_i = id` for a complete orthonormal eigenbasis is the
  completeness/spanning of the basis, normally proved by a dimension count. The trunk dissolves
  it: the IDENTITY operator is EvC-self-adjoint (trivially), so by the FULL spectral existence
  N85 it equals `specOpN l u` for an EvC-ORTHONORMAL family `{u i}`; the diagonal reader
  `specOpN_read` reads each eigenvalue `l k = EvC (id (u k)) (u k) = EvC (u k)(u k) = 1`, so
  `id = specOpN (fun _ => 1) u = ∑ i, projC (u i)`. The completeness FALLS OUT of N85 applied to
  the identity — no separate spanning/`finrank` argument. The operator inverse is then the
  reciprocal-eigenvalue operator: `specOpN c u ∘ specOpN (c⁻¹) u = specOpN (c·c⁻¹) u =
  specOpN (fun _ => 1) u = ∑ projC u_i = id` when every `c i ≠ 0` — the spectral composition law
  (N68 `specOpN_comp` generalized to two families) closed by the resolution.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    lid_isEvCSymm             — the identity operator is EvC-self-adjoint (trivially).
    specOpN_one_eq_sum_projC  — `specOpN (fun _ => 1) u = ∑ i, projC (u i)` (all-ones eigenvalues
                                give the bare projector sum).
    specOpN_comp_two          — ★ THE TWO-FAMILY COMPOSITION LAW: for an EvC-orthonormal family,
                                `specOpN l u ∘ specOpN m u = specOpN (l·m) u` (N68 `specOpN_comp`
                                generalized from `l = m` to two distinct eigenvalue families).
    stvc_resolution_of_identity — ★★ THE RESOLUTION-OF-IDENTITY: `∃ orthonormal {u i},
                                ∑ i, projC (u i) = id` (N85 applied to the identity operator).
    specOpN_inverse           — ★★ THE OPERATOR LEFT INVERSE: for an orthonormal family resolving
                                the identity with `∀ i, c i ≠ 0`,
                                `specOpN c u ∘ specOpN (c⁻¹) u = id` (the `(p^{1/2})⁻¹` step).
    specOpN_inverse_right     — the RIGHT inverse `specOpN (c⁻¹) u ∘ specOpN c u = id`.
    stvc_specOpN_const_invertible — ★ NON-VACUITY: a concrete invertible spectral operator
                                (eigenvalue `2` on the resolving family) has a two-sided inverse.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N86 ← the order-completeness of the derived
  ℝ `Cut` ← the fold. Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for
  every declaration (Audits/AxiomAudit.lean). Words-removable: delete
  "Lorentz/spectral/eigen*/orthonormal/diagonal/projection/resolution-of-identity/inverse/polar/
  KAK/compact/isometry/Spin/SO(9)/self-adjoint/positive-definite" → over the derived complete
  ordered field `Cut` and the positive-definite symmetric form `EvC`, the projector sum
  `∑ projC u_i` of the family `stvc_selfadj_specExists` returns on `id` equals `id`, two spectral
  operators compose by pointwise eigenvalue product, and the reciprocal-eigenvalue operator is a
  two-sided inverse when no eigenvalue vanishes; pure linear-algebra math.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumPolarPositive

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The IDENTITY operator is EvC-self-adjoint: `EvC (id p) q = EvC p q = EvC p (id q)`, trivially.
    The trivial self-adjointness that lets the spectral existence (N85) diagonalize the identity. -/
theorem lid_isEvCSymm : IsEvCSymm (LinearMap.id : Module.End Cut STVC) := by
  intro p q; rfl

/-- The rank-`n` spectral operator with ALL-ONES eigenvalues is the bare projector sum:
    `specOpN (fun _ => 1) u = ∑ i, projC (u i)`. Each `1 • projC (u i) = projC (u i)`. The bridge
    from the spectral operator to the resolution-of-identity projector sum. -/
theorem specOpN_one_eq_sum_projC {n : ℕ} (u : Fin n → STVC) :
    specOpN (fun _ => (1 : Cut)) u = ∑ i, projC (u i) := by
  unfold specOpN
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [one_smul]

/-- ★ THE TWO-FAMILY SPECTRAL COMPOSITION LAW: for an EvC-ORTHONORMAL eigen-family `{u i}`,
    `specOpN l u ∘ specOpN m u = specOpN (fun i => l i * m i) u`. The genuine generalization of
    N68 `specOpN_comp` (the `l = m` squaring case) to TWO distinct eigenvalue families: all
    off-diagonal cross terms vanish (`specOpN_EvC_read`); the diagonal eigenvalues multiply
    independently. The lever that turns the reciprocal-eigenvalue family into the operator inverse. -/
theorem specOpN_comp_two {n : ℕ} {l m : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN l u).comp (specOpN m u) = specOpN (fun i => l i * m i) u := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOpN_apply l u (specOpN m u p),
    specOpN_apply (fun i => l i * m i) u p]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [specOpN_EvC_read horth p i]
  congr 1
  ring

/-- ★★ THE RESOLUTION-OF-IDENTITY: there is an EvC-ORTHONORMAL family `{u i}` whose orthogonal
    eigenprojections sum to the identity, `∑ i, projC (u i) = LinearMap.id`. The completeness of
    the spectral basis, read off the IDENTITY operator with NO separate spanning/`finrank`
    argument: `id` is EvC-self-adjoint (`lid_isEvCSymm`), so by the FULL spectral existence (N85
    `stvc_selfadj_specExists`) it equals `specOpN l u` for an orthonormal `{u i}`; the diagonal
    reader `specOpN_read` reads each eigenvalue `l k = EvC (id (u k)) (u k) = EvC (u k)(u k) = 1`,
    so `id = specOpN (fun _ => 1) u = ∑ i, projC (u i)`. The completeness FALLS OUT of the
    spectral existence — the trunk dissolves the classical dimension count. -/
theorem stvc_resolution_of_identity :
    ∃ (n : ℕ) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
  obtain ⟨n, l, u, horth, hid⟩ := stvc_selfadj_specExists lid_isEvCSymm
  have hl : ∀ k, l k = 1 := by
    intro k
    have hread := specOpN_read (l := l) (u := u) horth k
    rw [← hid] at hread
    simp only [LinearMap.id_coe, id_eq] at hread
    rw [horth k k] at hread
    simp at hread
    exact hread.symm
  refine ⟨n, u, horth, ?_⟩
  rw [← specOpN_one_eq_sum_projC u, hid]
  congr 1
  funext k
  exact (hl k).symm

/-- ★★ THE OPERATOR LEFT INVERSE — the `(p^{1/2})⁻¹` step. For an EvC-orthonormal family `{u i}`
    whose eigenprojections resolve the identity (`∑ projC (u i) = id`) and whose eigenvalues are
    all nonzero (`∀ i, c i ≠ 0`), the reciprocal-eigenvalue spectral operator is a left inverse:
    `specOpN c u ∘ specOpN (fun i => (c i)⁻¹) u = id`. Via the two-family composition law:
    `specOpN c u ∘ specOpN c⁻¹ u = specOpN (fun i => c i · (c i)⁻¹) u = specOpN (fun _ => 1) u
    = ∑ projC u_i = id`. The operator inverse the compact part `k := g·(p^{1/2})⁻¹` consumes. -/
theorem specOpN_inverse {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC))
    (hc : ∀ i, c i ≠ 0) :
    (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id := by
  rw [specOpN_comp_two horth]
  have hone : (fun i => c i * (c i)⁻¹) = (fun _ => (1 : Cut)) := by
    funext i; rw [mul_inv_cancel₀ (hc i)]
  rw [hone, specOpN_one_eq_sum_projC, hres]

/-- THE OPERATOR RIGHT INVERSE: under the same hypotheses,
    `specOpN (fun i => (c i)⁻¹) u ∘ specOpN c u = id` (the eigenvalues commute, `(c i)⁻¹ · c i = 1`). -/
theorem specOpN_inverse_right {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC))
    (hc : ∀ i, c i ≠ 0) :
    (specOpN (fun i => (c i)⁻¹) u).comp (specOpN c u) = LinearMap.id := by
  rw [specOpN_comp_two horth]
  have hone : (fun i => (c i)⁻¹ * c i) = (fun _ => (1 : Cut)) := by
    funext i; rw [inv_mul_cancel₀ (hc i)]
  rw [hone, specOpN_one_eq_sum_projC, hres]

/-- ★ NON-VACUITY (W8): a CONCRETE invertible spectral operator. On the EvC-orthonormal family
    that resolves the identity (`stvc_resolution_of_identity`), the spectral operator with the
    constant nonzero eigenvalue `2` has a genuine two-sided inverse — the reciprocal-eigenvalue
    operator with eigenvalue `2⁻¹`. The inverse theorem is not vacuous: it produces a genuine
    two-sided inverse of a genuine nonzero-eigenvalue spectral operator over the derived ℝ `Cut`. -/
theorem stvc_specOpN_const_invertible :
    ∃ (n : ℕ) (u : Fin n → STVC),
      (specOpN (fun _ => (2 : Cut)) u).comp (specOpN (fun _ => (2⁻¹ : Cut)) u) = LinearMap.id ∧
      (specOpN (fun _ => (2⁻¹ : Cut)) u).comp (specOpN (fun _ => (2 : Cut)) u) = LinearMap.id := by
  obtain ⟨n, u, horth, hres⟩ := stvc_resolution_of_identity
  have hc : ∀ _ : Fin n, (2 : Cut) ≠ 0 := fun _ => two_ne_zero
  refine ⟨n, u, ?_, ?_⟩
  · have := specOpN_inverse (c := fun _ => (2 : Cut)) horth hres hc
    simpa using this
  · have := specOpN_inverse_right (c := fun _ => (2 : Cut)) horth hres hc
    simpa using this

end

end Phys.Algebra
