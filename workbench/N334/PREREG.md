# N334 — SEEDED GAUGE ROUTE B7 (arc-B, the CAPSTONE): the scale tower as ONE object.

FRESH worker, run 636. Task t_a97bcf0a. DIRECTED single successor of N333 (t_aecf6547) — chain tail.
Duplicate-instance check: my PPID=9952 = board `spawned.pid` (run 636); `ps` shows my only sibling is
the launching hermes CLI. I am the LEGIT worker; did NOT stand down. State at run start: HEAD `87c023d`
(N333 banked), git tree clean (only `workbench/N333/gate-fast.log` untracked), `workbench/N334` fresh
(genuine fresh start — no prior probe). Build green at HEAD.

════════════════════════════════════════════════════════════════════════════
## STEP A — SELECT (worker-body STEP A), run theory-native FIRST

The ticket offers three framings: (a) B7 part (1) the tower-as-one-object + part (2) the eigenvalue
reading if clean, (b) a smaller structural prerequisite (the n=7 QCD rung), or (c) the arc-C handoff
(C1). I ran SELECT fresh from the THEORY.

★ THE THEORY-NATIVE READING (why the MERGED (a)+(b) is the beat).
The fold's self-look-back closes over its Born circle. The banked N329 result is that ONE critical
phase budget `criticalPhaseNumerator = 84·cutPi = 2·cutPi·42 = 2π/α*` (the full Born-circle turn times
the 42 octonion Born-channels) is divided by the terminal algebra's OWN structural counts {7,9,28} =
finrank{ImO, spaceSub, selfAdj} into the three rung exponents {12·cutPi, 28·cutPi/3, 3·cutPi}. Every
scale hierarchy is the e-folds for one unit of a face's structure to complete its share of that ONE
budget. So the theory-native content of B7 is NOT a conjunction of the already-banked rungs — it is that
the WHOLE tower is a SINGLE object `scaleTowerRung(n, m) = cutExp(m·rungExponent n)` with only two
freedoms: the structural count `n ∈ {7,9,28}` and the integer multiplicity `m` (its SIGN = the ± e-fold
direction up/down from closure, its MAGNITUDE = the Born self-overlap power k ∈ {1,2}). Every banked
ratio is PROVEN to be this one object at a specific (n,m):
    ewClosureRatio (v/M)       = scaleTowerRung 9  (−1)
    seesawRatio    (m₀/M)      = scaleTowerRung 9  (−2)   (Born square = m-doubling −1→−2)
    planckClosureRatio (M/M_Pl)= scaleTowerRung 28 (−1)
    planckMassRatio (M_Pl/M)   = scaleTowerRung 28 (+1)   (reciprocal = m sign flip)
    newtonScaleProduct (G·M²)  = scaleTowerRung 28 (−2)   (Born square = m-doubling −1→−2)
The Born self-overlap square (N174 — the SAME positivity that forced cutExp_pos, made gravity's coupling
a square at B3, and the ν seesaw a square at B6) shows up here STRUCTURALLY as the homomorphism
`scaleTowerRung n m ^ 2 = scaleTowerRung n (2m)`: doubling the Born power IS doubling m. ONE CAUSE.

★ THE QCD RUNG COMPLETES THE TRIPLE (why (b) MERGES into (a)). The tower is INCOMPLETE with only n∈{9,28}
banked as ratios: the n=7 rung EXPONENT `rungExponent 7 = 12·cutPi` is banked (rungExponent_at_imO) but
NO n=7 ratio object exists. The one-object tower DEMANDS all three counts. So I bank the QCD rung
`qcdClosureRatio = scaleTowerRung 7 (−1) = cutExp(−12·cutPi)` — the third instance completing {7,9,28} —
exactly as forced as the EW rung, no fishing (falls out of the banked rungExponent_at_imO/finrank_ImO).
Framings (a)+(b) MERGE exactly as N332's did: the QCD rung is the load-bearing prerequisite the
one-object tower needs, so it is banked INSIDE the B7 deliverable, not as a separate node.

