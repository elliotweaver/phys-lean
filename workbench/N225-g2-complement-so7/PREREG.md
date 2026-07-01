# N225 PREREG — the explicit g₂-module complement so(7) = imRep(g₂) ⊕ crossEmb(7)

## Front chosen (under the OVERNIGHT GATHER LOCK — gather front, on the tower)
The stated §N224-superseded forward frontier: now that BOTH the fundamental 7 (`crossEmb`,
faithful dim-7 g₂-submodule of so(7), N224) AND the adjoint g₂ (`imRep`, dim-14, N223) sit as
g₂-submodules in ONE `so(7) = skewAdjointLieSubalgebra bornBil`, prove the EXPLICIT g₂-module
COMPLEMENT / direct sum:

    range imRep ⊔ range crossEmb = (skewAdjointLieSubalgebra bornBil).toSubmodule   (= so(7))
    range imRep ⊓ range crossEmb = ⊥                                                (trivial intersection)
    finrank so(7) = 21                                                              (= 14 + 7)

as g₂-modules on the banked tower `O ℚ`. This is the `so(7) = 14 ⊕ 7` decomposition made
rigorous — the two summands sit inside one so(7) and are complementary.

## The reduction (measure-first): ONE genuinely-new crux
The dimension count `14 + 7 = 21 = finrank so(7)` does NOT need a separate route-finding child.
It FALLS OUT of the trivial intersection + the banked `finrank_skewAdjoint_le_choose` (N28):
  - `finrank (range imRep) = 14` (imRep injective, `finrank derivationLieQ = 14` banked).
  - `finrank (range crossEmb) = 7` (banked `finrank_crossEmb_range`, N224).
  - trivial intersection ⟹ `finrank (range imRep ⊔ range crossEmb) = 14 + 7 = 21`
    (`Submodule.finrank_sup_add_finrank_inf_eq` + `finrank_bot`).
  - `range(sup) ≤ so(7)` (both summands ≤ so(7)), and `finrank so(7) ≤ C(7,2) = 21` (banked N28
    `finrank_skewAdjoint_le_choose` at the 7-dim Born form bornBil).
  - So `21 = finrank(sup) ≤ finrank so(7) ≤ 21` ⟹ `finrank so(7) = 21` AND `sup = so(7)`
    (`Submodule.eq_of_le_of_finrank_eq` on the ≤ of equal finrank).
  Hence the ENTIRE result reduces to the trivial-intersection crux.

## THE CRUX: `range imRep ⊓ range crossEmb = ⊥`  ("one cause, two terminations")
This is the "14 and 7 are NON-ISOMORPHIC g₂-irreps → share no submodule" content. Route:
Let `J := range imRep ⊓ range crossEmb`, a g₂-submodule of `End ℚ ImO` under the adjoint
action `X ↦ ⁅imRep D, X⁆` (both summands g₂-invariant: range imRep via imRep a Lie hom
`⁅imRep D, imRep D'⁆ = imRep⁅D,D'⁆`; range crossEmb via banked `crossEmb_range_g2_invariant`).
  (a) As a g₂-submodule of `range crossEmb` (which is g₂-IRREDUCIBLE, transported from the banked
      `ImLie_isIrreducible` N28 via the equivariant iso crossEmb), `J = ⊥` or `J = range crossEmb`.
  (b) If `J = range crossEmb` then `range crossEmb ≤ range imRep`: a g₂-submodule of `range imRep`
      of dim 7. But g₂-submodules of `range imRep` ↔ Lie ideals of derivationLieQ (via the Lie iso
      imRep), and `derivationLieQ_isSimpleOrder` (N28) forces every ideal to have dim 0 or 14.
      Dim 7 ∉ {0,14} → contradiction. Hence `J = ⊥`.

## Risk assessment (W9)
- COMPILE cost: LOW. No coordinate bash — everything is structural over banked finrank/irreducibility
  facts. Risk is Lean API friction (LieSubmodule/ideal plumbing, transporting irreducibility), NOT
  kernel blowup. KILL = 120s / obligation.
- Plumbing pieces to MEASURE before committing:
  P1. crossEmb g₂-equivariance: `crossEmb (D • a) = ⁅imRep D, crossEmb a⁆` (from banked intertwiner).
  P2. range crossEmb irreducibility (transport ImLie_isIrreducible via crossEmb equivariant iso).
  P3. range imRep ideal-correspondence: a g₂-submodule W ≤ range imRep gives a LieIdeal I with
      imRep(I)=W, finrank I = finrank W; isSimpleOrder ⟹ finrank W ∈ {0,14}.
  P4. assembly: finrank 21 + sup = so(7).
- If P3 (adjoint-irreducibility / ideal correspondence) turns out heavy, DECOMPOSE: bank the
  intersection crux as N225 and child assembly as N226 (W3). The assembly (P4) is cheap once the
  intersection is banked.

## Grounding (SOUL free-floating rail)
Every headline TYPE mentions banked tower objects: `imRep` (N22), `crossEmb`/`crossOp` (N224),
`bornBil` (N223), `skewAdjointLieSubalgebra bornBil` = so(7), `derivationLieQ` = g₂ = Der(O ℚ),
`ImO`. Ground = derived ℚ. Nothing posited; no bridge; extends the strand (does not fork).

## Non-vacuity (W8)
The direct sum is non-trivial: both summands are nonzero (`crossEmb_ne_zero` N224, imRep faithful
N22), dims 7 and 14 both > 0, and their sum is the full 21-dim so(7).
