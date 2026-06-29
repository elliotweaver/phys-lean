# N173 PREREG — THE FULL O(1,9) FROM THE IDENTITY COMPONENT (discrete cosets / component group)

FROZEN BEFORE COMPUTE.

## Chosen front (of the four N173 fronts)
**(iv) the FULL O(1,9) from the identity component** — the discrete det=−1 / non-orthochronous
cosets (parity / time-reversal), assembling the four connected components from the proper
orthochronous one banked by N172 (`joinedIdQvC_of_proper_orthochronous`).

### Why this front (MEASURE-FIRST verdict)
- It directly EXTENDS N172 (the closed SO⁺(1,9) identity component) with CONCRETE FINITE
  witnesses (three explicit sign-flip endomorphisms), not heavy analysis.
- It OPENS GENUINELY NEW STRUCTURE: the discrete component group (Klein-four ℤ/2×ℤ/2), the four
  cosets, and the reduction of an ARBITRARY isometry to the identity component via a discrete
  witness. This is NOT re-pinning the identity component — it is the full group on top of it.
- cutRpow (front i) needs exp/log over Cut — MEASURED: Cut has `cut_summable_*` (N-summable) but
  NO `cutExp`/`cutLog` banked → genuine multi-node sub-program, heavier. (Deferred / childed.)
- full G₂ (front ii) — expOEquiv route MEASURED heavy (operator-exp). Deferred.
- Klein-four identification (front iii) — re-pins N141's concrete table; LOW open. Deferred.

### Smallest obligation measured before committing
- `LinearMap.det parityLin = −1`: parityLin = prodMap id (prodMap (−id_Cut) (−id_OCut)); via
  `LinearMap.det_prodMap` + `LinearMap.det_smul`: 1 · (−1)^finrank(Cut)=(−1)^1=−1 ·
  (−1)^finrank(O Cut)=(−1)^8=1, product = −1. NEEDS `Module.finrank Cut Cut = 1`
  (`finrank_self`) + `finrank_O_eq_eight_Cut = 8` (N122, banked). RISK: the smul-det name.
  Probe FIRST.

## GO / NO-GO
- **GO** if: parityLin/timeRevLin/ptLin are proved `IsQvIsomC`; their dets are proved
  (det P = −1, det T = −1, det PT = +1); their orthochronicity signs are proved
  ((P e₀).1 = 1 ≥ 0 ortho, (T e₀).1 = −1 < 0 non-ortho, (PT e₀).1 = −1 non-ortho); the Klein-four
  relations P*P=1, T*T=1, P*T=T*P, PT=P*T are proved; and THE COMPONENT REDUCTION
  `joinedIdQvC_discreteReduce` (every QvC-isometry p with det p = ±1 has one of
  p / P*p / T*p / PT*p in JoinedIdQvC, via the four-way case split feeding N172) is proved
  foundations-only.
- **NO-GO / DECOMPOSE** if the det-smul or finrank machinery fights past the KILL: bank the
  bankable structural piece (the witnesses + their dets + Klein-four), child the reduction.

## KILL (instrument-failure classifier, W9)
- If `LinearMap.det parityLin` does NOT close via det_prodMap+det_smul+finrank in ≤ ~6 probe
  iterations, that is an INSTRUMENT/framing miss (the det route), NOT a theory failure — STOP,
  measure the smallest det sub-obligation, decompose; do NOT inflate maxHeartbeats or grind a
  10×10 coordinate expansion.
- Per-obligation compile-cost budget: any single decl > 60s wall on `lake env lean` of the
  isolated probe is declared an instrument wall → decompose that decl.

## Costume (C205)
Bite a WRONG discrete-coset / det / component claim: `LinearMap.det parityLin = 173`. Genuine
value = −1 (the prodMap+smul reduction). After `rw [det_parityLin]` (or unfolding), the goal
reduces to the false numeric `(−1 : Cut) = 173`, which must NOT compile. DISTINCT from the banked
battery (… C203 1=171, C204 1=172): use the false numeric `(-1) = 173` (distinct LHS and RHS).

## Physics-words-removable
Delete parity/time-reversal/reflection/Lorentz/isometry/orthochronous/det/coset/component/
Klein-four/Joined: for a Cut-linear endo p of Cut×Cut×O Cut preserving the quadratic QvC with
LinearMap.det p = 1 ∨ = −1, one of p / R₁∘p / R₂∘p / R₃∘p lies in the preconnected JoinedIdQvC
set through 1, where R₁,R₂,R₃ are the three explicit sign-flip endomorphisms; det R₁ = det R₂ =
−1, det R₃ = +1; R₁,R₂ are involutions and commute. Pure linear algebra over the derived ℝ.