★ THE EIGENVALUE READING FALLS OUT CLEANLY (part (2), banked). Define `criticalEigenvalue n = −n /
criticalPhaseNumerator` (built on the BANKED numerator, NOT the literal 84π — the `= −n/(84·cutPi)` form
is a THEOREM via criticalPhaseNumerator_eq). Then the exact identity is clean two-line arithmetic:
    criticalEigenvalue n · rungExponent n = −1        (the negative-reciprocal lock, n≠0)
    criticalPhaseNumerator · criticalEigenvalue n = −n (the seed's `K·λ_n = −n` form)
    criticalEigenvalue n = −(rungExponent n)⁻¹        (λ_n is the neg reciprocal of the rung exponent)
with the three values −1/(12·cutPi), −3/(28·cutPi), −1/(3·cutPi) falling out at {7,9,28}. Since it falls
out cleanly on the banked objects (the seed's condition to bank it), I bank the NUMBER and its exact
identity. The physical IDENTIFICATION of {7,9,28} as the relevant-direction eigenvalues of the
framework's ONE critical fixed point is a NAMED IDENTIFICATION (ladder/candidate grade) — I do NOT build
an actual RG fixed-point spectrum; "eigenvalue" is a REMOVABLE identifier, the theorem is pure arithmetic.

★ WHY NOT (c) the arc-C handoff. C1 (Σm_ν = m₀) is arc-C, downstream of B7. The seed orders B7 (the
arc-B capstone) BEFORE C1. B7 must land first; C1 is the successor's territory (the ONE forward child).

════════════════════════════════════════════════════════════════════════════
## S1 — STATE SURVEY (grep-confirmed this run, HEAD 87c023d)

BANKED (Phys/Algebra/):
- ScaleTowerNumeratorLock (N329): `criticalPhaseNumerator = azimuthalTurn·channelCount`,
  `criticalPhaseNumerator_eq = 84·cutPi`, `criticalPhaseNumerator_pos`, `rungExponent n =
  criticalPhaseNumerator/n`, `numerator_lock : rungExponent n · n = criticalPhaseNumerator` (n≠0),
  `rungExponent_at_imO = 12·cutPi` (n=7), `rungExponent_at_spaceSub = 28·cutPi/3` (n=9),
  `rungExponent_at_selfAdj = 3·cutPi` (n=28), `numerator_triple_lock`.
- finrank: `finrank_ImO = 7` (DerivationRep7), `finrank_spaceSub = 9` (SpacetimeSignature),
  `finrank_selfAdj_eq_28 = 28`.
- ScaleTowerLadder (N332): `ewClosureRatio = cutExp(−rungExponent(finrank spaceSub))`, `_eq =
  cutExp(−(28·cutPi/3))`, `_pos`, `_lt_one`.
- NewtonScaleProduct (N330): `planckClosureRatio = cutExp(−rungExponent(finrank selfAdj))`, `_eq =
  cutExp(−(3·cutPi))`, `newtonScaleProduct = planckClosureRatio·planckClosureRatio`,
  `newtonScaleProduct_born_square = planckClosureRatio^2`, `_eq = cutExp(−(6·cutPi))`.
- PlanckMassRatio (N331): `planckMassRatio = cutExp(rungExponent(finrank selfAdj))`, `_eq =
  cutExp(3·cutPi)`.
- SeesawScale (N333): `seesawRatio = ewClosureRatio·ewClosureRatio`, `seesawRatio_born_square =
  ewClosureRatio^2`, `_eq = cutExp(−(56·cutPi/3))`.
- ContinuumExp (N174): `cutExp_add (a b) : cutExp a · cutExp b = cutExp (a+b)`, `cutExp_zero`,
  `cutExp_pos`, `cutExp_mul_neg`. ContinuumLog: `cutExp_strictMono`. `cutPi`, `cutPi_pos`.

NOT banked: any n=7 ratio object; the parameterized one-object `scaleTowerRung`; `criticalEigenvalue`.

════════════════════════════════════════════════════════════════════════════
## S2 — THE BUILD (deliverable: `Phys/Algebra/ScaleTowerOneObject.lean`)

PART (1) — THE TOWER AS ONE OBJECT:
- `scaleTowerRung (n : ℕ) (m : ℤ) : Cut := cutExp ((m : Cut) * rungExponent n)`
- `scaleTowerRung_exponent_lock : (n:Cut) ≠ 0 → ((m:Cut)*rungExponent n)*n = (m:Cut)*criticalPhaseNumerator`
    (the numerator lock lifted: every rung's log × its count = m·(ONE budget))
- `scaleTowerRung_mul_same : scaleTowerRung n m₁ * scaleTowerRung n m₂ = scaleTowerRung n (m₁+m₂)`
    (the homomorphism / tower closure via cutExp_add)
- `scaleTowerRung_sq : (scaleTowerRung n m)^2 = scaleTowerRung n (2*m)`  (Born square = m-doubling)
- INSTANCES (each banked ratio IS the one object):
    `ewClosureRatio_as_rung : ewClosureRatio = scaleTowerRung 9 (-1)`
    `planckClosureRatio_as_rung : planckClosureRatio = scaleTowerRung 28 (-1)`
    `planckMassRatio_as_rung : planckMassRatio = scaleTowerRung 28 1`
    `seesawRatio_as_rung : seesawRatio = scaleTowerRung 9 (-2)`   (via born_square + scaleTowerRung_sq)
    `newtonScaleProduct_as_rung : newtonScaleProduct = scaleTowerRung 28 (-2)` (via born_square + sq)
- THE QCD RUNG completing {7,9,28}:
    `qcdClosureRatio : Cut := scaleTowerRung 7 (-1)`
    `qcdClosureRatio_eq : qcdClosureRatio = cutExp(−(12·cutPi))`  (via rungExponent 7 = 12·cutPi)
    `qcdClosureRatio_pos`, `qcdClosureRatio_lt_one`
- `rungExponent_at_7 : rungExponent 7 = 12·cutPi` (fresh from criticalPhaseNumerator_eq, or via finrank_ImO)

PART (2) — THE EIGENVALUE READING:
- `criticalEigenvalue (n : ℕ) : Cut := -(n : Cut) / criticalPhaseNumerator`
- `criticalEigenvalue_eq : criticalEigenvalue n = -(n:Cut)/(84·cutPi)`  (via criticalPhaseNumerator_eq)
- `criticalEigenvalue_mul_rungExponent : (n:Cut) ≠ 0 → criticalEigenvalue n * rungExponent n = -1`
- `criticalPhaseNumerator_mul_eigenvalue : criticalPhaseNumerator * criticalEigenvalue n = -(n:Cut)`
- `criticalEigenvalue_eq_neg_inv_rung : (n:Cut) ≠ 0 → criticalEigenvalue n = -(rungExponent n)⁻¹`
- three values: `criticalEigenvalue_at_7/9/28` = −1/(12·cutPi), −3/(28·cutPi), −1/(3·cutPi)

CAPSTONE:
- `scale_tower_one_object` (★★★): the five instances + qcd completion + exponent lock + eigenvalue lock,
  all as one conjunction — the tower is ONE object with {7,9,28} the only structural freedom.

NON-VACUITY (W8, C359): a WRONG multiplicity / wrong eigenvalue must fail a costume. Cert: the QCD-rung
exponent numerator `12` (= 84/7) is load-bearing; bogus `min 359 (12) = 359` reduces to `12 = 359`.

All tactics cheap (unfold/rw/ring/field_simp/push_cast/cutExp_add/cutExp_strictMono) on banked objects —
no W9 compile-cost risk. Probe `workbench/N334/probe1.lean` must COMPILE CLEAN before production.

════════════════════════════════════════════════════════════════════════════
## S3 — ANTI-BULLSHIT GATE (crux) — held brutally honest

NAME-THE-TEMPTATION, each handled:
  (a) DECORATIVE REPACKAGING (conjunct the banked rungs, call it "one object") → REJECTED. The genuine
      B7 exhibits a SINGLE parameterized object `scaleTowerRung(n,m) = cutExp(m·rungExponent n)` and
      PROVES each banked ratio equal to it at a specific (n,m), with {7,9,28} and m the ONLY freedom.
      The exponent-lock `(m·rungExponent n)·n = m·criticalPhaseNumerator` shows every rung's log is m/n
      of the ONE 84π budget — not a conjunction, a genuine single object with the rungs as instances.
  (b) POSIT the eigenvalue `−n/(84π)` as a literal → NOT done. `criticalEigenvalue` is built on the
      BANKED `criticalPhaseNumerator`; the `−n/(84·cutPi)` form is a THEOREM via criticalPhaseNumerator_eq.
  (c) CLAIM an actual RG fixed-point spectrum → NOT done. I bank the NUMBER λ_n = −n/K and its exact
      reciprocal identity λ·rung = −1 (clean arithmetic). The physical reading "{7,9,28} are the
      relevant-direction eigenvalues of the ONE critical fixed point" is a NAMED IDENTIFICATION
      (ladder/candidate grade), prose-only; "eigenvalue" is a REMOVABLE identifier.
  (d) FISH {7,9,28,42} arithmetic against measured hierarchies → NOT done. Every rung falls out of the
      banked numerator ÷ the banked structural count; the QCD rung from rungExponent_at_imO. No decimal.
  (e) import Real.exp/Real.pi → UNEARNED-IMPORT, NOT done; banked cutExp/cutPi throughout.
  (f) introduce qcdClosureRatio as a new dimensionful Cut atom → NOT done. It is a DIMENSIONLESS ratio
      (cutExp of a banked rung exponent), the k=−1 instance at n=7. G is the single anchor (G3).

WORDS-REMOVABLE (G5): delete "scale/tower/QCD/EW/Planck/gravity/neutrino/hierarchy/eigenvalue/rung/
fixed-point". What survives: `scaleTowerRung n m = cutExp((m:Cut)·(criticalPhaseNumerator/n))`; the
identity `(m·(K/n))·n = m·K` (n≠0); `cutExp(m₁·r)·cutExp(m₂·r) = cutExp((m₁+m₂)·r)`; `(cutExp(m·r))^2 =
cutExp((2m)·r)`; every banked ratio equals this at a specific (n,m); `(−n/K)·(K/n) = −1`; `K·(−n/K) =
−n`. Pure real analysis on the banked `cutExp`/`cutPi`/`criticalPhaseNumerator`/`rungExponent`/the banked
ratios. NO name is load-bearing.

FREE-FLOATING check: every theorem TYPE mentions the banked `Cut`/`cutExp`/`cutPi`/`criticalPhaseNumerator`/
`rungExponent`/`ewClosureRatio`/`planckClosureRatio`/`planckMassRatio`/`seesawRatio`/`newtonScaleProduct`/
`finrank`. Grounded on the banked tower, not generic. PASSES.

HONEST GRADE (mandatory flags — DO NOT over-claim):
  • IDENTITY-grade (forced, banked-grounded): the parameterized object `scaleTowerRung`, the
    exponent-lock, the homomorphism, the m-doubling square, every banked ratio as an instance at (n,m),
    the QCD rung `cutExp(−12·cutPi)`, and the eigenvalue reciprocal identity `λ_n·rung = −1`. All pure
    arithmetic on banked objects. Nothing fished.
  • LADDER-grade NAMED-IDENTIFICATION (prose-only, NEVER in a theorem): (i) WHICH face takes WHICH count
    (n=7 QCD / n=9 EW / n=28 gravity), inherited N329; (ii) the whole tower carries the PERMANENT
    INCEPTION CAP — deviations {+0.013,+0.046,+0.092,+0.060} dex, a ~few-% ladder, NOT theorem-exact;
    (iii) the {7,9,28}-as-fixed-point-eigenvalues reading is the DEEPEST structural identity but still a
    NAMED IDENTIFICATION in its physical claim (no RG spectrum is built).
  Per the seed + SOUL, grinding for a cleaner forced identity for the tower is chasing a phantom; the
  ladder-grammar one-object structure + the eigenvalue reciprocal IS the authorized B7 landing.

NOT a runway / not a new axiom: no empirical scale appears; every object is a banked-object arithmetic
combination. BUILD node (production Lean banked), landing B7.

════════════════════════════════════════════════════════════════════════════
## DECISION — BUILD: bank `Phys/Algebra/ScaleTowerOneObject.lean` — the scale tower as ONE object
##   `scaleTowerRung(n,m) = cutExp(m·rungExponent n)` with {7,9,28} and m the only freedom; every banked
##   ratio proven an instance; the QCD rung completing the triple; the Born square = m-doubling; and the
##   eigenvalue reading λ_n = −n/(84π) with λ·rung = −1. LADDER-grade + inception cap flagged prose-only.

ONE-SUCCESSOR RAIL: exactly one directed successor — a C1 arc-C node (Σm_ν = m₀, per seed order
B7→C1→…→C4). Pre-complete fork check (kanban_list, non-terminal successors = exactly 1 on the tail).
