# PREREG — CensusEnumerationTermination (ARC-D remainder; directed successor of CensusCompletenessClosure t_cb7d1426)

## TARGET (theory-native, SELECT-confirmed, comment 505)
The ENUMERATION EXHAUSTIVENESS + TERMINATION theorem — the second half of the composition-
completeness attestation (SEED_DIGITS §D7). The parent banked the census-level GATHER closing
(`16/3 = 10/3 + 2`); this node proves the finite banked band list is THE COMPLETE, count-FORCED
threshold set from the octonion ceiling `42` down to zero momentum, and that below the lightest
charged edge the active census is `0` so `1/α` FREEZES. Only with this is the banked closed real
provably the COMPLETE coupling (a partial sum may not be declared the full coupling — STANDARD).

## THE FOLD-CAUSAL LINE (S4.1, each arrow forced)
fold → no live fixed point → complex unit → doubling cascade → STOPS at octonions (`not_associative`,
banked O ℚ) → same non-associativity CAPS the Hermitian-Jordan / generation tower at 3
(`finrank ℚ Uhol = 3`, banked) → finitely many charged species (count = `Nc = finrank Uhol = 3`) →
the screening band list is FINITE and count-forced (its census BUDGET is `chargeTraceDepth =
ladderChargeTrace (finrank Uhol)`) → below the lightest charged edge the active flavour set is EMPTY
→ `bandCensus [] = 0` → a zero-census band screens nothing (`bandScreen 0 r = 0`) → appending frozen
bands leaves `invAlphaZero` fixed → FREEZE. Every step pure math on banked objects.

## WHAT I WILL BANK (all probed green in workbench/census-enum-termination/probe_*.lean)

### (A) ENUMERATION — the census budget is cap-forced and exhausted
- `census_budget_cap_forced`: `chargeTraceDepth = ((ladderChargeTrace (finrank ℚ Uhol) : ℚ):Cut) ∧ finrank ℚ Uhol = 3`
  — the screening tower's charge-census budget IS the cap-forced count applied to the ladder trace.
- `census_budget_exhausted`: `chargeTraceDepth = ((freezeoutStaircaseCensus:ℚ):Cut) + leptonCensus`
  (banked `census_completeness_closure`) — the enumerated bands distribute EXACTLY the budget.
- `one_cause_tie`: `not_associative ∧ finrank ℚ Uhol = 3` — the cascade-stop non-associativity is the
  SAME cause that caps the count (⭐ ONE CAUSE MANY TERMINATIONS, load-bearing not prose).

### (B) TERMINATION — below the lightest edge the census is 0, so 1/α freezes
- `frozenCensus : Cut := ((bandCensus [] : ℚ):Cut)`; `frozenCensus_zero : frozenCensus = 0`
  (empty active flavour set below the lightest edge).
- `frozenBand_screens_zero (r) : bandScreen frozenCensus r = 0`.
- `totalScreening_frozen (bands) (∀ p∈bands, p.1 = 0) : totalScreening bands = 0` (general).
- `frozen_tail_all_zero (rs) : ∀ p ∈ rs.map (fun r => (frozenCensus, r)), p.1 = 0`.
- ★ `endpoint_is_frozen (rb rc rl d) (rs) : invAlphaZero (completeFreezeoutList rb rc rl d ++
  rs.map (fun r => (frozenCensus, r))) = invAlphaZero (completeFreezeoutList rb rc rl d)` — the FREEZE:
  the descent has genuinely ended; further (below-edge) bands add nothing. The finite list is NOT
  truncated — anything below it is frozen.
- `freeze_at_ceiling`: `invAlphaZero (([] : List (Cut×Cut)) ++ rs.map (fun r => (frozenCensus,r))) = 42`
  (the empty active tower sits at the octonion ceiling, `invAlphaZero_nil`, and frozen bands keep it there).

### (C) TEETH (W8, non-vacuity)
- `active_band_moves (list) (r) (1<r) : invAlphaZero list < invAlphaZero (list ++ [(leptonCensus, r)])`
  — an ACTIVE band (nonzero census, ratio>1) strictly moves the assembly, so the freeze is genuine
  content (a frozen band is distinguished from an active one, not a vacuous equality).
