# PREREG — D8-freezeout / FreezeoutComposition (directed successor of D7/TheNumeral)

## NODE
ARC-D THE DIGITS. Directed successor of D7 (TheNumeral). Task t_02b56e79.
Goal as stated: derive freeze-out edge ratios rb, rc, rl as closed reals of Cut,
compose into completeFreezeoutList, re-evaluate the GENUINE 1/α(0).

## RESUME CHECK (start-of-run)
- ONE legit board-spawned worker (run 821, pid 81916). Nothing committed for this node
  (HEAD = D7 d9d9a97). No prior workbench for this node. Deriving fresh.

## FRONT SELECTION (theory-native, per task: GREP banked scales BEFORE assuming)
FRONT(1) = derive rb, rc, rl. Investigated across FOUR independent banked sources:
 - Z3 QuarkTexture: "the NUMERICAL quark mass ratios are ROUTE-NOT-YET-FOUND (the deviated
   individual-sector phase on the Fano line + the ℝ-descent)". No quark ratio numeral banked.
 - X9 QuarkHadronTower: "the individual current-quark Yukawa mass ratios / absolutes (there
   is NO banked quark texture — only the LEPTON Koide N340)... ROUTE-NOT-YET-FOUND".
 - ZArcValidationCapstone: officially grades quarkMassRatioNumerals = routeNotYetFound, and
   PROVES (quarkMassRatioNumerals, theoremExact) ∉ zGradeLedger.
 - SEED_MASSES: arc M CONSUMES "D's quark-ratio numerals (D2/D5 output)" — the quark ratios
   are arc-D's ℝ-descent to produce (i.e. THIS front), not yet banked.
 - X4 HadronicSpectrum ℕ-route: edges live on gapSpectrum=ℕ, floor 1, BUT the exact
   which-natural + the quarkonium anchor μ are route-not-yet-found (D2 grade note; X4).

The edge ratios are ratios of quark thresholds and Λ:
   rc = m_b/m_c, rl = m_c/Λ_floor, rb = (upper edge)/m_b — every one needs a quark mass
   ratio (route-not-yet-found). Λ is banked (Λ/v=cutExp(-8π/3)); the quark masses are not.
CONCLUSION: rb, rc, rl are GENUINELY route-not-yet-found (verified, not assumed). The task's
own instruction: "child a dedicated node, do NOT assert, do NOT fit."

## THE ARITHMETIC FINDING (theorem-backed, verified in ProbeFreezeout.lean)
The freeze-out summand = totalScreening(freezeoutTail) = κ·(11/3)·cutLog rb + κ·(10/3)·cutLog rc
+ κ·2·cutLog rl, with κ=kappaLeading≈0.106 and total census 11/3+10/3+2 = EXACTLY 9.
 - For ANY physical quark-threshold edge ratios (O(1–100)) the summand is ≈ 2–4 units.
 - To bridge the partial→measured gap (67.95 → 137.04, ≈ 69 units) via freeze-out ALONE
   would require edge ratios ≈ 10^31 — absurd, non-physical.
 - Even the DERIVED dressing (w=1/3, ×3/2) lifts partial 67.95 → dressed ~85, not ~137.
KEY: the freeze-out is a BOUNDED, logarithmically-small census refinement (theorem
freezeout_bounded: ≤ κ·9·cutLog(max edge)). This CORRECTS the D7/task expectation
("freeze-out is the DOMINANT contribution, expected to fill ~69"): it is quantitatively
NOT the dominant missing summand. The composition-completeness gate STILL fires — and even
with the edge ratios supplied, the composed value would land near the partial (~71–85),
not near the measured constant, absent a further large summand.

## DISCIPLINED OUTCOME (RUNBOOK W1 + task FRONT(1) exit + SOUL repeated-deferral signal)
Do NOT assert edge ratios. Do NOT fit to 137. Do NOT fake a completeness attestation.
BANK the theorem-exact advance I CAN prove; NAME the blocker precisely; hand ONE directed
route-finder child toward the quark ℝ-descent (the ≥5×-deferred front — Z3/Z6/X9/D2/D7).

## MODULE: Phys/Algebra/FreezeoutComposition.lean (import Phys.Algebra.TheNumeral only)
Banked theorems:
 (A) freezeout_total_census: censusBottom+censusCharm+censusLight = 9 (structural fact).
 (B) freezeout_closed: totalScreening(freezeoutTail rb rc rl) = κ·(11/3)cutLog rb +
     κ·(10/3)cutLog rc + κ·2·cutLog rl (censuses unfolded).
 (C) ★ freezeout_bounded: edges ≤ R (1<R) ⇒ freeze-out ≤ κ·9·cutLog R (THE FINDING —
     the freeze-out is a bounded logarithmic refinement).
 (D) composed_eq_split: composed = partial + freeze-out (chargeTraceDepth; re-states D7).
 (E) ★ composed_bounded: edges ≤ R ⇒ composed ≤ partial_hi + κ·9·cutLog R (composed exceeds
     the partial by AT MOST a bounded log term — the composition is a bounded refinement).
 (F) composed_gt_partial: composed strictly > partial (re-exports D7 attestation_partial).
 Teeth: freeze-out > 0 (D2), bound > 0, strict increase, census = 9.
 Capstone: freezeoutComposition_landing (non-hollow conjunction).
Grade: theorem-exact for (A)–(F); ROUTE-NOT-YET-FOUND for rb,rc,rl (quark ℝ-descent).
G2: 137.036 / quark masses / Λ_QCD REMOVABLE PROSE ONLY; no empirical number in any proof.

## COMPILE-COST BUDGET / KILL
All theorems are symbolic (linarith/ring/mul_le_mul over banked lemmas) — ProbeFreezeout.lean
already compiled clean. No heavy numeric. KILL: if any single obligation exceeds ~60s or needs
maxHeartbeats inflation, it is a W9 instrument failure → decompose. (Not expected; probe green.)

## ONE SUCCESSOR (one-successor rail)
Directed route-finder child toward the quark ℝ-descent: "Derive the quark-sector freeze-out
edge ratios rb, rc, rl as closed reals of Cut (the quark mass ℝ-descent via the Z3 forced-cubic
Fano-line phase / X4 ℕ-spectrum anchor)." This REPLACES both D8 and the generic SELECTION
ticket (D8 does not pass while the genuine 1/α(0) is uncomposed; the composition is blocked on
this route-not-yet-found). Exactly ONE non-terminal successor on the chain tail. No fork.
