# PREREG — N466 / ARC-X X7: α(M_Z) and sin²θ_W(M_Z), the intermediate readings

## The target (seed §X7)
From the SAME band-tower assembly (X6 `invAlphaZero`/`bandScreen`), the M_Z-scale readings
1/α(M_Z) and sin²θ_W(M_Z) as internal way-points — they FALL OUT of X2–X5 at μ = M_Z.
Theory-native reading: **M_Z is a further band edge in the finite tower; the M_Z reading is the
octonion-scale value screened across the bands ABOVE M_Z (a partial sum of the X6 tower).**

## The HONEST-CRUX finding (anti-bullshit gate — what is EXACT vs route-not-yet-found)
Physically 1/α(M) = 42 (highest energy) < 1/α(M_Z) ≈ 128 < 1/α(0) ≈ 137 (lowest energy):
screening runs 1/α UP as scale drops. The reading at a band edge is the SAME `invAlphaZero`
assembly TRUNCATED at that edge — a **partial sum**. So:
  - `invAlphaZero(full tower) = invAlphaZero(bands above M_Z) + totalScreening(bands below M_Z)`.
  This append-decomposition IS the theory-native X7 content: the intermediate reading and the
  zero-momentum reading are the SAME assembly at two different edges, related by exactly the
  screening between them. **This is NEW structure (not in X6), theorem-exact.**
  - The exact top band (octonion→electroweak v, banked EXACT ratio `topBandRatio = cutExp(28π/3)`,
    screening = 448/27) is ABOVE M_Z, so it is INSIDE the M_Z reading ⟹ `1582/27 ≤` M_Z reading
    (exact lower-bound way-point, teeth). ✓ theorem-exact.
  - The Weinberg angle at M_Z: banked `sinSqRunExact` at μ = M_Z — `= 3/8` stationary at matter
    isospin depth (`sinSqRunExact_matter_stationary`), `< 3/8` at the non-abelian reduced depth
    (`sinSqRunExact_departs_down`). ✓ theorem-exact STRUCTURE.
  - **ROUTE-NOT-YET-FOUND (named, enumerated for X10, NEVER asserted/fitted):** (1) the fully
    evaluated 1/α(M_Z) NUMERAL needs the intermediate band ratios octonion→…→M_Z (mass thresholds)
    as exact Cut reals — currently banked only as bounds; (2) the exact sin²θ_W(M_Z) numeral needs
    the reduced isospin depth `d2` (an honest parameter, exactly as N342 left it). The measured
    127.955 / 0.23122 are REMOVABLE PROSE / costume ONLY (G2), NEVER a proof step.

## What lands (theorem-exact deliverable)
1. `invAlphaZero_append`: reading at any intermediate edge is a partial sum of the tower
   (`invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below`). THE CORE.
2. `invAlphaMZ_le_zero`: 42 ≤ M_Z reading ≤ zero-momentum reading (genuine intermediate way-point).
3. `invAlphaMZ_ge_topBand`: 1582/27 ≤ M_Z reading (the exact top band is inside it) — exact bound.
4. `intermediate_step_eq_screening` + `bandScreen_unbounded` tie: the M_Z→0 running is exactly the
   screening below M_Z, and a single low band is unbounded (the low-energy tail is genuine).
5. Weinberg at M_Z: `sinSqMZ_matter_stationary` (= 3/8), `sinSqMZ_departs_down` (< 3/8).
6. Welded capstone `intermediateReading_landing` (statable from none alone).

## Guards
- G1 no asserted value (1582/27, 448/27, 3/8 all FALL OUT of banked X6/X2 landings).
- G2 no empirical number (no 127.955/0.23122/128 in any proof — removable prose only).
- G3 exact (1582/27 lower bound, the append-decomposition, 3/8 all exact).
- G5 words-removable: delete coupling/running/Weinberg/screening/electroweak → pure statement that
  `invAlphaZero(above++below)=invAlphaZero above + Σ below` over Cut, that it's monotone in `below`,
  that `1582/27 ≤` the value with the exact top band prepended, and that `sinSqRunExact` at a scale
  point is 3/8 stationary / < 3/8 at reduced depth. Pure real analysis on Cut.
- G6 foundations-only (imports X6 only → NEVER MassGapOne; #print axioms ⊆ {propext,choice,Quot.sound}).
- G8 teeth: strict ordering when a band screens; 1582/27 ≠ 42; the running step unbounded.

## NOT free-floating: every TYPE mentions banked derived objects (invAlphaZero, totalScreening,
bandScreen, chargeTraceDepth, topBandRatio, sinSqRunExact, isoDepth) over the derived ℝ Cut.

## Cost budget / KILL
Pure List.append + linarith/nlinarith over Cut on banked lemmas — cheap. KILL: if any single
obligation needs > default heartbeats, decompose. Expect < 1 min build (leaf append-only).

## Module: Phys/Algebra/FineStructureIntermediateReading.lean ; costume C491 ; import X6 only.
## Successor: X8 (absolute lepton masses).
