# N316 PREREG — SEEDED GAUGE ROUTE A4: α* = 1/42 lands (the fine-structure-scale coupling)

## S1 ARC SYNTHESIS (fresh worker — I am NOT the N315 worker)
Arc A of SEED 2 (docs/SEED_GAUGE_SCALE_COSMOLOGY.md):
- A1 (N313 BANKED): octonion 3-form φ = assoc3, ‖φ‖² = 42 = n(n−1).
- A2 (N314 BANKED): interaction-channel tower ℂ:0, ℍ:6, 𝕆:42 = n(n−1); `imChannelCount`, `channels_O : imChannelCount (finrank ℚ ImO) = 42`.
- A3 (N315 BANKED): ★ BRIDGE Born-isometry completeness 42·α = 1. `couplingWeight := bornWeight 0 1`;
  `couplingWeight_eq : couplingWeight = 1/42`; `channels_times_coupling : (imChannelCount (finrank ℚ ImO):ℚ)·couplingWeight = 1`.
- **A4 (THIS NODE): α* = 1/42 lands — the fine-structure-scale coupling.**

## WHAT A4 GENUINELY ADDS BEYOND A3 (the W4.5 sufficiency + anti-bullshit question, answered HONESTLY)
A3 framed the per-channel Born weight as (a) a normalized probability weight in a COMPLETE distribution (Σ=1)
and (b) a PRODUCT relation `(channel count)·α = 1`. A4's distinct, genuinely-new content is the **RECIPROCAL
reading**: naming that weight as the coupling constant α* and stating

    1/α* = (imChannelCount (finrank ℚ ImO) : ℚ) = 42 = n(n−1).

This is the canonical MARQUEE form of a coupling constant — "the INVERSE coupling is a pure integer COUNT" —
the physicist's `1/α` statement. It is NOT literally in A3 (A3 has the PRODUCT `N·α=1`, never the reciprocal
`1/α = N`). It is the "α* = 1/42 lands" headline: the inverse of the fine-structure-scale coupling IS the
interaction-channel count of the terminal division algebra, forced.

W4.5 DECISION: bank A4 as a CLEAN STANDALONE marquee landing (like the flavor seed banked Koide 2/3, δ_B=2/9
each as their own node), NOT folded into A5. A5 (hypercharge trace 5/3, the 3/4 trap) is a genuinely different
and heavier computation; bundling would muddy two distinct marquee landings. A4 is light but non-vacuous (the
reciprocal-count theorem is new and its costume genuinely bites a wrong α*). Do NOT gold-plate: minimal
content = rename tying to banked couplingWeight + α*=1/42 + the reciprocal-count marquee + W8 teeth.

## ANTI-BULLSHIT GATE (SOUL — run honestly, in writing)
1. TRACE fold→node, each arrow FORCED: fold → cascade → O ℚ terminal (Born multiplicativity stops at 𝕆,
   `Nrm_mul_on_O`) → assoc3 calibration 3-form (N209/N313) → assoc3NormSq=42 = channel count (N313/N314) →
   per-channel Born self-overlap normalized = 1/42 UNIFORM + COMPLETE (N315) → α* := that per-channel weight,
   α*=1/42, 1/α* = channel count 42. Every arrow a banked theorem. FORCED.
2. STANDARD version + what the theory DOES: standard physics treats α ≈ 1/137.036 as a MEASURED mystery
   ("Feynman's magic number"). The theory DERIVES the undressed structural value 1/α* = 42 as literally the
   count of ordered imaginary-unit pairs of the octonions = the interaction-channel count of the terminal
   division algebra — the mystery dissolves into a COUNT. The running/dressing 42→137 is downstream (not this
   node). Genuine: the theory turns "why 1/137?" into "1/α = 42 = n(n−1), dressed by running."
