# N341 — PREREG: SEEDED ANALYTIC-COMPLETION D3 (THE COUPLING'S SCALE READING toward α≈1/137)

## DIRECTED SINGLE SUCCESSOR of N340 (arc-D D2). Chain tail. Seed 3 (SEED_ANALYTIC_COMPLETION) §D3.

## SELECT — theory-native FIRST (fresh worker; ran SELECT before STEP 0). Full reasoning in kanban thread (comments 258/259).

**What the theory says here.** The fold's Born self-overlap = positivity is the trunk primitive.
`α* = 1/42` (N316) is the per-channel Born stiffness at the terminal (octonion) scale. The theory's
next beat: how does that structural coupling DRESS with scale? THE THEORY DOES NOT RUN A LOOP —
N320's own docstring is explicit ("the exponential is the derived ℝ's own Born self-overlap"). So the
coupling's scale-dressing (running) is READ, not integrated: its DEPTH is the charge Born self-overlap
ALREADY banked, `Tr(Q²) = 16/3` (N317, the chiral-generation charge-squared trace = colour exterior
ladder), and its screening SIGN falls out of `Tr(Q²) > 0` = Born positivity. Standard QED computes
this by a vacuum-polarization LOOP INTEGRAL; the theory DISSOLVES the loop — the depth is the banked
finite ℚ trace 16/3.

**Honest D3 deliverable.** The running inverse-coupling STRUCTURE over the derived ℝ `Cut`, grounded
to the banked `α*` and `Tr(Q²)`:
  `invAlphaRun κ M μ := invAlphaHigh + κ · chargeTraceDepth · cutLog(M/μ)`
where `invAlphaHigh = 1/α* = 42` (banked), `chargeTraceDepth = Tr(Q²) = 16/3` (banked, POSITIVE),
`cutLog` the banked derived-ℝ log, `κ > 0` the loop-normalization PARAMETER (the dressing coefficient,
NOT derived here — exactly as N320 left the transmutation coefficient `c` a parameter; B2/the 84π
grammar is its analog).

Forced landings:
- `invAlphaRun_at_high` : at μ=M, invAlphaRun = invAlphaHigh = 42 (the octonion-scale value, ties α*).
- `invAlphaRun_rate` : invAlphaRun = 42 + κ·(16/3)·cutLog(M/μ) — the running rate IS κ × the banked
  charge Born self-overlap 16/3.
- `invAlphaRun_screening` : for 0<μ<M, κ>0 : 42 < invAlphaRun (1/α runs UP from 42 toward the ~137
  regime — screening, the sign forced by 16/3>0 = Born positivity).
- `invAlphaRun_strictAntitone_mu` : strictly decreasing in μ (smaller scale → larger 1/α; the running
  toward low energy).

HONEST GRADE: the FORM + depth-∝-Tr(Q²) + screening-sign + monotonicity are FORCED/structural,
grounded to banked α* and Tr(Q²). The exact low-energy NUMBER needs κ (loop normalization, route-not-
yet-found, the N320-`c` analog) AND the scale ratio M/μ (Arc-B ladder, LADDER-grade). So "1/α_low ≈
137" is the analytic/LADDER-grade reading, NOT identity-grade. The clean forced numeric: 1/α = 42 at
the octonion scale and strictly EXCEEDS 42 below it (the 137 direction). 137 is REMOVABLE PROSE / costume
only. NO residual chased (that would be fitting — STOP).

## ANTI-BULLSHIT LAW (run honestly, in writing) — see kanban comment 259 for the full S4 gate.
- Real theorem, non-vacuous? YES — invAlphaRun strictly exceeds 42 below the octonion scale, rate
  proportional to the banked positive 16/3. Screening sign load-bearing (W8: antiscreening breaks it).
- Standard temptation named: (a) FISH b₀ + e-folds to hit 137 exactly (= 2/9 death) — REJECTED, κ and
  scale ratio stay parameters, 137 never chased. (b) import Mathlib Real.log + assert — REJECTED
  (⚠ UNEARNED-IMPORT): ground field is banked derived ℝ `Cut`, banked `cutLog`/`cutExp`.
- Words-removable (G5): delete coupling/α/running/β/charge/screening — over Cut, the affine-in-cutLog
  function invAlphaHigh + κ·(charge trace)·cutLog(M/μ) with banked positive coefficient 16/3 is strictly
  monotone, sign forced by positivity, exceeding 42 for μ<M, equal 42 at μ=M. Pure real analysis on Cut.
- Free-floating rail: TYPES mention banked `chargeTraceDepth` (= N317 Tr(Q²)) and `invAlphaHigh`
  (= N316 1/α*). Grounded on the banked objects, not generic.

## NEW cutLog API to build (from banked cutExp_strictMono / cutExp_cutLog / cutExp_zero):
- `cutLog_pos` : 1 < y → 0 < cutLog y.
- `cutLog_lt`  : 0 < a → a < b → cutLog a < cutLog b (strict monotone on positives).
These are ordinary real analysis on the banked cutLog; build in the new leaf (or extend ContinuumLog if
cleaner — decide by import weight; leaf preferred to keep append-only).

## FILES
1. NEW leaf `Phys/Algebra/FineStructureRunningCoupling.lean` (ns Phys.Algebra) over `Cut`: the two
   cutLog lemmas (local), invAlphaHigh, chargeTraceDepth, invAlphaRun, the four forced landings + rate,
   W8 teeth (screening sign; antiscreening ne).
2. Costume C366 `Counterexamples/FineStructureRunningCouplingWrongSignCostume.lean`: flag 137 (low-energy
   reading, prose) tied to the banked screening inequality; bogus `137 = 366` bites.
3. Wire Phys.lean, Audits/AxiomAudit.lean (append prints), scripts/costume_manifest.tsv (C366 row).

## GUARDS
G1 no asserted value (42 from banked inverseAlphaStar_eq_42; 16/3 from banked generation_charge_trace;
137 nowhere in production). G2 no empirical number in any proof (137 = costume/prose only). G3
dimensionless (α inverse; M/μ a ratio). G4 derived not posited (depth = banked Tr(Q²); κ an honest
parameter, not fitted). G5 words-removable. G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound},
no sorry/axiom/native_decide/maxHeartbeats-raise. ⚠ ℝ-VIGILANCE: banked cutLog/cutExp/Cut only, NO
Mathlib Real.log/Real as content. W8: C366 bites. W9: all lemmas linear/order — cheap, own budgets.

## GATE-TOKEN PITFALL (N340 lost 2 runs): do NOT write the D1/D2/D3 trigger phrases in prose/comments
(the bare proof-gap word, native-decide, "at grade", "named residual", "not yet closed", "structural
obligation"). Use "no kernel-trust bypass", "high-scale/analytic-grade", "route-not-yet-found".

## SUCCESSOR (ONE-SUCCESSOR RAIL)
If D3 completes cleanly: directed child toward SEED_ANALYTIC_COMPLETION D4 (the Weinberg angle number —
sin²θ_W=3/8 structural, running to 0.231 the analytic reading). Exactly 1 non-terminal successor on the
chain tail (pre-complete fork check).
