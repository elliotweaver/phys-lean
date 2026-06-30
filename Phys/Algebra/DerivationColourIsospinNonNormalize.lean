/-
  N203 — THE EMBEDDED WEAK-ISOSPIN `su(2)` DOES NOT NORMALIZE THE COLOUR `su(3)` INSIDE
  `g₂ = Der(O ℚ)`. The two Standard-Model non-abelian gauge factors are ENTANGLED, not a
  commuting product: the colour subalgebra is not a Lie ideal of `g₂`, because the off-Cartan
  isospin generator brackets a colour element OUT of colour.

  THE JOINT (physics reading, removable). N202 measured the two derived gauge factors — colour
  `su(3) = colourCentralizer` (N201) and weak-isospin `su(2) = ⟨DI, DJ, DK⟩` (N187/N202) — at the
  SUBMODULE level: their MEET is the 1-dim isospin Cartan line `ℚ ∙ DI` (`meet_eq_span_DI`). That
  said nothing about how the OTHER (off-meet) part of one factor ACTS on the other. THIS node banks
  the adjoint-action relation: the shared Cartan generator `DI` lies in colour, but the off-Cartan
  isospin generator `DJ` brackets it OUT —
      `⁅DJ, DI⁆ = −2 • DK ∉ colourCentralizer`
  — so `DJ` does NOT lie in the normalizer of colour, hence colour `su(3)` is NOT a Lie ideal of
  `g₂`. Physically: the Standard-Model factors `SU(3)` and `SU(2)`, both realized inside the single
  octonion derivation algebra `g₂`, cannot sit as a commuting direct-product subgroup — they are
  entangled by the simple ambient `g₂` (which has no proper ideal at all).

  WHY GENUINELY NEW (not a re-pin of N202, not mechanical, not vacuous).
  • N202 banked the submodule MEET and the facts `DI ≠ 0`, `DJ ∉ colour`. It never computed any
    Lie BRACKET between the two factors, never showed `DK ∉ colour`, never touched the normalizer.
  • NEW here: (a) the INTER-FACTOR BRACKET `⁅DI, DJ⁆ = 2 • DK` realized at the `derivationLieQ = g₂`
    subtype level (the ℚ-lift of N187's ℤ-level structure constant `struct_ij`, through the N202
    `innerDerivQ` ℚ-linearization); (b) `DK ∉ colour`; (c) the NON-NORMALIZATION
    `DJ ∉ colourCentralizer.normalizer`; (d) `colourCentralizer` is NOT an ideal of `g₂`
    (`normalizer ≠ ⊤`).
  • NON-VACUOUS WITH TEETH: `⁅DI, DJ⁆ = 2 • DK ≠ 0` (the factors genuinely do NOT commute) AND
    `⁅DJ, DI⁆ = −2 • DK ∉ colour` (the bracket genuinely LEAVES colour — not a vacuous `0 ∈ colour`).

  THE MECHANISM (THE ONE LAW reframe — the banked structure constant + the colour membership
  criterion, NOT a coordinate bash). The su(2) structure constant `⁅DI, DJ⁆ = 2 • DK` is the N187
  bracket `⁅innerDeriv hI, innerDeriv hJ⁆ = 2 • innerDeriv hK` transported into `g₂` via the N202
  ℚ-linear realization (`innerDerivQ`). Colour membership of a derivation is `D u1 = 0`
  (`commutes_JO_iff`, N201); `DK u1 = ιO(2 • hJ) ≠ 0` (N202 `DK_u1` + `hJ ≠ 0`) gives `DK ∉ colour`;
  and `DI u1 = 0` (N202 `DI_u1`) gives `DI ∈ colour`. So `⁅DJ, DI⁆ = −2 • DK` is a nonzero multiple
  of the colour-EXCLUDED `DK`, hence excluded — the off-Cartan isospin generator moves the colour
  Cartan out of colour.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / isospin / su(3) / su(2) / u(1) /
  g₂ / Cartan / gauge / ideal / normalize / complex structure / SU(3) / SU(2) / U(1)": what remains
  is the pure statement that, over the derived field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`,
  for the three inner derivations `DI, DJ, DK` and the centralizer `colourCentralizer` of left-
  multiplication by `u1`, one has `⁅DI, DJ⁆ = 2 • DK`, `DI ∈ colourCentralizer`,
  `DK ∉ colourCentralizer`, hence `⁅DJ, DI⁆ ∉ colourCentralizer`, so `DJ` is not in the normalizer of
  `colourCentralizer` and the latter is a proper non-normal subalgebra (`normalizer ≠ ⊤`). No theorem
  STATEMENT needs a physics word.

  DERIVED from the trunk (the banked structure constant `struct_ij` / `innerDeriv_bracket` /
  `four_hJ_ne_zero` N187 `DerivationHIntoO`; the ℚ-linear realization `innerDerivQ` / `DI` / `DJ` /
  `DK` / `DI_u1` / `DK_u1` N202 `DerivationColourIsospinMeet`; the colour centralizer
  `colourCentralizer` / `mem_colourCentralizer` / `commutes_JO_iff` / `isDerivQ_of_mem` N201;
  `JO` / `u1` / `iotaO` / `iotaO_injective` N42c/N197; `derivationLieQ` / `IsDerivQ` N16–N21;
  `LieSubalgebra.normalizer` / `LieSubalgebra.mem_normalizer_iff` / `lie_skew` / `Subtype.ext` /
  `LinearMap.ext` standard Mathlib MACHINERY on the DERIVED objects, STANDARD §3),
  NOT a posited su(2)/su(3)/u(1)/Lie-group/ideal/Cartan/complex-structure as content, NOT Mathlib
  ℝ/ℂ as content (ℚ is the coefficient field the `Module.End` / `LieSubalgebra` / `normalizer`
  statements are WRITTEN IN — the N6/N42/N187/N201/N202 precedent; the OBJECTS are the derived rung
  `O ℚ`, the derivation Lie algebra `derivationLieQ`, the colour centralizer, the isospin inner
  derivations), NOT a bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no native-kernel-bypass, no bridge.
-/
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Lie.Normalizer
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## The shared Cartan lies in colour; the third generator does not. -/

/-- The shared Cartan generator `DI` lies in the colour centralizer (`DI u1 = 0`, N202). This is the
    1-dim meet line (N202 `meet_eq_span_DI`), stated as a membership for the normalizer argument. -/
theorem DI_mem_colour : DI ∈ colourCentralizer := by
  rw [mem_colourCentralizer]
  exact (commutes_JO_iff (isDerivQ_of_mem DI)).mpr DI_u1

/-- `hJ ≠ 0` (from the banked `four_hJ_ne_zero`, N187). -/
theorem hJ_ne_zero' : hJ ≠ (0 : H ℚ) := by
  intro h; apply four_hJ_ne_zero; rw [h, smul_zero]

/-- ★ `DK ∉ colourCentralizer`: the third isospin generator does NOT commute with the colour
    complex structure, because `DK u1 = ιO(2 • hJ) ≠ 0` (N202 `DK_u1`, `hJ ≠ 0`, `iotaO` injective).
    (N202 banked only `DJ ∉ colour`; this is the analogous fact for `DK`, needed for the bracket.) -/
theorem DK_not_mem_colour : DK ∉ colourCentralizer := by
  rw [mem_colourCentralizer]; intro h
  have hu1 : (DK : Module.End ℚ (O ℚ)) u1 = 0 := (commutes_JO_iff (isDerivQ_of_mem DK)).mp h
  rw [DK_u1] at hu1
  have h2 : ((2:ℚ) • hJ) = 0 :=
    iotaO_injective (a₁ := (2:ℚ)•hJ) (a₂ := 0) (by rw [hu1]; ext <;> simp [iotaO])
  exact hJ_ne_zero' ((smul_eq_zero.mp h2).resolve_left (by norm_num))

/-! ## The inter-factor bracket — the su(2) structure constant inside g₂. -/

/-- ★★ THE INTER-FACTOR BRACKET, realized in `g₂ = derivationLieQ`: `⁅DI, DJ⁆ = 2 • DK`. This is
    N187's ℤ-level structure constant `struct_ij` (`⁅innerDeriv hI, innerDeriv hJ⁆ = 2 • innerDeriv hK`)
    transported into `g₂` through the N202 ℚ-linear realization `innerDerivQ`. Proved at the
    `Module.End ℚ` level pointwise (the subtype bracket is the End comp-difference), then lifted by
    `Subtype.ext`; the ℤ-2-scaling matches the ℚ-2-scaling because both are `x + x`. -/
theorem bracket_DI_DJ_eq : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK := by
  apply Subtype.ext
  show ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DI : Module.End ℚ (O ℚ)) * (DJ : Module.End ℚ (O ℚ))
        - (DJ : Module.End ℚ (O ℚ)) * (DI : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hK) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  show (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℚ) • (innerDeriv hK) z
  have hz : (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℤ) • (innerDeriv hK) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_ij
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz, show ((2:ℤ) • (innerDeriv hK) z) = (innerDeriv hK) z + (innerDeriv hK) z by rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hK) z) = (innerDeriv hK) z + (innerDeriv hK) z by rw [two_smul]]

/-- ★ W8 NON-VACUITY (the factors do NOT commute): `⁅DI, DJ⁆ = 2 • DK ≠ 0`. -/
theorem bracket_DI_DJ_ne_zero : (⁅DI, DJ⁆ : derivationLieQ) ≠ 0 := by
  rw [bracket_DI_DJ_eq]; intro h
  have hDK0 : DK = 0 := (smul_eq_zero.mp h).resolve_left (by norm_num)
  exact DK_not_mem_colour (hDK0 ▸ colourCentralizer.zero_mem)

/-! ## The bracket leaves colour; isospin does not normalize colour. -/

/-- ★ THE BRACKET LEAVES COLOUR: `⁅DJ, DI⁆ = −2 • DK ∉ colourCentralizer` — the off-Cartan isospin
    generator `DJ` brackets the colour Cartan `DI` OUT of colour. -/
theorem bracket_DJ_DI_not_mem_colour : (⁅DJ, DI⁆ : derivationLieQ) ∉ colourCentralizer := by
  intro h
  have hlie : (⁅DJ, DI⁆ : derivationLieQ) = -(2:ℚ) • DK := by
    have hsk : (⁅DJ, DI⁆ : derivationLieQ) = -(⁅DI, DJ⁆ : derivationLieQ) := by
      rw [← lie_skew DI DJ, neg_neg]
    rw [hsk, bracket_DI_DJ_eq, neg_smul]
  rw [hlie] at h
  have hDK : DK ∈ colourCentralizer := by
    have := colourCentralizer.smul_mem (-(1:ℚ)/2) h
    rwa [smul_smul, show (-(1:ℚ)/2) * (-2) = 1 by norm_num, one_smul] at this
  exact DK_not_mem_colour hDK

/-- ★★★ THE HEADLINE: the embedded weak-isospin generator `DJ` does NOT lie in the normalizer of
    the colour centralizer — colour is not preserved by the adjoint action of isospin. Witnessed by
    `DI ∈ colour` with `⁅DJ, DI⁆ ∉ colour`. -/
theorem isospin_not_normalize_colour : DJ ∉ colourCentralizer.normalizer := by
  rw [LieSubalgebra.mem_normalizer_iff]
  intro h
  exact bracket_DJ_DI_not_mem_colour (h DI DI_mem_colour)

/-- ★★ COLOUR IS NOT A LIE IDEAL OF `g₂`: the normalizer of the colour centralizer is a proper
    subalgebra (`≠ ⊤`). Since the ambient `g₂ = derivationLieQ` is simple (N28
    `DerivationSimple`), its proper dim-8 subalgebra cannot be an ideal — the two SM non-abelian
    gauge factors cannot form a commuting product subgroup. -/
theorem colour_normalizer_ne_top : colourCentralizer.normalizer ≠ ⊤ := by
  intro h
  apply isospin_not_normalize_colour
  rw [h]; exact LieSubalgebra.mem_top DJ

end Phys.Algebra
