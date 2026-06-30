# N201 PREREG — frozen before compute

## MEASURE-FIRST VERDICT on the named fronts (W9 / W4.5)

- **Front (i) THE FORCED GENERIC CASCADE-STOP LINK — ALREADY CLOSED, NOT OPEN.**
  Re-inspection of `Phys/Cascade/ForcedStop.lean` (commit `44035b8` "N2d-MIDDLE-core
  (the polarization core): THE FORCED IFF CLOSED — Nrm mult on CD A ⟺ A associative")
  shows the middle third is DONE: `Nrm_mul_iff_base_assoc`, `Nrm_mul_iff_O_assoc`,
  and `Nrm_not_mul_on_S` (the composition law CANNOT hold on `S ℚ`, FORCED not merely
  witnessed) are all proved, built (olean present), wired (Phys.lean + AxiomAudit),
  and audited foundations-only. THE TASK BODY, THE ROADMAP §N200-superseded paragraph,
  AND THE ForcedStop.lean HEADER DOCSTRING ARE ALL STALE on this ("middle third OPEN").
  ⟹ front (i) is REJECTED as already-banked (would be a re-pin / W4.5). Docs to be
  corrected at finalize.

- **Front (ii) HYPERCHARGE NORMALIZATION (Gell-Mann–Nishijima Q=T₃+Y/2)** — DEFERRED:
  risks a posited normalization convention (THE ONE LAW / W8). The charge normalization
  is a CHOICE in the literature; deriving it forced needs more setup than one light node.

- **Front (iii) THE COLOUR⊗ISOSPIN COMMUTANT / centralizer** — the live front.
  ⚠ N191 (`DerivationSO4TwoSU2`) already MEASURED the centralizer of the embedded
  ISOSPIN su(2) in g₂ as VACUOUS and rejected it. N197 banked `[innerDeriv q, JO]`
  ONLY for the isospin innerDeriv family. NEITHER banked the centralizer of the COLOUR
  complex structure JO across ALL of g₂.

## CHOSEN TARGET (N201)

**THE COLOUR su(3) IS THE CENTRALIZER OF THE COLOUR COMPLEX STRUCTURE J = L_{u1}
INSIDE g₂ = Der(O ℚ).**

For every ℚ-linear Leibniz derivation D of O ℚ (i.e. D ∈ derivationLieQ = g₂):
    [D, JO] = L_{D u1}   (additive form: D(JO x) = (D u1)·x + JO(D x), PURE Leibniz)
Hence D commutes with the operator JO ⟺ D u1 = 0 ⟺ D ∈ stabLieQ (N42a).
So the OPERATOR CENTRALIZER {D ∈ g₂ : D∘JO = JO∘D} = the MODULE STABILIZER su(3)
(N42a), of dimension 8 (N42b).

This is the precise theory-native meaning of "SU(3) ⊂ G₂ is the symmetry preserving
the colour complex structure": it ELEVATES su(3) from a module-fixing stabilizer (N42a)
to the Lie-theoretic CENTRALIZER of J (N42c). Connects N42a + N42b + N42c — never banked.

GENUINELY DIFFERENT from:
  - N197 (only the isospin innerDeriv family commutator, NOT all of g₂; NOT the
    centralizer-equals-stabilizer identification);
  - N191 (centralizer of the ISOSPIN su(2), measured vacuous — this is the centralizer
    of the COLOUR complex structure J, a different operator, a NON-vacuous dim-8 answer);
  - N42c (a module branching of the 7, NOT a Lie-subalgebra centralizer identification).

## DELIVERABLES (bank-as-you-go)
  1. `comm_deriv_JO`   — D(JO z) = (D u1)·z + JO(D z) for any IsDerivQ D (pure Leibniz).
  2. `commutes_JO_iff` — (D.comp JO = JO.comp D) ↔ (D : End) u1 = 0  [needs mul_one, zero_mul on O ℚ].
  3. `colourCentralizer` — {D ∈ derivationLieQ : D.comp JO = JO.comp D} as LieSubalgebra.
  4. ★★ `colourCentralizer_eq_stab` — centralizer = stabLieQ (THE HEADLINE connection).
  5. `finrank_colourCentralizer_eq_eight` — dim = 8 (transport N42b finrank_stabLieQ).
  6. W8 non-vacuity: centralizer ≠ ⊤ (D3E does NOT commute — D3E u1 = e₆ ≠ 0, N42a)
     and ≠ ⊥ (D0E commutes — D0E u1 = 0, N42a). So su(3) ⊊ g₂ as a centralizer.

## GO / NO-GO
  GO if: comm_deriv_JO + commutes_JO_iff close cheaply (Leibniz + mul_one/zero_mul on O ℚ),
  the centralizer LieSubalgebra closes (centralizer of a fixed operator always is one),
  and the eq-to-stab + dim-8 transport. All measured before committing.
  NO-GO / re-measure if: O ℚ lacks mul_one/zero_mul as cheap facts (then prove by hand,
  W1 build — not a wall), or if the equivalence collapses to a re-statement of N42a with
  no new operator-commutation content (W8: then look wider).

## KILL
  KILL = 90s / 600000 heartbeats per obligation. Any single obligation exceeding it ⟹
  INSTRUMENT failure (W9): measure smallest sub-obligation, decompose, never inflate-and-wait.

## COSTUME (next id C233)
  Must bite a WRONG claim, distinct false numeric from the battery (… C231 199=0,
  C232 200=-2). Plan: `201 = 8` — the centralizer dimension GENUINELY equals 8
  (finrank_colourCentralizer_eq_eight); the WRONG claim that it is the whole 14 (su(3) =
  g₂ / the colour structure is central / every derivation commutes with J) forces 201 = 8...
  actually bite via the dimension: WRONG dim 14 vs真 8. Use pair (201, 8) — fresh LHS.
  Alternatively bite the non-vacuity: D3E ∈ centralizer is FALSE. Decide at costume time.

## PHYSICS-WORDS-REMOVABLE
  Delete colour/su(3)/g₂/complex-structure/gauge/SU(3)/G₂/J: over the derived field ℚ and
  the Cayley–Dickson double O ℚ = CD (H ℚ), for left-multiplication JO by the fixed
  square-root-of-(−1) u1, the set of Leibniz-derivations D commuting with JO is exactly the
  set annihilating u1 (a Lie subalgebra), of dimension 8 inside the 14-dim derivation algebra,
  and it is proper (some derivation does not commute with JO). No theorem needs a physics word.
