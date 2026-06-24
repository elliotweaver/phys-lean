# N19 — PREREG ADDENDUM (run 121, the lower-bound advance)

## Inherited state (W6 verified independently this run)
- Run 120 banked the FINITE-DIMENSIONALITY SCAFFOLD: commit 0aab339,
  `Phys/Algebra/DerivationFinrank.lean`, `.olean` present, wired into Phys.lean.
  Re-verified: builds clean in 3.4s; the 7 load-bearing theorems
  (finrank_O_eq_eight, finrank_End_eq_64, finrank_derivationQ_le/_pos,
  derivationQ_ne_bot, witnessDerivQ_ne_zero, toEndQ_isDerivQ) are ALL
  foundations-only ⊆ {propext, Classical.choice, Quot.sound}. NOT a W9 fossil
  (no inflated heartbeats, structural product-equiv route, not a coordinate basis).
- Run 120 TIMED OUT before finalizing: docs (ROADMAP/FINDINGS) drafted but
  uncommitted; NO N20 created; lifecycle dangling. Scratch probes s4/s5 are clean
  reconnaissance (default heartbeats) that MEASURED the per-matrix Leibniz check
  cheap (~8s).
- W6 numerics re-verified (lb_analysis.py): all 14 nullbasis matrices are genuine
  derivations of the EXACT octonion product (model.py structure constants), rank 14.

## THE ADVANCE THIS RUN — the LOWER BOUND dim ≥ 14 (task DONE names
  "finrank scaffold + lower bound" as a valid honestly-scoped N19 core)
Exhibit the 14 explicit independent derivations + `14 ≤ finrank ℚ derivationQ`.

★ KEY DE-RISK (NEW this run, lb_analysis.py): the independence is DIAGONAL. Every
  Dk has a coordinate (out a_k, in i_k) where it is the UNIQUE nonzero among the 14:
    D0:(2,5) D1:(3,5) D2:(4,5) D3:(1,6) D4:(2,6) D5:(3,6) D6:(4,6) D7:(5,6)
    D8:(1,7) D9:(2,7) D10:(3,7) D11:(4,7) D12:(5,7) D13:(6,7)  (all value -1)
  So the functional φ_j(D) := (D e_{i_j}).coord_{a_j} gives φ_j(Dk) = -δ_jk
  (a NEGATED 14×14 identity) ⟹ the 14 are linearly independent with NO 14×14
  determinant — the unitriangular-functional route, MUCH cheaper than a raw
  LinearIndependent Fintype argument over 64-dim End.

## Compile-cost KILL budget (W9, FROZEN — carried from run-120 PREREG)
- Default maxHeartbeats (200000). NEVER inflate.
- KILL = 90s / obligation. The per-matrix IsDerivQ check is MEASURED ~8s (run 120
  s5 probe). The independence idiom is UNMEASURED → MEASURE on a 3-derivation probe
  BEFORE writing all 14 (W9.2). The 512×64 brute kernel stays MEASURED-DEAD.

## TURN-BUDGET KILL (anti-timeout, the prior run died at 90/90)
- Hard checkpoint: by the time ~55-60% of the turn budget is used, STOP advancing
  and FINALIZE whatever is banked (commit + child N20 + complete N19 as
  scaffold+lower-bound core). A clean board with turns to spare beats a richer board
  that times out mid-lifecycle (run 120's failure). Bank-as-you-go (W9.8): commit
  each file the instant it elaborates clean.

## GO / NO-GO
- GO (lower bound) if: the 3-derivation independence probe elaborates clean under
  the KILL budget. Then write all 14 (direct LinearMap forms, the measured-cheap
  route, NOT a matrix-abstraction layer that breaks the measured simp), the
  independence functional, and `14 ≤ finrank ℚ derivationQ`. Bank, commit.
- NO-GO / DECOMPOSE (W3) if: the independence idiom fights past the KILL budget, OR
  turn-budget checkpoint hit → finalize N19 as the SCAFFOLD ONLY (commit run-120
  docs, child the FULL remainder lower+upper+g₂ to N20), complete as decomposed.
  The scaffold is a legitimate bankable node on its own (PREREG i).

## Anti-vacuity (W8) — the new costume MUST bite a WRONG count
A claim that the 14 explicit derivations are linearly DEPENDENT (a false ℚ-linear
relation among them), or that a `dkfun` is NOT a derivation, must FAIL to compile.
Reuse the banked derivationQ + witnessDerivQ + the explicit forms from nullbasis.pkl.

## Physics-words-removable
Delete "gauge / g₂ / automorphism": what remains is the pure statement that the
Leibniz-derivation ℚ-submodule of the Cayley–Dickson double of a double of a double
has dimension ≥ 14, exhibited by 14 explicit linearly-independent derivations.

## Anti-circling (binding)
- Direct LinearMap forms (measured-cheap), NOT a matrix-abstraction layer (unmeasured).
- The independence is the diagonal-functional route, NOT a 14×14 determinant.
- 512×64 brute kernel DEAD; do not retry.
