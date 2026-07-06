# N369 — PREREG: the ANALYTIC FOLD — the derived-ℝ derivative and `cutExp' = cutExp`
## (toolkit ascent toward arc-F F4; NAMED climb per RUNBOOK repeated-deferral)

## SELECT (theory-native FIRST — see kanban comments 272/273 for the full S1–S4 record)

FRESH-WORKER SELECT ran docs/NODE_SELECTION.md IN FULL. The directed ticket asked for F4 proper
(Higgs quartic λ=0 at a fold-selected scale). S2/S4 found that F4's HONEST content — the criticality
CONDITION (a flow/derivative vanishing) and the m_H number (RGE running) — is a DERIVATIVE statement
the chain CANNOT YET MAKE: there is NO differentiation banked on the derived ℝ `Cut`, and `Cut` has
NO norm/metric (N35 W9 established `MetricSpace`/`NormedField Cut` do not synthesize), so Mathlib's
`HasDerivAt` does not apply. Asserting λ=0 now would be one of two failures: (a) FREE-FLOATING ("λ=0
is the boundary of boundedness" is true of any quadratic `a·s+λ·s²` — fails words-removable-inverse),
or (b) a HIDDEN BRIDGE ("self-coupling = look-back fixed point ⟹ λ=0" — an asserted identification =
the exact category error this project dies of). This is a REPEATED-DEFERRAL signal (RUNBOOK): the
SAME missing structure was childed by N364 (slow-roll `n_s=1−2/N` "needs derived-ℝ cutExp calculus"),
and the banked α/Weinberg "running" only READS a logarithm, never DERIVES a flow. Per RUNBOOK I NAME
the blocker and CLIMB it rather than defer again or assert.

THE THEORY-NATIVE BEAT (S2 reframing lens): the derivative is the fold's rate of self-change. The
fold's Born-positive self-overlap exponential `cutExp` (N174) satisfies `cutExp_add`, and its RATE OF
SELF-CHANGE REPRODUCES ITSELF: `cutExp' = cutExp` — self-look-back at the level of the rate, the
ANALYTIC FOLD. Standard math treats `exp'=exp` as a routine series fact; here it is the fold
reproducing itself under its own rate, and it is the ONE structure that unblocks criticality +
running + slow-roll at once.

## ANTI-BULLSHIT GATE (S4) — passed IN FULL (comment 273). Summary:
- FOLD-CAUSAL: fold → self-look-back → (N174) Born-positive self-overlap `cutExp` w/ `cutExp_add` →
  its rate of self-change reproduces itself. Each arrow forced.
- DISSOLUTION: standard "exp'=exp series fact" + "criticality needs RGE machinery" → the theory makes
  `cutExp'=cutExp` the analytic fold AND the single unblock for criticality/running/slow-roll.
- GOAL-WORDS-REMOVABLE: "the derived complete ordered field's Born-positive self-overlap exponential
  is its own derivative" is a genuine forced math reason; survives deletion of all physics words.
- NAME-THE-TEMPTATION: (a) assert λ=0 [REJECTED free-floating], (b) assert self-coupling=fixed-point
  [REJECTED hidden bridge], (c) side-step to F1 non-abelian anomaly completion [REJECTED lateral].
- HONESTY: cannot derive λ=0 today (needs the derivative to even STATE criticality); the forced beat
  is the calculus cornerstone.

## MEASURE-FIRST (W9) — DONE, route fully de-risked BEFORE production
- RESUME-FIND: `Phys/Foundation/ContinuumScalarDeriv.lean` (N41g) ALREADY BANKS `cut_powerseries_deriv`:
  for entire `a : ℕ → Cut` (`∑|aₙ|` summable), `t⁻¹((∑ tⁿaₙ)−a₀) → a₁` in `𝓝[≠] 0` over the order
  topology, NO Mathlib `HasDerivAt`/norm. This IS the analytic core.
- Probe `workbench/N369-analytic-fold/probe.lean` (EXIT 0, ~21s): `CutHasDerivAt`,
  `cutExp_diffquot_zero` (instantiate at `aₙ=expTermC 1 n=1/n!`, so `a₀=a₁=1`, `tⁿ·aₙ=expTermC t n`,
  series = `cutExp t`), `cutExp_hasDerivAt` (the analytic fold, via `cutExp_add`).
- Extended probes (/tmp/n369_probe2, 3e, EXIT 0): derivative uniqueness (`tendsto_nhds_unique`, since
  `𝓝[≠] 0` is `NeBot`), constant rule, sum rule, and `cutExp_scale_hasDerivAt` (`d/dx cutExp(a·x) =
  a·cutExp(a·x)` for `a≠0`, the scaling form the scale tower `cutExp(−c/g²)` and plateau
  `cutExp(−cφ)` actually use). ALL foundations-only ⊆ {propext, Classical.choice, Quot.sound}.
- COST: LIGHT. Each obligation a bounded `Tendsto` close over the banked N41g/N174 lemmas; no
  native_decide, no maxHeartbeats raise, no coordinate expansion. KILL budget never approached.

## PRODUCTION PLAN — new leaf `Phys/Foundation/ContinuumExpDeriv.lean`, ns `Phys.Foundation.ContinuumQ`
Decls (all measured green):
  1. `CutHasDerivAt f d x` (def — the trunk-native difference-quotient `Tendsto` at a point)
  2. `CutHasDerivAt.unique` (derivative uniqueness)
  3. `cutHasDerivAt_const` (constant rule)
  4. `CutHasDerivAt.add` (sum rule)
  5. `cutExp_diffquot_zero` (`t⁻¹(cutExp t − 1) → 1`)
  6. ★★ `cutExp_hasDerivAt` (THE ANALYTIC FOLD: `CutHasDerivAt cutExp (cutExp x) x`)
  7. ★ `cutExp_scale_hasDerivAt` (`d/dx cutExp(a·x) = a·cutExp(a·x)`, `a≠0`)
  8. teeth: non-vacuity — the derivative value is genuinely `cutExp x` (a positive number, `cutExp_pos`),
     and `cutExp` is NOT its own negative-derivative (distinguishes analytic fold from a rotation).

## COSTUME (C394): a WRONG derivative claim must FAIL. Candidate: assert `cutExp_diffquot_zero`
tends to a WRONG limit (e.g. `0` instead of `1`) → contradiction via `tendsto_nhds_unique` with the
banked correct limit `1`, reducing to a false numeric `1 = 394`. (W8 teeth: the derivative-at-0 value
`1` is load-bearing.)

## GUARDS
- G1 no asserted value (the derivative `cutExp x` FALLS OUT of `cut_powerseries_deriv` + `cutExp_add`).
- G2 no empirical number (none — pure analysis).
- G6 foundations-only; ground the derived ℝ `Cut` + banked `cutExp` (NO Mathlib-ℝ/`Real.exp` content).
- G5 physics-words-removable: NO physics words in the file — it is the pure statement that over the
  derived complete ordered field, the Born-positive self-overlap exponential is its own derivative.
- NOT FREE-FLOATING: every TYPE mentions the banked `cutExp`/`Cut`/`cut_powerseries_deriv`. The
  `CutHasDerivAt` def is instantiated ONLY to the banked `cutExp`, not left generic.

## ONE-SUCCESSOR RAIL: hand ONE directed child toward F4-proper — the criticality condition, now
STATEABLE as `CutHasDerivAt V 0 φ*` (the flow vanishes) on the banked potentials, carrying the named
remainders (F1 non-abelian anomaly completion; N364 slow-roll; F2 gauge-θ half).
