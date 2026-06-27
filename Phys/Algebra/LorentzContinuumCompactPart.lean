/-
  Phys.Algebra.LorentzContinuumCompactPart — N89: THE COMPOSITION-ADJOINT LEMMA + THE COMPACT
  PART `k := g·(p^{1/2})⁻¹` WITH `k*k = 1` + THE POLAR RECONSTRUCTION `g = k·p^{1/2}`. The
  EvC-adjoint composes CONTRAVARIANTLY (`IsEvCAdjoint a a'` + `IsEvCAdjoint b b'` ⟹
  `IsEvCAdjoint (a∘b) (b'∘a')`); from it, for an INJECTIVE operator `g` with an EvC-adjoint `h`,
  the compact/orthogonal part `k := g∘(p^{1/2})⁻¹` of the polar assembly satisfies `k*k = 1`
  (its EvC-adjoint composed with itself is the identity), and `g` reconstructs as `g = k∘p^{1/2}`
  — over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the CONCRETE `(p^{1/2})⁻¹` FOR THE `g*g`-FAMILY node (N88). N49–N88
  banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g` EvC-self-adjoint + positive (N59),
      `IsEvCAdjoint.symm` (adjunction symmetric);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-`n` spectral operator `specOpN`
      + `specOpN_isEvCSymm` (EvC-self-adjoint for EVERY family) + `specOpN_comp` (the squaring
      composition law) + `specOpN_read` + the spectral square root `specOpN_op_sqrt` (N63/N68);
    • the FULL n-DIM SPECTRAL EXISTENCE `stvc_selfadj_specExists` (N85);
    • the GLOBAL POSITIVE PART `comp_specExists_nonneg`/`comp_op_sqrt_exists`/`specExists_eigen_pos`
      (N86);
    • the RESOLUTION-OF-IDENTITY + the two-family composition law `specOpN_comp_two` + the
      ABSTRACT operator inverse `specOpN_inverse`/`specOpN_inverse_right` (N87);
    • the SPANNING lemma `specOpN_resolution_of_injective` + the CONCRETE `(p^{1/2})⁻¹` for the
      `g*g`-family `comp_specInverse_exists` (for `IsEvCAdjoint g h`, `g` injective: `h∘g =
      specOpN c u` over an EvC-orthonormal family with every `0 < c i`, and the positive operator
      square root `p^{1/2} = specOpN (cutSqrt∘c) u` has a CONCRETE two-sided inverse
      `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u`) (N88).

  ── THE TARGET (N89) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the remaining HEAVY group-manifold core toward the polar/KAK assembly
  `g = k·p^{1/2}`: the compact part `k := g·(p^{1/2})⁻¹` with `k*k = 1`, CONNECTEDNESS, the GLOBAL
  reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N89
  priority (i)+(ii)) confirms: the COMPOSITION-ADJOINT lemma and the COMPACT PART `k*k = 1` are
  now LIGHT — N88 banked the concrete two-sided `(p^{1/2})⁻¹` for the `g*g`-family; the only
  missing prerequisite was that the EvC-adjoint composes contravariantly (`IsEvCAdjoint (a∘b)
  (b'∘a')`), two pure-EvC adjunction steps. THIS node banks the composition-adjoint lemma, the
  compact part `k*k = 1`, AND the polar reconstruction `g = k∘p^{1/2}` — the orthogonal factor of
  the polar decomposition made concrete on the `g*g`-family. The remaining HEAVY remainder —
  CONNECTEDNESS of the isometry group over `Cut`, the GLOBAL reverse KAK surjectivity
  (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`), and the full `Spin(9)→SO(9)`
  exhaustion — is childed onto the chain tail.

  ── THE TRUNK REFRAME (THE ONE LAW): `k*k = 1` collapses via the two-sided inverse + squaring-back ──
  The classical claim that the polar/KAK orthogonal factor `k = g·p^{-1/2}` is orthogonal
  (`k*k = 1`) is standard Lie/operator theory, normally via the spectral theorem and the operator
  functional calculus. The trunk dissolves it into banked algebra: the EvC-adjoint of
  `k = g∘(p^{1/2})⁻¹` is `(p^{1/2})⁻¹∘h` (the EvC-adjoint composes contravariantly — `IsEvCAdjoint.comp`
  — and `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` is EvC-self-adjoint by `specOpN_isEvCSymm`,
  hence its own adjoint). Then, pointwise,
    `k*k v = (p^{1/2})⁻¹ (h (g ((p^{1/2})⁻¹ v)))`
          `= (p^{1/2})⁻¹ (p^{1/2} (p^{1/2} ((p^{1/2})⁻¹ v)))`   [`h∘g = g*g = p^{1/2}∘p^{1/2}`,
                                                                   `specOpN_comp` + `cutSqrt_sq`]
          `= (p^{1/2})⁻¹ (p^{1/2} v)`                            [`p^{1/2}∘(p^{1/2})⁻¹ = id`, N88]
          `= v`                                                  [`(p^{1/2})⁻¹∘p^{1/2} = id`, N88].
  And the reconstruction `g = k∘p^{1/2} = g∘(p^{1/2})⁻¹∘p^{1/2} = g∘id = g` is immediate from
  `(p^{1/2})⁻¹∘p^{1/2} = id` (N88) — `LinearMap.comp_assoc` + `LinearMap.comp_id`. NO Mathlib
  spectral theory, NO operator functional calculus, NO posited polar decomposition.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    IsEvCAdjoint.comp         — ★ THE COMPOSITION-ADJOINT LEMMA: the EvC-adjoint composes
                                CONTRAVARIANTLY — `IsEvCAdjoint a a'` + `IsEvCAdjoint b b'` ⟹
                                `IsEvCAdjoint (a.comp b) (b'.comp a')`. Two adjunction steps:
                                `EvC ((a∘b) p) q = EvC (b p)(a' q) = EvC p ((b'∘a') q)`. The
                                missing prerequisite the compact part consumes.
    comp_polar_decomposition  — ★★★ THE COMPACT PART + THE POLAR RECONSTRUCTION. For an INJECTIVE
                                `g` with EvC-adjoint `h`, the `g*g`-family `h∘g = specOpN c u`
                                (every `0 < c i`), and with `p^{1/2} = specOpN (cutSqrt∘c) u`,
                                `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u`, the compact part
                                `k := g∘(p^{1/2})⁻¹` has EvC-adjoint `(p^{1/2})⁻¹∘h`,
                                satisfies `k*k = ((p^{1/2})⁻¹∘h)∘k = id` (THE ORTHOGONAL FACTOR),
                                and reconstructs `g = k∘p^{1/2}` (THE POLAR ASSEMBLY).
    smulId_comp_polar_decomposition — ★ NON-VACUITY (W8): the concrete injective operator `3 • id`
                                produces a genuine compact part `k` with `k*k = 1` and a genuine
                                polar reconstruction `3•id = k∘p^{1/2}` — the payoff is not vacuous.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N88 ← the order-completeness of the derived
  ℝ `Cut` ← the fold. Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for
  every declaration (Audits/AxiomAudit.lean). Words-removable: delete "Lorentz/boost/rotation/
  compact/orthogonal/polar/KAK/Cartan/spectral/eigen*/adjoint/square-root/inverse/isometry/Spin/
  SO(9)/self-adjoint/positive-definite" → over the derived complete ordered field `Cut` and the
  positive-definite symmetric form `EvC`: for `Cut`-linear self-maps with `∀ p q, EvC (a p) q =
  EvC p (a' q)` and likewise for `b, b'`, the composite `a∘b` is paired with `b'∘a'`; and for
  `∀ p q, EvC (g p) q = EvC p (h q)` with `g` injective, the map `k := g∘(p^{1/2})⁻¹` (built from
  the `specOpN` reciprocal-root inverse of N88) satisfies `(p^{1/2})⁻¹∘h∘k = id` and
  `k∘p^{1/2} = g`; pure linear-algebra math. NO theorem STATEMENT needs a physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGGFamilyInverse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-- ★ THE COMPOSITION-ADJOINT LEMMA: the EvC-adjoint composes CONTRAVARIANTLY. If `a'` is the
    EvC-adjoint of `a` and `b'` is the EvC-adjoint of `b`, then `b'∘a'` is the EvC-adjoint of
    `a∘b`. Two adjunction steps, pure `EvC` rewriting:
    `EvC ((a∘b) p) q = EvC (a (b p)) q = EvC (b p) (a' q) = EvC p (b' (a' q)) = EvC p ((b'∘a') q)`.
    The missing prerequisite the compact part `k := g∘(p^{1/2})⁻¹`'s adjoint `(p^{1/2})⁻¹∘h`
    consumes (the operator analogue of `(ab)* = b*a*`). -/
