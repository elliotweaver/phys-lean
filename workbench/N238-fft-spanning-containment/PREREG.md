# N238 — PREREG/FINDINGS: the three KNOWN-summand irreducibilities of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`
#          (the non-circular back-half toolkit of the g₂ FFT ascent) + sharp diagnosis of the
#          single remaining blocker (the g₂ FFT GENERATION lemma), childed.

## The named ascent (inherited N234→N235→N236→N237, re-confirmed this run)
`tracelessSym_irreducible` (the 27) reduces (N234) to the g₂ FFT endomorphism count
`dim End_{g₂}(7⊗7) = 4`. N235 banked the g₂-invariant GENERATORS δ=gForm, φ=assoc3, ψ=coassoc4.
N236 banked the commutant object `commutantG2` + the LOWER bound `4 ≤ finrank commutantG2`. N237
banked the PEIRCE reduction + reduced the FFT UPPER bound to the single crisp, NON-CIRCULAR
containment `commutantG2 ≤ commutantSpan`, and childed that containment (this node, N238).

## RECONNAISSANCE (re-derived + confirmed this run — the containment DECOMPOSES, its hard core isolated)
Via the four banked projectors `eᵢ = fourProj i` (complete orthogonal idempotent system, banked
N237 `fourProj_sum_eq_one` + `peirce_expand`), every `T ∈ commutantG2` Peirce-expands
`T = Σᵢⱼ eᵢ T eⱼ`, with diagonal corners `eᵢ T eᵢ ∈ End_{g₂}(Vᵢ)` and off-diagonal corners
`eᵢ T eⱼ ∈ Hom_{g₂}(Vⱼ, Vᵢ)`. The containment `commutantG2 ≤ commutantSpan` is EQUIVALENT to
(diagonal) `End_{g₂}(Vᵢ) = ℚ·eᵢ` AND (off-diagonal) `Hom_{g₂}(Vⱼ,Vᵢ) = 0` for i≠j. By Schur,
every corner NOT involving the 27 (`tracelessSym`, index 3) is decidable from irreducibility +
absolute-irreducibility of the KNOWN summands (1,7,14) — non-circular. The corners INVOLVING the
27 reduce to `End_{g₂}(27)=ℚ` and `Hom_{g₂}(27,Vⱼ)=0`, which reduce to the 27's irreducibility —
CIRCULAR with the target (as N237 froze). So the SOLE remaining wall is the 27, and the ONLY
non-circular route is the DIRECT g₂ FFT invariant count, whose genuine hard core is:

  ★ THE g₂ FFT GENERATION LEMMA (the named blocker): every g₂-invariant multilinear degree-4 form
    on the fundamental 7 is a ℚ-combination of the three δ-pairings δ₁₂δ₃₄, δ₁₃δ₂₄, δ₁₄δ₂₃ and the
    coassociative 4-form ψ = coassoc4 — so `dim (ImO^{⊗4})^{g₂} = 4`. This is the classical First
    Fundamental Theorem of invariant theory for G₂ acting on its 7, Mathlib-ABSENT (no compact-group
    Reynolds averaging over ℚ, no highest-weight/Casimir toolkit; grep empty). A genuine ASCENT
    (W1 step 1 — BUILD forward), childed as N239.

## WHAT THIS RUN BANKS (the non-circular, forward, CRITICAL-PATH toolkit — W9.8 bank-as-you-go)
The three KNOWN-summand irreducibilities — the constituents the final `irreducible_clebsch_gordan`
capstone consumes, provable NOW without the containment, each transported from a banked lever
across the banked g₂-isos (NOT re-pins — the banked levers are about `ImO`/the ideal lattice; these
are about the SUMMANDS of `End ℚ ImO = 7⊗7`, a distinct arena, requiring the transport):
- `trivialLine_no_proper_invariant` (the 1): pure dimension (`0 < dim W < 1` impossible).
- `crossEmb_range_no_proper_invariant` (the 7 = `range crossEmb`): pull W back through the injective
  g₂-equivariant `crossEmb` (banked `crossEmb_injective` + `crossOp_imRep_intertwine` N223) to an
  `adEnd`-invariant subspace of `ImO`, killed by banked `no_proper_invariant_ImO` (N28).
- `imRepL_range_no_proper_invariant` (the 14 = `range imRepL`): pull W back through the injective
  Lie-hom `imRepL` (banked `imRep_injective` + `LieHom.map_lie`) to a Lie IDEAL of `derivationLieQ`,
  killed by the banked ideal-lattice simplicity `derivationLieQ_isSimpleOrder` (N30/DerivationSimpleCollapse).
- capstone `three_known_summands_no_proper_invariant` over `fourSummands i`, `i ≠ 3`.

ONE CAUSE, THE IRREDUCIBLE FACE: the SAME banked `no_proper_invariant_ImO` (the definite-Born /
so(7)-bound dissolution, N28) that made the fundamental 7 irreducible, transported through the two
banked g₂-equivariant embeddings (cross product → the 7-summand, `imRep` → the 14-summand of `7⊗7`),
delivers 3 of the 4 Clebsch–Gordan atoms irreducible; the ideal-lattice simplicity supplies the 14.

## W9 MEASURE-FIRST (frozen before promotion)
probe1 (crossEmb transport, 7) compiled standalone EXIT 0 in 15s; probe2 (trivialLine + imRepL
transport, 1 + 14) EXIT 0. NO heavy coordinate expansion, NO `LinearIndependent` def unfolding on
the two-level space; the transports route through `Submodule.comap`/`map_comap_eq`/
`equivMapOfInjective`/`finrank_eq` + banked injectivities — submodule-instance level only. Keep the
inherited N227–N237 synthInstance ceiling for the ℚ-End instance diamond; NO proof-search raise.

## DISCIPLINE (repeated-deferral rail, SOUL)
The FFT-count front has been deferred N235→N236→N237→N238 while genuine forward TOOLKIT was banked.
Per the repeated-deferral rail this run (a) NAMES the precise remaining blocker (the g₂ FFT
GENERATION lemma, above), (b) frames this brick EXPLICITLY as a step of the named ascent (the three
non-circular corners the containment needs), and (c) childs a DEDICATED node N239 whose stated job
is the FFT generation lemma. No shrink, no bridge, no assert, no weaken-to-semisimple. Every theorem
TYPE mentions banked tower objects (crossEmb/imRepL/trivialLine/fourSummands/adEnd/derivationLieQ/ImO)
— no free-floating carrier-agnostic statement.
