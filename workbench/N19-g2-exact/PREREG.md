# N19 — PREREG (frozen GO/NO-GO + compile-cost KILL budget)

## Target (from the ticket, sharpened decomposition)
Close `dim_ℚ Der(O ℚ) = 14` FORWARD + the g₂ structure, in dependency order:
  (i)   PREREQUISITE INFRA — finite-dimensionality scaffold on `O ℚ`:
        `FiniteDimensional ℚ (O ℚ)` + `finrank ℚ (O ℚ) = 8` (the 8 coordinate
        units), and `Der` realized as a `Submodule ℚ (Module.End ℚ (O ℚ))` so
        `Module.finrank ℚ Der` is a well-typed statement. THE NAMED FIRST BLOCKER.
        Bounded + coordinate-LIGHT. MEASURE first (W9.2).
  (ii)  LOWER bound dim ≥ 14 — 14 explicit independent derivations.
  (iii) UPPER bound dim ≤ 14 — the so(7)→g₂ cut 21→14 (rep-theoretic, W9-PRIME).
  (iv)  g₂ structure constants (from N6 `isDeriv_bracket`) + ≅ g₂.

## What is ALREADY banked (reuse, do NOT re-derive — W6 re-verify)
  • N6 Derivation.lean: IsDeriv, derivation (LieSubalgebra ℤ), innerDeriv/liftEnd/adHom,
    witnessDeriv (NONZERO).
  • N16 DerivationDim.lean: deriv_one (D 1 = 0).
  • N17 DerivationSkew.lean: instModuleQO/instModuleQH/cdModuleQ/dblModuleQ (Module ℚ),
    deriv_qsmul (ℤ-deriv ⟹ ℚ-linear), trace_id, deriv_star, deriv_real_zero,
    deriv_norm_preserve (skew = Der ⊆ so(7)).
  • N18 DerivationTraceFree.lean: deriv_reQ_zero/deriv_maps_im (trace-free), deriv_comm_star.
  • Numerics workbench/N16-g2-dimension: rank 50 / nullity 14 ⟹ dim=14; explicit 14
    integer-sparse basis (nullbasis.pkl), pivots [10,11,12,13,14,15,19,20,21,22,23,37,38,39].

## STANDARD §3 framing decision (FROZEN)
`Module ℚ (O ℚ)` / `Basis (Fin 8) ℚ (O ℚ)` / `finrank ℚ (O ℚ)` are MACHINERY on the
DERIVED object `O ℚ` — the OBJECT is the derived octonions, ℚ is the coefficient field
the finrank statement is WRITTEN IN (the metalanguage of dimension), exactly as N17
banked `Module ℚ (O ℚ)` and N3/N4 used `Matrix`/`Module`/`Subring`. NOT a posited number
system. This follows the N6/N16/N17 precedent (concrete Emergent witness ground = `O ℚ`).

## Compile-cost KILL budget (W9, FROZEN before compute)
  • Default maxHeartbeats (200000). NEVER inflate. A file/obligation that needs more is
    a W9 instrument-wall casualty → measure/decompose/reframe, NOT a longer grind.
  • KILL = 90s / obligation. Any single obligation exceeding 90s wall is declared an
    instrument failure → MEASURE the smallest sub-obligation, DECOMPOSE, prefer the
    STRUCTURAL route (LinearEquiv to a product, NOT a coordinate basis-matrix).
  • The 512×64 ℚ-rank brute kernel is MEASURED DEAD (N16 FINDINGS). FORBIDDEN to retry
    via decide/ring on a coordinate goal. The count is STRUCTURAL: scaffold + explicit
    basis (L) + per-generator cut (U).

## GO / NO-GO
  GO if: the finrank scaffold (i) elaborates clean under the KILL budget — the structural
    route `CD A ≃ₗ[ℚ] A × A` (componentwise re/im), chaining finrank_prod + finrank_self.
    Bank it the instant it compiles (W9.8 bank-as-you-go), commit, THEN attempt (ii).
  NO-GO / DECOMPOSE (W3) if: the scaffold fights past the KILL budget, OR the lower bound
    (ii) independence rank / the per-matrix IsDeriv checks blow up → bank the scaffold,
    child the remainder (lower + upper + g₂) onto the chain tail, complete as decomposed.
  The HONEST minimum deliverable this run: the finrank scaffold (i) banked + a costume
    biting a WRONG dimension + the remainder childed. The exact dim=14 / ≅g₂ is NEVER
    asserted, NEVER a bridge.

## Anti-vacuity (W8) — the new costume MUST bite a WRONG dimension
A claim `finrank ℚ (O ℚ) = 7` (or 9), or a fake "basis" of 8 vectors carrying a ℚ-linear
dependence, must FAIL to compile. Reuse the banked Module ℚ (O ℚ) — never a fresh table.

## Physics-words-removable
Delete "gauge / g₂ / automorphism": the scaffold is the pure statement that the
Cayley–Dickson double of a double of a double is an 8-dimensional ℚ-vector space and its
Leibniz-derivations form a ℚ-submodule of its endomorphism ring. No physics word load-bearing.

## Anti-circling (carried from N16/N17/N18 FINDINGS, still binding)
  • Do NOT decide/ring a 512×64 ℚ-rank; do NOT inflate maxHeartbeats. Brute kernel DEAD.
  • The scaffold is the STRUCTURAL route (product equiv), NOT a coordinate basis matrix.
