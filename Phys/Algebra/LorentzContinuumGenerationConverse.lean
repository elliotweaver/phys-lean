/-
  Phys.Algebra.LorentzContinuumGenerationConverse — N101: THE CONVERSE GENERATION ON THE
  BOOST (NON-COMPACT) SECTOR — a proper orthochronous boost's polar/KAK compact part IS the
  IDENTITY (the empty two-sided generator word), hence lies in the `Module.End` generated
  submonoid `genIsomMonoidLin`, and its bridge-image lies in the `Function.End` generated
  isometry submonoid `genIsomMonoidC2` — over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N100 (docs/ROADMAP.md §N101, priority (i) — MEASURE-FIRST, no
  topology). N100 banked the FORWARD transport: every `Module.End` two-sided generator word
  `biMulLin u u'`, pushed across the faithful monoid bridge `endToFunEnd` (N99), lands in the
  `Function.End` generated isometry submonoid `genIsomMonoidC2`
  (`endToFunEnd_genIsomMonoidLin_mem_gen2`). That DISCHARGED the generation question on the
  forward (linear-word → self-map) component. The remaining direction is the CONVERSE: that an
  isometry's polar/KAK compact part `k := g∘(p^{1/2})⁻¹` (a `Module.End` member of
  `qvIsomMonoidC` via the bridge, N99) IS a finite `biMulLin` product — i.e.
  `k ∈ genIsomMonoidLin` — whence by the N100 transport `endToFunEnd k ∈ genIsomMonoidC2`,
  closing `qvIsomMonoidC ≤ genIsomMonoidC2`.

  ── WHAT THIS NODE BANKS (the genuine NEW joint — the CONVERSE direction, boost sector) ──
  The ticket's priority (i) asks literally whether a CONCRETE compact part decomposes as an
  explicit finite `biMulLin` word — "is a concrete boost's compact part the identity / a
  specific `biMulLin` / `genTwoPlaneLin`?" The theory-native answer, forced by the KAK
  structure, is: it IS THE IDENTITY. A proper orthochronous boost `g := boostEndC a b`
  (`a²−b² = 1`, `a+b ≥ 0`, `a−b ≥ 0`, i.e. `a ≥ |b|`) is

      • EvC-SELF-ADJOINT  (`boostEndC_isEvCAdjoint_self` — the symmetric off-diagonal `b`), and
      • EvC-POSITIVE-SEMIDEFINITE  (`boostC_nonneg` via the defeq `boostEndC = boostC`; the
        trunk Born positivity as a sum of squares `(a+b)/2·(t+x)² + (a−b)/2·(t−x)² + gFormC v v`),

  so it IS ITS OWN polar positive part `p^{1/2} = √(g*g)`: by the positive-operator-square-root
  UNIQUENESS for an injective target (`op_sqrt_unique_of_injective`, N93), the spectral root
  `specOpN (cutSqrt∘c) u` of `g*g = specOpN c u` and the boost `g` itself — both EvC-self-adjoint,
  positive, and squaring to `g*g` (`g*g = g∘g` since `g* = g`) — are EQUAL. Therefore the polar
  compact part collapses:

      k := g ∘ (p^{1/2})⁻¹ = p^{1/2} ∘ (p^{1/2})⁻¹ = IDENTITY,

  the EMPTY two-sided generator word, trivially in `genIsomMonoidLin` (`one_mem`); bridged, in
  `genIsomMonoidC2`. THE CONVERSE GENERATION `qvIsomMonoidC ≤ genIsomMonoidC2` is hereby
  DISCHARGED on the ENTIRE BOOST (non-compact) SECTOR — the first converse-direction result,
  with NO operator topology, NO Lie-group integration, NO posited group.

  The deep structural content (genuinely NEW, not a re-pin of N93/N100): a pure boost carries
  ZERO rotation content — it contributes the TRIVIAL element to the compact-generation problem.
  All generated 2-plane rotations come from the genuinely-compact isometries, never from the
  boosts. KAK `g = k·p` with `k = id` for the pure-positive (boost) factor is exactly the
  statement that the non-compact directions add nothing to the compact generators.

    boostEndC_nonneg            — the boost is EvC-positive-semidefinite (helper, via `boostC_nonneg`).
    boostEndC_compact_part_eq_id — ★★ THE CONVERSE CORE: the boost's polar compact part
                                  `g∘(p^{1/2})⁻¹` EQUALS `LinearMap.id` (it is its own positive part).
    boostEndC_compact_part_mem_genLin — the compact part (= id) `∈ genIsomMonoidLin` (`one_mem`).
    boostEndC_compact_part_mem_gen2  — ★★ THE CONVERSE GENERATION (boost sector): the bridged
                                  compact part `endToFunEnd k ∈ genIsomMonoidC2`.
    boostEndC_5343_compact_part_id_coord — ★ W8 NON-VACUITY / TEETH: the concrete boost `(5/3,4/3)`
                                  (`(5/3)²−(4/3)² = 1`) has compact part `= id`, reading time
                                  coordinate `1` at the pure-time vector `(1,0,0)`.

  DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93; `op_sqrt_unique_of_injective` N93;
  `specOpN_op_sqrt` N68; `specOpN_inverse` / `specOpN_resolution_of_injective` N87/N88;
  `comp_injective_of_adjoint` N88; `linIsom_injective` N91; `cutSqrt_pos` N57;
  `boostEndC`/`_isQvIsomC`/`_isEvCAdjoint_self` N89; `boostC`/`boostC_nonneg` N66;
  `endToFunEnd` N99; `genIsomMonoidLin`/`endToFunEnd_genIsomMonoidLin_mem_gen2` N100; standard
  `Submonoid.one_mem` / `LinearMap` MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited
  operator exponential / continuous functional calculus, NOT Mathlib spectral theory, NOT a
  posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`),
  NOT a bridge-in-the-forbidden-sense (the compact-part collapse is a fully proved operator
  equality, not an asserted physics identification).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the polar/KAK compact factor of a pure
  boost is trivial is standard Lie theory (a positive-definite symmetric element is its own
  positive part, with orthogonal part the identity). Here it DESCENDS from the banked
  positive-operator-square-root UNIQUENESS (N93) applied to the boost's own self-adjointness +
  Born positivity (N66) — with NO Mathlib functional calculus, NO operator `exp`, NO operator
  topology over the derived `Cut`. The CONVERSE generation direction — the membership the global
  reverse surjectivity needs — is delivered structurally for the entire non-compact sector.

  ── THE W1 HEAVY REMAINDER (childed N102, an honest dissolution ticket, NOT closed here) ──
  The CONVERSE generation on the genuinely-COMPACT (rotation) sector — that a non-boost compact
  isometry's compact part `k` is a NONTRIVIAL finite `biMulLin` product — the literal operator
  TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap` so the
  N96 affine path is continuous), and the full `Spin(9)→SO(9)` exhaustion remain the genuine
  group-manifold remainder Mathlib lacks over `Cut`. THIS node closes the boost sector; the
  compact-sector generation + topology are childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / isometry / compact /
  orthogonal / polar / KAK / Cartan / positive part / square-root / spectral / generation /
  Spin / SO(9) / SO⁺(1,9) / rotation / non-compact": what remains is pure linear algebra over the
  derived complete ordered field `Cut` and `O Cut` — the self-adjoint positive-semidefinite
  `Cut`-linear operator `boostEndC a b` (`a²−b² = 1`, `a±b ≥ 0`) composed with the
  inverse-spectral-root of its own square equals `LinearMap.id` (it IS its own positive operator
  square root, by root uniqueness on the injective square); `LinearMap.id` lies in the generated
  submonoid; its image under the monoid homomorphism `endToFunEnd` lies in the target generated
  submonoid. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGeneration
