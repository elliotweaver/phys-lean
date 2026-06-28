# N122 PREREG — THE DERIVED-`Cut` FINRANK TOWER (the dimension count over the fold-derived ℝ `Cut`)

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## MEASURE-FIRST (ROADMAP §N122 priority ordering, the explicit (ii) measure)
ROADMAP §N122 names three scaffolds in priority order: (i) the full finrank-strong-recursion
assembly, (ii) the `Cut`-basis of `O Cut` — "MEASURE whether a `Cut`-basis of `O Cut` OR the
`ℚ→Cut` finrank transport is the lighter scaffold", (iii) operator topology over `Cut`.

MEASURED:
- The full assembly (i) is HEAVY: its base case ("fixes all imaginary axes ⟹ identity") needs a
  spanning/basis argument, and the KEY NEW MEASURE ("is there always a moved unit-imaginary axis
  INSIDE the complement") is exactly what N121's frontier flagged as potentially resistant. The
  ISOMETRY strand has no clean analogue of N85's `submodule_selfadj_has_eigenvalue`. Multi-run.
- The explicit `Cut`-basis (ii-basis) is HEAVY: an 8-element basis with Cut-linear-independence +
  spanning = a coordinate node.
- ★ The `ℚ→Cut` FINRANK TRANSPORT (ii-transport) is LIGHT and CERTAIN: N76 already banked the
  derived-`Cut` product equivalences `dblProdEquivCut : Dbl Cut ≃ₗ[Cut] Cut × Cut`,
  `hProdEquivCut : H Cut ≃ₗ[Cut] Dbl Cut × Dbl Cut`, `oProdEquivCut : O Cut ≃ₗ[Cut] H Cut × H Cut`.
  The ℚ proof `finrank_O_eq_eight` (DerivationFinrank, `2→4→8` through `Module.finrank_prod` +
  `Module.finrank_self`) transports VERBATIM with these `Cut`-equivalences. The derived-`Cut`
  finrank VALUES are genuinely UNBANKED (`finrank_O_eq_eight` is over ℚ; `finrank_STV = 10` is
  over ℚ — STV = ℚ×ℚ×O ℚ, NOT STVC = Cut×Cut×O Cut).

DECISION: bank the ii-transport. It is the lighter scaffold the ROADMAP names, AND it is the
load-bearing PREREQUISITE both heavier options need (the recursion's base case and depth bound,
and the basis enumeration, are all stated in `finrank Cut` terms). It OPENS structure the chain
lacks (W4.5: not lateral re-pinning — the derived-`Cut` dimensions are nowhere banked).

## TARGET (N122 — the derived-`Cut` finrank tower)
Over the fold-derived complete ordered field `Cut`, through the cascade's own doubling
equivalences (NOT Mathlib ℝ):
  - `finrank_dbl_eq_two_Cut`  : `finrank Cut (Dbl Cut) = 2`   (rung 1, via `dblProdEquivCut`)
  - `finrank_H_eq_four_Cut`   : `finrank Cut (H Cut) = 4`     (rung 2, via `hProdEquivCut`)
  - ★ `finrank_O_eq_eight_Cut`: `finrank Cut (O Cut) = 8`     (rung 3 — THE NAMED GAP, via `oProdEquivCut`)
  - `finrank_STVC`            : `finrank Cut STVC = 10`       (= 1+1+8, the (1,9) spacetime dimension
                                over the derived field, via `Module.finrank_prod`/`finrank_self`)
  - ★★ `ePerp_finrank_value`  : `finrank Cut (ePerp e) = 7` for a Born-unit `e` (`gFormC e e = 1`) —
                                THE CONCRETE DEPTH BOUND: the moved-axis Born-orthogonal complement
                                is 7-dimensional, so each peel of the global octonion-block exhaustion
                                lands on `8 − 1 = 7` and the descent terminates in ≤ 7 reflections
                                (N119's `ePerp_finrank` `= finrank (O Cut) − 1`, evaluated at 8).
  - (optional, if budget) `finrank_End_O_Cut` : `finrank Cut (Module.End Cut (O Cut)) = 64`
                                (the operator-space dimension the SO(8) generators live inside).

W8 TEETH (concrete, non-vacuous): `ePerp_finrank_witness` — `finrank Cut (ePerp ke2je2) = 7`
(`ke2je2` a Born-unit, `ke2je2_gFormC_self = 1`), the concrete moved-axis complement dimension.

## GO / NO-GO
GO if: every finrank obligation isolated-typechecks clean (`lake env lean` exit 0), each well
under the 90s KILL (expect ≪ 1s each — these are equiv-transport `rw`s, the lightest possible);
production builds an olean; `#print axioms` ⊆ {propext, Classical.choice, Quot.sound} for every
decl, INDEPENDENTLY audited vs the built olean; costume C154 bites.

NO-GO / DECOMPOSE: this node is the LIGHT scaffold by construction; if any value fights (it
should not), it is an INSTRUMENT issue (wrong equiv direction / missing `Module.finrank_self`),
NOT theory — reframe, do not weaken. The full finrank-strong-recursion assembly + the
fixes-all-imaginary-axes⟹identity lemma + operator topology over `Cut` are the childed heavy
remainder N123 regardless.

## KILL (INSTRUMENT failure, not theory)
- Any obligation exceeding 90s isolated `lake env lean` = W9 instrument wall → MEASURE/DECOMPOSE,
  do NOT inflate maxHeartbeats, do NOT brute. (These are `LinearEquiv.finrank_eq` transports;
  the ℚ analogues are one-liners. A blow-up means wrong framing.)
- NO inflated maxHeartbeats, NO native_decide, NO monolithic ring/decide/simp on expanded
  coordinates. Every step a structural `rw` through the banked equivalences.

## ANTI-DRIFT (THE ONE LAW)
The dimension count DESCENDS FROM THE FOLD: `O Cut := CD (CD (CD Cut))`, the doubling cascade's
own structural equivalences `Dbl/H/O ProdEquivCut` (N76), evaluated over the DERIVED continuum
`Cut`. NOT Mathlib ℝ as content; NOT a posited dimension; NOT `finrank_O_eq_eight` over ℚ
re-labeled. The ℚ→Cut transport is the SAME structural proof over the derived field. NEVER add a
hypothesis; NEVER weaken; NO bridge.

## COSTUME C154
A WRONG finrank / dimension-count claim, reducing to a false numeric DISTINCT from the banked
battery (… C152 0=115, C153 1=117): the BOGUS claim that `finrank Cut (O Cut) = 119` (the
terminal algebra is 8-dimensional over the derived field, NOT 119). Rewriting via the true
`finrank_O_eq_eight_Cut` forces `8 = 119`, must NOT compile. False numeric 119 distinct from the
battery (117 last). Physics-words-removable: the costume is a pure linear-algebra dimension claim
over the derived field, no physics word.

## ANTI-CIRCLING ROUTE LOG
(routes attempted + failure modes appended here as they happen)
