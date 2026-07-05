# N329 — SEEDED GAUGE ROUTE B2 (★ BRIDGE, 7th touch): LAND the ladder-grammar NUMERATOR LOCK
#         `bare_exponent × divisor = 84·cutPi = 2·cutPi·(1/α*) = 2π/α*` — the shared scale-tower
#         numerator = (Born-circle full turn, N328) × (octonion Born channels 1/α*=42, arc A),
#         dividing by the banked structural counts {7,9,28} into the three rung exponents.

FRESH worker, run 631. Task t_4a8b8e19. DIRECTED single successor of N328 (t_1e75a0db) — the chain
tail. This is the ★ BRIDGE route-finder's **7th touch** of B2's exponent (N321→N322→N326→N327→N328→
here). Duplicate-instance check: my PPID=42929 = board `spawned.pid` (run 631); `ps` shows my siblings
are the dashboard/TUI + a stray `hermes-verify-n328-axioms.lean` (a leftover, harmless); I am the legit
worker. State at run start: HEAD `da887ce` (N328 banked), git tree clean except untracked N328 probes,
`workbench/N329` fresh (genuine fresh start — no prior probe to resume).

════════════════════════════════════════════════════════════════════════════
## STEP A — SELECT (worker-body STEP A), run theory-native FIRST — THE FRESH-WORKER PIVOT

The ticket DIRECTS a "coupled which-sphere-dimension + count" route-finder (build S³ `2π²` / S⁴ `8π²`
flux measures, or a count operator). I ran SELECT fresh from the THEORY and from the CURRENT banked
state, and it lands ELSEWHERE — a genuine redirect, which is my job.

★ THE DECISIVE FACT the saturated N328/N327 workers could not see: the seed was **RE-SHARPENED in
commit 7108e55** (landed AFTER N327). The re-sharpened B2 target is NOT "build a higher-sphere flux
coupled to a count." It is the **LADDER-GRAMMAR NUMERATOR LOCK**:

    bare_exponent × divisor  =  84π  =  2π·42  =  2π/α*     (for all three rungs)

and it comes with an explicit HONEST GRADE: *"the scale tower is LADDER-grade ... DO NOT grind for a
cleaner forced identity for c — it does not exist at identity grade. Land Arc B at the ladder-grammar
structural identity and FLAG the ladder-grade honestly."* The SOUL's arc-wide discipline concurs:
*"B is LADDER-grade not identity (do NOT grind c for a phantom exact identity — the 84π=2π·42 grammar
IS the landing)."*

★ THE DISSOLUTION of the N327/N328 "coupled which-sphere" ceiling (the QUIET-DRIFT correction). N327
worried the exponent's numerator normalization `8π²` was a FREE choice of sphere (2-sphere `4π` / S³
`2π²` / S⁴ `8π²`) coupled to an un-forced count — and that building higher-sphere flux measures was
the required ascent. But the numerator is ALREADY BANKED, forced by arc A:

    the physicist's instanton numerator  8π²/g²  =  2π·(1/α*)  =  2π·42  =  84π,

because the banked `g² = 4π·α*` gives `1/α* = 4π/g²`, hence `2π/α* = 8π²/g²`. So `8π²/g²` is NOT a
free sphere choice — it is `2π/α*`, LOCKED to arc A's banked `α* = 1/42`. Concretely, `84·cutPi` is
literally `azimuthalTurn × channelCount` = (the BANKED N328 Born-circle full turn `2·cutPi`) × (the
BANKED arc-A octonion Born-channel count `1/α* = 42`). Building S³/S⁴ flux measures was the standard-
math staircase the theory does not need — the numerator falls out of the two banked objects already
in hand. This is the SOUL's QUIET-DRIFT law firing on the SMOOTH path: the obvious next standard build
(iterate the meridian integral one dimension up) was NOT the theory's next beat.

════════════════════════════════════════════════════════════════════════════
## S1 — STATE SURVEY (grep-confirmed this run)

Banked raw material (all confirmed built at HEAD da887ce):
- `azimuthalTurn = 2·cutPi` (N328, `ContinuumSphereFlux`) — the derived Born-circle FULL TURN.
- `cutPi`, `cutPi_pos`, `cutCos cutPi = −1` (N325, `ContinuumTrigPi`).
- `alphaStar : ℚ = 1/42` (`alphaStar_eq`), `1/alphaStar = 42` (`inverseAlphaStar_eq_42`), and
  `1/α* = channels_O` (arc A, `FineStructureScaleCoupling`) — the DERIVED octonion Born-channel count.
- The three banked structural counts: `finrank_ImO = 7` (`DerivationRep7`), `finrank_spaceSub = 9`
  (`SpacetimeSignature`), `finrank_selfAdj_eq_28` (`TowerGatherSymAntisymDecomp`).
- `transmutationRatio c g2 = cutExp(−(c/g2))` (N320 B1), `cutExp` (`ContinuumExp`) — B1 form banked.

════════════════════════════════════════════════════════════════════════════
## S2 — THE BUILD (deliverable: the numerator lock as a derived identity on banked objects)

`Phys/Algebra/ScaleTowerNumeratorLock.lean`:
- `channelCount := ((1/alphaStar : ℚ) : Cut)`; `channelCount_eq : = 42` (via banked `inverseAlphaStar_eq_42`).
- `criticalPhaseNumerator := azimuthalTurn * channelCount`;
    `criticalPhaseNumerator_eq : = 84 * cutPi`   (FALLS OUT: `2·cutPi × 42`; NEVER a literal `84`),
    `criticalPhaseNumerator_phase_form : = azimuthalTurn * ((1/alphaStar:ℚ):Cut)` (rfl — the `2π/α*` form).
