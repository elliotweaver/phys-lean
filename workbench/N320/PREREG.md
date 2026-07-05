# N320 PREREG — SEEDED GAUGE ROUTE B1: dimensional transmutation `v = M·exp(−c/g²)` (STRUCTURAL FORM)

## S1 — ARC SYNTHESIS (fresh worker; I am NOT the N319 worker)

- **Where the chain stands.** ARC A of SEED 2 (the gauge couplings) is COMPLETE (A1→A7, banked
  N314–N319). A1 the octonion 3-form ‖φ‖²=42; A2 the channel tower n(n−1); A3 ★ Born-isometry
  completeness 42·α=1; A4 α*=1/42 (the banked `alphaStar := couplingWeight`); A5/A6 the chiral
  traces → 5/3 → sin²θ_W=3/8; A7 the one-coupling coherence / iso-stiffness.
- **Where B1 sits.** B1 OPENS ARC B — THE SCALE TOWER, where DIMENSIONFUL SCALES enter (and at B3,
  GRAVITY). B1 seed text (verbatim): "dimensional transmutation `v = M·exp(−c/g²)`. Derive the
  electroweak scale as an exponentially-suppressed ratio of the closure scale, the same mechanism
  as Λ_QCD, using the banked derived-ℝ `exp` (`cutExp`). *(Uses the Arc-A coupling. Structural
  form first.)*"
