# N203 — PREREG (frozen before compute)

## TARGET (the chosen W1 front — genuinely DIFFERENT physics joint)
THE EMBEDDED WEAK-ISOSPIN su(2) DOES NOT NORMALIZE THE COLOUR su(3) INSIDE g₂ = Der(O ℚ).

N202 banked the MEET of the two SM non-abelian factors at the SUBMODULE level
(isospinSpan ⊓ colourCentralizer = ℚ∙DI, dim 1) and EXPLICITLY never touched the Lie
BRACKET relating them. THIS node banks the adjoint-action relation: the colour element
DI ∈ colour (the shared Cartan) is brackated OUT of colour by the off-Cartan isospin
generator DJ — ⁅DJ, DI⁆ = −2•DK ∉ colour — so DJ ∉ colourCentralizer.normalizer, hence
the colour su(3) is NOT a Lie ideal of g₂ (the structural obstruction to the SM gauge
factors forming a commuting product subgroup; forced because g₂ is SIMPLE — banked
DerivationSimple — so its proper dim-8 subalgebra cannot be an ideal).

## WHY GENUINELY NEW / DIFFERENT / NON-VACUOUS (W4.5 + W8)
- DIFFERENT OBJECT: the Lie bracket / adjoint action between the two factors, NOT the
  submodule meet of N202, NOT the centralizer alone of N201, NOT the (1,9) form, NOT the
  sedenion associator. N202 said meet ≠ 0 and DJ ∉ colour but never computed any bracket
  between the factors.
- NEW: (a) the inter-factor bracket ⁅DI, DJ⁆ = (2:ℚ)•DK realized at the derivationLieQ=g₂
  subtype level (lift of the ℤ-level struct_ij N187 through the innerDerivQ ℚ-linearization
  N202); (b) DK ∉ colour (N202 only had DJ ∉ colour); (c) the non-normalization
  DJ ∉ colourCentralizer.normalizer; (d) colourCentralizer is not an ideal (normalizer ≠ ⊤).
- NON-VACUOUS WITH TEETH: ⁅DI, DJ⁆ = 2•DK ≠ 0 (the factors do NOT commute) AND DK ∉ colour
  — so the bracket genuinely leaves colour, not a vacuous 0 ∈ colour.

## DECL PLAN (production: Phys/Algebra/DerivationColourIsospinNonNormalize.lean)
1. DI_mem_colour            : DI ∈ colourCentralizer            (DI_u1 = 0 via commutes_JO_iff)
2. DK_not_mem_colour        : DK ∉ colourCentralizer            (DK_u1 = ιO(2•hJ) ≠ 0)
3. bracket_DI_DJ_eq         : ⁅DI, DJ⁆ = (2:ℚ)•DK               (lift of struct_ij)
4. bracket_DI_DJ_ne_zero    : ⁅DI, DJ⁆ ≠ 0  (W8 teeth — factors don't commute)
5. bracket_DJ_DI_not_mem_colour : ⁅DJ, DI⁆ ∉ colourCentralizer  (= −2•DK ∉ colour)
6. isospin_not_normalize_colour : DJ ∉ colourCentralizer.normalizer  (HEADLINE; DI witnesses)
7. colour_normalizer_ne_top : colourCentralizer.normalizer ≠ ⊤  (colour not an ideal of g₂)

## COSTUME (C235) — bite the GENUINE relational content
The inter-factor bracket coefficient is genuinely 2 (⁅DI,DJ⁆ = 2•DK). The WRONG claim that
the factors commute / isospin normalizes colour / the bracket coefficient is anything else
forces 203 = 2 in ℚ. Pair (203, 2): LHS 203 fresh, RHS 2 fresh (battery … C232 200=-2,
C233 201=8, C234 202=1). File: Counterexamples/DerivationColourIsospinNonNormalizeWrongValueCostume.lean

## GO / NO-GO (frozen)
GO if: all 7 decls compile foundations-only AND costume bites (203=2 unsolved) AND
physics-words-removable AND non-vacuous (bracket ≠ 0, DK ∉ colour).
NO-GO / DECOMPOSE if: the subtype-bracket coercion (decl 3) or the normalizer API (decl 6/7)
resists past KILL — bank the bankable prefix, child the remainder.

## KILL (instrument-failure bound — W9)
KILL = 90s / 600000 heartbeats per single obligation. If one obligation exceeds it: STOP,
measure smallest sub-obligation, decompose; do NOT inflate the ceiling. Probes via
`lake env lean` (no olean) — append #print axioms lines and read stdout, OR build module.
Whole-module olean build expected < 20s (small file, all deps banked).

## TRUNK PROVENANCE (unbroken)
struct_ij/innerDeriv_bracket/four_hJ_ne_zero (N187, DerivationHIntoO); innerDerivQ/DI/DJ/DK/
DK_u1/DI_u1 (N202, DerivationColourIsospinMeet); colourCentralizer/mem_colourCentralizer/
commutes_JO_iff/isDerivQ_of_mem (N201); JO/u1/iotaO/iotaO_injective (N42c/N197);
derivationLieQ/IsDerivQ + LieSubalgebra.normalizer/mem_normalizer_iff MACHINERY (Mathlib) on
the DERIVED objects. NO posited su(2)/su(3)/Lie-group/ideal as content, NO Mathlib ℝ/ℂ as
content (ℚ = coefficient field the Module.End/LieSubalgebra statements are WRITTEN IN), no bridge.
