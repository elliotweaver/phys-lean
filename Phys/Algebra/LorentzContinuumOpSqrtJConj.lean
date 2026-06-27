/-
  Phys.Algebra.LorentzContinuumOpSqrtJConj — N92: THE `J`-CONJUGATION OF A POSITIVE OPERATOR
  SQUARE ROOT + THE TWO POSITIVE OPERATOR SQUARE ROOTS OF `p⁻¹` (`J p^{1/2} J` and `(p^{1/2})⁻¹`).
  The immediately-bankable structural setup the operator-square-root-UNIQUENESS lift
  `J p^{1/2} J = (p^{1/2})⁻¹` consumes — over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after THE METRIC-CONDITION CHARACTERIZATION OF THE LINEAR ISOMETRIES + THE
  `J`-CONJUGATION INVERSION `J p J = p⁻¹` (N91). N49–N91 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC`, `IsQvIsomC` (N49);
    • the POSITIVE-DEFINITE reference form `EvC` (N58), the OPERATOR FORM-ADJOINT `IsEvCAdjoint`
      + `IsEvCAdjoint.comp` (the EvC-adjoint composes contravariantly) (N59/N89);
    • the spectral operator `specOpN` + `specOpN_op_sqrt` + the full spectral existence
      `stvc_selfadj_specExists` (N63–N85);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt s g := IsEvCSymm s ∧
      (∀ p, 0 ≤ EvC (s p) p) ∧ s∘s = g` (N60/N68);
    • the CONCRETE `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` for the `g*g`-family of an injective
      `g`, with `h∘g = specOpN c u`, every `0 < c i`, and the two-sided inverse
      (`comp_specInverse_exists`, N88);
    • ★ THE SIGNATURE INVOLUTION operator `J := sigOpC`, `sigOpC_comp_self` (`J∘J = id`),
      `sigOpC_isEvCAdjoint_self` (`J* = J`), THE OPERATOR LORENTZ METRIC CONDITION
      `h∘J∘g = J` (N90), and ★★★ THE `J`-CONJUGATION INVERSION `linIsom_posPart_J_conj_inv`
      (`(J∘(h∘g)∘J)∘(h∘g) = id`, i.e. `J p J = p⁻¹`) + `linIsom_injective` (N91).

  ── THE TARGET (N92) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the remaining HEAVY group-manifold core toward the GLOBAL reverse KAK
  surjectivity: the FULL isometry-compact-part lemma — that the compact part `k := g·(p^{1/2})⁻¹`
  of an ISOMETRY `g ∈ qvIsomMonoidC` preserves `QvC`. MEASURE-FIRST (ROADMAP §N92 priority (i))
  confirms this reduces to the operator-square-root-UNIQUENESS lift `J p^{1/2} J = (p^{1/2})⁻¹`,
  which the roadmap proves by exhibiting BOTH `J p^{1/2} J` and `(p^{1/2})⁻¹` as positive operator
  square roots of `p⁻¹` and invoking positive-operator-square-root UNIQUENESS
  (`IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q → s₁ = s₂`). The general uniqueness over the 10-dim
  derived `Cut`-module `STVC` — the two roots live over DIFFERENT eigen-families (`u` and the
  spectral family of the conjugate) — is the genuine W1 spectral remainder, NOT yet banked. THIS
  node banks the IMMEDIATELY-BANKABLE structural setup that uniqueness consumes: the `J`-conjugation
  of a positive operator square root is again a positive operator square root (of the `J`-conjugate),
  and — for an isometry — BOTH `J p^{1/2} J` and `(p^{1/2})⁻¹` are positive operator square roots of
  the SAME operator `p⁻¹ = specOpN c⁻¹ u`. The general uniqueness lemma, the lift
  `J p^{1/2} J = (p^{1/2})⁻¹`, the full isometry-compact-part lemma `IsQvIsomC (g·(p^{1/2})⁻¹)`,
  CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion are childed
  onto the chain tail (N93).

  WHAT THIS NODE DERIVES (it is FORCED — pure composition algebra + the trunk positivity, NO sqrt
  uniqueness needed yet):
    • the `EvC↔J` symmetry `J* = J` (`sigOpC_isEvCAdjoint_self` N90) ⟹ conjugation by `J`
      preserves `EvC`-self-adjointness and `EvC`-positivity;
    • `J∘J = id` (`sigOpC_comp_self` N90) ⟹ `(J s J)∘(J s J) = J (s∘s) J`;
    • `J p J = p⁻¹` (`linIsom_posPart_J_conj_inv` N91) PLUS the right inverse `p∘p⁻¹ = id`
      (`comp_specInverse_exists` N88, left-inverse = right-inverse over the finite module) ⟹
      `J p J = specOpN c⁻¹ u` AS AN OPERATOR EQUALITY;
    • `((cutSqrt c)⁻¹)² = c⁻¹` (`cutSqrt_sq` N57 + `mul_inv`) ⟹ `(p^{1/2})⁻¹` squares to `p⁻¹`.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N91 ← the order-completeness of the derived
  ℝ `Cut` ← the fold. `LinearMap.comp_assoc`/`comp_id`/`id_comp`/`ext`, `mul_inv`, `inv_nonneg` are
  standard MACHINERY on the DERIVED objects (STANDARD §3). Complete: `#print axioms ⊆
  {propext, Classical.choice, Quot.sound}` for every declaration (Audits/AxiomAudit.lean).
  Words-removable: delete "Lorentz/boost/signature/metric/isometry/orthogonal/adjoint/compact/
  spectral/square-root/uniqueness/inverse/positive-definite/positive-semidefinite/self-adjoint/
  involution/conjugation/group/connected/Spin/SO(9)" → over the derived complete ordered field
  `Cut`, with the positive-definite symmetric form `EvC` and the involution `J` (`J∘J = id`,
  `∀ p q, EvC (J p) q = EvC p (J q)`): if `s∘s = q` with `s` `EvC`-symmetric and `EvC`-nonneg, then
  `J∘s∘J` is `EvC`-symmetric, `EvC`-nonneg, and `(J∘s∘J)∘(J∘s∘J) = J∘q∘J`; and for a `Cut`-linear
  `g` with `∀ p q, EvC (g p) q = EvC p (h q)` preserving the quadratic form `QvC`, with the
  `EvC`-orthonormal family `{u i}` and eigenvalues `0 < c i` of `h∘g = specOpN c u`, both
  `J∘(specOpN (cutSqrt∘c) u)∘J` and `specOpN ((cutSqrt∘c)⁻¹) u` are positive operator square roots
  of `specOpN c⁻¹ u`; pure linear-algebra math. NO theorem STATEMENT needs a physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumIsomMetricChar
import Phys.Algebra.LorentzContinuumGGFamilyInverse
import Phys.Algebra.LorentzContinuumCompactPart

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-! ## P1 — THE `J`-CONJUGATION OF A POSITIVE OPERATOR SQUARE ROOT. -/

/-- ★ THE `J`-CONJUGATION OF A POSITIVE OPERATOR SQUARE ROOT: if `s` is a positive operator square
    root of `q` (`IsEvCOpSqrt s q`), then `J∘s∘J` is a positive operator square root of `J∘q∘J`.
    FORCED — pure composition algebra from the trunk: `J* = J` (`sigOpC_isEvCAdjoint_self` N90) makes
    `J∘s∘J` `EvC`-self-adjoint (`EvC ((J s J) p) p' = EvC (s (J p)) (J p')`, symmetric since `s` is)
    and `EvC`-positive-semidefinite (`EvC ((J s J) p) p = EvC (s (J p)) (J p) ≥ 0`); `J∘J = id`
    (`sigOpC_comp_self` N90) makes `(J s J)∘(J s J) = J∘(s∘s)∘J = J∘q∘J`. NO spectral theory, NO sqrt
    uniqueness — the involution conjugation of a positive root is a positive root. -/
theorem opSqrt_sigOpC_conj {s q : Module.End Cut STVC} (hs : IsEvCOpSqrt s q) :
    IsEvCOpSqrt (sigOpC.comp (s.comp sigOpC)) (sigOpC.comp (q.comp sigOpC)) := by
  obtain ⟨hsymm, hpos, hsq⟩ := hs
  have HJ := sigOpC_isEvCAdjoint_self
  refine ⟨?_, ?_, ?_⟩
  · -- EvC-self-adjoint: J* = J twice + s symmetric
    intro p p'
    simp only [LinearMap.comp_apply]
    rw [HJ (s (sigOpC p)) p', hsymm (sigOpC p) (sigOpC p'), HJ p (s (sigOpC p'))]
  · -- EvC-positive-semidefinite: J* = J reduces to s's positivity at J p
    intro p
    simp only [LinearMap.comp_apply]
    rw [HJ (s (sigOpC p)) p]
    exact hpos (sigOpC p)
  · -- squares to J q J: J∘J = id collapses the inner pair, s∘s = q
    apply LinearMap.ext; intro p
    simp only [LinearMap.comp_apply]
    have hJJ : ∀ x, sigOpC (sigOpC x) = x := by
      intro x; have := congrArg (fun (f : Module.End Cut STVC) => f x) sigOpC_comp_self
      simpa [LinearMap.comp_apply] using this
    rw [hJJ (s (sigOpC p))]
    have : s (s (sigOpC p)) = q (sigOpC p) := by
      have := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC p)) hsq
      simpa [LinearMap.comp_apply] using this
    rw [this]