- `rungExponent (n : ℕ) := criticalPhaseNumerator / (n : Cut)`.
- `numerator_lock (n) (hn : (n:Cut)≠0) : rungExponent n * n = criticalPhaseNumerator` (the ★ lock).
- Three rung exponents at the BANKED counts (values FALL OUT, never premised):
    `rungExponent_at_imO     (finrank ImO=7)   = 12·cutPi`,
    `rungExponent_at_spaceSub (finrank spaceSub=9) = 28·cutPi/3`,
    `rungExponent_at_selfAdj  (finrank selfAdj=28) = 3·cutPi`,
  and their three locks (`× count = criticalPhaseNumerator`).
- `numerator_triple_lock : 12·cutPi·7 = (28·cutPi/3)·9 ∧ (28·cutPi/3)·9 = 3·cutPi·28` (the seed's exact
  triple identity, pure arithmetic on the derived Cut).
- NON-VACUITY (W8, C354): `criticalPhaseNumerator ≠ 42·cutPi` (the FULL turn `2·cutPi`, not the half
  turn — a WRONG `azimuthalTurn = cutPi` would collapse it) and the rungs are distinct.

Both probes (`workbench/N329/probe1.lean`, `probe2.lean`) compile clean (`$LAKE env lean`, EXIT=0).
Cheap tactics throughout (`norm_num`/`ring`/`field_simp`/`push_cast`/`nlinarith [cutPi_pos]`) — no W9
compile-cost risk (arithmetic identities on banked objects).

════════════════════════════════════════════════════════════════════════════
## S3 — ANTI-BULLSHIT GATE (the ★ BRIDGE bar; crux G4) — held brutally honest

NAME-THE-TEMPTATION, each handled:
  (a) FISH the divisors {7,9,28} to reproduce the seed's {12π, 28π/3, 3π} → NOT done. I compute
      `84π / n` at the three BANKED finranks and WHATEVER falls out falls out (84/7=12, 84/9=28/3,
      84/28=3, pure arithmetic). Nothing is tuned. The `84` itself = `2·42` falls out of (banked
      `2·cutPi`) × (banked `1/α* = 42`); no value is premised.
  (b) declare the face↔divisor class-selection (7=QCD b₀ / 9=EW F₄-Coxeter / 28=gravity Spin(8)) as a
      forced THEOREM → NOT done. That matching is the seed's explicit **NAMED IDENTIFICATION at
      ladder grade**; it lives ONLY in prose (words-removable), NEVER in a theorem statement. The
      Lean divisors are the three banked finranks; the theorems are pure arithmetic about them.
  (c) build S³ `2π²` / S⁴ `8π²` flux measures and pick the one reproducing `6π`/`3π` → the QUIET-DRIFT
      staircase, DISSOLVED: the numerator is `2π/α* = 8π²/g²`, forced by banked arc A, so no higher-
      sphere build is needed. NOT done.
  (d) import Mathlib `Real.pi` to supply `84π` → UNEARNED-IMPORT. NOT done; `84·cutPi` is the DERIVED
      one, `azimuthalTurn × channelCount` on the derived `Cut`.
  (e) assemble a standard one-loop `b₀` from loop factors 11/3, 2/3, 1/6 → C1 forbidden hidden bridge.
      NOT attempted; the divisors are banked finranks, not QFT loop content.

WORDS-REMOVABLE (G5): delete "scale-tower / hierarchy / Born-channel / phase / gauge-dof / QCD / EW /
gravity". What survives: `(2·cutPi)·((1/α*:ℚ):Cut) = 84·cutPi`, and for three banked finranks n,
`(84·cutPi/n)·n = 84·cutPi`, with quotients {12·cutPi, 28·cutPi/3, 3·cutPi}. Pure real arithmetic on
the derived `Cut`. No name is load-bearing.

FREE-FLOATING check: every theorem TYPE mentions the banked `Cut`/`cutPi`/`azimuthalTurn`/`alphaStar`/
the banked finranks — grounded on the tower, not generic. PASSES.

HONEST GRADE (the flag, mandatory, exactly like the T8 caveat): the numerator identity
`84·cutPi = 2·cutPi·(1/α*)` and the arithmetic lock are IDENTITY-grade (forced, banked-grounded). The
FACE↔DIVISOR class-selection (which physical hierarchy takes which of {7,9,28}) is LADDER-grade — a
NAMED IDENTIFICATION seen before/alongside the derivation, NOT a clean forced theorem. This is stamped
in the module docstring; the node does NOT over-claim it. Per the seed + SOUL, THIS ladder-grammar
identity IS the authorized B2 landing — grinding for an identity-grade class-selection is chasing a
phantom (the seed says so explicitly).

NOT a runway / not a new axiom: no empirical scale (v≈246 GeV, Λ_QCD) appears anywhere; the divisors
are banked finranks. This is a BUILD node (production Lean banked), landing B2 at its ladder-grade
target.

════════════════════════════════════════════════════════════════════════════
## DECISION — BUILD (deliverable): bank `Phys/Algebra/ScaleTowerNumeratorLock.lean` — the ladder-
##   grammar numerator lock `84·cutPi = 2·cutPi·(1/α*) = 2π/α*` with the three banked-count rungs and
##   the triple lock. FLAG ladder-grade honestly. NO empirical number; class-selection prose-only.

ONE-SUCCESSOR RAIL: exactly one directed successor — a B3 node (`G·M² = e^(−6π)`, gravity's first
appearance) that USES this banked `criticalPhaseNumerator` (`84·cutPi`) and the n=28 rung (`3·cutPi`,
the half-rung to B4's `M_Pl/M = e^(3π)`), per the seed's B3→B4 ladder. The numerator lock is now
banked; B3 is the next forced beat that consumes it. Pre-complete fork check run before `kanban_complete`.
