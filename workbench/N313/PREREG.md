# N313 — SEEDED GAUGE ROUTE A1: the octonion structure 3-form φ and ‖φ‖² = 42 = n(n−1)

## S1 arc synthesis (fresh worker — NOT the N312 worker)
Flavor seed T1–T8 STRUCTURALLY DONE (HEAD 7b86b39). Per flavor seed §6 the chain's next course
is SEED 2 (docs/SEED_GAUGE_SCALE_COSMOLOGY.md) ARC A, target A1 — pre-directed. A1 is NOT a bridge
(the ★ BRIDGE links are A3 `42α=1` and B2); A1 is a COUNTING landing: the norm of the banked
octonion calibration 3-form = the count of nonzero structure constants = n(n−1) = 42 for n=7.

## What φ IS in banked terms (MEASURED, not guessed)
φ = the banked calibration 3-form `assoc3 x y z := gForm x (octCross y z)` (N209,
Phys/Algebra/OctonionAssociative3Form.lean). Totally antisymmetric on ImO, = −reQ(x·(y·z)),
G₂-invariant (`assoc3_g2_invariant`, TowerGatherInvariantFormsG2). This IS the associative
calibration 3-form the seed names. NOT a new object to build — REUSE the banked one (W2).

## The 42 reading (theory-native, the n(n−1) COUNT)
‖φ‖² := Σ_{i,j,k : Fin 7} (assoc3 (imBasis i) (imBasis j) (imBasis k))²   over the banked
orthonormal imaginary frame `imBasis : Fin 7 → O ℚ` (N-DerivationStabilizerSplit,
`gForm_imBasis i j = δ_ij`, `imBasis_mem_ImO`).

THE STRUCTURAL COLLAPSE (reuses banked Born composition law — NOT a 343-term brute decide):
  Step 1 (Parseval on the first index): for fixed j,k, with w := octCross (imBasis j)(imBasis k) ∈ ImO,
     Σ_{i} (assoc3 eᵢ eⱼ eₖ)² = Σ_{i} (gForm eᵢ w)² = gForm w w         [imParseval — the ONE build]
  Step 2 (banked Lagrange/Born composition law, octCross_lagrange N206):
     gForm w w = gForm eⱼ eⱼ · gForm eₖ eₖ − (gForm eⱼ eₖ)²
  Step 3 (banked orthonormality gForm_imBasis):  = 1·1 − δ_jk = 1 − δ_jk
  Step 4 (count): Σ_{j,k : Fin 7} (1 − δ_jk) = 49 − 7 = 42 = n(n−1).

READING: 42 = the number of ORDERED PAIRS (j,k) of DISTINCT imaginary units (7×6), each giving a
unit cross product octCross(eⱼ,eₖ) (Born-length 1 by the surviving composition law); the diagonal
j=k contributes 0 (octCross self = 0). This IS n(n−1): the off-diagonal ordered pairs of the 7
imaginary units. One cause: the SAME Born=self-overlap composition law (Nrm_mul_on_O, surviving to
O ℚ, lost at S ℚ) that gave the Lagrange identity forces every off-diagonal cross product to unit
length → 42.

## The ONE build (W1): imParseval
`imParseval (w : O ℚ) (hw : w ∈ ImO) : gForm w w = ∑ i : Fin 7, (gForm (imBasis i) w)^2`.
imBasis = [u1,e2O,…,e7O] covers exactly the 7 imaginary coordinate slots (real slot = the "1"
line, gForm 1 w = 0 for w∈ImO). Proof: coordinate destructure of w (obtain 8 comps) + reQ w = 0
(reQ_ImO_zero) + Fin.sum_univ_seven + ring — the SAME shape as banked gForm_polar (Fin 8).
MEASURE this in Probe.lean FIRST.

## Guards
- G1 no asserted value: 42 FALLS OUT of Step 4's 49−7; never premised.
- G5 words-removable: delete "structure constant/calibration/gauge/coupling" → pure statement that
  the banked assoc3 (=gForm∘octCross on O ℚ = CD(H ℚ)) summed-squared over the banked imBasis = 42.
- FREE-FLOATING RAIL: TYPE cites banked assoc3/octCross/gForm/imBasis on O ℚ — NOT a generic
  7-dim cross-product algebra. φ is the CONCRETE banked octonion calibration 3-form.
- G6 foundations-only; ground field ℚ (banked O ℚ); NO Mathlib-ℝ/ℂ; NO native_decide.
- W8 non-vacuity: 42 ≠ 49 (didn't drop diagonal), ≠ 0 (cross product not degenerate). Costume C342:
  a WRONG value (42 = something) fails to compile.

## Compile-cost budget / KILL (W9)
imParseval: one coordinate destructure + ring — bounded, ~seconds. The triple sum: Parseval reduces
343 → 49 → arithmetic, each step banked-lemma rewrite, NO octonion-product expansion. If any single
obligation exceeds ~30s or needs maxHeartbeats raise → STOP, decompose. Probe measures before prod.
