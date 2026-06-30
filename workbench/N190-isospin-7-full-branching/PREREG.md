# N190 PREREG — THE FULL ISOSPIN BRANCHING OF THE 7: 7 = 1 ⊕ 3 ⊕ 3

FROZEN before compute. Run 416 (first run on t_77df3824).

## Front chosen (W4.5/W9 measure-first)
Front (ii) of the N189-superseded forward frontier: **the COMPLEMENTARY su(2)-action on the
remaining 6 of the 7**. N189 split off the singlet `ℚ·e₄` (`e₄ = κO 1 = ⟨0,1⟩`). N190 banks
the FULL branching: the complement decomposes into TWO adjoint copies — the explicit
`7 = 1 ⊕ 3 ⊕ 3` isospin decomposition of `ImO` under the embedded `su(2) = ⟨innerDeriv hI/J/K⟩`.

## The math (measured clean, NO coordinate brute)
`O ℚ = CD (H ℚ) = ⟨H,H⟩`. The inner derivations act COMPONENTWISE (N6 `innerDeriv_apply`:
`innerDeriv q ⟨a,b⟩ = ⟨adHom q a, adHom q b⟩`). Two complementary embeddings:
  • `iotaO : H ℚ →ₗ[ℚ] O ℚ`, `a ↦ ⟨a,0⟩`  (the OLD line — `CD.iota` packaged ℚ-linear)
  • `kappaO : H ℚ →ₗ[ℚ] O ℚ`, `b ↦ ⟨0,b⟩`  (the NEW plane — banked N189)

THE TWO INTERTWINERS (engine, generalizes N189's special e₄ case):
  • `innerDeriv q (iotaO a)  = iotaO (adHom q a)`   — old line carries the adjoint action
  • `innerDeriv q (kappaO b) = kappaO (adHom q b)`   — new plane carries the adjoint action
(both immediate from `innerDeriv_apply` + `adHom q 0 = 0`). So BOTH H-copies inside O are
intertwined by the adjoint representation of H.

THE IMAGINARY-H SUBSPACE (mirror the banked N22 `ImO` construction at rung 2):
  • `starLH : Module.End ℚ (H ℚ)`, `ImH := ker(starLH+1)`, `finrank ℚ ImH = 3`
    (rank–nullity: `range(starLH+1) = ℚ·1`, `finrank H = 4` banked N19).

THE DECOMPOSITION:
  • `iotaO(ImH) ⊆ ImO` (3-dim, the OLD imaginary line — an adjoint 3)
  • `κO 1 = e₄` spans the singlet (1-dim, N189)
  • `kappaO(ImH) ⊆ ImO` (3-dim, the NEW imaginary plane — a second adjoint 3)
  • each su(2)-INVARIANT: for imaginary q, `adHom q` preserves `ImH` (via `adHom_star_comm`),
    so `innerDeriv q` preserves each of `iotaO(ImH)`, `kappaO(ImH)`, and fixes `ℚ·e₄`.
  • DIMENSION: `3 + 1 + 3 = 7 = finrank ℚ ImO` (banked N22 `finrank_ImO`).

## GO / NO-GO
GO if: the two intertwiners + `ImH` (finrank 3) + `iotaO(ImH),kappaO(ImH) ⊆ ImO` + each
su(2)-invariant + the dimension identity `3+1+3 = 7` all compile foundations-only, AND the
node is NON-VACUOUS (the two 3's are genuine nonzero invariant subspaces, the action is
nontrivial — W8) and GENUINE (NOT a re-statement of N189's componentwise split: the new
content is the EXPLICIT `1 ⊕ 3 ⊕ 3` with the two distinct adjoint 3's identified + dimension
closure).

NO-GO / look WIDER if: the decomposition reduces to a vacuous restatement, or the dimension
assembly turns into a coordinate brute (W9), or it measures as a re-pin.

## KILL (instrument-failure threshold, W9)
- Any single obligation that does not close in a bounded probe (`lake env lean`, < ~60s) is an
  INSTRUMENT failure → MEASURE the smallest sub-obligation, DECOMPOSE, prefer structure over
  coordinate expansion. Do NOT inflate maxHeartbeats. Do NOT brute the full ImO coordinates.
- If `finrank ImH = 3` via rank–nullity fights, fall back to mirroring N22's exact proof of
  `finrank_ImO = 7` at rung 2 (the construction is identical one rung down).

## BANK-AS-YOU-GO order
1. `iotaO` + two intertwiners `innerDeriv_iotaO`/`innerDeriv_kappaO` → production + commit.
2. `starLH` + `ImH` + `finrank_ImH_eq_three` → commit.
3. invariance lemmas + `iotaO(ImH),kappaO(ImH) ⊆ ImO` → commit.
4. the `1 ⊕ 3 ⊕ 3` dimension assembly + W8 non-vacuity → commit. Gate bg.

## Costume (next id C222)
Must bite a WRONG branching claim, distinct false numeric (e.g. `3 = 190` or `6 = 190`),
DISTINCT from battery (… C220 2=188, C221 1=189). Bites the genuine relational content
(the complement is two 3's summing with the singlet to 7), not a re-statement.

## STANDARD
NO posited su(2)/su(3)/Lie group/rep as content; NO Mathlib ℝ/ℂ as content (ℚ is the
coefficient field the Module/finrank/LinearMap statements are WRITTEN IN, N6/N22/N189
precedent); objects derived: H ℚ (N3), O ℚ = CD(H ℚ) (N4), ImO (N22), innerDeriv/adHom (N6),
kappaO (N189), finrank_H/finrank_ImO (N19/N22). Physics-words-removable. NO bridge.
