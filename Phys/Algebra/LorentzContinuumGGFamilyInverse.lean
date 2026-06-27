/-
  Phys.Algebra.LorentzContinuumGGFamilyInverse — N88: THE CONCRETE `(p^{1/2})⁻¹` FOR THE
  `g*g`-FAMILY — the SPANNING / RESOLUTION-OF-IDENTITY lemma for the decomposing family. For
  an EvC-ORTHONORMAL eigen-family over which an INJECTIVE spectral operator `specOpN c u`
  decomposes, the projector sum `∑ i, projC (u i)` equals `LinearMap.id` — the
  resolution-of-identity read off INJECTIVITY, with NO dimension count. Hence the `g*g`-family
  of an INJECTIVE operator `g` (with EvC-adjoint `h`) resolves the identity, every eigenvalue
  is strictly positive, and the positive operator square root `p^{1/2} = specOpN (cutSqrt∘c) u`
  has a CONCRETE two-sided inverse `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` — over the DERIVED
  ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the RESOLUTION-OF-IDENTITY / OPERATOR INVERSE node (N87). N49–N87
  banked, over the derived ℝ `Cut`:
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
    • the GLOBAL POSITIVE PART: `g*g` decomposes spectrally with `0 ≤ c i`, has the positive
      operator square root `specOpN (cutSqrt ∘ c) u`, plus the strict eigenvalue positivity
      `specExists_eigen_pos` (positive-semidefinite + injective ⟹ `0 < c i`) (N86);
    • the RESOLUTION-OF-IDENTITY `∑ projC u_i = id` (on the identity operator, N85) + the
      two-family composition law `specOpN_comp_two` + the ABSTRACT operator inverse
      `specOpN_inverse` (`∀ i, c i ≠ 0` + resolution ⟹ `specOpN c u ∘ specOpN (c⁻¹) u = id`) (N87).

  ── THE TARGET (N88) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the remaining HEAVY group-manifold core toward `g = k·p^{1/2}`: the
  concrete `(p^{1/2})⁻¹` for the `g*g`-family, the compact part `k := g·(p^{1/2})⁻¹` with
  `k*k = 1`, CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the `Spin(9)→SO(9)`
  exhaustion. MEASURE-FIRST (ROADMAP §N88 priority (i)) confirms: the CONCRETE `(p^{1/2})⁻¹`
  for the `g*g`-family is now LIGHT once the SPANNING lemma is in hand — N87 banked the ABSTRACT
  inverse parameterized by the resolution hypothesis `∑ projC u_i = id`; the only gap was that
  the SPECIFIC `g*g`-family (the one `comp_specExists_nonneg` N86 returns) resolves the
  identity. THIS node banks the SPANNING lemma + the concrete `g*g`-family inverse. The
  remaining HEAVY remainder — the compact part `k` with `k*k = 1` (needing a composition-adjoint
  lemma `IsEvCAdjoint (a∘b) (b'∘a')` not yet banked), CONNECTEDNESS, the GLOBAL reverse
  surjectivity, and the `Spin(9)→SO(9)` exhaustion — is childed onto the chain tail.

  ── THE TRUNK REFRAME (THE ONE LAW): the resolution is INJECTIVITY, not a dimension count ──
  The ROADMAP flagged the cleanest route as possibly strengthening `specExists_aux` (N85) to
  carry the resolution-of-identity alongside the decomposition. The trunk supplies a CLEANER
  route that does not touch N85's induction at all: an EvC-orthonormal family `{u i}` over which
  an INJECTIVE spectral operator `specOpN c u` decomposes AUTOMATICALLY resolves the identity.
  The projector sum `P := specOpN (fun _ => 1) u = ∑ projC u_i` is IDEMPOTENT (`specOpN_comp`,
  `1·1 = 1`); its kernel lies inside the kernel of `specOpN c u` (if `P v = 0` then every
  `EvC (u k) v = 0` by `specOpN_EvC_read`, so `specOpN c u v = ∑ c_k·0·u_k = 0`); so `specOpN c u`
  injective ⟹ `ker P = 0` ⟹ `P` injective; and an INJECTIVE IDEMPOTENT is the identity
  (`P (P v − v) = P v − P v = 0`, `P` injective ⟹ `P v = v`) — NO finite-dim, NO `finrank` count.
  And `g*g = h∘g` is injective when `g` is (`(h∘g) v = 0 ⟹ EvC (g v)(g v) = 0 ⟹ g v = 0`,
  the positive-definite `EvC` N58 `EvC_eq_zero_iff` ⟹ `v = 0`). The strict positivity
  `specExists_eigen_pos` N86 then gives `0 < c i`, so `cutSqrt (c i) > 0 ≠ 0` (`cutSqrt_pos`
  N57), and `specOpN_inverse` N87 closes the two-sided inverse `(p^{1/2})⁻¹`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    injective_idem_eq_id      — an INJECTIVE IDEMPOTENT endomorphism is the identity (pure algebra,
                                no finite-dim).
    specOpN_one_idem          — the all-ones spectral operator `specOpN 1 u` is IDEMPOTENT over an
                                EvC-orthonormal family (`specOpN_comp`, `1·1 = 1`).
    specOpN_ker_sub_of_one    — `specOpN 1 u v = 0 ⟹ specOpN c u v = 0` (orthonormal family):
                                a vector killed by the projector sum is killed by every spectral
                                operator over the family.
    specOpN_resolution_of_injective — ★★ THE SPANNING LEMMA: an EvC-orthonormal family over which
                                an INJECTIVE spectral operator decomposes resolves the identity,
                                `∑ projC u_i = id`. The resolution read off INJECTIVITY, NO dimension
                                count — the trunk dissolves the classical spanning argument.
    comp_injective_of_adjoint — `IsEvCAdjoint g h` + `g` INJECTIVE ⟹ `g*g = h∘g` INJECTIVE
                                (positive-definite `EvC`: `EvC (g v)(g v) = 0 ⟹ g v = 0`).
    comp_specInverse_exists   — ★★★ THE PAYOFF — the concrete `(p^{1/2})⁻¹` for the `g*g`-family:
                                for `IsEvCAdjoint g h` with `g` INJECTIVE, `g*g = specOpN c u` over
                                an EvC-orthonormal family with every `0 < c i`, and the positive
                                operator square root `p^{1/2} = specOpN (cutSqrt∘c) u` has a CONCRETE
                                two-sided inverse `specOpN ((cutSqrt∘c)⁻¹) u`.
    smulId_isEvCAdjoint / smulId_injective — the scaled identity `c • id` is its own EvC-adjoint
                                and is injective for `c ≠ 0` (the non-vacuity witness ingredients).
    smulId_comp_specInverse_exists — ★ NON-VACUITY (W8): the concrete injective operator `3 • id`
                                produces a genuine two-sided `(p^{1/2})⁻¹` — the payoff is not vacuous.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N87 ← the order-completeness of the derived
  ℝ `Cut` ← the fold. Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for
  every declaration (Audits/AxiomAudit.lean). Words-removable: delete "Lorentz/spectral/eigen*/
  orthonormal/diagonal/projection/resolution-of-identity/spanning/inverse/polar/KAK/compact/
  isometry/Spin/SO(9)/self-adjoint/positive-definite/square-root" → over the derived complete
  ordered field `Cut` and the positive-definite symmetric form `EvC`: an injective idempotent
  endomorphism is the identity; an EvC-orthonormal family over which an injective `specOpN c u`
  decomposes has `∑ projC u_i = id`; for `∀ p q, EvC (g p) q = EvC p (h q)` with `g` injective,
  `h∘g = specOpN c u` for an orthonormal family with every `0 < c i`, and the reciprocal-root
  spectral operator is its two-sided inverse; pure linear-algebra math. NO theorem STATEMENT
  needs a physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumResolutionId

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-- An INJECTIVE IDEMPOTENT endomorphism is the identity: `P∘P = P` and `P` injective force
    `P = id`. From `P (P v) = P v` and injectivity, `P v = v` for every `v`. NO finite-dim, NO
    dimension count — the structural fact behind the resolution-of-identity from injectivity. -/
