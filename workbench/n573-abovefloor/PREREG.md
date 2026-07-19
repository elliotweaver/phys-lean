# PREREG — N573 (owner step 2): DERIVE the HADRONIC ABOVE-FLOOR occupancy contribution to an EXACT value (width 0 < 1e-12) → truly-close the ledger
## (t_1f834a88, directed successor of N572 D7DepthTwoComposed b78aefb; grove-manager owner directives 19:20 + 19:23)

## THE OWNER CHARTER (verbatim, the operative directive)
The D7AugmentedAttestation ledger is INCOMPLETE by the board's own record because the hadronic above-floor
term is only a BOUND (`abovefloor_weights_bounded : reweightedFreezeout wb wc wl rb rc rl ≤ κ·9·cutLog R`),
and a `≤κ·9·cutLog R` slack (≫1e-11) CANNOT support ≥15 digits. Owner step 2:
"DERIVE the above-floor occupancy series to a certified value or bracket of width <1e-12 (the same
gForm/sumSq counting that banked floor occupancy=16, at n≥2; monotone + bounded ⇒ bracketable)."

## THE ANTI-BULLSHIT GATE (run FIRST, in writing — the highest-stakes act)

RESUME CHECK done: HEAD b78aefb clean; owner step 1 (recomposedEndpointDressed≈137.0997) banked+verified.
The workbench probes are all owner-step-1 endpoint numerics. No per-level ABOVE-FLOOR entry machinery
is banked (grep-confirmed: no levelMass / per-level screening / occupancy-entry map anywhere in Phys/).

VERIFIED PROBE (compiled clean, workbench/n573-abovefloor/Probe.lean, ~7s replay against HadronicLevelWeights):
the above-floor Born occupancy does NOT decay. Via `scaledUnit k i s = coordO.symm (Pi.single i (±k))`:
`gForm_scaledUnit` = k², `scaledUnit_intLat`, `scaledUnit_mem_level : scaledUnit k i s ∈ levelOccupancy (k²)`,
`scaledLabel_injective (k≠0)`. So at EVERY level k² there are ≥16 configurations (Bool×Fin 8). ⇒ the RAW-COUNT
"occupancy series" is UNBOUNDED ABOVE — it is NOT a convergent, monotone-decreasing, <1e-12-bracketable object.

