# OWNER-AUTHORIZED SEED — ARC D: THE ANALYTIC COMPLETION (forced structure → ACTUAL NUMBERS)
*The third owner-authorized route seed. It succeeds the gauge→scale→cosmology seed
(`SEED_GAUGE_SCALE_COSMOLOGY.md`, arcs A/B/C). Same law: the MECHANISM and ordered targets are
given; discipline is relaxed by NOTHING. Every value is a DERIVED landing, never asserted, never
cited at grade, never fitted to data. No empirical number enters any proof — comparison to PDG is
REMOVABLE PROSE / costume only.*

**WHAT THIS ARC IS FOR.** Many results are banked as *forced structure* over ℚ but their individual
NUMERICAL values were honestly deferred because they need analytic functions of the derived ℝ that
were not yet built — most sharply `cos(2/3 rad)` for the lepton mass ratios (T6, `route-NOT-YET-found:
a forward ℝ-descent build dependency`, banked note in `OctonionJordanGenerationMassRatios.lean`). This
arc BUILDS that analytic machinery on the banked derived ℝ and then EVALUATES the already-forced
structures into actual numbers (masses in ratio, angles in the natural measure, the couplings' scale
readings). **This is not new physics — it is the analytic completion of banked structure.** Zero new
posits; the whole arc rides `ContinuumQ.Cut` + `cutExp`/`cutLog`/derivatives (all banked, N7–N14).

**GO IN WITH NO FEAR.** Every target DERIVES. The one genuine machinery build is D1 (trig on the
derived ℝ); everything after is evaluation of banked structures. When a node resists, the instrument
or framing is wrong (W5) — never the theory. Attack with the full W1 arsenal — build what's missing,
DECOMPOSE into child nodes, reframe, switch tactics, pursue relentlessly. The block/CHAIN-RUNWAY valve
is a LAST RESORT against *asserting a value*, earned only after the attack is exhausted — NEVER an
early off-ramp because a node looks hard.

---

## LAUNCH PLATFORM (banked — REUSE, do not re-derive)

- **Derived ℝ = `ContinuumQ.Cut`** with completeness, `cutExp` (exp), `cutLog` (log), derivatives
  (`ContinuumScalarDeriv`, `ContinuumDerived`), Archimedean, field structure — N7–N14, foundations-clean.
  NO Mathlib ℝ is load-bearing anywhere; keep it that way.
- **The forced FLAVOR structure over ℚ:** the mass cubic `t³−σ₁t²+σ₂t−σ₃` with `σ₁=6M²` forced
  (`OctonionJordanGenerationMassRatios.lean`, N309), the phase entering only through `e₃` with shape
  `cos(3δ_B)`, `3δ_B = 2/3 = T`; the T8 frame-overlap mixing (`OctonionJordanGenerationMixingOverlap.lean`).
- **The forced GAUGE structure:** `α* = 1/42` (`FineStructureScaleCoupling.lean`, N316), `sin²θ_W = 3/8`
  (arc A A6), the channel tower (N314).
- **The SCALE tower** (arc B): `v`, `M`, `M_Pl`, `m₀` as exp-ratios (`cutExp`).

---

> ⚠️⚠️ **HONEST GRADE — READ BEFORE ATTACKING ARC D. THE RATIO-vs-SCALE LINE IS THE WHOLE POINT.**
> This arc turns forced *structure* into *numbers*, but be precise about what is forced:
> - **What is theorem-exact / forced:** the dimensionless RATIOS and angles — the lepton mass *ratios*
>   `m_e:m_μ:m_τ` (forced by the derived Q=2/3 and δ_B=2/9), Koide, the mixing angles' structure. These
>   are genuine derived numbers once D1 trig exists.
> - **What is NOT pure-forced — the ABSOLUTE masses = ratios × scale.** An absolute mass in MeV is a
>   *ratio* (forced) × the *scale* `v`/`M` from Arc B (which is LADDER-grade with an inception flag, ~few
>   % — see the Arc B honest-grade block). So "the electron mass in MeV" inherits Arc B's ladder-grade;
>   it is NOT identity-grade. Say so. The private program still carries **2 genuine dimensionless input
>   walls** (m_b-genre and z0/m_e-genre) with internal chains — the lepton sector is *derived-conditional*
>   on those, not input-free. Do NOT claim "all masses forced from nothing"; claim "the ratios are forced;
>   the absolute scale is the G-anchored ladder."
> - **The mixing angles (D5/D6) are LEADING-ORDER (~few %), NOT theorem-exact** — the T8 caveat carries
>   through. And **V_cb specifically has a live inclusive-vs-exclusive experimental split** — any "off by
>   X%" claim is meaningless without naming the measurement; the sector is *consistent with* data, not in
>   tension. Do NOT chase the residuals to zero — that is fitting.
> - ⚠️ **HIDDEN JOINT (D2):** evaluating `cos(2/3 rad)` on the derived ℝ is a genuine *convergence*
>   build — you must prove the `cutCos` series converges and bound it to extract a numeral, not just
>   define it. That is real analysis work on `ContinuumQ.Cut` (a normal multi-node build, not a wall).
>   Decompose it; do not fake a decimal.

## THE TARGETS (in order — each a separate node, each a real theorem)

