/-
  Phys.Algebra.LorentzContinuumEndBridge — N99: THE Module.End ↔ Function.End MONOID BRIDGE —
  the faithful monoid homomorphism that makes the global reverse surjectivity well-posed, over
  the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N98 (docs/ROADMAP.md §N99, priority (ii)). The structural skeleton of
  the global reverse surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2` is fully assembled (N93–N98):
  every isometry `g = k · γ(1)` with `k := g∘(p^{1/2})⁻¹` ITSELF an isometry (N93) and `γ(1)` the
  endpoint of an affine cone-path from the identity (N96), packaged in ONE witness (N97); and the
  two-sided generator family now reaches the diagonal `span{1,u}` (N94), the imaginary-plane
  `span{u,w}` (N95), AND the product-unit `span{1,u·u'}` (N98) planes.

  ── THE OBSTRUCTION THE N98 MEASURE SURFACED (the algebraic joint the surjectivity passes through) ──
  The compact part `k := g∘(p^{1/2})⁻¹` (N93) is a `Module.End Cut STVC` OPERATOR (a `Cut`-linear
  map), but the generators `biMulFun u u'` and the generated submonoid
  `genIsomMonoidC2 : Submonoid (Function.End STVC)` live in the `Function.End` (bare self-map)
  world. So the very STATEMENT of the global reverse surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2`
  — and the question "is the compact part `k` a finite product of the banked generators" — needs a
  `Module.End → Function.End` BRIDGE: a structural transport, NOT a posited-physics identification.

  ── WHAT THIS NODE BANKS (the CLEAN WRAP — priority (ii) confirmed by MEASURE-FIRST, NOT a W1 core) ──
  The coercion `⇑ : Module.End Cut STVC → Function.End STVC` (a `Cut`-linear map to its underlying
  self-map) is a MONOID HOMOMORPHISM (`map_one' = id`, `map_mul' = composition`) and is FAITHFUL
  (injective: a linear map is determined by its underlying function). Concretely:

    endToFunEnd        — ★ THE BRIDGE: the monoid hom `Module.End Cut STVC →* Function.End STVC`.
    endToFunEnd_apply  — the computation rule `endToFunEnd k = ⇑k`.
    endToFunEnd_injective — ★ THE BRIDGE IS FAITHFUL: no information lost crossing it (so word
                         products of generators transport without collapse).
    endToFunEnd_mem_qvIsomMonoidC_iff — ★ THE BRIDGE REFLECTS THE ISOMETRY PREDICATE: an operator's
                         bridge-image lies in `qvIsomMonoidC` IFF the operator preserves `QvC`.
    biMulLin           — the explicit `Module.End` whose bridge-image is the generator `biMulFun u u'`
                         (the two-sided multiplication `v ↦ u·(v·u')` is `Cut`-linear, via the
                         centrality `smulCompat_oCut` — `Cut` central on `O Cut`).
    endToFunEnd_biMulLin — `endToFunEnd (biMulLin u u') = biMulFun u u'`: the generators ARE
                         bridge-images of explicit linear operators.
    biMulLin_mem_gen2  — the bridged generator `endToFunEnd (biMulLin u u')` lies in `genIsomMonoidC2`
                         for Born-units `u, u'`.
    isometry_compact_part_mem_qvIsomMonoidC — ★★★ THE JOINT: the polar/KAK compact part `k` of an
                         isometry `g`, pushed across the bridge into the `Function.End` world, lies
                         in `qvIsomMonoidC` — the SAME monoid the generators live in. So the global
                         reverse surjectivity `k ∈ genIsomMonoidC2` is now a WELL-POSED membership
                         question in a single monoid; the bridge is the joint it passes through.
    boost_compact_part_mem_qvIsomMonoidC — ★ NON-VACUITY (W8): a concrete boost realises the joint.
    endToFunEnd_biMulLin_e2_coord — ★ THE W8 ANCHOR (teeth): the bridged generator
                         `endToFunEnd (biMulLin e₂ e₂)` at the space vector `(0,0,1)` reads the
                         deep-scalar coordinate `−1` (`e₂·(1·e₂) = e₂·e₂ = −1`).

  DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93; `biMulFun`/`genIsomMonoidC2` N55;
  `biMulFun_distinct_mem_gen2` N98; `smulCompat_oCut` — `Cut` central on `O Cut`, N41-family;
  `e2_alt` N53; `specOpN`/`cutSqrt`/`IsQvIsomC`/`IsEvCAdjoint`/`qvIsomMonoidC` N49–N68; standard
  `DFunLike.coe_injective`/`MonoidHom`/`LinearMap` MACHINERY on the DERIVED objects, STANDARD §3),
  NOT a posited Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content (the continuum is the DERIVED `Cut`),
  NOT a bridge-in-the-forbidden-sense (this is a PROVED monoid homomorphism between two derived
  endomorphism monoids — a fully proved implication, not an asserted physics identification).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a linear operator is determined by its
  underlying function, and that the linear-endomorphism monoid embeds faithfully in the self-map
  monoid, is standard category/algebra. The genuine content here is that THIS embedding is exactly
  the joint the octonionic-Spin(9) reverse surjectivity passes through: the polar compact part (a
  derived `Cut`-linear operator) and the two-sided Moufang generators (derived bare self-maps) are
  rendered COMMENSURABLE in one monoid by the faithful bridge — so the generation question becomes
  well-posed without any posited group, any operator topology, or any Mathlib spectral content.

  ── THE W1 HEAVY REMAINDER (childed N100, an honest dissolution ticket, NOT closed here) ──
  The GLOBAL reverse surjectivity proper — that the compact part `k` IS a finite product of the
  banked `biMulFun` generators (the generation / word-length content), the literal operator TOPOLOGY
  over `Cut` (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap`), and the full
  `Spin(9)→SO(9)` exhaustion remain the genuine group-manifold remainder Mathlib lacks over `Cut`.
  The bridge banked here makes the statement WELL-POSED; the generation itself is childed onto the
  chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  compact / orthogonal / polar / KAK / Cartan / generator / Moufang / bimultiplication / Spin /
  SO(9) / cover / generation / reverse-surjectivity / bridge": what remains is pure mathematics —
  over the derived complete ordered field `Cut` and the algebra `O Cut`, the coercion
  `Module.End Cut STVC → Function.End STVC` is an injective monoid homomorphism, its image of an
  operator lies in the `QvC`-preserving submonoid iff the operator preserves `QvC`, the maps
  `(t,x,v) ↦ (t,x, u·(v·u'))` are bridge-images of explicit `Cut`-linear operators, and the
  operator `g∘(p^{1/2})⁻¹` of a `QvC`-preserving `g` lands, via the bridge, in the `QvC`-preserving
  submonoid. NO theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-forbidden-
  sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited
  Lorentz group.
-/
import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-! ## The Module.End ↔ Function.End monoid bridge. -/

/-- ★ THE BRIDGE — the coercion `Module.End Cut STVC → Function.End STVC` (a `Cut`-linear map to its
    underlying self-map) as a MONOID HOMOMORPHISM. Inside the structure builder `*` is the
    `Function.End` monoid multiplication (function composition), so `map_one'` (the identity linear
    map's underlying function is `id`) and `map_mul'` (the underlying function of a composite is the
    composite of the underlying functions) close definitionally. This is the structural transport
    that makes the global reverse surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2` well-posed: the
    polar compact part (a `Module.End`) and the two-sided generators (`Function.End`) are rendered
    commensurable in one monoid. -/
def endToFunEnd : Module.End Cut STVC →* Function.End STVC where
  toFun k := (k : STVC → STVC)
  map_one' := rfl
  map_mul' _ _ := rfl

/-- The computation rule: the bridge sends an operator to its underlying self-map. -/
@[simp] theorem endToFunEnd_apply (k : Module.End Cut STVC) :
    endToFunEnd k = (k : STVC → STVC) := rfl

/-- ★ THE BRIDGE IS FAITHFUL — `endToFunEnd` is INJECTIVE: a `Cut`-linear map is determined by its
    underlying function (`DFunLike.coe_injective`). No information is lost crossing the bridge, so
    word products of generators transport from the `Function.End` world back without collapse — the
    reverse-surjectivity question is not weakened by the transport. -/
theorem endToFunEnd_injective : Function.Injective endToFunEnd := by
  intro a b hab
  exact DFunLike.coe_injective hab

/-- ★ THE BRIDGE REFLECTS THE ISOMETRY PREDICATE — an operator's bridge-image lies in the
    `QvC`-preserving submonoid `qvIsomMonoidC` IFF the operator itself preserves `QvC`. Membership in
    the target monoid is EXACTLY the operator being an isometry (the carrier of `qvIsomMonoidC` is
    `{T : Function.End STVC | IsQvIsomC T}`, and `endToFunEnd k = ⇑k`). The bridge does not smuggle
    or drop the isometry property. -/
theorem endToFunEnd_mem_qvIsomMonoidC_iff (k : Module.End Cut STVC) :
    endToFunEnd k ∈ qvIsomMonoidC ↔ IsQvIsomC (k : STVC → STVC) :=
  Iff.rfl

/-! ## The two-sided generators as bridge-images of explicit linear operators. -/

/-- The explicit `Module.End` whose bridge-image is the two-sided generator `biMulFun u u'`. The
    two-sided multiplication `v ↦ u·(v·u')` on `O Cut` is `Cut`-LINEAR: additivity is bilinearity of
    `·` (`add_mul`/`mul_add`), and `Cut`-homogeneity is the centrality `smulCompat_oCut`
    (`(c•a)·b = c•(a·b)` and `a·(c•b) = c•(a·b)` — `Cut` is central on `O Cut`). The time–space
    `(t,x)` block is the identity (linear). -/
def biMulLin (u u' : O Cut) : Module.End Cut STVC where
  toFun p := (p.1, p.2.1, u * (p.2.2 * u'))
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show u * ((p.2.2 + q.2.2) * u') = u * (p.2.2 * u') + u * (q.2.2 * u')
    rw [add_mul, mul_add]
  map_smul' c p := by
    have hsc := smulCompat_oCut
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show u * ((c • p.2.2) * u') = c • (u * (p.2.2 * u'))
    rw [hsc.hl c p.2.2 u', hsc.hr c u (p.2.2 * u')]

/-- The bridge-image of `biMulLin u u'` is exactly the two-sided generator `biMulFun u u'`: the
    `Function.End` generators ARE images of explicit `Cut`-linear operators under the bridge. -/
@[simp] theorem endToFunEnd_biMulLin (u u' : O Cut) :
    endToFunEnd (biMulLin u u') = biMulFun u u' := rfl

/-- The bridged two-sided generator `endToFunEnd (biMulLin u u')` lies in the extended generated
    isometry submonoid `genIsomMonoidC2` for Born-units `u, u'` — both the generators and (below) the
    compact part are bridge-images living in the common `Function.End` monoid. -/
theorem biMulLin_mem_gen2 (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    endToFunEnd (biMulLin u u') ∈ genIsomMonoidC2 := by
  rw [endToFunEnd_biMulLin]
  exact biMulFun_distinct_mem_gen2 u u' hu hu'

/-! ## THE JOINT — the polar compact part, bridged, lands in the target isometry monoid. -/

/-- ★★★ THE JOINT — the polar/KAK compact part `k := g∘(p^{1/2})⁻¹` of an isometry `g` (N93), pushed
    ACROSS THE BRIDGE into the `Function.End` world, lies in `qvIsomMonoidC` — the SAME monoid the
    two-sided generators (and `genIsomMonoidC2`) live in. The compact part is a `Module.End`
    operator; the bridge renders it commensurable with the `Function.End` generators, so the global
    reverse surjectivity — the membership `k ∈ genIsomMonoidC2` — is now a WELL-POSED question in ONE
    monoid. The bridge is exactly the algebraic joint the surjectivity passes through (the generation
    itself — that this `qvIsomMonoidC` member IS a finite product of the banked generators — is the
    W1 HEAVY remainder, childed N100). DERIVED: the N93 compact-part isometry, transported across the
    faithful monoid hom; the bridge-image is in `qvIsomMonoidC` because `IsQvIsomC` of the compact
    part holds (`endToFunEnd_mem_qvIsomMonoidC_iff`). NO posited group, NO operator topology. -/
theorem isometry_compact_part_mem_qvIsomMonoidC (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      h.comp g = specOpN c u ∧
      endToFunEnd (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∈ qvIsomMonoidC := by
  obtain ⟨n, c, u, horth, hcpos, heq, hk⟩ := isometry_compact_part_isQvIsom hg H
  exact ⟨n, c, u, heq, hk⟩

/-! ## Non-vacuity (W8). -/

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) realises the joint — its compact part, bridged
    into the `Function.End` world, is a genuine member of `qvIsomMonoidC`. The joint is not vacuous:
    the isometry monoid contains genuine non-identity boosts whose bridged compact parts land in the
    target monoid. -/
theorem boost_compact_part_mem_qvIsomMonoidC {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      endToFunEnd ((boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
        ∈ qvIsomMonoidC :=
  isometry_compact_part_mem_qvIsomMonoidC (boostEndC_isQvIsomC hab)
    (boostEndC_isEvCAdjoint_self a b)

/-- ★ THE W8 ANCHOR (teeth) — the bridged two-sided generator `endToFunEnd (biMulLin e₂ e₂)`, read at
    the space vector `(0,0,1)`, sends the unit `1` to `e₂·(1·e₂) = e₂·e₂ = −1` (the banked
    unit-imaginary square `e2_alt`), whose deep-scalar coordinate `re.re.re = −1`. The bridge
    transports the genuine generator action — the concrete coordinate is `−1`, not anything else. -/
theorem endToFunEnd_biMulLin_e2_coord :
    ((endToFunEnd (biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (-1 : Cut) := by
  show ((CD.e2 : O Cut) * ((1 : O Cut) * (CD.e2 : O Cut))).re.re.re = (-1 : Cut)
  rw [one_mul]
  have h : (CD.e2 : O Cut) * (CD.e2 : O Cut) = (-1 : O Cut) := by
    have h := e2_alt (1 : O Cut); rwa [mul_one] at h
  rw [h]
  show ((-1 : O Cut)).re.re.re = (-1 : Cut)
  rw [CD.neg_re, CD.neg_re, Dbl.neg_re]; rfl

end

end Phys.Algebra