- **SCOPE (from the ticket, sharp).** STRUCTURAL FORM FIRST. B1 banks the FORM
  `v/M = cutExp(−c/g²)` (equivalently `v = M·cutExp(−c/g²)`) with `c` a *parameter* (NOT its
  value — B2's coefficient `c` is the ★ BRIDGE, a LATER node), and the structural consequences
  that FOLLOW from the form: exponential suppression `v/M ∈ (0,1)` for `c,g²>0`, `v < M`,
  monotonicity of the ratio in `c` and in `g²`, the ratio a function of the single coupling.
- **Theory-native reading (what the theory SAYS here, before the standard move).** The closure
  scale `M` is the single dimensionful anchor (the octonion-rung closure). The Arc-A coupling `g²`
  (the banked uniform Born self-overlap weight, `alphaStar`/`couplingWeight` = 1/42, one weight on
  every channel) sits in an EXPONENT `−c/g²`: the derived-ℝ exponential `cutExp` is the trunk's
  OWN Born-positive homomorphism (`cutExp x = (cutExp(x/2))²`, strictly positive because it is a
  self-overlap square — literally Born=self-overlap on the continuum). So the suppression factor
  `cutExp(−c/g²)` is a self-overlap number in `(0,1)`: the closure scale is suppressed by a
  positive-definite Born factor of the inverse coupling. THIS is why the form is forced and not
  an ansatz — the exponential is the derived-ℝ's own Born square, the suppression `<1` is
  `cutExp` of a negative argument (`cutExp_le_one_of_nonpos`), the positivity `>0` is
  `cutExp_pos` = the self-overlap positivity of the continuum. The "same mechanism as Λ_QCD" is
  removable prose; the MATH is: a Born-positive exp of a negative multiple of the inverse coupling.

## THE PLAN (magnitude theorem, on the BANKED objects)

Ground field: the DERIVED ℝ `ContinuumQ.Cut` (NOT Mathlib-ℝ). The exp is the BANKED `cutExp`.
Module: `Phys/Algebra/DimensionalTransmutation.lean`, namespace `Phys.Algebra`.

- `transmutationRatio (c g2 : Cut) : Cut := cutExp (−(c / g2))` — the dimensionless suppression
  factor `v/M = exp(−c/g²)`, built on the banked derived-ℝ `cutExp`.
- `transmutationScale (M c g2 : Cut) : Cut := M * transmutationRatio c g2` — `v = M·exp(−c/g²)`.
- **The structural landings (all from banked `cutExp` lemmas, W2):**
  - `transmutationRatio_pos` : `0 < transmutationRatio c g2` (banked `cutExp_pos`) — Born
    positivity of the suppression factor; the ratio is a genuine self-overlap number.
  - `transmutationRatio_le_one` : for `0 ≤ c`, `0 < g2` ⟹ `transmutationRatio c g2 ≤ 1`
    (banked `cutExp_le_one_of_nonpos`, since `−(c/g2) ≤ 0`).
  - `transmutationRatio_lt_one` : for `0 < c`, `0 < g2` ⟹ `transmutationRatio c g2 < 1`
    (STRICT suppression — `cutExp_strictMono` vs `cutExp_zero`: `−(c/g2) < 0` ⟹
    `cutExp(−(c/g2)) < cutExp 0 = 1`). ★ this is the genuine exponential-suppression content.
  - `transmutationScale_lt_M` : for `0 < c`, `0 < g2`, `0 < M` ⟹ `transmutationScale M c g2 < M`
    (`v < M` — the electroweak scale strictly below the closure scale).
  - `transmutationScale_pos` : `0 < M` ⟹ `0 < transmutationScale M c g2` (positive scale).
  - `transmutationRatio_mono_c` : the ratio is STRICTLY DECREASING in `c` (larger `c` ⟹ more
    suppression) — `c1 < c2`, `0 < g2` ⟹ `transmutationRatio c2 g2 < transmutationRatio c1 g2`
    (`cutExp_strictMono` on `−(c2/g2) < −(c1/g2)`).
  - `transmutationRatio_mono_g2` : the ratio is STRICTLY INCREASING in `g²` (weaker suppression
    at larger coupling) — for `0 < c`, `0 < g1 < g2` ⟹
    `transmutationRatio c g1 < transmutationRatio c g2` (`−(c/g2) < −(c/g1)` since `c/g1 > c/g2`).
  - `transmutationRatio_eq_scale_div` : `transmutationScale M c g2 / M = transmutationRatio c g2`
    for `M ≠ 0` (the ratio IS `v/M`) — grounds the "dimensionless ratio" reading (G3).
  - `transmutation_form` : the capstone conjunction (the FORM + the suppression + positivity +
    monotonicity), stated on the banked `cutExp`.
  - **The coupling instance (NOT free-floating):** `transmutationRatio_at_alphaStar` — the ratio
    at the BANKED Arc-A coupling `g² = alphaStar` cast into `Cut`, i.e.
    `transmutationRatio c ((alphaStar : ℚ) : Cut)` with `alphaStar > 0` (banked
    `alphaStar_ne_zero`/`alphaStar_eq`), showing the suppression holds at the derived coupling.
    This is what ties the TYPE to the banked object (FREE-FLOATING RAIL).

## W8 NON-VACUITY (a WRONG form fails)

- `transmutationRatio_wrong_no_suppression_ne` : the ratio is NOT ≥ M-inflating — a claim that
  `transmutationRatio c g2 = cutExp (c / g2)` (WRONG SIGN — inflation not suppression) would give
  `> 1` for `c,g2 > 0`, contradicting `transmutationRatio_lt_one`. (Structural: `cutExp(+) > 1`.)
- Costume **C349** (next after C348): a ℕ-certificate that BITES on a wrong reading. The honest
  certificate here is qualitative (suppression `<1`, not a specific value — `c` is a parameter),
  so the costume anchors a boolean/ordering fact cleared to a false ℕ numeral. Concretely: encode
  "the ratio is suppressed (`< 1`)" as a certificate `susp := 1` and a bogus "no suppression"
  claim `min 349 susp = 349` that reduces to `1 = 349`. The TRUE side is tied to
  `transmutationRatio_lt_one` at a concrete positive `c, g2` witnessing genuine suppression, so a
  wrong (no-suppression / wrong-sign) reading cannot produce the `1`.

## ANTI-BULLSHIT GATE (the DERIVATION, honestly)

- **Trace fold→node.** fold → derived ℚ (RationalTower) → derived ℝ `Cut` (completion of the
  gather of closures) → banked `cutExp` (the Born-positive self-overlap exp, N174) + its order
  lemmas (N175 ContinuumLog: `cutExp_strictMono`, `cutExp_le_one_of_nonpos`, `cutExp_pos`,
  `cutExp_zero`) → the Arc-A coupling `alphaStar = 1/42` (banked). B1 = the exp of a negative
  multiple of the inverse coupling on the banked derived ℝ. Every arrow forced; nothing posited.
- **Name the standard version + what the theory DOES.** Standard QFT: dimensional transmutation
  `v = M·exp(−c/g²)` is derived by integrating the one-loop RG equation `μ dg/dμ = −b g³` — the
  scale emerges from the running coupling hitting a Landau-like pole. THE THEORY does NOT run a
  loop integral: the exponential is the derived-ℝ's OWN Born square (`cutExp x = (cutExp(x/2))²`),
  and the suppression is `cutExp` of a negative argument. The FORM is banked as a fact about the
  trunk's continuum, not lifted from a perturbative calculation. (The COEFFICIENT `c` — where the
  β-function integers {28,9,4π} would enter — is deferred to B2, honestly not smuggled here.)
