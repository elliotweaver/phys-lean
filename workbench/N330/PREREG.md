# N330 — SEEDED GAUGE ROUTE B3 (arc-B, GRAVITY'S FIRST APPEARANCE): `G·M² = e^(−6π)`
#         the saturation-face completion, via the banked n=28 rung `rungExponent_at_selfAdj = 3·cutPi`.

FRESH worker, run 632. Task t_bff6fc23. DIRECTED single successor of N329 (t_4a8b8e19) — the chain
tail. Duplicate-instance check: my PPID=52781 = board `spawned.pid` (run 632); `ps` shows my sibling
is the launching hermes CLI; I am the LEGIT worker, did NOT stand down. State at run start: HEAD
`1d6747f` (N329 banked + audit-import fix), git tree clean except untracked N328/N329 gate logs +
probes, `workbench/N330` fresh (genuine fresh start — no prior probe to resume).

════════════════════════════════════════════════════════════════════════════
## STEP A — SELECT (worker-body STEP A), run theory-native FIRST

The ticket offers three framings: (a) the B3 assembly `G·M² = e^(−6π)` directly on `cutExp` + the
banked n=28 rung, (b) B4 first (`M_Pl = G^(−1/2)`, `M = M_Pl·e^(−3π)`), or (c) a smaller structural
prerequisite. I ran SELECT fresh from the THEORY.

★ THE THEORY-NATIVE READING (why B3 is the beat, and why it is FORCED, not fished). The n=28
saturation channel (dim `selfAdj` = 28 = Λ²(ℝ⁸) = Spin(8)) is the gravitational face. Its rung
exponent is the BANKED `rungExponent_at_selfAdj = 3·cutPi` (N329). Reading physically, this is the
closure-to-Planck HALF-RUNG suppression: `M/M_Pl = e^(−3π)` (equivalently `M_Pl/M = e^(3π)`, the B4
half-rung). Now gravity's dimensionless coupling is `G·M²`. In natural units `G = M_Pl^(−2)`, so

        G·M²  =  (M/M_Pl)²  =  the BORN SELF-OVERLAP SQUARE of the half-rung suppression e^(−3π).

The factor-of-two doubling `6π = 2·(3π)` is NOT a second independent input — it IS the Born
self-overlap square. This is the SAME trunk primitive `cutExp x = (cutExp (x/2))²` that forced
`cutExp_pos` (N174, Born = self-overlap = positivity). So gravity's coupling is a Born self-overlap,
and its exponent is exactly twice the n=28 saturation rung PRECISELY BECAUSE Born overlap is a square.
That is the deepest theory-native reading and it consumes the banked half-rung `3·cutPi` directly.

Therefore B3 (not B4) is the beat: the dimensionless product `G·M²` is the primary derived object —
a pure RATIO (G3-honest: dimensionless), needing no G anchor to state — while B4's `M_Pl`/`M`
individually require introducing G. The half-rung ratio `M/M_Pl = e^(−3π)` is the ATOM; it is built
here as B3's internal prerequisite (`planckClosureRatio`), and B4 will consume it. Framing (c) is
subsumed: `planckClosureRatio` IS the small structural prerequisite, and it is one line off the
banked rung.

════════════════════════════════════════════════════════════════════════════
## S1 — STATE SURVEY (grep-confirmed this run)

Banked raw material (confirmed at HEAD 1d6747f):
- `rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = 3·cutPi`
  (`rungExponent_at_selfAdj`, N329 `ScaleTowerNumeratorLock`) — the n=28 gravity rung.
- `criticalPhaseNumerator = 84·cutPi`, `rungExponent n := criticalPhaseNumerator/(n:Cut)` (N329).
- `cutExp`, `cutExp_add` (homomorphism), `cutExp_pos` (Born positivity), `cutExp_zero`
  (`ContinuumExp`); `cutExp_strictMono` (`ContinuumLog`). ALL banked.
- `cutPi`, `cutPi_pos` (`ContinuumTrigPi`, N325). Banked.
- `transmutationRatio c g2 = cutExp(−(c/g²))` (N320 B1 form) — the exp-suppression shape.

════════════════════════════════════════════════════════════════════════════
## S2 — THE BUILD (deliverable: `Phys/Algebra/NewtonScaleProduct.lean`)

- `planckClosureRatio := cutExp (−(rungExponent (finrank selfAdj)))`   (M/M_Pl, the atom)
    `planckClosureRatio_eq : = cutExp (−(3·cutPi))`   (via banked `rungExponent_at_selfAdj`),
    `planckClosureRatio_pos`, `planckClosureRatio_lt_one` (strict: −3π < 0, `cutExp_strictMono`).
- `gravExponent_eq_two_rung : (6:Cut)·cutPi = 2 · rungExponent (finrank selfAdj)`  (FALLS OUT).
- `gravExponent_from_numerator : (6:Cut)·cutPi = 2 · (criticalPhaseNumerator/(finrank selfAdj:Cut))`
    (ties 6π to the shared 84π budget: `2·(84π/28)`).
- `newtonScaleProduct := planckClosureRatio * planckClosureRatio`   (★ G·M², the Born self-overlap square)
    `newtonScaleProduct_born_square : = planckClosureRatio ^ 2`,
    `newtonScaleProduct_eq : = cutExp (−(6·cutPi))`   (★★ B3 — via `cutExp_add`: (e^(−3π))² = e^(−6π)),
    `newtonScaleProduct_pos`, `newtonScaleProduct_lt_one` (strict: G·M² < 1, the closure below Planck),
    `newtonScaleProduct_lt_planckClosureRatio` (G·M² < M/M_Pl — the square is deeper, since ratio < 1).
