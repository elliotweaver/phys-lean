# N346 — arc-E E1a: the weak-field metric g=η+h + the EXACT linearized-inverse residual, over the derived ℝ Cut

## SELECT (done, comment 261)
Fresh-worker SELECT S1–S4 passed. Target: the SMALLEST forced first object of the GR machinery on
the banked derived ℝ — the metric g = η + h with η the banked (1,9) Born-derived Minkowski signature
over Cut, and the EXACT linearized-inverse identity `g·(η − ηhη) = 1 − (hη)²` (kept exact, not
truncated — the residual (hη)² is the first appearance of the look-back's non-closure / self-overlap
failing to undo at second order). E1b (connection) and E1c (curvature) are childed.

## Theory-native anchor
- The metric IS the Born self-overlap (trunk positivity). The flat η is the banked (1,9) signature
  (signature_one_nine, itself Born-derived: gForm = sum of 8 squares). Over the derived ℝ this is the
  banked carrier `STVC = Cut × Cut × O Cut` with `QformC t x v = t² − x² − gFormC v v`.
- Gravity = local distortion h of that transport: g = η + h, h symmetric.
- η is INVOLUTIVE (η² = 1): the flat self-overlap "undoes itself" exactly. The linearized inverse
  ǧ = η − ηhη raises indices with η. EXACT identity: g·ǧ = 1 − (hη)². The residual (hη)² is the
  non-closure (curvature seed), childed to the derivative level (E1b/E1c).

## Design (LIGHT — no coordinate bash, dimension-generic proof instantiated at banked (1,9))
Ground ring: derived ℝ `Cut` (Field, ContinuumFieldInverse). Carrier: `Matrix (Fin 10) (Fin 10) Cut`
(banked spacetime dim = 10, the (1,9) octonionic Minkowski — NOT posited 4; the 10→4 reduction is a
separate downstream node, do not posit it here).

1. `minkowskiMetric` (generic Fin (n+1)) / `flatMetric := Matrix (Fin 10)` — diagonal(1,−1,…,−1).
2. `flatMetric_symm` (diagonal symmetric); `flatMetric_involutive : flatMetric*flatMetric = 1`
   (diagonal ±1 squares to 1) — η is its own inverse.
3. `flatQuad c = c 0² − ∑_{i≥1} c i²` — the (1,9) coordinate quadratic form, one +, nine − (GROUNDS
   flatMetric to the banked signature_one_nine over Cut).
4. GENERAL RING LEMMA `residual_identity {R}[Ring R] (η h)(hη: η*η=1): (η+h)*(η−η*h*η)=1−(h*η)*(h*η)`
   — pure machinery (noncomm_ring + rw hη). INSTANTIATE at flatMetric: `metric_linearized_inverse`.
5. Flat limit: h=0 ⟹ g=η, g*ǧ = η*η = 1 EXACT (residual 0 — no gravity).
6. Metric symmetry: g = η+h symmetric for symmetric h.
7. W8 NON-VACUITY (C371): concrete nonzero symmetric h₀ = diagonal(1,0,…,0), (h₀η)² ≠ 0, so
   g*ǧ ≠ 1 — the linearized inverse is genuinely NOT exact for nonzero field; residual bites.

## Anti-bullshit (comment 261): fold→Born→banked(1,9)η→metric=self-overlap forced; dissolves the
## field's "define manifold+metric from nothing + truncate the inverse" (η banked, identity kept
## exact); words-removable (diagonal involution + symmetric perturbation over a field); temptation
## (import Mathlib manifolds / entrywise bash) REJECTED; machinery-grade, no value asserted.

## Guards: G1 no value asserted (machinery). G2 no empirical number. G4 built on derived Cut, η the
## banked signature, NOT posited. G5 words-removable. G6 foundations-only, NO Mathlib-ℝ/manifolds as
## content (Mathlib Matrix = machinery). W8 C371. W9 LIGHT (dimension-free algebra, no coordinate bash).

## ONE SUCCESSOR: DIRECTED child E1b (connection = Christoffel of the look-back transport on Cut).
