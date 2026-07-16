# PREREG — N465 / ARC-X X6: 1/α(0) — the zero-momentum inverse fine-structure coupling

Directed successor of N464/X5. Seed docs/SEED_EXACT_DRESSING.md §X6.

## THE FRONT CHOSEN (theory-native, anti-bullshit gate applied)

The marquee target: assemble X1–X5 across the finite band tower → the zero-momentum inverse
fine-structure coupling `1/α(0)` as a DERIVED closed real of `Cut`.

### Anti-bullshit / measure-first finding (the honest crux)

The assembly is `1/α(0) = 42 + Σ_bands κ·census_b·cutLog(ratio_b)`, where:
- `42` = the banked UV octonion-scale value `invAlphaHigh` (N341, X3 `inverseAlphaStar_eq_42`).
- `κ` = the banked all-orders normalization (X5 `kappaLeadingDressed`) / X2 `betaCensus`.
- `census_b` = the banked per-band census (X3 `bandCensus`: 2, 10/3, 11/3 + lepton slices).
- `ratio_b` = the band-edge SCALE RATIOS.

**Survey of the band-edge ratios as derived reals (MEASURED before production):**
- HIGH-scale ratio `v/M = ewClosureRatio = cutExp(−28·cutPi/3)` IS an EXACT derived real of `Cut`
  (`ElectroweakTransmutation.minimalWrapRatio_eq`, arc B). ✓ exact.
- The X4 hadronic band edges are the integer gap-spectrum `ℕ` (`gapSpectrum_eq_natRange`), floor 1
  = confinement scale — exact integer spacing. ✓ exact structure.
- The LOW-energy lepton/light-quark thresholds are banked ONLY as rational BOUNDS over `Cut`
  (`GenerationMassRatiosNumeric`: `m₁/m₂ ∈ [483/100000,485/100000]`, etc.), NOT single exact reals,
  and the ABSOLUTE scale anchor is LADDER-grade (arc B), not identity-grade. ✗ not-yet-exact-reals.

**Consequence (honest, per seed §X6 contingency + G3 + SOUL "route COMPLETE vs route NOT-YET-FOUND"):**
The fully-evaluated 10-digit number `137.035999084` as a single proved numeral of `Cut` is
route-NOT-YET-FOUND, because it needs the exact low-energy band-edge scale ratios as single derived
reals (currently bounds). Asserting the number, fitting it, or reaching for a numerology closed form
(e.g. `4π³+π²+π`) would violate G1/G2/anti-bullshit. **Sanity check reinforces this:** naive
constant-census running from M_oct gives `42 + κ·(16/3)·~92 e-folds ≈ 94`, NOT 137 — so the exact
number genuinely needs the detailed finite threshold tower with exact ratios; there is NO clean
one-line closed form (any such would be a fit).

### What X6 delivers (route-COMPLETE, EXACT as STRUCTURE — the honest theory-native capstone)

The deep, moat-defining, genuinely-novel content of X6 is NOT the raw digit-crunch — it is the
**EXACT ASSEMBLY STRUCTURE + the NO-LANDAU-POLE FINITENESS**:

1. `invAlphaZero` — the zero-momentum inverse coupling as the FINITE band-tower assembly over `Cut`:
   `42 + (finite list-sum of screening terms κ·census_b·cutLog(ratio_b))`. A def on banked objects.
2. `invAlphaZero_closed` — the EXACT closed-form telescoping identity: `invAlphaZero = 42 + totalScreening`.
   EXACT structure, no error bar arises from the STRUCTURE (finite sum of exact-structure terms).
3. ★ `invAlphaZero_finite` / no-Landau-pole — the tower is FINITE (a `List`/`Finset` sum over
   finitely many bands) because the algebra cascade TERMINATES at the octonion scale (UV boundary,
   1/α*=42 finite) and the census FREEZES to zero below the lightest charged threshold (IR boundary).
   So `1/α(0)` is a finite closed real of `Cut` — NOT a divergent Landau pole. This DISSOLVES the
   standard QED UV pathology (the fold provides the intrinsic finite cutoff). TEETH: an infinite /
   totalizing tower diverges (tie to X5 `geometric_diverges_at_one` / `Cut` unboundedness).
4. `invAlphaZero_screens` / `invAlphaZero_gt_42` — strictly `> 42` (screening runs 1/α UP), from the
   positive banked census + `cutLog(ratio) > 0` for `ratio > 1`.
5. TEETH (W8/G8): finiteness is load-bearing (infinite tower diverges); zero census ⟹ no screening
   (frozen at 42); a wrong (negative) contribution excluded.
6. Welded capstone (non-hollow ∧).

The measured `137.035999084` and the exact-ratio gating are REMOVABLE PROSE (G2), enumerated as the
ONE gated input for the X10 grade ledger.

### Successor (one-successor rail)

Hand ONE directed successor toward X7 (α(M_Z) and sin²θ_W(M_Z), the intermediate readings that fall
out of X2–X5 at μ=M_Z). The exact-band-edge-ratio refinement is NOT a blocking route-finder child —
it is an arc-D/P input enumerated for X10's grade ledger (the arc's designated honest-accounting
node), so the arc sequence X6→X7→…→X10 stays intact. (If the probe reveals the structure itself
needs a not-yet-banked fact, a route-finder child REPLACES the X7 handoff — decide after probe.)

## DISCIPLINE
STANDARD (unbroken/complete/words-removable); foundations-only ⊆ {propext,Classical.choice,Quot.sound},
no sorry/axiom/native_decide/foldRetention (IMPORT GUARD: ConfinementMassGap/HadronicSpectrum, never
MassGapOne); ℝ-vigilance (banked Cut + cutLog/cutExp/cutPi, never Mathlib Real/Complex as content);
NO fit (no measured α/137.035999084/127.955/0.23122 in any proof — removable prose only); EXACT
structure (G3); teeth (W8); free-floating check (every TYPE about banked κ/census/band-tower/derived ℝ).

## COST BUDGET (W3/W9)
Assembly is List.sum + cutLog + field arithmetic over Cut — light. KILL: if any single obligation
exceeds ~90s in a probe, decompose. Probe the finiteness + screening + closed-form shape cheaply
BEFORE production. Estimate: <1 min per probe, production build a few min (leaf append). Next Cid C490.
D6-FAST: add `import Phys.Algebra.<Module>` to Audits/AxiomAudit.lean in the same commit span.