- `frozen_below_active : frozenCensus < leptonCensus` (`0 < 2`) — frozen census strictly below active.
- `census_budget_ne_uncapped : chargeTraceDepth ≠ ((ladderChargeTrace 2 : ℚ):Cut)` (banked
  `chargeTraceDepth_ne_wrong_colour`) — a WRONG (mis-capped) count gives a WRONG budget: the count is
  load-bearing.

### (D) CAPSTONE (welded, non-hollow)
`censusEnumerationTermination_landing` — conjunction of (A) budget cap-forced + exhausted + one-cause,
(B) frozen census 0 + endpoint frozen + freeze at ceiling, (C) three teeth. Statable from no single
conjunct alone.

## GRADE (honest)
THEOREM-EXACT now (exact identities/inequalities of Cut/ℚ, foundations-only, no error bar). This node
banks the ENUMERATION EXHAUSTIVENESS + TERMINATION — the finite band list is the complete count-forced
threshold set, and the descent terminates (freeze). ROUTE-NOT-YET-FOUND (unchanged, handed forward):
the ℝ-descent edge NUMERALS (rb, rc, rl to N digits via the banked ContinuumBracket) — a separate
numeral front, NEVER fitted. The endpoint is NOT claimed = the measured `1/α(0) ≈ 137.036` (removable
prose only). `s` stays derived `1/8`.

## HARD GUARDS
- NO fit (never pin to 137.036); s stays 1/8; NO empirical number in any statement or proof
  (137.036/135.06/etc removable prose ONLY); NO new axiom; NO truncation to a measured decimal.
- BANKED derived ℝ Cut throughout (bandScreen/invAlphaZero/cutLog over Cut); NEVER Mathlib ℝ as content.
- NOT free-floating: every production TYPE mentions banked objects (chargeTraceDepth, ladderChargeTrace,
  finrank Uhol, bandCensus, bandScreen, totalScreening, invAlphaZero, completeFreezeoutList, leptonCensus,
  freezeoutStaircaseCensus, not_associative on O ℚ). FALSE over an algebra without the banked stack.
- Physics-words-removable: delete coupling/threshold/generation/freeze/census/colour — remains a finite
  census-weighted screening sum over Cut whose budget is a cap-forced count and whose below-edge (empty)
  bands add 0. Pure math survives.

## FOUNDATIONS / IMPORT GUARD
Import only `Phys.Algebra.CensusCompletenessClosure` (⇒ transitively SubBandCompletion,
DecouplingCensusRemoval, EndpointAssembly, X3/X4/X6, ChiralGenerationChargeTrace ⇒ finrank_Uhol,
Cascade O ℚ ⇒ not_associative) + `Mathlib.Tactic`. NO `foldRetention`, NEVER `MassGapOne`/`OneAxiom`.
`#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No native_decide (note: `decide` on tiny ℕ
goals like the wrong-count tooth is fine — it's `Nat` decidability, kernel-checked, NOT native_decide).

## COSTUME
C565 — flag=1 tied to the enumeration/termination landing (budget cap-forced + endpoint frozen).
`min 565 flag = 1`; bogus `= 565` reduces to `1 = 565`, bites.

## COMPILE-COST BUDGET (W9)
All obligations are norm_num/ring/rfl/List.sum_eq_zero/linarith on tiny finite objects — already probed
green individually. No monolithic brute tactic, no maxHeartbeats inflation. KILL: if any single
obligation exceeds ~30s, MEASURE + decompose; do not grind. (Not expected — every probe closed instantly.)

## ONE-SUCCESSOR RAIL
On completion: emit ONE directed successor — the ℝ-descent edge numerals (rb, rc, rl) via the banked
ContinuumBracket toward the enumerated freeze-out edge numerals (SEED_DIGITS D2e/D5), the last
route-not-yet-found sub-fact of the completeness attestation. (Or generic SELECT if the fresh worker's
theory-native read redirects — but the numeral front is the standing route-not-yet-found.)
Fork guard: verify exactly 1 non-terminal successor before kanban_complete.