import Phys.Algebra.LorentzContinuumReverseSurj
import Phys.Algebra.LorentzContinuumPolarKAK

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The boost is EvC-positive-semidefinite (the positivity its own polar-positivity rests on). -/

/-- The boost endomorphism `boostEndC a b` is EvC-POSITIVE-SEMIDEFINITE for `a+b ≥ 0 ∧ a−b ≥ 0`
    (i.e. `a ≥ |b|`): the diagonal value is the sum of squares
    `(a+b)/2·(t+x)² + (a−b)/2·(t−x)² + gFormC v v ≥ 0` — the trunk Born positivity (`boostC_nonneg`
    N66, via the defeq `boostEndC = boostC`). The positivity that makes a proper boost its own
    polar positive part. -/
theorem boostEndC_nonneg {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) (p : STVC) :
    0 ≤ EvC (boostEndC a b p) p :=
  boostC_nonneg hab hab' p

/-! ## THE CONVERSE CORE — the boost's polar compact part is the identity. -/

/-- ★★ THE CONVERSE CORE — a proper orthochronous boost's polar/KAK compact part IS THE IDENTITY.
    For `g := boostEndC a b` with `a²−b² = 1` and `a+b ≥ 0`, `a−b ≥ 0`, the positive part of the
    polar split is `p = g*g = specOpN c u` (eigenvalues `0 < c i`, N93), and BOTH `specOpN
    (cutSqrt∘c) u` (the spectral root, N68) AND the boost `g` itself are positive operator square
    roots of `p` — `g` because it is EvC-self-adjoint (`boostEndC_isEvCAdjoint_self`),
    EvC-positive-semidefinite (`boostEndC_nonneg`), and `g∘g = g*g`. The target `p` is INJECTIVE
    (`comp_injective_of_adjoint` on the injective isometry `g`), so by the positive-operator-root
    UNIQUENESS (`op_sqrt_unique_of_injective` N93) the spectral root EQUALS the boost. Hence the
    compact part `k := g∘(p^{1/2})⁻¹ = p^{1/2}∘(p^{1/2})⁻¹ = id` (`specOpN_inverse` on the
    resolution-of-identity). A pure boost is its OWN positive part; its compact part is trivial. -/