- **D1 — trig on the derived ℝ (`cutSin`, `cutCos`).** BUILD `cutSin`/`cutCos` on `ContinuumQ.Cut`
  from the banked `cutExp` (Euler route `cos x = (cutExp(ix)+cutExp(−ix))/2` on the derived-ℂ built
  over `Cut`, OR directly as the banked power series exactly as `cutExp` was constructed). Prove the
  defining identities (`sin²+cos²=1`, the derivative relations, the addition law, and the values at the
  angles the chain needs). *This is the one genuine machinery build; it is ordinary node work on the
  banked ℝ, NOT a foundational gate. DECOMPOSE freely if it wants several nodes — normal shape.*
  ✅ *NOTE: largely BANKED already — N323 (`cutSin`/`cutCos` + Pythagorean identity), N324 (addition
  formulas + boundedness), N325 (`cutPi` via IVT + periodicity) were pulled forward as the Arc-B
  π-prerequisite. Verify what's banked and build only the remainder (evaluation/convergence bounds).*
- **D2 — the actual lepton mass ratios (numbers).** Evaluate the banked T6 mass cubic at the derived
  `δ_B = 2/9` using D1's `cutCos` for `cos(3δ_B)=cos(2/3)`: derive `m_e : m_μ : m_τ` as actual real
  numbers of the derived ℝ. *The forced ratios become numbers. Comparison to PDG (0.0000583, 0.0595)
  is REMOVABLE PROSE / costume only, NEVER a proof step (G2).*
- **D3 — the coupling's scale reading.** From the banked `α* = 1/42` and the derived running structure,
  derive the numerical reading toward the low-energy `α ≈ 1/137`. *If the running needs a β-function
  build, that is a legitimate child node — build it, don't assert. The 1/137 is a comparison, prose only.*
- **D4 — the Weinberg angle number.** From the banked `sin²θ_W = 3/8` (structural/high-scale) + the
  derived running, the numerical low-scale reading toward `0.231`. *Structural 3/8 is exact; the running
  to 0.231 is the analytic reading — derive it, never fit.*
- **D5 — the CKM/PMNS mixing angles (numbers).** Evaluate the banked T8 frame overlap numerically over
  the derived ℝ (with D1 trig) → the mixing angles in the natural measure. *LEADING-ORDER per the
  flavor seed's ⚠ HONEST-STATUS caveat — landing the matrix to ~few-% with zero continuous knobs is the
  honest result; pushing residuals to zero by adding structure is FITTING (STOP if you catch it).*
- **D6 — the Jarlskog CP invariant (number).** From the banked T7 associator / T8 CP tie, evaluate the
  Jarlskog invariant `J` numerically. *Leading-order; the sign and order of magnitude are the honest
  claim.*
- **D7 — the numerical prediction table (consolidation).** Bundle D2–D6 into one derived-ℝ prediction
  object: every forced flavor+gauge observable as an actual number, each traced to the fold, with the
  PDG comparison as an explicit REMOVABLE-PROSE column (never a proof input). Hand forward ONE
  successor: a DIRECTED child toward **E1** of `docs/SEED_GR_BLACKHOLE_COSMOLOGY.md`.

---

## HARD GUARDS (identical law — these make the discipline structural)

- **G1 — NO ASSERTED VALUES.** Every number FALLS OUT of evaluating a banked forced structure with the
  derived analytic functions. Never a premise, never cited at grade, never bridged.
- **G2 — NO EMPIRICAL NUMBER IN ANY PROOF.** The PDG masses, `1/137`, `0.231`, the measured angles —
  REMOVABLE PROSE / costume only, exactly like `sin²θ_W=3/8` vs `0.231`. NEVER a proof step.
- **G3 — SCALES vs RATIOS.** D2/D5 are dimensionless (ratios/angles) — pure derived numbers. Absolute
  masses need arc B's scale `M`/`v` as the single dimensionful anchor (the choice of unit), not a fit.
- **G4 — DERIVED, NOT POSITED.** The trig (D1) is built from `cutExp`, not axiomatized. The running
  (D3/D4) is derived from the cascade β-structure, not fitted to hit the low-scale number.
- **G5 — PHYSICS-WORDS-REMOVABLE.** Delete "mass", "coupling", "angle" — the theorems stand as pure
  statements about `cutSin`/`cutCos`, the roots of a banked cubic over the derived ℝ, and ratios thereof.
- **G6 — FOUNDATIONS-ONLY.** `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No `sorry`,
  `axiom`, `native_decide`. ⚠ ℝ-VIGILANCE: use the BANKED derived ℝ + D1's derived trig — NEVER
  `import Mathlib...Real`/`Mathlib...Trigonometric` as load-bearing content. The continuum is banked;
  substituting Mathlib-ℝ/trig is the hidden-second-axiom drift.
- **G7 — ONE LAW.** If a value won't converge or you reach for a fit, you are drifting — the instrument
  is wrong, the theory is right. Reframe, build machinery, decompose, switch tactics. Block ONLY as a
  last resort against asserting, after the attack is exhausted — never early.

---

## AFTER D7 — THE NEXT COURSE IS SET

When D7 lands, the analytic-completion arc is done. The chain does NOT stop and does NOT hand a generic
SELECTION ticket. Your ONE successor is a **directed child toward E1** of
`docs/SEED_GR_BLACKHOLE_COSMOLOGY.md` (the metric/curvature machinery on the banked ℝ). Read that seed
IN FULL and queue E1 — the GR / black-hole / deep-cosmology arc. Same law, same no-fear framing.

## WHY THIS IS SAFE TO HAND YOU

The route is a MAP of which structures to build and evaluate — it contains no proof and no permission to
assert. Every number is earned by evaluating a banked forced structure with derived analytic functions,
through the identical gate. The map does not walk the path for you; it tells you the path exists.