theorem injective_idem_eq_id (P : Module.End Cut STVC)
    (hidem : P.comp P = P) (hinj : Function.Injective P) :
    P = LinearMap.id := by
  apply LinearMap.ext
  intro v
  have h1 : P (P v) = P v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hidem
    simpa [LinearMap.comp_apply] using this
  simpa using hinj h1

/-- The all-ones spectral operator `specOpN (fun _ => 1) u` is IDEMPOTENT over an EvC-orthonormal
    eigen-family — `specOpN_comp` (N68) with `1 · 1 = 1`. The projector sum `∑ projC u_i` is a
    projection: idempotency is the first half of "injective idempotent = identity". -/
theorem specOpN_one_idem {n : ℕ} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN (fun _ => (1:Cut)) u).comp (specOpN (fun _ => (1:Cut)) u)
      = specOpN (fun _ => (1:Cut)) u := by
  rw [specOpN_comp horth]
  congr 1
  funext i
  ring

/-- A vector killed by the projector sum is killed by EVERY spectral operator over the family:
    `specOpN (fun _ => 1) u v = 0 ⟹ specOpN c u v = 0`. If `P v = 0` then every `EvC (u k) v = 0`
    (the family eigenblock reader `specOpN_EvC_read` with `l ≡ 1`), so `specOpN c u v =
    ∑ (c k · EvC (u k) v) • u k = ∑ 0 = 0`. The kernel of the projector sum sits inside the kernel
    of every spectral operator over the orthonormal family. -/
