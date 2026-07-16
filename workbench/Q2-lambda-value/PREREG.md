## PREREG — N436 (arc-Q Q2): THE Λ VALUE — the saturation-residue mechanism

### TARGET
The vacuum-energy density (the "cosmological constant") as the FOURTH POWER of the derived
per-channel deepest scale, over the derived spacetime dimension, with the BARE constant zero
(N372) and the observed value the RESIDUE of incomplete self-coherence (C6). Grade: THEOREM for
the STRUCTURE; CANDIDATE-MECHANISM (flagged prose) for the numeric divisor identification and the
value-landing on measured ρ_Λ.

### BANKED OBJECTS (all located, all resolve — probe.lean EXIT 0)
- `seesawScale M = M·seesawRatio` (N333, SeesawScale) — the deepest derived scale m₀ = v²/M, the
  n=2 double-wrap Born-square rung. `seesawScale_pos` (0<M ⇒ 0<m₀).
- `channelCount = 42` (ScaleTowerNumeratorLock, `channelCount_eq`) — the octonion Born-channel
  count = 1/α*. The structural divisor from the banked channel structure.
- `Module.finrank ℚ STV4 = 4` (SpacetimeReduction, `finrank_STV4`) — the derived spacetime
  dimension (the (1,3) reduction). Needs `attribute [local instance] CD.narCD CD.srCD
  Phys.Algebra.dblModuleQ Phys.Algebra.cdModuleQ`.
- `Phys.Algebra.NoDial.lambda_vacuum_zero c : plateauApproachPot c 0 = 0` (N372) — the BARE Λ = 0
  (Born self-overlap potential pinned at the self-blind origin, no additive dial).
- `Phys.Algebra.NoDial.selfOverlap s = s^2` — the Born self-overlap primitive.
- `neutrinoMassSum_eq_seesawScale` (N335, NeutrinoMassSum) — Σm_ν = seesawScale M (the joint-kill
  structural tie: the residue rides the SAME scale as the ν sum).

### THE MECHANISM (theory-native)
fold → self-blindness pins V(0)=0 (bare Λ=0, no dial, N372) → C6 forbids the fixed point ⇒ a
nonzero residual coherence gap mid-approach → residual vacuum energy = the Born self-overlap of
the deepest derived scale m₀, per-channel (÷ channelCount=42=1/α*), to the derived spacetime
dimension 4 (= iterated Born self-overlap, self-overlap∘self-overlap). ρ_Λ ~ (m₀/42)⁴.

### DECLS (production, ns Phys.Algebra.Cosmo)
- `residualScale M := seesawScale M / channelCount` — the per-channel deepest scale.
- `vacuumResidueDensity M := residualScale M ^ (Module.finrank ℚ STV4)` — the residue density.
- `vacuumResidueExponent_eq_spacetimeDim` — exponent = finrank STV4 (= 4, derived not literal).
- `vacuumResidueDensity_eq_fourth_power` — = residualScale M ^ 4.
- `vacuumResidueDensity_is_iterated_selfOverlap` — = selfOverlap(selfOverlap(residualScale M))
  (the fourth power IS Born self-overlap twice — the fold positivity, twice).
- `bareCosmoConstant_zero` — plateauApproachPot c 0 = 0 (re-cite N372; the bare term is zero).
- `vacuumResidueDensity_pos` — 0 < vacuumResidueDensity M (0<M) — Born positivity.
- `vacuumResidueDensity_ne_bare` — vacuumResidueDensity M ≠ plateauApproachPot 1 0 (the observed
  is the RESIDUE, distinct from the pinned-zero bare term).
- `structuralDivisor_eq_channelCount` — channelCount = 42 = 1/α* (the divisor IS the banked
  octonion Born-channel count).
- `residue_suppressed_below_scale4` — vacuumResidueDensity M < seesawScale M ^ 4 (0<M) — the
  channel-count divisor genuinely dilutes; the residue is small BECAUSE it rides the deepest scale
  per channel, not the largest (the dissolution of the "worst prediction in physics").
- `residue_pos_iff_scale_pos` / `residue_zero_iff_scale_zero` — the C6 tie: the residue is nonzero
  for any nonzero fold scale (the eternal approach never yields zero residue), zero only in the
  trivial collapse.
- `residue_rides_seesaw_scale` — the JOINT-KILL: vacuumResidueDensity M is built from the SAME
  seesawScale M that Σm_ν rides (neutrinoMassSum_eq_seesawScale) — if the ν ladder's m₀ is wrong,
  the Λ residue dies with it. Structural, plus loud prose (DESI Σm_ν exclusion watch).
- `lambda_saturation_residue` — ★★★ capstone bundle.
- W8 teeth `lambda_residue_nonvacuous` — concrete M=1: residue > 0, bare = 0, residue ≠ bare, AND
  the WRONG divisor (49, the degenerate n² not n(n−1)) gives a strictly LARGER residue (42 bites).

### GRADE / GUARDS
- THEOREM: bare=0 (N372), the residue object (positive, iterated-Born, suppressed, C6-nonzero,
  rides-seesaw). CANDIDATE-MECHANISM (flagged prose): the exact divisor value 42 as THE one landing
  on measured ρ_Λ, and the value-match itself. NO empirical ρ_Λ in any statement (removable prose).
- Joint-kill carried as loud prose (N335 Σm_ν≈58 meV under DESI DR2 exclusion; no escape hatch).
- G4 words-removable: delete "dark energy/vacuum/Λ/cosmological constant/neutrino" → a fourth power
  (= derived dim = iterated self-overlap) of a banked derived scale over a banked derived count,
  positive, strictly below the un-diluted fourth power, distinct from the pinned zero.
- G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; ℝ-vigilance (derived Cut only,
  no Mathlib-ℝ as content). NOT free-floating (every TYPE cites seesawScale/channelCount/STV4).
- W8 non-vacuity: costume C461 bites 1=461.
- COST: probe EXIT 0 ~14s, all pieces LIGHT (rw/positivity/nlinarith/pow_lt_pow_left₀); no brute,
  no heartbeat raise. KILL: if any obligation blows up, decompose — but nothing here is heavy.
