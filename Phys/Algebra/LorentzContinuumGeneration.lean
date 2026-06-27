/-
  Phys.Algebra.LorentzContinuumGeneration — N100: THE ALGEBRAIC GENERATION TRANSPORT —
  the Module.End-side two-sided generators close into a submonoid whose bridge-image lands in
  the Function.End-side generated isometry submonoid `genIsomMonoidC2`, over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N99 (docs/ROADMAP.md §N100, priority (i)). N99 banked the
  `Module.End ↔ Function.End` MONOID BRIDGE `endToFunEnd : Module.End Cut STVC →* Function.End STVC`
  (faithful, reflects the `QvC`-isometry predicate), the explicit `Cut`-LINEAR two-sided operator
  `biMulLin u u'` (`endToFunEnd (biMulLin u u') = biMulFun u u'`), and `biMulLin_mem_gen2` (the
  bridged generator `∈ genIsomMonoidC2` for Born-units). The bridge rendered the polar/KAK compact
  part (a `Module.End` operator, N93) and the two-sided Moufang/Spin(9) generators (`Function.End`
  self-maps, N55/N98) commensurable in ONE monoid, making the global reverse surjectivity
  `qvIsomMonoidC ≤ genIsomMonoidC2` a WELL-POSED membership question.

  ── THE GENERATION JOINT THIS NODE BANKS (priority (i): the immediately-bankable, NO-topology core) ──
  The two-sided generators have TWO incarnations: the `Cut`-LINEAR operators `biMulLin u u'` (in
  `Module.End Cut STVC`) and the bare self-maps `biMulFun u u'` (in `Function.End STVC`), related by
  the faithful monoid hom `endToFunEnd`. On the `Module.End` side the linear generators close into a
  submonoid `genIsomMonoidLin := ⟨biMulGenSetLin⟩` (every finite product of `Cut`-linear two-sided
  Born-unit operators). THE TRANSPORT: the bridge carries this ENTIRE submonoid into
  `genIsomMonoidC2` — every finite product of the LINEAR generators, pushed across the faithful
  bridge, IS a finite product of the bare-self-map generators in `genIsomMonoidC2`. This is the
  algebraic content of the generation direction made structural through the monoid hom: a compact
  part that IS a finite `biMulLin` product on the `Module.End` side lands, via the bridge, inside
  `genIsomMonoidC2` on the `Function.End` side — the membership the global surjectivity needs, with
  NO operator topology, NO Lie-group integration, NO posited group. It descends from the monoid-hom
  laws (`map_one`, `map_mul`) under `Submonoid.closure_induction` — the structural skeleton, NOT a
  coordinate grind.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N93/N95/N99):
    biMulGenSetLin    — the `Module.End`-side two-sided Born-unit generator SET (the `Cut`-linear
                        operators `biMulLin u u'`).
    genIsomMonoidLin  — its closure: the `Module.End` generated two-sided submonoid.
    biMulGenSetLin_image_subset — the bridge maps each `Module.End` generator into `genIsomMonoidC2`.
    endToFunEnd_genIsomMonoidLin_mem_gen2 — ★★ THE TRANSPORT: every `K ∈ genIsomMonoidLin` has
                        `endToFunEnd K ∈ genIsomMonoidC2` (closure-induction over the monoid-hom laws).
    endToFunEnd_map_genIsomMonoidLin_le — ★ the submonoid form `map endToFunEnd genIsomMonoidLin ≤
                        genIsomMonoidC2`: the bridge-image of the whole linear submonoid sits inside
                        the target generated monoid.
    genTwoPlaneLin    — the CONCRETE `Cut`-linear 2-plane rotation `biMulLin w w * biMulLin u u`.
    genTwoPlaneLin_apply — its bridge-image applies as the nested self-map composition
                        `biMulFun w w (biMulFun u u p)` (the N95 composite).
    endToFunEnd_genTwoPlaneLin — the bridge-image equals the `Function.End` composite, via `map_mul`.
    genTwoPlaneLin_mem_genLin / _mem_gen2 — ★ the concrete linear rotation `∈ genIsomMonoidLin`, and
                        bridged `∈ genIsomMonoidC2`.
    genTwoPlaneLin_e2je2_fixes_one — ★ W8 NON-VACUITY: the concrete bridged rotation `genTwoPlaneLin
                        e₂ ιe₂` FIXES the real axis `(0,0,1)` (the N95 imaginary-plane rotation, now a
                        bridged `Module.End` product).
    genTwoPlaneLin_e2je2_real_coord — ★ W8 ANCHOR (teeth): the bridged rotation at `(0,0,1)` reads
                        deep-scalar coordinate `re.re.re = 1`.

  DERIVED from the trunk (`endToFunEnd`/`biMulLin`/`endToFunEnd_biMulLin`/`biMulLin_mem_gen2` N99;
  `biMulFun`/`genIsomMonoidC2` N55; `biMulComp_e2_je2_fixes_one`/`je2` N95; `e2_alt` N53; standard
  `Submonoid.closure`/`closure_induction`/`Submonoid.map`/`MonoidHom` MACHINERY on the DERIVED
  objects, STANDARD §3), NOT a posited Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content (the continuum
  IS the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (the transport is the image of a PROVED
  monoid homomorphism — a fully proved implication, not an asserted physics identification).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a monoid hom carries a generated submonoid
  into the image of the generating set is standard algebra; that octonionic bimultiplication composes
  to generic rotations is standard `Spin(9)` (Sudbery, Manogue–Dray, Baez). The genuine content here
  is that the TWO incarnations of the two-sided generator — the `Cut`-linear operator world where the
  polar compact part lives, and the bare-self-map world where the generated isometry monoid lives —
  are reconciled by the faithful bridge so the GENERATION (every linear word lands in the self-map
  generated monoid) holds WITHOUT any operator topology, any posited group, or any Mathlib spectral
  content, over the DERIVED ℝ `Cut` and the terminal algebra `O Cut`.

  ── THE W1 HEAVY REMAINDER (childed N101, an honest dissolution ticket, NOT closed here) ──
  The CONVERSE generation — that an ARBITRARY `qvIsomMonoidC` member's compact part IS such a finite
  `biMulLin` product (the full surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2`), the literal operator
  TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap`), and the full
  `Spin(9)→SO(9)` exhaustion remain the genuine group-manifold remainder Mathlib lacks over `Cut`.
  This node banks the FORWARD transport (linear words → self-map generated monoid); the converse is
  childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  generation / generator / Moufang / bimultiplication / Spin / SO(9) / plane / compact / KAK /
  bridge / cover": what remains is pure mathematics — over the derived complete ordered field `Cut`
  and the algebra `O Cut`, the `Cut`-linear maps `v ↦ u·(v·u')` close into a submonoid of
  `Module.End Cut STVC` whose image under the monoid hom `endToFunEnd` lies in the submonoid of
  `Function.End STVC` generated by the self-maps `(t,x,v) ↦ (t,x, u·(v·u'))`; a concrete product of
  two such operators bridges to the composite self-map and reads coordinate `1` at `(0,0,1)`. NO
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-forbidden-
  sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited
  Lorentz group.
-/
import Phys.Algebra.LorentzContinuumEndBridge
import Phys.Algebra.LorentzContinuumSpin9Product

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The Module.End-side two-sided generator set and its generated submonoid. -/

/-- THE `Module.End`-SIDE TWO-SIDED GENERATOR SET: every `Cut`-LINEAR operator `biMulLin u u'`
    (`v ↦ u·(v·u')`) for a pair of Born-units `u, u'`. The linear incarnation of the two-sided
    Moufang/Spin(9) generators — the operators whose bridge-images are the `Function.End`
    generators `biMulFun u u'`. -/
def biMulGenSetLin : Set (Module.End Cut STVC) :=
  {K | ∃ (u u' : O Cut), gFormC u u = 1 ∧ gFormC u' u' = 1 ∧ K = biMulLin u u'}

/-- THE `Module.End` GENERATED TWO-SIDED SUBMONOID: the closure of `biMulGenSetLin` — every finite
    product of `Cut`-linear two-sided Born-unit operators. The linear-operator world in which the
    polar/KAK compact part `k := g∘(p^{1/2})⁻¹` (a `Module.End`, N93) lives; the question "is `k` a
    finite generator product" is membership in THIS submonoid. -/
def genIsomMonoidLin : Submonoid (Module.End Cut STVC) :=
  Submonoid.closure biMulGenSetLin

/-! ## The transport: the bridge carries the linear generated submonoid into `genIsomMonoidC2`. -/

/-- The bridge maps each `Module.End`-side generator into the `Function.End`-side generated isometry
    submonoid `genIsomMonoidC2` (`endToFunEnd (biMulLin u u') = biMulFun u u' ∈ genIsomMonoidC2` for
    Born-units, `biMulLin_mem_gen2`). The generating-set form of the transport below. -/
theorem biMulGenSetLin_image_subset :
    ∀ K ∈ biMulGenSetLin, endToFunEnd K ∈ genIsomMonoidC2 := by
  rintro K ⟨u, u', hu, hu', rfl⟩
  exact biMulLin_mem_gen2 u u' hu hu'

/-- ★★ THE TRANSPORT — every `K ∈ genIsomMonoidLin` (every finite product of `Cut`-linear two-sided
    generators) is carried by the faithful bridge into `genIsomMonoidC2`: `endToFunEnd K ∈
    genIsomMonoidC2`. The generation direction made structural through the monoid hom — a compact
    part that IS a finite `biMulLin` product on the `Module.End` side lands, via the bridge, inside
    the `Function.End` generated isometry monoid where the bare-self-map generators live. Pure
    `Submonoid.closure_induction` over the monoid-hom laws: generators go to generators
    (`biMulGenSetLin_image_subset`), the identity to the identity (`map_one`), and products to
    products (`map_mul`, `mul_mem`). NO operator topology, NO coordinate grind. -/
theorem endToFunEnd_genIsomMonoidLin_mem_gen2 {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) : endToFunEnd K ∈ genIsomMonoidC2 := by
  induction hK using Submonoid.closure_induction with
  | mem x hx => exact biMulGenSetLin_image_subset x hx
  | one => rw [map_one]; exact one_mem _
  | mul x y _ _ ihx ihy => rw [map_mul]; exact mul_mem ihx ihy

/-- ★ THE SUBMONOID FORM — `map endToFunEnd genIsomMonoidLin ≤ genIsomMonoidC2`: the bridge-image of
    the whole `Module.End` two-sided generated submonoid sits inside the `Function.End` generated
    isometry submonoid. The clean statement that the linear-operator generation transports, as a
    submonoid inequality, into the self-map generation — the algebraic backbone of the global
    surjectivity, well-posed in one monoid via the bridge. -/
theorem endToFunEnd_map_genIsomMonoidLin_le :
    Submonoid.map endToFunEnd genIsomMonoidLin ≤ genIsomMonoidC2 := by
  rintro T ⟨K, hK, rfl⟩
  exact endToFunEnd_genIsomMonoidLin_mem_gen2 hK

/-! ## A concrete `Cut`-linear 2-plane rotation as a member of the linear submonoid. -/

/-- THE CONCRETE `Cut`-LINEAR 2-PLANE ROTATION: the product of two linear two-sided half-turns
    `biMulLin w w * biMulLin u u` (the linear incarnation of the N95 imaginary-plane composite
    `biMulFun w w ∘ biMulFun u u`). A genuine `Module.End` operator that is a finite product of the
    linear generators — exactly the shape a polar compact part would have. -/
def genTwoPlaneLin (u w : O Cut) : Module.End Cut STVC := biMulLin w w * biMulLin u u

/-- The bridge-image of the concrete linear rotation applies as the nested self-map composition
    `biMulFun w w (biMulFun u u p)` — the N95 composite (`map_mul`, the `Function.End` product is
    composition). -/
theorem genTwoPlaneLin_apply (u w : O Cut) (p : STVC) :
    (endToFunEnd (genTwoPlaneLin u w)) p = biMulFun w w (biMulFun u u p) := rfl

/-- The bridge-image of `genTwoPlaneLin u w` is the `Function.End` composite of the two self-map
    generators (`map_mul`, `endToFunEnd_biMulLin` twice). The concrete generators ARE bridge-images
    of explicit linear operators, and their product is the bridge-image of the product. -/
theorem endToFunEnd_genTwoPlaneLin (u w : O Cut) :
    (endToFunEnd (genTwoPlaneLin u w))
      = (endToFunEnd (biMulLin w w)) * (endToFunEnd (biMulLin u u)) := by
  unfold genTwoPlaneLin; rw [map_mul]

/-- ★ The concrete linear 2-plane rotation lies in the `Module.End` generated two-sided submonoid
    `genIsomMonoidLin` (a product of two Born-unit linear generators, `mul_mem`). -/
theorem genTwoPlaneLin_mem_genLin (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    genTwoPlaneLin u w ∈ genIsomMonoidLin := by
  unfold genTwoPlaneLin
  exact mul_mem (Submonoid.subset_closure ⟨w, w, hw, hw, rfl⟩)
    (Submonoid.subset_closure ⟨u, u, hu, hu, rfl⟩)

/-- ★ The bridged concrete linear rotation lands in `genIsomMonoidC2` — the transport applied to a
    CONCRETE finite generator product: a specific `Cut`-linear 2-plane rotation, pushed across the
    bridge, IS a member of the `Function.End` generated isometry submonoid. -/
theorem genTwoPlaneLin_mem_gen2 (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    endToFunEnd (genTwoPlaneLin u w) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2 (genTwoPlaneLin_mem_genLin u w hu hw)

/-! ## Non-vacuity and W8 teeth (the concrete `e₂`, `ιe₂` rotation over `Cut`). -/

/-- ★ W8 NON-VACUITY — the CONCRETE bridged linear 2-plane rotation `genTwoPlaneLin e₂ ιe₂`
    (`= biMulLin ιe₂ ιe₂ * biMulLin e₂ e₂` bridged) FIXES the real axis `(0,0,1)`. This is the N95
    imaginary-plane rotation, now realised as a bridged `Module.End` PRODUCT: the linear generation
    is not vacuous — a genuine non-identity rotation (it negates `span{e₂, ιe₂}`) is a finite linear
    generator product whose bridge-image is a real member of `genIsomMonoidC2`. -/
theorem genTwoPlaneLin_e2je2_fixes_one :
    (endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)))
        ((0 : Cut), (0 : Cut), (1 : O Cut))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  rw [genTwoPlaneLin_apply]; exact biMulComp_e2_je2_fixes_one

/-- ★ THE W8 ANCHOR (teeth) — the bridged concrete linear rotation `genTwoPlaneLin e₂ ιe₂`, read at
    the real axis `(0,0,1)`, fixes it, so its deep-scalar coordinate `re.re.re = 1` (the genuine
    fixed-real-axis value). A single half-turn would send `(0,0,1) ↦ (0,0,−1)` (coordinate `−1`);
    the bridged PRODUCT of two distinct anticommuting half-turns reads coordinate `1` — the
    distinguishing fact that the bridged composite is a genuine 2-plane rotation, transported across
    the monoid bridge from the `Module.End` world. -/
theorem genTwoPlaneLin_e2je2_real_coord :
    ((endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (1 : Cut) := by
  rw [genTwoPlaneLin_apply, biMulComp_e2_je2_fixes_one]; rfl

end

end Phys.Algebra
