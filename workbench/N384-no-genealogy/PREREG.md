# N384 — arc-H H6 (assembly): the no-genealogy / far-side frontier

## Target (theory-native, SELECT-confirmed comment 290)
DERIVE that a far-side face carries NO observable trace of its parent — the far side receives a
BLANK, ψ-independent state (nothing passes THROUGH the self-blind closure), re-deriving S_init =
cutLog 1 = 0 FROM the black-hole side (cross-check of the banked cosmological row); the forced
plateau inflation washes any residual anisotropy exponentially. Parentage is unobservable IN
PRINCIPLE. Grade: assembly (TR1–TR4 theorems, TR5 stance-only prose).

## Module
`Phys/Algebra/CosmoNoGenealogyFarSide.lean`, namespace `Phys.Algebra`.
Imports: `Phys.Algebra.SpacetimeSingularityClosure` (closure tip blindness, arc E),
`Phys.Algebra.LandauerBound` (resetState / negEntropy / cutLog), `Phys.Algebra.NoDialDissolutionTheorems`
(initialEntropy_leg / foldCoherenceGap), `Mathlib.Tactic`.

## Banked objects (verified live)
- `closureTip θ = eucPlanePoint 0 θ`; `closureTip_angle_independent (θ θ') : closureTip θ = closureTip θ'`;
  `closureTip_eq_origin`; `closureSection_blind_iff_tip (ρ) : (∀θθ', eucPlanePoint ρ θ = eucPlanePoint ρ θ') ↔ ρ=0`;
  `closureSection_faithful_off_tip : eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0`. (ns Phys.Algebra)
- `Phys.Algebra.Landauer.resetState (n) : Fin n → Cut`;
  `Phys.Algebra.Landauer.resetState_zero_negEntropy (n) : negEntropy (resetState n) = 0`;
  `Phys.Algebra.MaxEnt.negEntropy`; `cutLog_one : cutLog 1 = 0`.
- `Phys.Algebra.NoDial.initialEntropy_leg (c) : foldCoherenceGap c 0 = 0`;
  `foldCoherenceGap (c φ) = 1 - cutExp(-(c*φ))` (ns Phys.Foundation.ContinuumQ).
- `cutExp_pos`, `cutExp_zero`, `cutExp_strictMono` (foundations).

## Theorems (TR1–TR4 + capstone)
- `farSideState (obs : Cut×Cut → α) (θ) := obs (closureTip θ)` — an observable read off the far side.
- TR1 `farSideState_psi_independent (obs θ θ') : farSideState obs θ = farSideState obs θ'`
  (via closureTip_angle_independent). "Any observable off the far side is direction-blind" = nothing
  passes THROUGH the closure. Reader-facing: closure forgets the parent's ψ.
  - `closure_forgets_direction (θ θ') : closureTip θ = closureTip θ'` (re-read).
  - non-vacuity: `closureSection_faithful_off_tip` — off the tip directional data is REAL, so the
    blindness is a property of the self-blind closure, not of a constant observable.
- TR2 `farSide_selfDatum_eq_cutLog_one (n) : negEntropy (resetState n) = cutLog 1`
  (via resetState_zero_negEntropy + cutLog_one). The blank/single-point state has zero self-datum =
  S_init = ln 1. + `farSide_blank_zero (n) : negEntropy (resetState n) = 0`.
- TR3 `sInit_crosscheck (c n) : negEntropy (resetState n) = foldCoherenceGap c 0` — the informational
  face (Landauer/cutLog 1) AGREES with the fold-gap face (initialEntropy_leg), both = 0. Cross-check.
- TR4 wash `anisotropyWash (δ k N) := δ * cutExp (-(k*N))`:
  - `anisotropyWash_zero : wash δ k 0 = δ` (cutExp 0 = 1).
  - `anisotropyWash_pos (hδ:0<δ) : 0 < wash δ k N` (cutExp_pos).
  - `anisotropyWash_lt_initial (hδ hk hN, all >0) : wash δ k N < δ` (cutExp(-(kN))<1).
  - `anisotropyWash_strictAnti (hδ hk, N₁<N₂) : wash δ k N₂ < wash δ k N₁` (more e-folds → smaller).
  k kept SYMBOLIC; the physical e^{−6N} shear-scaling coefficient is REMOVABLE PROSE (no "6" in proof).
- capstone `no_genealogy_structure` — bundle TR1(concrete id-observable), TR2, TR3, TR4 pieces.
- TR5: docstring-only stance (one transition vs many universes — architectural, no machine face).

## Costume C409 (`Counterexamples/CosmoNoGenealogyFarSideVacuityCostume.lean`)
iFlag=1 tied to `closure_forgets_direction 0 cutPi : closureTip 0 = closureTip cutPi` (the closure is
direction-blind). Bogus: "the closure is faithful / parentage observable" ⇒ min 409 iFlag = 409,
reduces to 1 = 409. Must FAIL to compile. (Cid 409 fresh.)

## Guards
G1 no asserted value (S_init=0 = cutLog 1 DERIVED; wash from cutExp; k symbolic). G2 no empirical
number in proof (e^{−6N}, CMB numbers = removable prose). G3 blank slate from banked self-blind
tip + Landauer, not asserted. G5 words-removable (see S4.3). G6 foundations-only ⊆ {propext,
Classical.choice, Quot.sound}, no sorry/native_decide/heartbeat-raise, derived-ℝ Cut only, no
Mathlib Real analysis as content. W8 non-vacuity via off-tip faithfulness + C409. W4.5 sufficiency:
TR1–TR4 only, TR5 stance-only, no gold-plating (no limit theorem for the wash — mirror N383).

## Cost budget / KILL
All proofs are compositions of banked lemmas + ring/positivity/linarith on Cut — cheap. KILL: if any
single obligation needs >60s in the probe, MEASURE/DECOMPOSE (not expected). Probe first, then production.
