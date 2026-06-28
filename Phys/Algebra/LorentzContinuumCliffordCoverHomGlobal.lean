/-
  Phys.Algebra.LorentzContinuumCliffordCoverHomGlobal — N135: THE GLOBAL COVER HOMOMORPHISM
  `Pin(1,9) ↠ SO⁺(1,9)` — the even/Spin cover (N134) lifted along an ARBITRARY reflection WORD,
  via the TWISTED ADJOINT (grade involution). Over the derived ℝ `Cut`, the terminal algebra
  `O Cut`, the spacetime `STVC`, the indefinite Minkowski form `BvC`, the Clifford algebra
  `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORCED NEXT STRUCTURE (W4.5 SUFFICIENCY: advance, do not re-pin).
  N132 CLOSED the continuum Lorentz group: `reflection_closure_eq_bvIsomLinMonoid` —
  `Submonoid.closure houseHolderMSet = bvIsomLinMonoid`, EVERY linear `BvC`-isometry IS a finite
  indefinite Householder WORD. N133 banked the generator-level cover WITH A SIGN
  (`reflection_clifford_conj : ι(houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`). N134 banked
  the even/Spin TWO-generator cover (`cover_compose_two`, sign-free for even words). The forward
  joint (priority i) those OPEN is THE GLOBAL COVER along an ARBITRARY WORD — the SURJECTIVITY
  `Pin(1,9) ↠ SO⁺(1,9)` as a DERIVED map, NOT a posited group.

  ── THE ONE LAW REFRAME (W1 step 2 — the sign DISSOLVES through the trunk). ──
  The N133 sign `-(QvC a)⁻¹` is EXACTLY what the TWISTED adjoint (grade involution) absorbs:
  Mathlib `CliffordAlgebra.involute` (`involute_ι : involute(ι m) = -ι m`) gives the textbook Pin
  cover `Ad'_u(x) := involute(↑u) · x · ↑u⁻¹`. At the generator level
    involute(ι a)·ι v·((QvC a)⁻¹•ι a) = (-ι a)·ι v·((QvC a)⁻¹•ι a)
      = -(QvC a)⁻¹•(ι a·ι v·ι a) = ι(houseHolderM a v)
  — SIGN-FREE, the clean cover (`twistedAdjoint_ι_reflection`). Since `involute` is an `AlgHom`
  (multiplicative) and `(uw)⁻¹ = w⁻¹u⁻¹`, the twisted adjoint COMPOSES: `Ad'_{uw} = Ad'_u ∘ Ad'_w`
  (`cliffCovers_mul`). Along a reflection WORD `g = R₁···Rₙ` the covering unit is the Pin element
  `u = ι a₁···ι aₙ`, and `Ad'_u(ι v) = ι(g v)` for all `v`. By N132 every Lorentz element IS such a
  word, so EVERY element of `bvIsomLinMonoid = SO⁺(1,9)` has a Clifford covering unit — the GLOBAL
  surjectivity of the cover, DERIVED, with no posited Pin/Spin group and no posited cover.

  ── WHAT THIS NODE BANKS ──
    cliffUnitOf / _val / _inv     — the Clifford unit `ι a` of an anisotropic vector as a genuine
                                    `CliffCˣ` (explicit inverse `(QvC a)⁻¹ • ι a`, no `Classical.choose`).
    CliffCovers u g               — THE TWISTED-ADJOINT COVER PREDICATE: `∀ v, involute(↑u)·ι v·↑u⁻¹
                                    = ι (g v)` — the Clifford unit `u` covers the linear map `g` on
                                    the spinor module.
    ★ twistedAdjoint_ι_reflection — THE SIGN-FREE GENERATOR COVER: `involute(ι a)·ι v·((QvC a)⁻¹•ι a)
                                    = ι(houseHolderM a v)` — N133's sign absorbed by the grade
                                    involution; the textbook Pin cover at the generator level.
    cliffCovers_reflection        — each reflection is covered by its `cliffUnitOf`.
    cliffCovers_one               — the identity is covered by the unit `1` (the cover sends `1 ↦ id`).
    ★ cliffCovers_mul             — THE HOMOMORPHISM LAW: if `u` covers `g` and `w` covers `h` then
                                    `u*w` covers `g*h` — the twisted adjoint composes (`involute`
                                    multiplicative + `(uw)⁻¹ = w⁻¹u⁻¹`). The cover is a HOMOMORPHISM.
    ★★ cover_global_reflection_word — THE GLOBAL COVER over the reflection-word group: EVERY
                                    `g ∈ Submonoid.closure houseHolderMSet` has a Clifford covering
                                    unit `u : CliffCˣ` with `CliffCovers u g`. By `closure_induction`.
    ★★ cover_global_bvIsom        — THE GLOBAL SURJECTIVITY: EVERY linear `BvC`-isometry
                                    (`g ∈ bvIsomLinMonoid = SO⁺(1,9)`, N132) has a Clifford covering
                                    unit — `Pin(1,9) ↠ SO⁺(1,9)`, the two-to-one cover surjective.
    cover_global_qvIsom           — every linear `QvC`-isometry covered (via `linQvIsom_…`, N132).
    W8 (genuinely-indefinite teeth):
    cover_global_boost            — the CONCRETE boost `(5/3,4/3)` (a real non-identity Lorentz
                                    element) has a Clifford covering unit (non-vacuity on a real boost).
    cover_global_timelike_scalar_unit — the covering unit's inverse scalar at the timelike generator
                                    is `1` (`(QvC mTimeUnit)⁻¹ = 1`); the read-off costume C167 negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Pin/Spin double cover
  `Pin(1,9) → SO⁺(1,9)` and its surjectivity onto a FIXED Minkowski metric, reading the twisted
  adjoint off that fixed structure. Here every reflection is the trunk's own `houseHolderM` (the
  Cartan–Dieudonné generator PROVED to exhaust the closed group, N132), the Clifford algebra is the
  FUNCTOR on the cascade's derived form `QvCQuad` over the derived field `Cut`, the generator lift is
  the banked `reflection_clifford_conj` (N133), the sign dissolves through Mathlib's grade involution,
  and the GLOBAL surjectivity is DERIVED FORWARD by closure induction over the reflection alphabet —
  no posited Pin/Spin group, no posited cover, no posited metric, no bridge. The UNBROKEN strand: the
  closed reflection-word group (N132) is EXACTLY what makes the global cover an induction, each
  generator a Clifford unit (N133), the composition a homomorphism (the grade involution).

  DERIVED from the banked N49–N134 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "cover / Pin / Spin / spinor / reflection /
  Householder / Lorentz / Minkowski / metric / timelike / isometry / homomorphism / surjectivity /
  word / generator / grade / involution / SO⁺(1,9) / bridge": what remains is pure algebra over the
  derived complete ordered field `Cut`, `STVC = Cut × Cut × O Cut`, the bilinear form `BvC` and its
  quadratic form `QvC`, the Clifford algebra of `QvCQuad` and Mathlib's `involute` — for every `g` in
  the submonoid generated by the maps `houseHolderM a` (`BvC a a ≠ 0`), there is a unit `u : CliffCˣ`
  with `involute(↑u)·ι v·↑u⁻¹ = ι (g v)` for all `v`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra`/`involute` are
  MACHINERY on the derived form), NO posited Clifford/Pin/Spin/cover group.
-/
import Phys.Algebra.LorentzContinuumCliffordCoverHom
import Mathlib.LinearAlgebra.CliffordAlgebra.Conjugation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The Clifford unit of an anisotropic vector as a genuine `CliffCˣ`. -/

/-- THE CLIFFORD UNIT of an anisotropic vector, built explicitly (no `Classical.choose`):
    `↑u = ι a`, `↑u⁻¹ = (QvC a)⁻¹ • ι a`. For `BvC a a ≠ 0` the anisotropy makes `ι a` a unit
    (`cliffSq` + `QvC a ≠ 0`) — the Pin generator at the unit level, packaged so the twisted
    adjoint of the WORD can compose via the group structure on `CliffCˣ`. -/
def cliffUnitOf (a : STVC) (ha : BvC a a ≠ 0) : CliffCˣ where
  val := CliffordAlgebra.ι QvCQuad a
  inv := (QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a
  val_inv := by
    have hqne : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
    rw [mul_smul_comm, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]
  inv_val := by
    have hqne : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
    rw [smul_mul_assoc, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]

@[simp] theorem cliffUnitOf_val (a : STVC) (ha : BvC a a ≠ 0) :
    (cliffUnitOf a ha : CliffC) = CliffordAlgebra.ι QvCQuad a := rfl

@[simp] theorem cliffUnitOf_inv (a : STVC) (ha : BvC a a ≠ 0) :
    (((cliffUnitOf a ha)⁻¹ : CliffCˣ) : CliffC) = (QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a := rfl

/-! ## The twisted-adjoint cover predicate, and the sign-free generator cover. -/

/-- THE TWISTED-ADJOINT COVER PREDICATE: the Clifford unit `u` COVERS the linear map `g` on the
    spinor module iff conjugation by `u` with the grade involution sends each `ι v` to `ι (g v)`:
    `∀ v, involute(↑u) · ι v · ↑u⁻¹ = ι (g v)`. The grade involution `involute` makes the cover
    sign-free (N133's reflection sign `involute(ι a) = -ι a` cancels the lift sign). -/
def CliffCovers (u : CliffCˣ) (g : Module.End Cut STVC) : Prop :=
  ∀ v : STVC,
    CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.ι QvCQuad v * ((u⁻¹ : CliffCˣ) : CliffC)
      = CliffordAlgebra.ι QvCQuad (g v)

/-- ★ THE SIGN-FREE GENERATOR COVER (the textbook Pin cover at the generator level): the twisted
    adjoint of `ι a` covers the reflection `houseHolderM a`:
    `involute(ι a) · ι v · ((QvC a)⁻¹ • ι a) = ι (houseHolderM a v)`. N133's sign `-(QvC a)⁻¹` is
    ABSORBED by the grade involution `involute(ι a) = -ι a` — sign-free, the defining cover map. -/
theorem twistedAdjoint_ι_reflection {a : STVC} (ha : BvC a a ≠ 0) (v : STVC) :
    CliffordAlgebra.involute (CliffordAlgebra.ι QvCQuad a)
      * CliffordAlgebra.ι QvCQuad v
      * ((QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a)
      = CliffordAlgebra.ι QvCQuad (houseHolderM a v) := by
  rw [CliffordAlgebra.involute_ι, reflection_clifford_conj ha v,
      mul_smul_comm, neg_smul, ← smul_neg]
  congr 1
  noncomm_ring

/-- Each reflection `houseHolderM a` is covered by its Clifford unit `cliffUnitOf a ha`. -/
theorem cliffCovers_reflection {a : STVC} (ha : BvC a a ≠ 0) :
    CliffCovers (cliffUnitOf a ha) (houseHolderM a) := by
  intro v
  rw [cliffUnitOf_val, cliffUnitOf_inv]
  exact twistedAdjoint_ι_reflection ha v

/-! ## The cover is a homomorphism: identity ↦ id, and composition. -/

/-- THE COVER SENDS `1 ↦ id`: the unit `1 : CliffCˣ` covers the identity operator. -/
theorem cliffCovers_one : CliffCovers (1 : CliffCˣ) (1 : Module.End Cut STVC) := by
  intro v
  rw [inv_one, Units.val_one, map_one, one_mul, mul_one, Module.End.one_apply]

/-- ★ THE HOMOMORPHISM LAW: if `u` covers `g` and `w` covers `h`, then `u * w` covers `g * h`. The
    twisted adjoint COMPOSES: `involute` is an `AlgHom` (multiplicative) and `(u*w)⁻¹ = w⁻¹*u⁻¹`, so
    `Ad'_{uw} = Ad'_u ∘ Ad'_w`. This is what makes the cover a group homomorphism — the defining
    feature lifted from the two-generator law (N134 `cover_compose_two`) to ARBITRARY words. -/