/-! ## P2 — `J p^{1/2} J` IS A POSITIVE OPERATOR SQUARE ROOT OF `J p J`. -/

/-- ★ For the positive part `p := h∘g = specOpN c u` of an isometry (eigenvalues `0 < c i`),
    `J∘p^{1/2}∘J` is a positive operator square root of `J∘p∘J`, where `p^{1/2} = specOpN (cutSqrt∘c) u`
    (N68 `specOpN_op_sqrt`). Immediate from `opSqrt_sigOpC_conj` (P1) applied to the spectral square
    root of `p`. -/
theorem linIsom_JsqrtJ_isOpSqrt
    {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hcpos : ∀ i, 0 < c i) (heq : h.comp g = specOpN c u) :
    IsEvCOpSqrt
      (sigOpC.comp ((specOpN (fun i => cutSqrt (c i)) u).comp sigOpC))
      (sigOpC.comp ((h.comp g).comp sigOpC)) := by
  have hsqrt : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) u) (h.comp g) := by
    rw [heq]
    exact specOpN_op_sqrt (fun i => (hcpos i).le) horth
  exact opSqrt_sigOpC_conj hsqrt

/-! ## P3 — `(p^{1/2})⁻¹` IS A POSITIVE OPERATOR SQUARE ROOT OF `p⁻¹`. -/

/-- ★ The concrete operator inverse `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` (N88) is a positive
    operator square root of `p⁻¹ = specOpN c⁻¹ u`. FORCED — `specOpN` is `EvC`-self-adjoint for every
    family (`specOpN_isEvCSymm`), `EvC`-positive-semidefinite since each `(cutSqrt (c i))⁻¹ ≥ 0`
    (`specOpN_nonneg` + `inv_nonneg` + `cutSqrt_nonneg`), and squares to `specOpN c⁻¹ u` because
    `((cutSqrt (c i))⁻¹)² = (cutSqrt (c i))⁻² = ((cutSqrt (c i))²)⁻¹ = (c i)⁻¹` (`mul_inv` +
    `cutSqrt_sq`, `0 ≤ c i`). -/
theorem linIsom_posInv_isOpSqrt
    {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hcpos : ∀ i, 0 < c i) :
    IsEvCOpSqrt
      (specOpN (fun i => (cutSqrt (c i))⁻¹) u)
      (specOpN (fun i => (c i)⁻¹) u) := by
  refine ⟨specOpN_isEvCSymm _ _,
    specOpN_nonneg (fun i => inv_nonneg.mpr (cutSqrt_nonneg (c i))) u, ?_⟩
  rw [specOpN_comp horth]
  congr 1
  funext i
  rw [← mul_inv, cutSqrt_sq (hcpos i).le]

/-! ## THE `J`-CONJUGATION INVERSION AS AN OPERATOR EQUALITY `J p J = specOpN c⁻¹ u`. -/

/-- ★★ `J p J = p⁻¹ = specOpN c⁻¹ u` AS AN OPERATOR EQUALITY, for the positive part `p := h∘g`
    of an INJECTIVE isometry. N91 `linIsom_posPart_J_conj_inv` gives `(J∘p∘J)∘p = id` (a LEFT
    inverse of `p`); N88 `specOpN_inverse` gives the RIGHT inverse `p∘(specOpN c⁻¹ u) = id`
    (`p` injective ⟹ resolution of identity ⟹ reciprocal-eigenvalue inverse, eigenvalues
    `0 < c i` nonzero). Over the finite module a left inverse equals the right inverse:
    `J p J = (J p J)∘(p∘p⁻¹) = ((J p J)∘p)∘p⁻¹ = id∘p⁻¹ = p⁻¹`. NO sqrt, NO spectral inverse of
    the conjugate — pure composition algebra. -/