3. DELETE physics words (coupling/α/fine-structure): the theorem says the banked normalized per-channel
   self-overlap value of the calibration 3-form is 1/42 and its reciprocal is the banked channel count 42.
   Pure math on banked objects. SURVIVES.
4. NAME the standard temptation + show mine differs: temptation = `def alpha := (1:ℚ)/42` free-floating,
   `alpha = 1/42` by rfl, costume 42=345 — SAILS through words-removable while FLOATING FREE (the free-floating
   trap). AVOIDED: `alphaStar := couplingWeight` (the BANKED object), so `alphaStar_eq` IS `couplingWeight_eq`,
   and the marquee `inverseAlphaStar_eq_channelCount` cites BOTH banked objects (couplingWeight/α* AND
   imChannelCount N314). Genuinely tied to the banked self-overlap, NOT a free `1/42`.

## GUARDS
- G1 no asserted value: α*=1/42 FALLS OUT of couplingWeight_eq (banked); 1/α*=42 falls out of channels_O +
  channels_times_coupling. Never premised.
- G2 no empirical number in any proof: 1/137 appears ONLY in the module docstring as removable prose. NEVER a
  theorem statement / proof step. (Grep the production file for `137` → must be 0 outside the docstring.)
- G5 words-removable: pass (see gate step 3).
- G6 foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide/maxHeartbeats.
- FREE-FLOATING RAIL: alphaStar := couplingWeight (banked); marquee theorem TYPE cites imChannelCount (N314).
- UNEARNED-IMPORT: ground field ℚ (1/42, 42, 1/49 all ℚ-exact); NO Mathlib-ℝ/ℂ content.
- EVERY CONSTANT IS FORCED: 1/42 is a THEOREM of banked A3, not fitted/empirical/human-gated.

## PLANNED PRODUCTION (Phys/Algebra/FineStructureScaleCoupling.lean, ns Phys.Algebra)
- `def alphaStar : ℚ := couplingWeight`  — the coupling, the BANKED per-channel Born weight.
- `alphaStar_eq : alphaStar = 1 / 42` := couplingWeight_eq (banked).
- `alphaStar_reciprocal_completeness : (imChannelCount (finrank ℚ ImO):ℚ) * alphaStar = 1` := channels_times_coupling (banked).
- ★ `inverseAlphaStar_eq_channelCount : 1 / alphaStar = (imChannelCount (finrank ℚ ImO):ℚ)`  — THE MARQUEE: inverse coupling = channel count.
- `inverseAlphaStar_eq_42 : 1 / alphaStar = 42`  — the numeric landing 1/α* = 42.
- W8: `alphaStar_ne_zero`, `alphaStar_ne_wrong : alphaStar ≠ 1/49`, `inverseAlphaStar_ne_wrong : 1/alphaStar ≠ 49`.
- (optional bundle) `fineStructureScale_reading : alphaStar = 1/42 ∧ 1/alphaStar = (channel count) ∧ (count)·alphaStar = 1`.

## COSTUME C345 (next free — C344 taken by N315): a WRONG 1/α* fails to compile.
Certificate = the FORCED inverse-coupling count `inverseAlpha := 42` (1/α* = 42 = channel count, DERIVED via
inverseAlphaStar_eq_42). Anchor `min 345 inverseAlpha = 42` TRUE (tied via inverseAlphaStar_eq_42). BOGUS:
`min 345 inverseAlpha = 345` → rewrites to `42 = 345`, kernel cannot close → BITES. Pair (345,42) fresh
(RHS 345 distinct from every prior). A WRONG α*≠1/42 (e.g. 1/49) gives 1/α*≠42, breaking the certificate.

## COST BUDGET / KILL (W9): entirely ℚ-exact, all proofs are `rw` banked-lemma + `norm_num`/`decide` one-liners.
Expected production olean < 20s. KILL: if any single obligation exceeds 60s, STOP — measure/decompose (it
should never come close; this is light). No coordinate expansion, no native_decide, no maxHeartbeats.