theorem cliffCovers_mul {u w : CliffCˣ} {g h : Module.End Cut STVC}
    (hu : CliffCovers u g) (hw : CliffCovers w h) :
    CliffCovers (u * w) (g * h) := by
  intro v
  have hval : ((u * w : CliffCˣ) : CliffC) = (u : CliffC) * (w : CliffC) := Units.val_mul u w
  have hinv : (((u * w)⁻¹ : CliffCˣ) : CliffC)
      = ((w⁻¹ : CliffCˣ) : CliffC) * ((u⁻¹ : CliffCˣ) : CliffC) := by rw [mul_inv_rev]; rfl
  rw [hval, hinv, map_mul, Module.End.mul_apply]
  calc CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.involute (w : CliffC)
          * CliffordAlgebra.ι QvCQuad v
          * (((w⁻¹ : CliffCˣ) : CliffC) * ((u⁻¹ : CliffCˣ) : CliffC))
      = CliffordAlgebra.involute (u : CliffC)
          * (CliffordAlgebra.involute (w : CliffC) * CliffordAlgebra.ι QvCQuad v
              * ((w⁻¹ : CliffCˣ) : CliffC))
          * ((u⁻¹ : CliffCˣ) : CliffC) := by noncomm_ring
    _ = CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.ι QvCQuad (h v)
          * ((u⁻¹ : CliffCˣ) : CliffC) := by rw [hw v]
    _ = CliffordAlgebra.ι QvCQuad (g (h v)) := hu (h v)