- `newton_gravitational_product` — capstone conjunction (B3 form + Born-square + 6π=2·rung + pos + <1).
- NON-VACUITY (W8, C355): `newtonScaleProduct_ne_halfRung` (G·M² ≠ M/M_Pl — the Born-square doubling
    is load-bearing) and `gravExponent_ne_rung` (6π ≠ 3π).

All tactics cheap (`rw`/`ring`/`congr`/`nlinarith [cutPi_pos]`/`mul_lt_mul_of_pos_right`) on banked
objects — no W9 compile-cost risk (arithmetic identities + banked order lemmas, exactly like N329).
Probe (`workbench/N330/probe1.lean`) must compile clean (`$LAKE env lean`, EXIT=0) BEFORE production.

════════════════════════════════════════════════════════════════════════════
## S3 — ANTI-BULLSHIT GATE (★ BRIDGE bar; crux G4) — held brutally honest

NAME-THE-TEMPTATION, each handled:
  (a) POSIT `6π` (or `e^(−6π)`) directly to reproduce the seed's `G·M²=e^(−6π)` → NOT done. `6π`
      FALLS OUT as `2 · rungExponent_at_selfAdj = 2·(3·cutPi)`; the `2` is the Born-square (def
      `newtonScaleProduct = planckClosureRatio·planckClosureRatio`, closed by banked `cutExp_add`),
      the `3·cutPi` is the banked n=28 rung. Nothing premised; no literal `6π` in a def.
  (b) declare the n=28 → gravity face-selection a forced THEOREM → NOT done. That is the seed's
      NAMED IDENTIFICATION (ladder grade). The Lean object is the banked `finrank selfAdj = 28`; the
      theorems are pure arithmetic about it. The physics word "gravity/saturation" is prose-only.
  (c) import Mathlib `Real.exp`/`Real.pi` to supply `e^(−6π)` → UNEARNED-IMPORT. NOT done; the exp
      is the banked derived-ℝ `cutExp`, the π is the banked `cutPi`, on the derived `Cut`.
  (d) fish `{28, 9, 4π}` arithmetic against a measured v/M or M_Pl/M ratio → the G4 hidden-bridge
      death (the predecessor's 2/9). NOT attempted; no empirical scale (M_Pl ≈ 1.22e19 GeV, v) is
      anywhere. The only inputs are the banked n=28 rung and the Born-square.
  (e) claim identity-grade for the whole thing → NOT done. Two honest-grade flags below.

WORDS-REMOVABLE (G5): delete "gravity / Newton / Planck / closure-scale / saturation / coupling".
What survives: `planckClosureRatio := cutExp(−rungExponent(finrank selfAdj))`, and
`newtonScaleProduct := planckClosureRatio · planckClosureRatio = cutExp(−(6·cutPi))` with
`6·cutPi = 2·rungExponent(finrank selfAdj)`, plus positivity and `< 1`. Pure real analysis on the
derived `Cut` and the banked `cutExp`/`cutPi`/`rungExponent`. NO name is load-bearing.

FREE-FLOATING check: every theorem TYPE mentions the banked `Cut`/`cutExp`/`cutPi`/`rungExponent`/
`criticalPhaseNumerator`/the banked `finrank selfAdj`. Grounded on the tower, not generic. PASSES.

HONEST GRADE (mandatory flags, exactly like the T8 caveat — DO NOT over-claim):
  • IDENTITY-grade (forced, banked-grounded): `newtonScaleProduct = (e^(−3π))² = e^(−6π)`, the
    `6π = 2·rungExponent(selfAdj)` doubling, the Born-square, positivity, and `< 1`. Pure arithmetic
    on banked objects; nothing fished.
  • LADDER-grade FLAG (i) — CONVENTION-UNIQUENESS: identifying the derived dimensionless product with
    the *bare-G pair-potential* convention `G·M²` (vs `8πG`, `16πG`, `32πG`, which shift the theory
    integer off n=28 by 5–7 units) is a NAMED IDENTIFICATION, not a clean theorem. Prose-only.
  • LADDER-grade FLAG (ii) — the n=28 rung carries P=1 (no completion factor) because saturation is
    GLOBAL. NAMED IDENTIFICATION, prose-only.
  Per the seed + SOUL, THIS ladder-grammar landing IS the authorized B3 target; grinding for a
  cleaner forced convention-identity is chasing a phantom (the seed says so explicitly).

E3 CROSS-TIE (noted, NOT overreached): B3 uses the *bare-G* convention `G·M²`, so it does NOT itself
supply the `8πG = 2·4π·G` / `4π` Gauss-sphere normalization — that is E3's job (gravity in arc E),
which will reuse the banked `gaussSphereSolidAngle = 4·cutPi` (N328). Noted here so E3 inherits the joint.

NOT a runway / not a new axiom: no empirical scale appears; the exponent is the banked n=28 rung
doubled by the Born square. This is a BUILD node (production Lean banked), landing B3 at ladder grade.

════════════════════════════════════════════════════════════════════════════
## DECISION — BUILD: bank `Phys/Algebra/NewtonScaleProduct.lean` — `G·M² = e^(−6π)` as the Born
##   self-overlap square of the banked n=28 half-rung `e^(−3π)`, with `6π = 2·rungExponent_at_selfAdj`.
##   FLAG the two ladder-grade named-identifications honestly; class-selection + convention prose-only.

ONE-SUCCESSOR RAIL: exactly one directed successor — a B4 node (`M_Pl = G^(−1/2)`, `M = M_Pl·e^(−3π)`,
the half-rung) that consumes this banked `planckClosureRatio` (`e^(−3π)`) and `newtonScaleProduct`
(`e^(−6π)`), per the seed's B3→B4 ladder. Pre-complete fork check (kanban_list, non-terminal
successors = exactly 1 on the tail) run before `kanban_complete`.
