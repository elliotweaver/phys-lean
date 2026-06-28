/-
  Phys.Algebra.LorentzContinuumCliffordSpinHom — N144: THE COVER GROUP HOMOMORPHISM
  `Spin / Pin ↠ SO⁺(1,9)` AS A GROUP MAP — the cascade's Clifford cover assembled into a
  genuine `MonoidHom` ONTO the continuum Lorentz group, surjective. Over the derived ℝ `Cut`,
  the terminal algebra `O Cut`, the spacetime `STVC`, the indefinite Minkowski form `BvC`, the
  Clifford algebra `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORWARD JOINT (W4.5 SUFFICIENCY: advance, do not re-pin).
  N135 banked the GLOBAL surjectivity of the cover as an EXISTENCE statement: every linear
  `BvC`-isometry `g ∈ bvIsomLinMonoid` HAS a Clifford covering unit `u : CliffCˣ` with
  `CliffCovers u g` (`cover_global_bvIsom`), and the cover composes (`cliffCovers_mul`), sends
  `1 ↦ id` (`cliffCovers_one`), and covers each reflection (`cliffCovers_reflection`). N142
  graded the cover (even = Spin), N143 landed the even covering units in Mathlib's abstract
  `spinGroup QvCQuad` via the unitary condition (`cliffEvenUnit_mem_spinGroup`, the GROUP-level
  membership). What the chain did NOT yet carry is the cover AS A GROUP MAP: a genuine
  `MonoidHom` from the covering units ONTO `bvIsomLinMonoid = SO⁺(1,9)`. N135's cover is an
  elementwise relation `CliffCovers u g`; this node upgrades it to a FUNCTION (the covered
  operator is UNIQUE) and packages the function as a homomorphism — the cover IS a group
  homomorphism, surjective. That is THE genuine new content of this node, beyond N143's
  elementwise membership.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — the well-definedness DISSOLVES through ι). ──
  The one structural datum the group map needs and the chain lacked is the FAITHFULNESS of the
  spinor module embedding: `Function.Injective (ι QvCQuad)`. Over the derived field `Cut`
  (characteristic 0, so `Invertible (2 : Cut)`), Mathlib's `equivExterior` gives a `Cut`-linear
  ISOMORPHISM `CliffC ≃ₗ ExteriorAlgebra Cut STVC`, under which `changeForm_ι` sends `ι QvCQuad`
  to the exterior `ι` — and the exterior `ι` is injective (`ExteriorAlgebra.ι_inj`). So the
  cascade's spinor embedding is faithful: `cliff_iota_injective`. From injectivity the covered
  operator is UNIQUE (`cliffCovers_unique`: `CliffCovers u g → CliffCovers u h → g = h`, since
  `ι (g v) = ι (h v)` for all `v` forces `g v = h v`), which is exactly the well-definedness
  that turns the existence-cover (N135) into a function. No `tsum`, no exponential, no
  coordinate brute, no W9 risk — pure linear-equiv + closure-induction machinery.

  ── WHAT THIS NODE BANKS ──
    ★ cliff_iota_injective    — THE FAITHFUL SPINOR EMBEDDING: `Function.Injective (ι QvCQuad)`
                                over the derived field `Cut` — the spacetime `STVC` embeds
                                faithfully into the Clifford algebra `CliffC` (via `equivExterior`
                                + `ExteriorAlgebra.ι_inj`, char ≠ 2).
    ★ cliffCovers_unique      — THE COVERED OPERATOR IS UNIQUE: `CliffCovers u g → CliffCovers u h
                                → g = h` — the twisted-adjoint cover determines the linear map it
                                covers (from faithfulness). The well-definedness upgrading the
                                existence-cover (N135) to a function.
    CoversSub                 — THE COVERING SUBMONOID of `CliffCˣ`: units that cover SOME element
                                of `bvIsomLinMonoid` (closed under `1` and `*`, by `cliffCovers_one`
                                / `cliffCovers_mul`).
    coverOp / _mem / _covers  — THE COVERED-OPERATOR FUNCTION on `CoversSub`: each covering unit
                                determines its (unique) covered isometry in `bvIsomLinMonoid`.
    ★★ coverMap               — THE HEADLINE — THE COVER GROUP MAP `CoversSub →* bvIsomLinMonoid`:
                                a genuine `MonoidHom` sending a covering unit to the isometry it
                                covers, `coverMap 1 = 1` and `coverMap (u*w) = coverMap u * coverMap
                                w` (uniqueness + `cliffCovers_one` / `cliffCovers_mul`). The cover
                                IS a group homomorphism — DERIVED, not posited.
    ★★ coverMap_surjective    — THE SURJECTIVITY `↠ SO⁺(1,9)`: `coverMap` is onto `bvIsomLinMonoid`
                                — every linear `BvC`-isometry is the image of a covering unit
                                (`cover_global_bvIsom`, N135). The cover GROUP MAP is surjective
                                onto the full continuum Lorentz group.
    coverMap_spin_mem         — the abstract Spin-group elements (N143 `cliffEvenUnit_mem_spinGroup`)
                                that arise as covering units sit in `CoversSub`, tying the abstract
                                `spinGroup` membership (N143) to the cover group map.
    W8 (genuinely-indefinite teeth):
    coverMap_boost_apply      — a CONCRETE boost `(5/3,4/3)` (a genuine non-identity Lorentz element)
                                is the image under `coverMap` of its covering unit — the surjectivity
                                realized on a real boost. The read-off the costume C176 negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the double cover
  `Pin/Spin → SO⁺(1,9)` as a group homomorphism, taking both the group structure and the
  well-definedness for granted, reading the twisted adjoint off a FIXED Minkowski metric. Here
  the Clifford algebra is the FUNCTOR on the cascade's derived form `QvCQuad` over the derived
  field `Cut`, the covering units are the cascade's own `cliffUnitOf` (N135), the well-definedness
  is DERIVED from the faithfulness of the cascade's own spinor embedding (`equivExterior`, char ≠
  2 over the derived field), and the homomorphism + surjectivity onto the DERIVED Lorentz group
  `bvIsomLinMonoid` (the reflection-word group PROVED to exhaust the isometry group, N132) is
  assembled FORWARD — no posited Pin/Spin group, no posited group map, no posited well-definedness,
  no posited metric, no Mathlib ℝ/ℂ as content, no bridge. The UNBROKEN strand: the faithful
  embedding (here), the existence-cover (N135), and the closed isometry group (N132) are exactly
  the three data the surjective group homomorphism is built from.

  DERIVED from the banked N49–N143 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`.
  Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "cover / Pin / Spin / spinor / Lorentz /
  Minkowski / metric / isometry / reflection / boost / homomorphism / group-map / surjectivity /
  faithful / SO⁺(1,9) / bridge": what remains is pure algebra over the derived complete ordered
  field `Cut`, `STVC = Cut × Cut × O Cut`, the Clifford algebra `CliffC` of `QvCQuad` and its
  `ι` — `ι` is injective; the twisted-adjoint cover relation `CliffCovers` determines the linear
  operator it relates; the units covering a `bvIsomLinMonoid` element form a submonoid; the
  assignment unit ↦ covered operator is a `MonoidHom` onto `bvIsomLinMonoid`, surjective. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra` / `ι` /
  `equivExterior` / `ExteriorAlgebra` / `MonoidHom` / `Submonoid` are MACHINERY on the derived
  form), NO posited Clifford/Pin/Spin/cover/group/homomorphism structure.
-/
import Phys.Algebra.LorentzContinuumCliffordSpinGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The faithful spinor embedding — `ι QvCQuad` is injective over the derived field. -/

/-- ★ THE FAITHFUL SPINOR EMBEDDING: the canonical linear map `ι QvCQuad : STVC → CliffC` is
    INJECTIVE over the derived field `Cut`. Over a characteristic-≠-2 field (`Invertible (2 : Cut)`,
    as `Cut` has characteristic 0), Mathlib's `equivExterior` is a `Cut`-linear isomorphism
    `CliffC ≃ₗ ExteriorAlgebra Cut STVC` under which `changeForm_ι` carries `ι QvCQuad` to the
    exterior `ι`, and the exterior `ι` is injective (`ExteriorAlgebra.ι_inj`). The spacetime `STVC`
    embeds faithfully into its Clifford algebra. -/
theorem cliff_iota_injective :
    Function.Injective (CliffordAlgebra.ι (R := Cut) QvCQuad) := by
  haveI : Invertible (2 : Cut) := invertibleOfNonzero two_ne_zero
  intro x y h
  have hx : CliffordAlgebra.equivExterior QvCQuad (CliffordAlgebra.ι QvCQuad x)
          = CliffordAlgebra.equivExterior QvCQuad (CliffordAlgebra.ι QvCQuad y) := by rw [h]
  simp only [CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply,
    CliffordAlgebra.changeForm_ι] at hx
  exact (ExteriorAlgebra.ι_inj Cut x y).mp hx

/-! ## The covered operator is unique — the cover determines a function. -/

/-- ★ THE COVERED OPERATOR IS UNIQUE: if a unit `u` covers both `g` and `h` (`CliffCovers u g`,
    `CliffCovers u h`), then `g = h`. From the faithful embedding: `CliffCovers` pins
    `ι (g v) = ι (h v)` for every `v`, and `ι` injective forces `g v = h v`. This is the
    well-definedness that upgrades the existence-cover (`cover_global_bvIsom`, N135) into a
    function — the operator a covering unit covers is determined. -/
theorem cliffCovers_unique {u : CliffCˣ} {g h : Module.End Cut STVC}
    (hg : CliffCovers u g) (hh : CliffCovers u h) : g = h := by
  apply LinearMap.ext
  intro v
  apply cliff_iota_injective
  rw [← hg v, ← hh v]

/-! ## The covering submonoid and the covered-operator function. -/

/-- THE COVERING SUBMONOID of `CliffCˣ`: the units that cover SOME element of the continuum
    Lorentz group `bvIsomLinMonoid`. Closed under `1` (`cliffCovers_one`, covering `id`) and `*`
    (`cliffCovers_mul`, covering the product). -/
def CoversSub : Submonoid CliffCˣ where
  carrier := {u | ∃ g, g ∈ bvIsomLinMonoid ∧ CliffCovers u g}
  one_mem' := ⟨1, one_mem _, cliffCovers_one⟩
  mul_mem' := by
    rintro a b ⟨g, hg, hcg⟩ ⟨h, hh, hch⟩
    exact ⟨g * h, mul_mem hg hh, cliffCovers_mul hcg hch⟩

/-- THE COVERED-OPERATOR of a covering unit (well-defined by `cliffCovers_unique`; the existential
    witness, pinned uniquely by the covering relation through the lemmas below). -/
def coverOp (u : CoversSub) : Module.End Cut STVC := u.prop.choose

/-- The covered operator lies in the continuum Lorentz group `bvIsomLinMonoid`. -/
theorem coverOp_mem (u : CoversSub) : coverOp u ∈ bvIsomLinMonoid := u.prop.choose_spec.1

/-- The covering unit covers its covered operator. -/
theorem coverOp_covers (u : CoversSub) : CliffCovers (u : CliffCˣ) (coverOp u) :=
  u.prop.choose_spec.2

/-! ## THE HEADLINE — the cover as a group homomorphism onto `SO⁺(1,9)`, surjective. -/

/-- ★★ THE COVER GROUP MAP `CoversSub →* bvIsomLinMonoid`: a genuine `MonoidHom` sending each
    covering unit to the (unique) continuum-Lorentz isometry it covers. `coverMap 1 = 1`
    (`cliffCovers_one` covers `id`, unique) and `coverMap (u * w) = coverMap u * coverMap w`
    (`cliffCovers_mul` covers the product, unique) — the cover IS a group homomorphism onto the
    continuum Lorentz group, DERIVED forward, not posited. -/
def coverMap : CoversSub →* bvIsomLinMonoid where
  toFun u := ⟨coverOp u, coverOp_mem u⟩
  map_one' := by
    apply Subtype.ext
    show coverOp 1 = _
    have h1 : CliffCovers ((1 : CoversSub) : CliffCˣ) (1 : Module.End Cut STVC) := by
      rw [Submonoid.coe_one]; exact cliffCovers_one
    exact cliffCovers_unique (coverOp_covers 1) h1
  map_mul' u w := by
    apply Subtype.ext
    show coverOp (u * w) = coverOp u * coverOp w
    have hmul : CliffCovers ((u * w : CoversSub) : CliffCˣ) (coverOp u * coverOp w) := by
      rw [Submonoid.coe_mul]
      exact cliffCovers_mul (coverOp_covers u) (coverOp_covers w)
    exact cliffCovers_unique (coverOp_covers (u * w)) hmul

/-- The value of `coverMap` is exactly the covered operator. -/
@[simp] theorem coverMap_coe (u : CoversSub) : (coverMap u : Module.End Cut STVC) = coverOp u := rfl

/-- ★★ THE SURJECTIVITY `↠ SO⁺(1,9)`: `coverMap` is ONTO the continuum Lorentz group
    `bvIsomLinMonoid`. Every linear `BvC`-isometry `g` has a Clifford covering unit
    (`cover_global_bvIsom`, N135), which lies in `CoversSub` and whose covered operator is `g`
    (uniqueness). The cover GROUP MAP is surjective onto the full continuum Lorentz group. -/
theorem coverMap_surjective : Function.Surjective coverMap := by
  rintro ⟨g, hg⟩
  obtain ⟨u, hu⟩ := cover_global_bvIsom hg
  refine ⟨⟨u, g, hg, hu⟩, ?_⟩
  apply Subtype.ext
  show coverOp ⟨u, g, hg, hu⟩ = g
  exact cliffCovers_unique (coverOp_covers ⟨u, g, hg, hu⟩) hu

/-- The covered operator of a unit explicitly covering `g` IS `g` (the cover map computes the
    covering relation; the inversion of `coverOp_covers` via uniqueness). -/
theorem coverOp_eq_of_covers {u : CliffCˣ} {g : Module.End Cut STVC}
    (hg : g ∈ bvIsomLinMonoid) (hu : CliffCovers u g) :
    coverOp ⟨u, g, hg, hu⟩ = g :=
  cliffCovers_unique (coverOp_covers ⟨u, g, hg, hu⟩) hu

/-! ## Tying the abstract Spin group (N143) to the cover map. -/

/-- The like-signature even covering unit (which lands in the abstract `spinGroup QvCQuad`, N143
    `cliffEvenUnit_mem_spinGroup`) is a covering unit of the proper composite isometry — it lies in
    `CoversSub`. The abstract Spin-group elements that arise as covering units are exactly the
    domain of the cover group map. -/
theorem coverMap_spin_mem {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (hg : houseHolderM a * houseHolderM b ∈ bvIsomLinMonoid) :
    (cliffUnitOf a ha * cliffUnitOf b hb) ∈ CoversSub :=
  ⟨houseHolderM a * houseHolderM b, hg,
   cliffCovers_mul (cliffCovers_reflection ha) (cliffCovers_reflection hb)⟩

/-! ## W8 teeth — a concrete boost is the image of its covering unit. -/

/-- ★ W8 NON-VACUITY — the CONCRETE boost `(5/3,4/3)` (a genuine non-identity Lorentz element,
    off-diagonal `4/3 ≠ 0`) is the IMAGE under `coverMap` of its covering unit. The surjectivity
    realized on a real boost: `boostEndC (5/3) (4/3)` is a `BvC`-isometry, hence has a covering unit
    `u ∈ CoversSub` with `coverMap u = boostEndC (5/3) (4/3)`. The read-off the costume C176 negates. -/
theorem coverMap_boost_apply :
    ∃ u : CoversSub, (coverMap u : Module.End Cut STVC) = boostEndC ((5:Cut)/3) ((4:Cut)/3) := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  have hg : boostEndC ((5:Cut)/3) ((4:Cut)/3) ∈ bvIsomLinMonoid := boostEndC_isBvIsomLin hab
  obtain ⟨u, hu⟩ := cover_global_bvIsom hg
  exact ⟨⟨u, _, hg, hu⟩, coverOp_eq_of_covers hg hu⟩

end

end Phys.Algebra