/-! ## THE GLOBAL COVER — every reflection-word / isometry element is covered. -/

/-- ★★ THE GLOBAL COVER over the reflection-word group: EVERY `g ∈ Submonoid.closure houseHolderMSet`
    has a Clifford covering unit `u : CliffCˣ` with `CliffCovers u g`. Proved by induction over the
    generating set (`closure_induction`): the generators are covered by their `cliffUnitOf`
    (`twistedAdjoint_ι_reflection`), the identity by `1` (`cliffCovers_one`), and products compose
    (`cliffCovers_mul`). The Pin element covering a word `R₁···Rₙ` is the product `ι a₁···ι aₙ`. -/
theorem cover_global_reflection_word {g : Module.End Cut STVC}
    (hg : g ∈ Submonoid.closure houseHolderMSet) :
    ∃ u : CliffCˣ, CliffCovers u g := by
  induction hg using Submonoid.closure_induction with
  | mem x hx =>
      obtain ⟨a, ha, rfl⟩ := hx
      exact ⟨cliffUnitOf a ha, cliffCovers_reflection ha⟩
  | one => exact ⟨1, cliffCovers_one⟩
  | mul x y _ _ ihx ihy =>
      obtain ⟨u, hu⟩ := ihx
      obtain ⟨w, hw⟩ := ihy
      exact ⟨u * w, cliffCovers_mul hu hw⟩

