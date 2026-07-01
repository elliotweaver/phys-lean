# N237 — PREREG/FINDINGS: the g₂ FFT UPPER bound `finrank commutantG2 ≤ 4` (the hard core)

## The named ascent (inherited N234→N235→N236, re-confirmed this run)
`tracelessSym_irreducible` reduces (N234) to `dim End_{g₂}(7⊗7) = 4`. N236 banked the commutant
object `commutantG2 = End_{g₂}(End ℚ ImO)` + the LOWER bound `4 ≤ finrank commutantG2` (four banked
orthogonal idempotent projectors, linearly independent). THIS node attacks the UPPER bound
`finrank commutantG2 ≤ 4` — the genuine g₂ First Fundamental Theorem hard core.

## RECONNAISSANCE VERDICT (frozen before compute) — the decomposition route is PROVABLY CIRCULAR
Via the four banked projectors `eᵢ = fourProj i` (complete orthogonal idempotent system, `Σeᵢ = id`
banked `projTrivial_add_proj27_add_proj7_add_proj14`, orthogonal `fourProj_mul_ne`, idempotent
`fourProj_mul_self`, all in `commutantG2` `fourProj_mem_commutantG2`), every `T ∈ commutantG2`
Peirce-expands `T = Σᵢⱼ eᵢ T eⱼ`, and `eᵢ·commutantG2·eⱼ ≅ Hom_{g₂}(Vⱼ, Vᵢ)`. Hence
      `dim commutantG2 = Σᵢⱼ dim Hom_{g₂}(Vⱼ, Vᵢ)`   (Vᵢ = the four summands 1,7,14,27).
Closing this at `4` needs the DIAGONAL `dim End_{g₂}(Vᵢ) = 1` (each summand absolutely irreducible)
AND the OFF-DIAGONAL `dim Hom_{g₂}(Vᵢ,Vⱼ) = 0` (i≠j). For the 27 (`tracelessSym`), `dim End_{g₂}(27)=1`
IS the target irreducibility — CIRCULAR. Confirmed: the decomposition route cannot deliver `≤4`.

## THE ONLY NON-CIRCULAR ROUTE (the direct FFT count) + its trunk-native shape
`dim commutantG2 = dim (ImO^{⊗4})^{g₂}` (self-dual via the definite `bornBil`). The g₂ First
Fundamental Theorem: the invariant quadrilinear forms on the 7 have dim exactly 4. TRUNK-NATIVE
SHAPE (found this run): the 4 spanning invariants are **3 metric double-pairings δ(·)δ(·) + the
coassociative 4-form ψ = coassoc4** (NOT "3 δδ + φ·φ" naively — N211 `octCross_gram_contraction`
shows the SYMMETRIC part of the φφ-Gram contraction reduces to δδ, and its ANTISYMMETRIC part is
exactly ψ = coassoc4, N210). So `Inv₄ = span{δ₁₂δ₃₄, δ₁₃δ₂₄, δ₁₄δ₂₃, ψ}`. The `≥4` (independence)
half is the banked lower bound; the `≤4` (SPANNING / "no more invariants") half is the genuine
Mathlib-absent classification — no compact-group Reynolds averaging (not posited over ℚ), no
highest-weight/Casimir toolkit (Mathlib-absent). A genuine multi-node ASCENT.

## WHY NO ONE-RUN DISSOLUTION (SOUL W1 step 2 applied honestly)
`dim Inv₄ = dim End_{g₂}(7⊗7) = dim commutantG2` — the invariant-form count and the commutant count
are literally the SAME problem (self-duality), so reframing form↔module does NOT dissolve it. The
spanning direction requires either (a) tensor-invariant/FFT machinery built forward (W1 step 1,
multi-node), or (b) a g₂ weight/Reynolds toolkit (Mathlib-absent, multi-node). No slick trunk
collapse found after thorough reconnaissance of the banked Schur/isotypic/semisimplicity levers.

## WHAT THIS RUN BANKS (the forward brick — W9.8 bank-as-you-go) + what it childs
Bank the TRACTABLE, non-circular, forward structural skeleton the FFT-assembly needs:
- `commutantG2` is a unital ℚ-SUBALGEBRA of `End ℚ (End ℚ ImO)` (contains id, closed under mul).
- the four banked projectors are a COMPLETE ORTHOGONAL IDEMPOTENT SYSTEM inside it (`Σeᵢ=id`).
- the PEIRCE EXPANSION `T = Σᵢⱼ eᵢ T eⱼ` for every `T ∈ commutantG2`, with each corner
  `eᵢ T eⱼ ∈ commutantG2` — the explicit reduction that SHARPENS the upper bound to the
  corner (Hom-vanishing / End-scalar) facts.
Then CHILD the genuine hard core (the FFT SPANNING count `dim Inv₄ ≤ 4` / equivalently the corner
facts involving the 27) as the next dissolution node on the tail, and BLOCK. A stalled board with an
honest block + queued dissolution ticket is CORRECT; a "done" node hiding the unproven FFT is the
worst failure.

## W9 INSTRUMENT NOTE (inherited N236)
`LinearIndependent`/heavy defs unfold pathologically on the two-level `End ℚ (End ℚ ImO)` via the
Cayley–Dickson instance diamond (whnf timeout even at 800k hb). Route through operator-level
`Module.End.mul_apply` + pointwise `LinearMap.ext` + submodule membership (as N236 did), NEVER through
`LinearIndependent` def unfolding. Keep the inherited synthInstance ceiling; NO proof-search raise.
MEASURE each obligation in a bounded probe before committing.

## DISCIPLINE
No shrink to "semisimple", no bridge, no assert, no weaken. Every theorem TYPE mentions banked tower
objects (commutantG2/fourProj/adEnd/derivationLieQ/ImO). The brick is explicitly a step of the named
ascent (cites the childed FFT core), NOT undirected breadth.
