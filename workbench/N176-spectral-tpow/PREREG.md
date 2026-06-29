# N176 PREREG — frozen GO/NO-GO + KILL before compute

## FRONT CHOSEN (measure-first verdict)
Of the three N176 W1 fronts, **(ii) THE CONTINUOUS SPECTRAL t-POWER PATH** is the FORCED node:
- (i) full G₂ via expOEquiv (exp(D)∈Aut(O Cut) product-preservation) is W9-HEAVY — operator
  exponential series + Leibniz→binomial automorphism over Cut; MEASURE says decompose, not 1-run.
- (iii) discrete component-group ℤ/2×ℤ/2 / π₀(O(1,9))=4 RE-PINS N173's already-banked concrete
  relations (W4.5 OPEN-vs-re-pin → re-pin) → child as OPTIONAL, not the forward node.
- (ii) OPENS genuinely new structure the discrete `specOpN_comp` cannot express: a CONTINUOUS
  one-parameter group of operators (the spectral functional calculus for a real power), now that
  `cutRpow` (N175) is banked. The flow law `specPow p ∘ specPow q = specPow (p+q)` descends from
  `cutRpow_add` per eigenblock. This is the W4.5 OPENS-new-structure node.

## GO (the target)
A new production file `Phys/Algebra/LorentzContinuumSpectralPow.lean` banking:
1. `specOpN_comp_general` — the TWO-eigenvalue composition law
   `specOpN a u ∘ specOpN b u = specOpN (a·b) u` for an EvC-orthonormal family `u`
   (generalizes the banked `specOpN_comp`, which is the a=b case). Smallest obligation.
2. `specPow p l u := specOpN (fun i => cutRpow (l i) p) u` — the continuous spectral t-power.
3. `specPow_flow` — ★ THE ONE-PARAMETER FLOW LAW
   `(specPow p l u).comp (specPow q l u) = specPow (p+q) l u` for `∀ i, 0 < l i` + orthonormal `u`,
   from `specOpN_comp_general` + `cutRpow_add` per eigenblock. THE genuinely-new content.
4. `specPow_one` — `specPow 1 l u = specOpN l u` for `∀ i, 0 < l i` (via `cutRpow_one`, genuinely
   uses cutExp∘cutLog = id).
5. `specPow_zero` — `specPow 0 l u = specOpN (fun _ => 1) u` for `∀ i, 0 < l i` (via `cutRpow_zero`).
6. `specPow_isEvCSymm` / `specPow_nonneg` — self-adjoint + positive (from specOpN_*; cutRpow_pos).
7. `specPow_two` — `specPow 2 l u = specOpN (fun i => l i * l i) u` (via `cutRpow_two`); connects
   the continuous power at p=2 back to the discrete square.
8. A CONCRETE rank-4 non-vacuity witness over the banked `mix4` 4-frame (positive eigenvalues).
9. Costume C208 biting a WRONG flow/power claim → false numeric `1=176` (DISTINCT from battery).

## NO-GO / DECOMPOSE
If `specPow_flow` does not type-check after the general composition law + cutRpow_add (e.g. a
positivity-threading or `congr`/`funext` snag that resists the trunk reframe), DECOMPOSE: bank
`specOpN_comp_general` (a clean standalone generalization, genuinely new) NOW + child the flow
remainder onto the chain tail. Do NOT weaken the flow target; child it.

## KILL (instrument-failure threshold, W9)
- Smallest-obligation probe (`specOpN_comp_general` alone) must elaborate < 15s.
- Whole-file `lake env lean` probe must elaborate < 90s. If it exceeds 90s → INSTRUMENT signal:
  measure the smallest sub-obligation, decompose, do NOT inflate maxHeartbeats / re-grind.
- No `maxHeartbeats` inflation. No monolithic brute normalizer. Structural reduction through the
  banked `specOpN_*` + `cutRpow_*` only.

## STANDARD (the second gate)
- UNBROKEN: builds only on banked `specOpN`/`specOpN_apply`/`specOpN_EvC_read`/`specOpN_isEvCSymm`/
  `specOpN_nonneg` (N68) + `projC` (N63) + `EvC` (N58) + `cutRpow`/`cutRpow_add`/`cutRpow_one`/
  `cutRpow_zero`/`cutRpow_two`/`cutRpow_pos` (N175) over the derived ℝ `Cut` + the terminal `O Cut`.
  NO Mathlib ℝ/ℂ as content; Finset.sum / Module.End / LinearMap are MACHINERY on derived objects.
- COMPLETE: every decl foundations-only {propext, Classical.choice, Quot.sound}; no sorry/axiom/
  native bypass; verified vs the built olean.
- PHYSICS-WORDS-REMOVABLE: delete "spectral / eigenvalue / eigenbasis / power / flow / one-parameter
  group / operator" → pure math: over the derived complete ordered field `Cut` with the continuous
  real power `cutRpow`, for the orthonormal family `u` and the diagonal operator `specOpN`, the map
  `P(t) := specOpN (cutRpow(l·) t) u` satisfies `P(s)∘P(t) = P(s+t)`, `P(1) = specOpN l u`,
  `P(0) = specOpN 1 u`. No theorem STATEMENT needs a physics word.
- NON-VACUOUS (W8): costume C208 bites a wrong flow/power numeric; the rank-4 witness exhibits a
  concrete continuous flow over the mix4 frame; deleting physics words leaves a real constraint.