theorem specOpN_ker_sub_of_one {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (v : STVC) (hv : specOpN (fun _ => (1:Cut)) u v = 0) :
    specOpN c u v = 0 := by
  have hzero : ∀ k, EvC (u k) v = 0 := by
    intro k
    have hread := specOpN_EvC_read (l := fun _ => (1:Cut)) horth v k
    rw [hv] at hread
    rw [EvC_symm (u k) 0, EvC_zero_left, one_mul] at hread
    exact hread.symm
  rw [specOpN_apply]
  apply Finset.sum_eq_zero
  intro k _
  rw [hzero k, mul_zero, zero_smul]

/-- ★★ THE SPANNING LEMMA: an EvC-ORTHONORMAL eigen-family `{u i}` over which an INJECTIVE
    spectral operator `specOpN c u` decomposes RESOLVES THE IDENTITY — `∑ i, projC (u i) =
    LinearMap.id`. The resolution-of-identity read off INJECTIVITY with NO dimension/`finrank`
    count: the projector sum `P := specOpN (fun _ => 1) u = ∑ projC u_i` is IDEMPOTENT
    (`specOpN_one_idem`), and its kernel sits inside the kernel of `specOpN c u`
    (`specOpN_ker_sub_of_one`), so `specOpN c u` injective ⟹ `P` injective ⟹ `P = id`
    (`injective_idem_eq_id`). The trunk dissolves the classical spanning argument — completeness
    of the eigenbasis falls out of the operator being injective, not a basis count. This is the
    bridge that turns the ABSTRACT operator inverse `specOpN_inverse` (N87) into the CONCRETE
    `(p^{1/2})⁻¹` for the `g*g`-family. -/
theorem specOpN_resolution_of_injective {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hinj : Function.Injective (specOpN c u)) :
    (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
  rw [← specOpN_one_eq_sum_projC u]
  apply injective_idem_eq_id _ (specOpN_one_idem horth)
  rw [injective_iff_map_eq_zero]
  intro v hv
  refine hinj ?_
  rw [map_zero]
  exact specOpN_ker_sub_of_one horth v hv

/-- `IsEvCAdjoint g h` with `g` INJECTIVE ⟹ the form-adjoint composite `g*g = h∘g` is INJECTIVE.
    If `(h∘g) v = 0` then `EvC ((h∘g) v) v = EvC (g v)(g v) = 0` (one adjunction step), so
    `g v = 0` by the positive-definiteness of the reference form `EvC` (N58 `EvC_eq_zero_iff`),
    hence `v = 0` by injectivity of `g`. The injectivity prerequisite of the strict eigenvalue
    positivity `specExists_eigen_pos` (N86) and of the spanning lemma. -/
theorem comp_injective_of_adjoint (H : IsEvCAdjoint g h) (hg : Function.Injective g) :
    Function.Injective (h.comp g) := by
  rw [injective_iff_map_eq_zero]
  intro v hv
  have hpos : EvC (g v) (g v) = 0 := by
    have := congrArg (fun w => EvC w v) hv
    simp only at this
    rw [EvC_zero_left, LinearMap.comp_apply, H.symm (g v) v] at this
    exact this
  have hgv : g v = 0 := (EvC_eq_zero_iff (g v)).mp hpos
  exact hg (by rw [hgv, map_zero])

/-- ★★★ THE PAYOFF — THE CONCRETE `(p^{1/2})⁻¹` FOR THE `g*g`-FAMILY. For an arbitrary operator
    `g` with an EvC-adjoint `h` (`IsEvCAdjoint g h`) and `g` INJECTIVE, the form-adjoint composite
    `g*g = h∘g` equals `specOpN c u` over an EvC-ORTHONORMAL eigen-family with EVERY eigenvalue
    `0 < c i` (strictly positive — `specExists_eigen_pos` N86, positive-semidefinite + injective),
    and its POSITIVE OPERATOR SQUARE ROOT `p^{1/2} = specOpN (cutSqrt∘c) u` (N68) has a CONCRETE
    two-sided inverse `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u`. The concrete inverse the polar/KAK
    compact part `k := g·(p^{1/2})⁻¹` consumes — the abstract `specOpN_inverse` (N87) made concrete
    on the `g*g`-family via the SPANNING lemma `specOpN_resolution_of_injective`. -/
theorem comp_specInverse_exists (H : IsEvCAdjoint g h) (hg : Function.Injective g) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      (specOpN (fun i => cutSqrt (c i)) u).comp
          (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id ∧
      (specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp
          (specOpN (fun i => cutSqrt (c i)) u) = LinearMap.id := by
  obtain ⟨n, c, u, horth, _, heq⟩ := comp_specExists_nonneg H
  have hinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint H hg
  have hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p := by
    intro p; rw [← heq]; exact H.comp_nonneg p
  have hcpos : ∀ i, 0 < c i := fun i => specExists_eigen_pos horth hpos hinj i
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hinj
  have hsq : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  exact ⟨n, c, u, horth, hcpos, heq,
    specOpN_inverse horth hres hsq, specOpN_inverse_right horth hres hsq⟩

/-! ## Non-vacuity (W8): a CONCRETE injective operator with a genuine `(p^{1/2})⁻¹`. -/

/-- The scaled identity `c • id` is its OWN EvC-adjoint: `EvC (c • p) q = c · EvC p q =
    EvC p (c • q)`. -/
theorem smulId_isEvCAdjoint (c : Cut) :
    IsEvCAdjoint (c • (LinearMap.id : Module.End Cut STVC)) (c • LinearMap.id) := by
  intro p q
  show EvC (c • p) q = EvC p (c • q)
  rw [EvC_smul_left, EvC_smul_right]

/-- The scaled identity `c • id` is INJECTIVE for `c ≠ 0`: `c • v = 0 ⟹ v = 0`. -/
theorem smulId_injective {c : Cut} (hc : c ≠ 0) :
    Function.Injective (c • (LinearMap.id : Module.End Cut STVC)) := by
  rw [injective_iff_map_eq_zero]
  intro v hv
  have hv' : c • v = 0 := hv
  rcases smul_eq_zero.mp hv' with h | h
  · exact absurd h hc
  · exact h

/-- ★ NON-VACUITY (W8): the concrete injective operator `3 • id` produces a genuine two-sided
    `(p^{1/2})⁻¹` via `comp_specInverse_exists`. Its `g*g = (3•id)∘(3•id) = 9•id` is positive
    with a positive operator square root whose inverse is a genuine two-sided inverse — the
    payoff theorem is not vacuous: it produces a real `(p^{1/2})⁻¹` for a real injective operator
    over the derived ℝ `Cut`. -/
theorem smulId_comp_specInverse_exists :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      ((3 : Cut) • (LinearMap.id : Module.End Cut STVC)).comp ((3 : Cut) • LinearMap.id)
          = specOpN c u ∧
      (specOpN (fun i => cutSqrt (c i)) u).comp
          (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id ∧
      (specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp
          (specOpN (fun i => cutSqrt (c i)) u) = LinearMap.id :=
  comp_specInverse_exists (smulId_isEvCAdjoint 3) (smulId_injective (by norm_num))

end

end Phys.Algebra