theorem linIsom_JpJ_eq_specInv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h)
    (hgi : Function.Injective g)
    {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (heq : h.comp g = specOpN c u) :
    sigOpC.comp ((h.comp g).comp sigOpC) = specOpN (fun i => (c i)⁻¹) u := by
  have hpinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint H hgi
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hpinj
  have hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p := by
    intro p; rw [← heq]; exact H.comp_nonneg p
  have hcpos : ∀ i, 0 < c i := fun i => specExists_eigen_pos horth hpos hpinj i
  have hcne : ∀ i, c i ≠ 0 := fun i => ne_of_gt (hcpos i)
  have hpinv : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id :=
    specOpN_inverse horth hres hcne
  have hpinv' : (h.comp g).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id := by
    rw [heq]; exact hpinv
  have hlever : (sigOpC.comp ((h.comp g).comp sigOpC)).comp (h.comp g) = LinearMap.id :=
    linIsom_posPart_J_conj_inv hg H
  set JpJ := sigOpC.comp ((h.comp g).comp sigOpC) with hJpJ
  have key : JpJ.comp ((h.comp g).comp (specOpN (fun i => (c i)⁻¹) u)) = JpJ := by
    rw [hpinv', LinearMap.comp_id]
  rw [← key, ← LinearMap.comp_assoc, hlever, LinearMap.id_comp]

/-! ## THE DELIVERABLE — BOTH `J p^{1/2} J` AND `(p^{1/2})⁻¹` ARE POSITIVE OPERATOR SQUARE ROOTS
    OF THE SAME `p⁻¹`. -/

/-- ★★★ THE N92 DELIVERABLE — THE SETUP THE OPERATOR-SQUARE-ROOT-UNIQUENESS LIFT CONSUMES. For a
    linear isometry `g` (`IsQvIsomC g`) with `EvC`-adjoint `h`, there is an `EvC`-orthonormal
    eigen-family `{u i}` and eigenvalues `0 < c i` with `h∘g = specOpN c u`, such that BOTH
      • `J∘(specOpN (cutSqrt∘c) u)∘J` (the `J`-conjugate of the positive square root `p^{1/2}`), and
      • `specOpN ((cutSqrt∘c)⁻¹) u` (the operator inverse `(p^{1/2})⁻¹`)
    are POSITIVE OPERATOR SQUARE ROOTS of the SAME operator `p⁻¹ = specOpN c⁻¹ u`. Assembled from
    P2 (`linIsom_JsqrtJ_isOpSqrt`) with the second argument rewritten through the operator equality
    `J p J = specOpN c⁻¹ u` (`linIsom_JpJ_eq_specInv`), and P3 (`linIsom_posInv_isOpSqrt`). By
    positive-operator-square-root UNIQUENESS (childed N93) these two are EQUAL — the lift
    `J p^{1/2} J = (p^{1/2})⁻¹` that lands the compact part `k := g·(p^{1/2})⁻¹` in the maximal
    compact. NO sqrt uniqueness is used HERE — this is the forced SETUP, foundations-only. -/
theorem linIsom_two_opSqrts_of_posInv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      IsEvCOpSqrt
        (sigOpC.comp ((specOpN (fun i => cutSqrt (c i)) u).comp sigOpC))
        (specOpN (fun i => (c i)⁻¹) u) ∧
      IsEvCOpSqrt
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)
        (specOpN (fun i => (c i)⁻¹) u) := by
  have hgi : Function.Injective g := linIsom_injective hg H
  obtain ⟨n, c, u, horth, hcpos, heq, _, _⟩ := comp_specInverse_exists H hgi
  refine ⟨n, c, u, horth, hcpos, heq, ?_, linIsom_posInv_isOpSqrt horth hcpos⟩
  have h1 := linIsom_JsqrtJ_isOpSqrt horth hcpos heq
  rw [linIsom_JpJ_eq_specInv hg H hgi horth heq] at h1
  exact h1

/-! ## Non-vacuity (W8): a CONCRETE boost realises the two-positive-roots setup. -/

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) realises the two-positive-roots setup — its
    positive part `g*g` is a genuine non-identity positive operator over the derived ℝ `Cut`,
    and both `J·(g*g)^{1/2}·J` and `((g*g)^{1/2})⁻¹` are genuine positive operator square roots of
    `(g*g)⁻¹`. The deliverable is not vacuous. -/
theorem boostEndC_two_opSqrts_of_posInv {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      IsEvCOpSqrt
        (sigOpC.comp ((specOpN (fun i => cutSqrt (c i)) u).comp sigOpC))
        (specOpN (fun i => (c i)⁻¹) u) ∧
      IsEvCOpSqrt
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)
        (specOpN (fun i => (c i)⁻¹) u) :=
  linIsom_two_opSqrts_of_posInv (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

end

end Phys.Algebra