theorem IsEvCAdjoint.comp {a a' b b' : Module.End Cut STVC}
    (Ha : IsEvCAdjoint a a') (Hb : IsEvCAdjoint b b') :
    IsEvCAdjoint (a.comp b) (b'.comp a') := by
  intro p q
  simp only [LinearMap.comp_apply]
  rw [Ha (b p) q, Hb p (a' q)]

/-- ★★★ THE COMPACT PART `k := g·(p^{1/2})⁻¹` WITH `k*k = 1` + THE POLAR RECONSTRUCTION
    `g = k·p^{1/2}`. For an arbitrary operator `g` with an EvC-adjoint `h` (`IsEvCAdjoint g h`)
    and `g` INJECTIVE, N88 `comp_specInverse_exists` supplies an EvC-orthonormal eigen-family
    `{u i}` with every eigenvalue `0 < c i`, the `g*g`-family `h∘g = specOpN c u`, and the
    concrete two-sided inverse: with `p^{1/2} := specOpN (cutSqrt∘c) u` and `(p^{1/2})⁻¹ :=
    specOpN ((cutSqrt∘c)⁻¹) u`, both `p^{1/2}∘(p^{1/2})⁻¹ = id` and `(p^{1/2})⁻¹∘p^{1/2} = id`.
    THIS theorem assembles the polar/KAK orthogonal factor: the compact part `k := g∘(p^{1/2})⁻¹`
    has EvC-adjoint `(p^{1/2})⁻¹∘h` (`IsEvCAdjoint.comp` — the EvC-adjoint composes
    contravariantly — using `(p^{1/2})⁻¹` EvC-self-adjoint by `specOpN_isEvCSymm`); its
    self-composite `k*k = ((p^{1/2})⁻¹∘h)∘(g∘(p^{1/2})⁻¹)` collapses to `LinearMap.id` via
    `h∘g = p^{1/2}∘p^{1/2}` (`specOpN_comp` + N57 `cutSqrt_sq`) and the two-sided inverse N88 —
    THE COMPACT/ORTHOGONAL FACTOR `k*k = 1`; and `g` reconstructs as `g = k∘p^{1/2}`
    (`(p^{1/2})⁻¹∘p^{1/2} = id`, `LinearMap.comp_assoc`) — THE POLAR ASSEMBLY `g = k·p^{1/2}`.
    NO Mathlib spectral theory, NO operator functional calculus, NO posited polar decomposition. -/
theorem comp_polar_decomposition (H : IsEvCAdjoint g h) (hg : Function.Injective g) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      IsEvCAdjoint (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
                   ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h) ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h).comp
          (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) = LinearMap.id ∧
      (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp
          (specOpN (fun i => cutSqrt (c i)) u) = g := by
  obtain ⟨n, c, u, horth, hcpos, heq, hps_pi, hpi_ps⟩ := comp_specInverse_exists H hg
  set psqrt := specOpN (fun i => cutSqrt (c i)) u with hpsqrt
  set pinv := specOpN (fun i => (cutSqrt (c i))⁻¹) u with hpinv
  -- hps_pi : psqrt.comp pinv = id ;  hpi_ps : pinv.comp psqrt = id
  have hpinv_adj : IsEvCAdjoint pinv pinv := specOpN_isEvCSymm _ _
  refine ⟨n, c, u, horth, hcpos, heq, H.comp hpinv_adj, ?_, ?_⟩
  · -- THE COMPACT PART: k*k = id
    have hsq : psqrt.comp psqrt = h.comp g := by
      rw [hpsqrt, specOpN_comp horth, heq]
      congr 1; funext i; rw [cutSqrt_sq (le_of_lt (hcpos i))]
    apply LinearMap.ext; intro v
    simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    -- goal: pinv (h (g (pinv v))) = v
    have e1 : h (g (pinv v)) = psqrt (psqrt (pinv v)) := by
      have := congrArg (fun (f : Module.End Cut STVC) => f (pinv v)) hsq
      simp only [LinearMap.comp_apply] at this
      exact this.symm
    rw [e1]
    have e2 : psqrt (pinv v) = v := by
      have := congrArg (fun (f : Module.End Cut STVC) => f v) hps_pi
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [e2]
    have e3 : pinv (psqrt v) = v := by
      have := congrArg (fun (f : Module.End Cut STVC) => f v) hpi_ps
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [e3]
  · -- THE POLAR RECONSTRUCTION: g = k ∘ p^{1/2}
    rw [LinearMap.comp_assoc, hpi_ps, LinearMap.comp_id]

/-- ★ NON-VACUITY (W8): the concrete injective operator `3 • id` produces a genuine compact part.
    Its `g*g = (3•id)∘(3•id) = 9•id` is positive with a positive operator square root `p^{1/2}`;
    the compact part `k := (3•id)∘(p^{1/2})⁻¹` satisfies `k*k = 1` and `3•id = k∘p^{1/2}` — the
    polar decomposition is not vacuous: it produces a real orthogonal factor `k` with `k*k = 1`
    and a real reconstruction for a real injective operator over the derived ℝ `Cut`. -/
theorem smulId_comp_polar_decomposition :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      ((3 : Cut) • (LinearMap.id : Module.End Cut STVC)).comp ((3 : Cut) • LinearMap.id)
          = specOpN c u ∧
      IsEvCAdjoint (((3 : Cut) • LinearMap.id).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
                   ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp ((3 : Cut) • LinearMap.id)) ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp ((3 : Cut) • LinearMap.id)).comp
          (((3 : Cut) • LinearMap.id).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
          = LinearMap.id ∧
      (((3 : Cut) • LinearMap.id).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp
          (specOpN (fun i => cutSqrt (c i)) u) = (3 : Cut) • LinearMap.id :=
  comp_polar_decomposition (smulId_isEvCAdjoint 3) (smulId_injective (by norm_num))

end

end Phys.Algebra
