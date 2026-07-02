/-
  Phys.Algebra.TowerGatherImageColourSubalgebra — N250.
  ===========================================================================
  THE IMAGE of the faithful colour su(3)-representation as a CONCRETE dim-`8` LIE SUBALGEBRA of
  `Module.End ℚ Vsub`, landing in the COMMUTANT of the charge complex structure `chargeOpV`,
  DERIVED from the gather-obstruction charge operator. Owner-authorized gather-side hypercharge
  front, under the TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01).
  Gather-native, NOT the parked invariant-tower ascent.

  THE DELIVERABLE. N248 banked the induced colour rep `colourRepV : colourCentralizer →ₗ⁅ℚ⁆
  Module.End ℚ Vsub` (a genuine Lie hom, every value commuting with `chargeOpV`, nontrivial). N249
  banked its FAITHFULNESS (`colourRepV_faithful : Function.Injective colourRepV`). Neither built
  the IMAGE as a concrete object, nor its dimension. THIS node realizes colour su(3) as a CONCRETE
  dim-`8` Lie subalgebra of the endomorphisms of the charged matter — the FIRST place injectivity
  does load-bearing work (image dim = domain dim REQUIRES faithfulness):

    ★★★ `colourRepImg := colourRepV.range : LieSubalgebra ℚ (Module.End ℚ Vsub)` — THE IMAGE of the
        induced colour rep, a genuine LIE SUBALGEBRA of the endomorphisms of the charged 6-space.
    ★★★ `finrank_colourRepImg : finrank ℚ colourRepImg.toSubmodule = 8` — THE FIRST DOWNSTREAM USE
        OF N249's INJECTIVITY: image dim = domain dim = `8` REQUIRES faithfulness. Via the Mathlib
        `LieHom.equivRangeOfInjective` (a Lie equivalence `colourCentralizer ≃ₗ⁅ℚ⁆ colourRepV.range`
        built from `colourRepV_faithful`) → `LinearEquiv.finrank_eq`, transporting N201
        `finrank_colourCentralizer_eq_eight`. The FULL dim-`8` colour su(3) sits as a concrete
        dim-`8` Lie subalgebra of `Module.End ℚ Vsub`. If the rep were NOT faithful the image would
        be strictly smaller than `8`; faithfulness is exactly what makes the image the full `8`.
    ★★  `colourRepImg_le_commutant : ∀ M ∈ colourRepImg, Commute M chargeOpV` — the image lands in
        the COMMUTANT of the charge complex structure `chargeOpV` inside `End ℚ Vsub`: colour su(3)
        is a dim-`8` subalgebra of the ℂ-LINEAR endomorphisms of the charged 6-space. Every image
        element is `colourRepV D` for some `D` (`LieHom.mem_range`); N248 `colourRepV_commute` gives
        it commutes with `chargeOpV`. Span-free / range-induction — no coordinate bash.
    ★★  `colourRepImg_ne_bot : colourRepImg ≠ ⊥` — W8 NON-VACUITY: the image is NONZERO. A genuine
        dim-`8` su(3), NOT collapsed (`colourRepV_ne_zero`, N248: `DI` acts nonzero).
    ★★★ `image_colour_subalgebra_structure` — THE CAPSTONE: the image is a Lie subalgebra of
        `Module.End ℚ Vsub` of dimension EXACTLY `8`, every element commuting with the charge
        complex structure `chargeOpV` (`chargeOpV² = −id`), and nonzero.

  THE PROOF (THE ONE LAW / no coordinate bash). Pure PACKAGING of banked structural facts:
    - `colourRepImg := colourRepV.range` is a `LieSubalgebra` by Mathlib `LieHom.range`.
    - dimension: `colourRepV.equivRangeOfInjective colourRepV_faithful` (N249) is a Lie equivalence
      `colourCentralizer ≃ₗ⁅ℚ⁆ colourRepV.range`; its underlying `LinearEquiv.finrank_eq` gives
      `finrank ℚ colourCentralizer = finrank ℚ colourRepV.range`. The `toSubmodule`/coe-sort
      reconciliations are definitional (`rfl`), and N201 `finrank_colourCentralizer_eq_eight`
      supplies the `8`. NO ring/decide/coordinate expansion.
    - commutant: `M ∈ colourRepImg → ∃ D, colourRepV D = M` (`LieHom.mem_range`); then N248
      `colourRepV_commute D`.
    - non-vacuity: `colourRepV ⟨DI, DI_mem_colour⟩` is a member of the range (`mem_range_self`) and
      is nonzero (N248 `colourRepV_ne_zero`), so the range is not `⊥`.

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The field POSITS colour su(3) as an
  abstract Lie algebra acting on the coloured matter. Here the concrete dim-`8` REALIZATION — colour
  su(3) as a dim-`8` Lie subalgebra of the endomorphisms of the charged 6-space, inside the commutant
  of the charge complex structure — is DERIVED. Its being the FULL dim-`8` (not a collapsed image) is
  the SAME `imRep_injective` (faithfulness of the parent fundamental 7-rep) read through the charge
  eigenspace split (N249); its landing in the ℂ-linear commutant is the SAME `u1` (the fold's √−1 =
  the gather-tear input = the charge operator = the complex structure `J`) forcing colour to commute
  with `chargeOpV` (N248). One cause (`u1`), many faces: faithful embedding AND ℂ-linear image.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOpV`, `colourRepV`, `colourCentralizer`, `Vsub` stay DERIVED REAL objects; `LieSubalgebra`,
  `LieHom.range`, `LieHom.equivRangeOfInjective`, `LinearEquiv.finrank_eq`, `Commute`, `finrank` are
  Mathlib machinery on them. The "commutant of the charge complex structure" content is the REAL
  statement `∀ M ∈ colourRepImg, Commute M chargeOpV`. NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`,
  NO `ℚ[i]`-as-ground.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / su(3) / charge / triplet / 3 / 3̄ /
  gauge / commutant / representation": over the derived field ℚ and `O ℚ = CD (H ℚ)`, for the induced
  restriction map `colourRepV : colourCentralizer →ₗ⁅ℚ⁆ End ℚ Vsub` (which is injective), the range
  `colourRepV.range` is a Lie subalgebra of `Module.End ℚ Vsub` whose `toSubmodule` has `finrank` `8`,
  whose every element commutes with the endomorphism `chargeOpV` (which squares to `−id`), and which
  is not `⊥`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N249 (`colourRepV_faithful`) — transitively N248
  (`colourRepV`/`colourRepV_commute`/`colourRepV_ne_zero`/`chargeOpV`/`chargeOpV_sq_id`), N201
  (`finrank_colourCentralizer_eq_eight`), N202 (`DI`/`DI_mem_colour`) — and standard Mathlib
  Lie/LinearEquiv/finrank/Commute machinery. Ground = derived ℚ; nothing posited; no Mathlib
  number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherFaithfulColourRep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE IMAGE OF THE FAITHFUL COLOUR su(3)-REPRESENTATION AS A LIE SUBALGEBRA. -/

