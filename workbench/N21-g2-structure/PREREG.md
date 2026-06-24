# N21 — THE g₂ STRUCTURE of Der(O ℚ): explicit basis + Lie-bracket structure constants + ≅ g₂

Frozen before compute. The dimension is CLOSED (`finrank_derivationQ_eq_14`, N20). This node
derives the g₂ LIE STRUCTURE FORWARD from the banked pieces.

## GO / NO-GO

GO (bankable forward increment) requires, in priority order (bank each the instant it compiles):
1. **Bracket closure over ℚ.** `isDerivQ_bracket : IsDerivQ f → IsDerivQ g → IsDerivQ ⁅f,g⁆`
   (direct ℚ-analog of N6 `isDeriv_bracket`; same trunk reframe — distributivity, no associativity).
2. **The Lie algebra.** `derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))` carved by `IsDerivQ`,
   carrier = `derivationQ` carrier. Exposes bilinear/alternating/Jacobi. This IS "the 14-dim Lie algebra."
3. **The basis.** `derivBasis : Basis (Fin 14) ℚ derivationQ` — independence lifted from the banked
   `Dvec_linearIndependent` into the submodule (via the subtype embedding) + spanning from the banked
   `finrank_derivationQ_eq_14` (`basisOfLinearIndependentOfCardEqFinrank`).
4. **Structure constants.** A PROVED family of explicit bracket identities `⁅DiE, DjE⁆ = Σ cᵏᵢⱼ DkE`
   (each side an explicit `Module.End ℚ (O ℚ)`; proved by `ext`+coordinate `simp`+`ring`). MEASURE one
   bracket first (W9). Bank as many as fit cleanly; at minimum a non-trivial biting family.

The `≅ g₂` Lie isomorphism (3c in the ticket) is CHILDED if Mathlib lacks a usable exceptional-Lie
`g₂` to compare against (W1 — BUILD don't posit; never assert "this 14-dim algebra IS g₂" without the
isomorphism). The full 91-entry bracket table, if not finished this run, is childed (W3).

NO-GO / NEVER: posit/import a Mathlib `G₂`/`LieAlgebra.g2` to "match"; assert `≅ g₂` at grade;
weaken the basis claim; a fresh derivation table (reuse the banked `D0E..D13E`).

## KILL (instrument-cost budget, W9)

- **Per-obligation compile KILL: 90 s.** If one bracket identity / one basis obligation exceeds 90 s
  → it is an INSTRUMENT failure (W9), NOT theory. MEASURE the smallest sub-obligation first; decompose
  (per-coordinate lemmas / per-bracket lemmas), never one monolithic tactic over the 14×14 table.
- **NEVER inflate `maxHeartbeats`** above default. An inflated ceiling is the W9 fossil signature.
- **Turn-budget checkpoint at ~55%.** Prior N19/N20 runs timed out mid-finalization. Checkpoint EARLY:
  the moment a piece compiles clean → move to production → wire → `git commit`. A clean board with the
  basis + closure banked beats a richer board that times out before the bank ceremony.

## Anti-vacuity (W8) — the costume MUST bite

A NEW costume claiming a WRONG structure constant (`⁅DiE,DjE⁆ = DkE` for a `k` the coordinates refute,
or a fake basis carrying a ℚ-linear dependence among the 14) must FAIL to compile. Reuse the banked
`D0E..D13E` + `Dvec_linearIndependent` + `finrank_derivationQ_eq_14`.

## Physics-words-removable (§2)

Delete "gauge / g₂ / automorphism": what remains is a complete proof that the Leibniz-derivation
ℚ-submodule of the Cayley–Dickson double of a double of a double of ℚ is a 14-dimensional Lie algebra
(under the commutator) with the exhibited explicit basis and bracket structure constants.

## Numerics plan (reconnaissance, NOT the deliverable)

Reconstruct the 14 matrices INDEPENDENTLY from the actual banked Lean `DkE` definitions (not from
nullbasis.pkl ordering — W6 independent re-verify). Verify each is a genuine derivation of the EXACT
octonion product, rank 14, then compute all `⁅Di,Dj⁆` as 8×8 matrices and solve `Σ cᵏ Dk = ⁅Di,Dj⁆`
over ℚ to read off the structure constants to bank against.

## MEASUREMENT (W9, done before committing strategy) — all GREEN

- `isDerivQ_bracket` (ℚ closure): compiles clean, trivial (direct N6 analog).
- basis: `Dsub` (the 14 in the submodule) + `Dsub_indep` (independence lifted via
  `subtype ∘ Dsub = Dvec` defeq + `LinearIndependent.of_comp`) + `derivBasis`
  (`basisOfLinearIndependentOfCardEqFinrank`, card route on banked `finrank=14`): ~6s, clean.
  Needs `import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas`; `Module.Basis` (not bare `Basis`).
- structure constants: `⁅DiE,DjE⁆ = <comb>` via `show D*−D* = ...; ext z <;> simp only [...,
  sub_eq_add_neg, LinearMap.{sub,add,neg,smul}_apply, Module.End.mul_apply, Dk-defs, c-defs,
  CD/Dbl re/im/neg/add, qsmul] <;> ring`. Single-term (`br_0_4=D7`) AND two-term octonionic
  (`br_4_7 = 2D0+2D3`) both compile, ~3s marginal each. NO `sub_re` lemma exists → `sub_eq_add_neg`
  is the key. KEY: `Ring.lie_def` does NOT fire (bracket is defeq `*−*`); use `show D*−D* = ...`.

The numerics: all 14 genuine derivations, rank 14, **bracket CLOSES in span(D)**, all structure
constants INTEGER in {-2,-1,1,2}, 84/91 nonzero. Full table in FINDINGS.md.

## DECISION
GO. Bank in two production files, commit each on compile (W9.8):
1. `DerivationBracket.lean` — `isDerivQ_bracket` + `derivationLieQ` (Lie subalgebra ℚ) + the basis.
2. `DerivationStructureConstants.lean` — the bracket structure-constant identities (full table if it
   fits; else a biting representative family + child remainder). The `≅ g₂` isomorphism: childed N22
   (W1 — Mathlib exceptional-Lie support thin; BUILD don't posit). Costume: a WRONG constant bites.