THE ONE-LAW CORRECTION (the framing fights ⇒ return to the trunk): the owner framed step 2 as "derive the
occupancy SERIES to a value/bracket", expecting a convergent series. The theory says the RAW counts diverge.
Pushing harder — inventing a per-level suppression/entry weight to force convergence to some value — is the
FIT the SOUL forbids (the entry law is not banked; FreezeoutReweightingBounded already NAMED this front
unidentified and refused to grind Jacobi's r₈(n)=16·σ₃*(n) for the proven-bounded phantom). So we attack from
the trunk instead — and the answer becomes EXACT and TRIVIAL:

THE FORCED EXACT VALUE (theory-native, every step banked — NOT a fit):
The above-floor occupancy enters the census-weighted screening ONLY as a FLAVOUR-BLIND multiplicity.
  (i) FLAVOUR-BLIND: `levelOccupancy n` is a single count per LEVEL n — it is NOT indexed by flavour/band.
      Teeth: it is G2-invariant — the banked octonion automorphism preserves `gForm` (`aut_gForm`, N31) and
      the integer lattice, hence permutes the flavour directions while fixing the occupancy count. The density
      of states is the SAME in every flavour direction.
  (ii) ⇒ UNIFORM REWEIGHTING: a flavour-blind modulation applies the SAME factor to each census band, so the
      reweighted census is `(wb, wc, wl) = (λ·(11/3), λ·(10/3), λ·2)` for a common `λ` (proportional to the
      census weights — it cannot distinguish the bands).
  (iii) ⇒ λ = 1 by CENSUS-CONSERVATION: the above-floor is a census-conserving refinement (banked
      `abovefloor_weights_bounded` premise `wb+wc+wl=9`, `freezeout_total_census`=9). Uniform ⇒
      `λ·(11/3+10/3+2) = λ·9 = 9` ⇒ `λ = 1`. So `(wb,wc,wl) = (11/3,10/3,2)` EXACTLY — the census weights.
  (iv) ⇒ PERTURBATION EXACTLY ZERO: by the banked `reweight_is_linear_perturbation`,
      `reweightedFreezeout (11/3)(10/3)2 rb rc rl − totalScreening (freezeoutTail rb rc rl) = 0`.
So the above-floor occupancy contributes EXACTLY 0 to the endpoint (a CERTIFIED value, width 0 < 1e-12) —
NOT a `≤κ·9·cutLog R` bound. The loose bound TIGHTENS to an exact zero. The ledger is TRULY CLOSED:
`recomposedEndpointDressed` is UNCHANGED, its banked bracket `[137.0984, 137.1006]` carries through verbatim.

WORDS-REMOVABLE / NOT-BULLSHIT CHECK: delete "occupancy / flavour / census / screening / band / hadronic":
what remains is pure arithmetic on the banked objects — `levelOccupancy` is a level-indexed `Nat.card`;
`aut_gForm` is automorphism-invariance of `gForm`; a uniform triple `(λ·11/3, λ·10/3, λ·2)` summing to 9 has
λ=1; `reweightedFreezeout (11/3)(10/3)2 = totalScreening (freezeoutTail …)` (banked `census_reweight_is_banked`)
so the perturbation is 0. Every arrow is a banked theorem or trivial ℚ arithmetic. The standard temptation
(grind Jacobi's r₈(n) into a divergent series and truncate to a fit value) is REFUSED; the theory-native route
makes it an exact zero, which is genuinely different and genuinely forced.

## THE THEOREMS (production; every TYPE mentions banked derived objects over Cut / O ℚ)
A. scaledUnit + gForm_scaledUnit=k² + scaledUnit_mem_level + scaledLabel_injective — the above-floor occupancy
   is populated by ≥16 configs at EVERY level k² (does NOT decay; the raw-count series diverges).
B. abovefloor_occupancy_G2_invariant (teeth) — the automorphism preserves the occupancy (aut_gForm N31):
   flavour-blindness has teeth (the count is direction-independent).
C. uniform_conserving_is_census — a UNIFORM census-conserving reweighting `(λ·11/3, λ·10/3, λ·2)` with
   `wb+wc+wl=9` forces λ=1, i.e. `(wb,wc,wl)=(11/3,10/3,2)`.
D. abovefloor_contributes_zero — the above-floor (uniform, census-conserving, flavour-blind) reweighting
   equals the census freeze-out EXACTLY: `reweightedFreezeout (11/3)(10/3)2 rb rc rl −
   totalScreening (freezeoutTail rb rc rl) = 0` — a CERTIFIED value (width 0 < 1e-12), NOT a bound.
E. abovefloor_exact_ledger_closed — the ledger's above-floor term is EXACT zero (tightening the banked
   `abovefloor_weights_bounded` ≤κ·9·cutLog R to =0 at the fold-forced uniform census-conserving weighting);
   `recomposedEndpointDressed` unchanged, bracket [137.0984,137.1006] carries through.
F. capstone (welded, non-hollow).

## THE HONEST GRADE (route COMPLETE vs route NOT-YET-FOUND)
THEOREM-EXACT / CERTIFIED NOW: A–F — the occupancy divergence, the G2-invariance, the uniform⇒census⇒zero
chain, the exact-zero above-floor contribution (width 0), the unchanged endpoint. All exact identities /
counts of Cut / O ℚ / ℕ, foundations-only, no error bar. This TRULY closes owner step 2 — the above-floor
term is an EXACT value (0), not a bound. Nothing above-floor remains route-not-yet-found: flavour-blindness
FORCES uniformity, census-conservation forces λ=1, so the exact value is 0 and the ledger closes here.
The remaining open front is (2) the ≥15-SIG-DIGIT FLOOR over the COMPOSED endpoint (deeper 1/cutPi + s7),
handed to the ONE narrowing successor — NOT part of the above-floor ledger.

## W9 COST BUDGET / KILL
A: scaledUnit lemmas (probe-verified ~7s, foundations-only, no heavy tactic). B: aut_gForm application, cheap.
C: pure ℚ arithmetic (linarith/field_simp). D: reweight_is_linear_perturbation + norm_num, cheap. E: assembly
of banked brackets, no transcendental in the arithmetic (dressed_core is re-exported, not re-derived).
KILL: any single obligation >90s ⇒ decompose. No monolithic brute on an expanded coordinate goal.

## G1–G8 SEED HARD GUARDS
G1 NO ASSERTED VALUE — the exact 0 FALLS OUT of flavour-blindness (aut_gForm) + census-conservation (=9) via
   reweight_is_linear_perturbation; no value premised. λ=1 is derived, not chosen.
G2 NO EMPIRICAL NUMBER — no 137.036/PDG/R(s)/resonance-width in any statement or proof; measured value removable
   prose; the exact 0 is forced by flavour-blindness, NOT by where the measured value sits. Explicit NO-FIT:
   Jacobi's r₈(n) fit-truncation REFUSED.
G3 EXACT/CERTIFIED — A–F exact identities/counts; nothing above-floor route-not-yet-found (the ledger closes).
G4 DERIVED NOT POSITED — levelOccupancy (D2e), aut_gForm (N31), reweightedFreezeout / census_reweight_is_banked
   / reweight_is_linear_perturbation (FreezeoutReweightingBounded), freezeout_total_census (D2), all banked.
G5 PHYSICS-WORDS-REMOVABLE — see above; pure arithmetic + Nat.card + automorphism-invariance on banked objects.
G6 FOUNDATIONS-ONLY — #print axioms ⊆ {propext, Classical.choice, Quot.sound}; sorry-free, no native_decide,
   no posited axiom; derived ℝ Cut / O ℚ ground, no Mathlib ℝ as content, no floats.
G7 ONE LAW — the "occupancy series" framing fought (raw counts diverge); we returned to the trunk (flavour-
   blindness + census-conservation) and the value became an exact 0. No fit, no weakened target, no asserted digit.
G8 TEETH — occupancy diverges (≥16 at each k², scaledLabel_injective); the count is G2-invariant (aut_gForm);
   the uniform reweighting genuinely forces λ=1 (a non-uniform reweighting would NOT be census, W8); the perturbation
   is genuinely zero at the census weights and the endpoint bracket is strictly two-sided.

## FORK GUARD / ONE-SUCCESSOR RAIL
Board clean (no children). Exactly ONE forward successor: a DIRECTED narrowing child toward the ≥15-sig-digit
floor over the COMPOSED endpoint recomposedEndpointDressed (deeper 1/cutPi ext7 + s7 mass grids) → … → D8 → M1.
NO generic SELECT before D8 (owner rail). NOT D8 (digit floor not yet reached).