/-- ★★★ THE IMAGE of the induced colour su(3)-representation `colourRepV` (N248), as a genuine
    LIE SUBALGEBRA of `Module.End ℚ Vsub` (Mathlib `LieHom.range`). Colour su(3) is realized as a
    concrete Lie subalgebra of the endomorphisms of the charged 6-space `Vsub = 3 ⊕ 3̄`. -/
def colourRepImg : LieSubalgebra ℚ (Module.End ℚ Vsub) := colourRepV.range

/-- The image is exactly the range of the induced colour rep. -/
theorem colourRepImg_eq_range : colourRepImg = colourRepV.range := rfl

/-- Membership in the image: `M ∈ colourRepImg` iff `M = colourRepV D` for some colour `D`. -/
theorem mem_colourRepImg {M : Module.End ℚ Vsub} :
    M ∈ colourRepImg ↔ ∃ D : colourCentralizer, colourRepV D = M := colourRepV.mem_range M

/-! ## THE DIMENSION — THE FIRST DOWNSTREAM USE OF FAITHFULNESS. -/

/-- ★★★ THE IMAGE HAS DIMENSION EXACTLY `8`: `finrank ℚ colourRepImg.toSubmodule = 8`. THE FIRST
    DOWNSTREAM USE OF N249's INJECTIVITY — image dim = domain dim = `8` REQUIRES faithfulness. Via
    the Mathlib `LieHom.equivRangeOfInjective` (a Lie equivalence `colourCentralizer ≃ₗ⁅ℚ⁆
    colourRepV.range` built from `colourRepV_faithful`, N249) → `LinearEquiv.finrank_eq`,
    transporting N201 `finrank_colourCentralizer_eq_eight`. The FULL dim-`8` colour su(3) sits as a
    concrete dim-`8` Lie subalgebra of `Module.End ℚ Vsub`. Were the rep NOT faithful, the image
    would be strictly smaller than `8`; faithfulness is exactly what makes the image the full `8`.
    The `toSubmodule`/coe-sort reconciliations are definitional (`rfl`); no coordinate bash. -/
theorem finrank_colourRepImg : Module.finrank ℚ colourRepImg.toSubmodule = 8 := by
  have e := colourRepV.equivRangeOfInjective colourRepV_faithful
  calc Module.finrank ℚ colourRepImg.toSubmodule
      = Module.finrank ℚ (colourRepV.range) := rfl
    _ = Module.finrank ℚ (colourCentralizer) := e.toLinearEquiv.finrank_eq.symm
    _ = Module.finrank ℚ colourCentralizer.toSubmodule := rfl
    _ = 8 := finrank_colourCentralizer_eq_eight