/-- ★★ THE GLOBAL SURJECTIVITY `Pin(1,9) ↠ SO⁺(1,9)`: EVERY linear `BvC`-isometry
    (`g ∈ bvIsomLinMonoid`, the full continuum Lorentz group, N132) has a Clifford covering unit
    `u : CliffCˣ` with `CliffCovers u g`. Combines the reflection-word cover
    (`cover_global_reflection_word`) with N132's classification
    `reflection_closure_eq_bvIsomLinMonoid` (every isometry IS a reflection word). The two-to-one
    cover is SURJECTIVE — DERIVED forward, no posited Pin/Spin group, no posited cover. -/
theorem cover_global_bvIsom {g : Module.End Cut STVC} (hg : g ∈ bvIsomLinMonoid) :
    ∃ u : CliffCˣ, CliffCovers u g := by
  apply cover_global_reflection_word
  rw [reflection_closure_eq_bvIsomLinMonoid]
  exact hg

/-- THE GLOBAL COVER on the predicate form: every linear `QvC`-isometry `g` has a Clifford covering
    unit. Via N132's `linQvIsom_mem_reflection_closure` (every linear `QvC`-isometry a reflection
    word) and the reflection-word cover. -/
theorem cover_global_qvIsom {g : Module.End Cut STVC} (hg : IsQvIsomC g) :
    ∃ u : CliffCˣ, CliffCovers u g :=
  cover_global_reflection_word (linQvIsom_mem_reflection_closure hg)

/-! ## W8 teeth — a concrete boost is covered, and a numeric read-off. -/

/-- ★ W8 NON-VACUITY — the CONCRETE boost `(5/3,4/3)` (a genuine non-identity Lorentz element,
    off-diagonal `4/3 ≠ 0`) has a Clifford covering unit. The global surjectivity realized on a real
    boost: `boostEndC (5/3) (4/3)` is a `BvC`-isometry (`boostEndC_isBvIsomLin`), hence covered. -/
theorem cover_global_boost :
    ∃ u : CliffCˣ, CliffCovers u (boostEndC ((5:Cut)/3) ((4:Cut)/3)) := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  exact cover_global_bvIsom (boostEndC_isBvIsomLin hab)

/-- ★ W8 TEETH — the covering unit's inverse SCALAR at the timelike generator is `1`:
    `(QvC mTimeUnit)⁻¹ = 1`, because `QvC mTimeUnit = 1` (the timelike unit is anisotropic with unit
    norm). The Clifford unit `cliffUnitOf mTimeUnit` has inverse `(QvC mTimeUnit)⁻¹ • ι mTimeUnit
    = 1 • ι mTimeUnit` — the read-off the costume C167 (`1 = 135`) negates. -/
theorem cover_global_timelike_scalar_unit : (QvC (mTimeUnit : STVC))⁻¹ = 1 := by
  have : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self
  rw [this, inv_one]

end

end Phys.Algebra
