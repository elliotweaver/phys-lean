# N315 — SEEDED GAUGE ROUTE A3: ★ BRIDGE Born-isometry completeness `42·α = 1`

## TARGET (docs/SEED_GAUGE_SCALE_COSMOLOGY.md ARC A, third bullet — the FIRST ★ BRIDGE)
Derive that the total Born weight over the 42 interaction channels (N314) is 1 — the
self-overlap/return normalization Σ_channels α = 1 — with the per-channel coupling weight = α
identified as a **THEOREM of the banked self-overlap structure**, not a posited bridge. Turns the
counting fact "42 channels" into the coupling `α* = 1/42` (A4 downstream).

## THE ANTI-BULLSHIT GATE (this is a ★ BRIDGE — highest bar; G4 THE BRIDGE IS DERIVED NOT POSITED)

### What the banked structure ALREADY gives (N313 + N314, W2 — use, don't re-derive)
- `assoc3InnerSum (j k : Fin 7) : ∑ i, (assoc3 eᵢ eⱼ eₖ)² = 1 − δ_jk` — the per-channel Born
  SELF-OVERLAP `gForm(octCross eⱼ eₖ)(octCross eⱼ eₖ)`: **unit** for the 42 off-diagonal (active)
  channels (forced by the surviving Born composition law `octCross_lagrange`/`Nrm_mul_on_O`),
  **zero** for the 7 diagonal. THIS IS THE BORN SELF-OVERLAP, the trunk's positive self-overlap form.
- `assoc3NormSq = ∑_{i,j,k}(…)² = 42` — the TOTAL Born self-overlap over all channels.
- `channels_O : imChannelCount (finrank ℚ ImO) = 42` — the count of active channels (N314).

### The genuine NEW content of A3 (beyond N313/N314) — NOT a trivial 42/42
1. **UNIFORMITY (democracy)**: the NORMALIZED per-channel Born weight `bornWeight j k :=
   chanSelfOverlap j k / assoc3NormSq` is the SAME `1/42` on EVERY active channel (composition law
   forces unit self-overlap per active channel → a SINGLE shared coupling, not 42 different ones).
   This is the physical content: WHY there is one coupling constant.
2. **COMPLETENESS (Parseval / return normalization)**: `∑_{j,k} bornWeight j k = 1` — the Born
   self-overlap, summed over all channels the self-referential process can land in, is the whole
   (total-probability = 1, the isometry completeness = `assoc3NormSq / assoc3NormSq`).
3. Therefore **`42·α = 1`** with α = the shared per-active-channel weight = `1/42`:
   `(imChannelCount (finrank ℚ ImO) : ℚ) · couplingWeight = 1`, literally `42 · (1/42) = 1`.

### Is "per-channel Born weight = coupling α" a THEOREM or a posited bridge? (the crux)
THEOREM. The N308 template: holonomy=statistics was a LITERAL operator identity on banked objects,
NOT asserted; the value fell out of the banked balance. Here identically: `bornWeight` is DEFINED as
the concrete banked self-overlap ratio (`chanSelfOverlap / assoc3NormSq`); its value `1/42` and the
completeness `Σ=1` are PROVED from `assoc3InnerSum` + `assoc3NormSq_eq_42`. **We NEVER introduce α as
a fresh symbol and impose Σα=1 to solve for it** (that would be the G4 posited-bridge failure). The
physics label "coupling/α/g²/4π" is attached to `bornWeight` and is fully REMOVABLE.

### NAME-THE-TEMPTATION (rejected)
- (a) "let α be the per-channel weight, impose 42α=1, solve α=1/42" → the POSITED-BRIDGE failure
  (G4). REJECTED: `bornWeight`'s value is DERIVED from the banked unit self-overlap / total 42.
- (b) a generic "a uniform probability distribution over 42 outcomes sums to 1" theorem → the
  FREE-FLOATING trap. REJECTED: the TYPE cites the CONCRETE banked `assoc3`/`assoc3NormSq`/
  `imChannelCount (finrank ℚ ImO)` on `O ℚ`, NOT an abstract 42-outcome distribution.
- (c) asserting 1/42 or α → G1. REJECTED: 1/42 = (unit self-overlap)/(banked 42), falls out.
- (d) any empirical number (1/137, g²/4π at a scale) in a proof → G2. Comparison is downstream
  removable prose only (A4), never a proof step.

### WORDS-REMOVABLE (G5): delete coupling/charge/α/Born/interaction → the theorems stand as: the
normalized per-channel self-overlap of the banked octonion calibration 3-form is `1/42` on every
off-diagonal ordered pair of the 7 imaginary units, `0` on the diagonal, and totals `1` over all
pairs (a Parseval completeness of a banked positive form). No physics name is load-bearing.

## ROUTE (ℚ-EXACT, LIGHT — all heavy work banked in N313)
- `chanSelfOverlap j k := ∑ i, (assoc3 (imBasis i) (imBasis j) (imBasis k))²` (the concrete banked
  per-channel self-overlap) — `= 1 − δ_jk` by `assoc3InnerSum`.
- `assoc3NormSq = ∑_{j,k} chanSelfOverlap j k` (reorder N313's triple sum, sum_comm) — the total.
- `bornWeight j k := chanSelfOverlap j k / assoc3NormSq`.
- `bornWeight_offdiag (h : j ≠ k) : bornWeight j k = 1/42` (unit / 42).
- `bornWeight_diag : bornWeight j j = 0`.
- `bornWeight_uniform : j≠k → j'≠k' → bornWeight j k = bornWeight j' k'` (DEMOCRACY).
- `born_isometry_completeness : ∑_{j,k} bornWeight j k = 1` (= assoc3NormSq/assoc3NormSq).
- `couplingWeight := bornWeight 0 1` (a concrete active channel); `couplingWeight_eq : = 1/42`.
- ★★★ `channels_times_coupling : (imChannelCount (finrank ℚ ImO) : ℚ) · couplingWeight = 1`
  — literally `42 · α = 1`, the ★ BRIDGE headline, count = banked N314, weight = banked N313 ratio.
- W8: `couplingWeight_ne_zero`, a WRONG per-channel weight (1/49, diagonal not dropped) breaks
  42·α=1; the completeness total ≠1 for a wrong normalization.

## COST BUDGET / KILL (W9): all obligations reduce to banked `assoc3InnerSum` + `assoc3NormSq_eq_42`
+ ℚ `norm_num`/`simp`/`Finset.sum`. NO octonion-product expansion, NO decide over Fano table, NO
native_decide, NO maxHeartbeats raise. KILL: if any single obligation runs >60s in the probe →
instrument wall, decompose. Expected: LIGHT (seconds), within the Phys incremental build.

## GUARDS: G1 (1/42 falls out, never premised) · G2 (no empirical number) · G4 (DERIVED not posited —
bornWeight is the banked ratio, α never a free symbol) · G5 (words-removable) · G6 (foundations-only
⊆ {propext,Classical.choice,Quot.sound}, ground ℚ, NO Mathlib-ℝ/ℂ content, no native_decide/
maxHeartbeats) · G7 (did not fight — the normalization dissolves through the banked self-overlap).
Ground field ℚ (the weight 1/42 is ℚ-EXACT — no ℝ reached for; UNEARNED-IMPORT clean).
NOT free-floating: TYPE cites banked assoc3/assoc3NormSq/imChannelCount(finrank ℚ ImO) on O ℚ.