/-! ## THE COMMUTANT — THE IMAGE LANDS IN THE ℂ-LINEAR ENDOMORPHISMS. -/

/-- ★★ THE IMAGE LANDS IN THE COMMUTANT of the charge complex structure `chargeOpV`: every element
    of `colourRepImg` COMMUTES with `chargeOpV` inside `Module.End ℚ Vsub`. Colour su(3) is a
    dim-`8` subalgebra of the ℂ-LINEAR endomorphisms of the charged 6-space. Every image element is
    `colourRepV D` for some `D` (`LieHom.mem_range`); N248 `colourRepV_commute` gives it commutes
    with `chargeOpV`. Span-free / range-induction — no coordinate bash. -/
theorem colourRepImg_le_commutant : ∀ M ∈ colourRepImg, Commute M chargeOpV := by
  intro M hM
  rw [mem_colourRepImg] at hM
  obtain ⟨D, rfl⟩ := hM
  exact colourRepV_commute D

/-! ## W8 NON-VACUITY — THE IMAGE IS A GENUINE dim-8 su(3), NOT COLLAPSED. -/

/-- The concrete colour generator `DI` (N202) has a nonzero image in `colourRepImg`. -/
theorem colourRepV_DI_mem_colourRepImg : colourRepV ⟨DI, DI_mem_colour⟩ ∈ colourRepImg :=
  LieHom.mem_range_self _ _

/-- ★★ W8 NON-VACUITY: the image is NONZERO — `colourRepImg ≠ ⊥`. A genuine dim-`8` su(3), NOT
    collapsed. If the image were `⊥`, the nonzero element `colourRepV ⟨DI, DI_mem_colour⟩` (N248
    `colourRepV_ne_zero`) would be `0`, a contradiction. -/
theorem colourRepImg_ne_bot : colourRepImg ≠ ⊥ := by
  intro h
  have hmem : colourRepV ⟨DI, DI_mem_colour⟩ ∈ colourRepImg := colourRepV_DI_mem_colourRepImg
  rw [h, LieSubalgebra.mem_bot] at hmem
  exact colourRepV_ne_zero hmem

/-! ## THE CAPSTONE. -/

/-- ★★★ THE IMAGE OF THE FAITHFUL COLOUR su(3)-REPRESENTATION AS A CONCRETE dim-`8` LIE SUBALGEBRA
    of `Module.End ℚ Vsub`, in the COMMUTANT of the charge complex structure, from the gather
    obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the
    branching complement `Vsub` (N42c), colour `colourCentralizer = su(3)` (N201), the induced
    faithful colour rep `colourRepV` (N248/N249), and the charge complex structure `chargeOpV`
    (N242):
    (i)   the image `colourRepImg = colourRepV.range` is a genuine LIE SUBALGEBRA of
          `Module.End ℚ Vsub` (`LieHom.range`);
    (ii)  its dimension is EXACTLY `8` (`finrank_colourRepImg`) — the FIRST downstream use of
          faithfulness (N249): image dim = domain dim `8` REQUIRES injectivity;
    (iii) every element COMMUTES with the charge complex structure `chargeOpV`
          (`colourRepImg_le_commutant`) — the image lands in the ℂ-linear commutant;
    (iv)  `chargeOpV² = −id` (`chargeOpV_sq_id`, N242) — the complex structure is genuine, so (iii)
          is content;
    (v)   the image is NONZERO (`colourRepImg_ne_bot`) — a genuine dim-`8` su(3), NOT collapsed.
    The full dim-`8` colour su(3) is REALIZED as a concrete dim-`8` Lie subalgebra of the
    endomorphisms of the charged matter, inside the commutant of the charge complex structure. The
    realization is DERIVED — its being the FULL `8` descends from the faithfulness of the parent
    fundamental 7-rep (`imRep_injective`) through the charge eigenspace split, and its landing in
    the ℂ-linear commutant descends from colour being the centralizer of the charge complex
    structure (one cause, `u1`) — not a posited assignment. -/
theorem image_colour_subalgebra_structure :
    Module.finrank ℚ colourRepImg.toSubmodule = 8 ∧
    (∀ M ∈ colourRepImg, Commute M chargeOpV) ∧
    chargeOpV.comp chargeOpV = -LinearMap.id ∧
    colourRepImg ≠ ⊥ :=
  ⟨finrank_colourRepImg, colourRepImg_le_commutant, chargeOpV_sq_id, colourRepImg_ne_bot⟩

end

end Phys.Algebra