theorem boostEndC_compact_part_eq_id {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (hpos : 0 ≤ a + b) (hpos' : 0 ≤ a - b) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      (boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id := by
  obtain ⟨n, c, u, horth, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)
  refine ⟨n, c, u, horth, hcpos, heq, ?_⟩
  -- both `specOpN (cutSqrt∘c) u` and `boostEndC a b` are positive operator square roots of `g*g`
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) u) (specOpN c u) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth
  have h₂ : IsEvCOpSqrt (boostEndC a b) (specOpN c u) :=
    ⟨boostEndC_isEvCAdjoint_self a b, boostEndC_nonneg hpos hpos', heq⟩
  -- the positive part `g*g = specOpN c u` is injective (the isometry `g` is injective)
  have hg_inj : Function.Injective (boostEndC a b) :=
    linIsom_injective (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)
  have hqinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint (boostEndC_isEvCAdjoint_self a b) hg_inj
  -- by sqrt-uniqueness the spectral root equals the boost itself, so the compact part is `id`
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) u = boostEndC a b :=
    op_sqrt_unique_of_injective hqinj h₁ h₂
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  rw [← hsqrt_eq]
  exact specOpN_inverse horth hres hsq_ne

/-! ## The converse generation on the boost sector. -/

/-- The boost's polar compact part (`= id`) lies in the `Module.End` generated two-sided submonoid
    `genIsomMonoidLin` — the EMPTY generator word (`one_mem`). A pure boost contributes the trivial
    element to the linear-operator generation. -/
theorem boostEndC_compact_part_mem_genLin {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (hpos : 0 ≤ a + b) (hpos' : 0 ≤ a - b) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      (boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) ∈ genIsomMonoidLin := by
  obtain ⟨n, c, u, _, _, heq, hkid⟩ := boostEndC_compact_part_eq_id hab hpos hpos'
  refine ⟨n, c, u, heq, ?_⟩
  rw [hkid]
  exact one_mem genIsomMonoidLin

/-- ★★ THE CONVERSE GENERATION (boost sector) — the bridged polar compact part of a proper boost
    lies in the `Function.End` generated isometry submonoid `genIsomMonoidC2`. Since the compact
    part IS the identity (`boostEndC_compact_part_eq_id`), it lies in the `Module.End` generated
    submonoid `genIsomMonoidLin` (`boostEndC_compact_part_mem_genLin`), and the N100 transport
    `endToFunEnd_genIsomMonoidLin_mem_gen2` carries it across the faithful bridge into
    `genIsomMonoidC2`. The CONVERSE direction of `qvIsomMonoidC ≤ genIsomMonoidC2` — that an
    isometry's compact part IS a finite generator product — DISCHARGED on the entire boost
    (non-compact) sector, with NO operator topology. -/
theorem boostEndC_compact_part_mem_gen2 {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (hpos : 0 ≤ a + b) (hpos' : 0 ≤ a - b) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      endToFunEnd ((boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
        ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, u, heq, hmem⟩ := boostEndC_compact_part_mem_genLin hab hpos hpos'
  exact ⟨n, c, u, heq, endToFunEnd_genIsomMonoidLin_mem_gen2 hmem⟩

/-! ## Non-vacuity and W8 teeth (the concrete boost `(5/3, 4/3)` over `Cut`). -/

/-- ★ W8 NON-VACUITY / TEETH — the CONCRETE boost `(5/3, 4/3)` (a point on the unit hyperbola
    `(5/3)² − (4/3)² = 1`) realises the converse core: its polar compact part EQUALS the identity,
    so it reads time coordinate `1` at the pure-time vector `(1,0,0)`. The converse generation is
    not vacuous: a genuine non-identity boost (off-diagonal `4/3 ≠ 0`) has a TRIVIAL compact part,
    the distinguishing fact that the entire boost sector contributes nothing to the compact
    generation. -/
theorem boostEndC_5343_compact_part_id_coord :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      ((boostEndC ((5 : Cut)/3) ((4 : Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u) ((1 : Cut), (0 : Cut), (0 : O Cut))).1 = 1 := by
  obtain ⟨n, c, u, _, _, _, hkid⟩ :=
    boostEndC_compact_part_eq_id (a := (5 : Cut)/3) (b := (4 : Cut)/3)
      (by norm_num) (by norm_num) (by norm_num)
  exact ⟨n, c, u, by rw [hkid]; rfl⟩

end

end Phys.Algebra