- **Delete the physics words.** Delete "transmutation/electroweak/scale/coupling/closure/QCD":
  the theorems become pure statements about `cutExp(−(c/g2))` over the derived ℝ `Cut` — it is in
  `(0,1)` for `c,g2 > 0`, strictly below 1, `M·(that) < M`, monotone decreasing in `c`, monotone
  increasing in `g2`. All properties survive as pure real analysis on the banked `cutExp`. NO name
  is load-bearing. ✓
- **Name the temptation + show genuinely different / re-derived.**
  - TEMPTATION (a): assert `c`'s value (e.g. `c = 28/(9·something)` or any β-function combination)
    to make `v/M` a specific number. REJECTED — that is B2's ★ BRIDGE, a LATER node; asserting it
    here is the hidden-bridge failure. B1 keeps `c` a *parameter*.
  - TEMPTATION (b): import Mathlib-ℝ / `Real.exp` because it is the "obvious" exp. REJECTED —
    UNEARNED-IMPORT: the derived ℝ + `cutExp` are BANKED; using Mathlib-ℝ as content is the hidden
    second axiom = the predecessor's death. USE the banked `cutExp` (W2). ✓
  - TEMPTATION (c): state a generic real-analysis lemma about `exp` over an arbitrary ordered
    field (free-floating). REJECTED — the FREE-FLOATING RAIL: the production TYPEs must cite the
    banked `cutExp`/`Cut` and the banked `alphaStar` for the coupling instance. The capstone +
    `transmutationRatio_at_alphaStar` anchor to the banked objects. ✓
  - Is a truly-different result surviving? YES: the content is "on the trunk's OWN continuum, the
    Born-positive exp of `−c/g²` (the banked coupling in the exponent) is a suppression factor in
    (0,1)" — a fact ABOUT the banked derived ℝ and the banked coupling, not a generic exp fact.
- **G-guards.** G1 no asserted value (`c` a parameter; the ratio is DEFINED and its properties
  COMPUTED from banked lemmas). G2 no empirical number (v≈246 GeV / Λ_QCD prose/costume only —
  none in any statement/proof). G3 SCALES vs RATIOS (`v/M` is the dimensionless ratio; `M` the
  single anchor via `transmutationScale M c g2`). G4 the ★ BRIDGE (`c`) is a LATER node, not
  smuggled. G5 words-removable ✓. G6 foundations-only, ground field derived ℝ. G7 ONE LAW (the
  form did not fight — the banked `cutExp` order lemmas close it directly).

## W9 MEASURE-FIRST + COST

The derived ℝ `cutExp` is `noncomputable` (tsum), so proofs go through banked order lemmas, NOT
`decide`/`norm_num` on `cutExp` values. Cost budget: each landing is a few banked-lemma
applications + `linarith`/`div` positivity. KILL: if any single obligation needs an unbounded
`cutExp` computation, STOP — reframe through the banked order lemmas (they exist). Probe1 confirms
the banked lemmas do exactly what the plan needs BEFORE production.
