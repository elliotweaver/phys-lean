# N### PREREG — arc-Q Q9: EMERGENT QUANTIZATION as EXACT INTEGER WINDING

## Target (theory-native, S4-passed)
The quantum-Hall-genre integer and the SC flux quantum, read off the banked trunk, with the
EXACTNESS mechanism DERIVED: emergent integers are exact because winding is counting — the fold's
own ℤ — the SAME discreteness that floored the mass gap I4. Mechanism/beyond-key grade, flagged.
NO material numbers (Hall conductance / flux value = REMOVABLE PROSE, NO-FIT).

## Module
`Phys/Algebra/EmergentQuantization.lean`, ns `Phys.Algebra.EmergentQuant`. Cid C468.

## Banked objects cited (all located verbatim)
- M1 winding grid — `Phys/Algebra/ScaleTowerWindingQuantization.lean`, ns `Phys.Algebra.Winding`:
  `windingRungIndex k = 1 + 3k` (`windingRungIndex_eq`), `windingPhase k = azimuthalTurn·(idx:Cut)`,
  `windingRungIndex_injective`, `windingRungIndex_residue` (≡1), `windingRungIndex_spacing_ne_one`,
  `windingPhase_step`.
- azimuthalTurn = 2·cutPi (N328), `cutPi_pos` (ContinuumTrigPi) — for azimuthalTurn ≠ 0.
- I4 mass gap — `Phys/Algebra/ConfinementMassGap.lean`, ns `Phys.Algebra`: `IntLat`, `gForm`,
  `bornAction_lattice_floor` (IntLat w → w≠0 → 1 ≤ gForm w w), `no_floor_over_continuum`.
- doubled fold — `Phys/Quantum/PrimitiveFibre.lean`, ns `Phys.Quantum`: `StateFibre`,
  `fibre_finrank` (= 2).
- `Cut` is a `Field` + `ConditionallyCompleteLinearOrderedField`.

## Planned theorems (ALL about banked objects; ℤ + derived ℝ Cut; NO Mathlib-ℝ/ℂ content)
(A) THE INTEGER INVARIANT
  - `def emergentWindingCount (k:ℤ) : ℤ := windingRungIndex k`  (the Hall/Chern integer = banked count)
  - `emergentInvariant_is_integer_phase : windingPhase k = azimuthalTurn * (emergentWindingCount k : Cut)`
  - `emergentInvariant_ratio : azimuthalTurn ≠ 0 → windingPhase k / azimuthalTurn = (emergentWindingCount k : Cut)`
  - `emergentWindingCount_injective` (faithful ℤ-ladder — distinct plateaus, no continuous drift)
  - `emergentWindingCount_ne_zero_of_residue`? (residue 1 ⟹ never 0 — but that is a specific fact;
    keep as: the count is ≡1 so nonzero — `emergentWindingCount_residue`)

(B) THE EXACTNESS MECHANISM = winding is counting (the fold's ℤ), WELDED to the mass gap I4
  - `winding_floor : ∀ n:ℤ, n ≠ 0 → 1 ≤ n.natAbs`  (the elementary ℤ fact — nonzero integer ≥ 1)
  - `emergent_exact_step : windingPhase (k+1) - windingPhase k = (3:Cut) * azimuthalTurn` (integer step)
  - `★ exactness_is_massgap_discreteness` (the marquee weld): bundles
      (i) the winding floor (nonzero winding ⟹ magnitude ≥ 1),
      (ii) the SAME nonzero-integer discreteness on the curvature side (cite `bornAction_lattice_floor`),
      (iii) the continuum has NO floor (cite `no_floor_over_continuum`) — exactness REQUIRES discreteness.
    → one fold-discreteness, two physical costumes (emergent winding exactness ⟺ confinement mass gap).

(C) THE FLUX QUANTUM as the doubled fold (binary self-blindness)
  - `def emergentPairFlux : Cut := azimuthalTurn / (finrank Cut StateFibre : Cut)`
  - `pair_doubles_flux : (finrank Cut StateFibre : Cut) * emergentPairFlux = azimuthalTurn`
    (the SC flux halving = the pair = the doubled fold = banked fibre dim 2; NOT a free 2)

(D) W8 NON-VACUITY
  - `emergentWindingCount_spacing_ne_one : emergentWindingCount 1 - emergentWindingCount 0 ≠ 1`
    (a real grid with gaps, not the trivial all-ℤ ladder)
  - `emergentPairFlux_ne_azimuthal : emergentPairFlux ≠ azimuthalTurn`
    (the halving is real — the pair genuinely doubles; needs azimuthalTurn ≠ 0)

(E) CAPSTONE `emergent_quantization` bundling (A)+(B)+(C) headline facts, TYPE mentions banked objects.

## Cost budget / KILL (W9)
All facts are `omega`/`ring`/`push_cast` on ℤ + `Cut` field ops, or direct citations of banked
lemmas — LIGHT (term/tactic, no brute, no heartbeat raise). KILL: if any single olean obligation
> 90s or needs a heartbeat raise, MEASURE-decompose. Probe first.

## Guards
G1 no asserted values (grid facts fall out of banked `finrank_Uhol`/`fibre_finrank`+omega/ring).
G2 no empirical number in any proof (Hall/flux values REMOVABLE PROSE). G3 exactness DERIVED
(winding=counting, not "Hall conductance is quantized"). G4 physics-words-removable. G5
foundations-only ⊆ {propext,Classical.choice,Quot.sound}; no proof-hole/native-decide/heartbeat.
ℝ-vigilance: every TYPE about banked derived objects; NO Mathlib-ℝ/ℂ as content.
