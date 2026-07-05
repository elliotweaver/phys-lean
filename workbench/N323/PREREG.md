# N323 — SEEDED ARC-D/D1 (pulled forward as the ARC-B π-prerequisite): the derived Gauss-sphere π machinery
## PREREG + route decision

FRESH worker, run 625. Task t_cd8ba796. Directed W1-DECOMPOSE child of N322 (t_f85c9ee0, the B2 ★ BRIDGE).
Duplicate-instance check: my PPID=80387 = board spawned.pid (alive), no live sibling. I am the legit worker.
State at run start: HEAD 18637d3 (N320 banked, gate-fast GREEN), tree clean but for ?? workbench/N321,N322.
workbench/N323 empty → genuine fresh start. N322/PREREG.md read IN FULL — I EXECUTE its diagnosis
(the transmutation exponent's π is the DERIVED GAUSS-SPHERE π; that machinery is grep-confirmed ABSENT
from Phys/). I do NOT re-run the c attack, do NOT re-survey. This node builds the π-machinery ONLY.

════════════════════════════════════════════════════════════════════════════
## S1 — THE TARGET (docs/SEED_ANALYTIC_COMPLETION.md D1, pulled forward)

Build `cutSin`/`cutCos` on the DERIVED ℝ `ContinuumQ.Cut` from the BANKED `cutExp` machinery, prove the
defining identities the chain needs, and construct `cutPi` structurally (a zero/period of the derived
trig). The theory-native reading (NOT decoration): (cutCos, cutSin) parametrizes the BORN-UNIT-CIRCLE
{(c,s) : c²+s²=1} in Cut² — the self-overlap-preserving rotation — and `cutPi` is the PERIOD of that
closure map (the Gauss-sphere circumference / octonion-unit return normalization). So the Pythagorean
identity cutSin²+cutCos²=1 IS load-bearing (it is the statement that the map closes on the Born circle),
and cutPi is the fundamental period of that circle-parametrization.

════════════════════════════════════════════════════════════════════════════
## S2 — STATE SURVEY (banked material; grep-confirmed)

- `Phys/Foundation/ContinuumExp.lean` (N174) is the TEMPLATE + foundation: `expTermC x n := xⁿ/n!`,
  `cutExp x := ∑' n, expTermC x n`, with `expTermC_summable`, `cutExp_zero`, the Cauchy-product
  `cutExp_add`, `cutExp_mul_neg`, `cutExp_pos`. The Cauchy product rides
  `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` (NO ℝ-valued norm — synthesizes on Cut).
- `Phys/Foundation/ContinuumSummable.lean` (N39/N40): `cut_summable_pow_div_factorial (0≤c) :
  Summable (n ↦ cⁿ/n!)` (THE majorant), `cut_summable_of_abs`, `cut_summable_of_nonneg_of_le`,
  `cut_summable_mul_of_abs`, general-index `'` variants. `cut_abs_tsum_le` (in ScalarDeriv).
- `Cut` is a complete `LinearOrderedField` (ContinuumField) + `OrderTopology`/`T2Space`/
  `IsTopologicalRing` (ContinuumTopology) + `CompleteSpace` (ContinuumComplete). All the topology the
  tsum/IVT machinery needs is banked.
- `cutExp_continuous` (ContinuumLog N175) + `cutExp_surjOn_pos` used IVT on the complete Cut — the
  IVT is available on Cut (via `intermediate_value_Icc` on `ContinuousOn`, per cutExp_surjOn_pos).
- DERIVATIVE MACHINERY (ScalarDeriv N41g / N-2): ONLY derivative-AT-0 (`cut_powerseries_deriv` recovers
  the first coefficient as a `Tendsto (𝓝[≠] 0)` limit). There is NO general HasDerivAt / MVT /
  constancy theory over Cut. ⇒ the derivative+constancy route to sin²+cos²=1 is NOT cheaply available;
  the Cauchy-product route (mirroring cutExp_add) is the trunk-native path.
- NOT BANKED (grep-confirmed): ZERO cutPi/cutSin/cutCos in Phys/. Building them is genuinely new.

════════════════════════════════════════════════════════════════════════════
## S3 — ROUTE DECISION (W9 measure-first)

TWO route options in the D1 spec: (Euler over a derived-ℂ) vs (direct alternating power series over Cut).
DERIVED-ℂ is REJECTED as the carrier for the series: a derived-ℂ = Cut×Cut has NO order, so the
order-based majorant `cut_summable_pow_div_factorial` does not apply directly; convergence would need a
Cut-valued sub-multiplicative norm + normed-ring theory over Cut = a large unbanked tower. The DIRECT
alternating power series over Cut is the cheap route: it reuses the EXACT banked summability machinery.

DIRECT-SERIES definitions:
  `cosTermC x n := (-1)^n · x^(2n)   / (2n)!`
  `sinTermC x n := (-1)^n · x^(2n+1) / (2n+1)!`
  `cutCos x := ∑' n, cosTermC x n` ;  `cutSin x := ∑' n, sinTermC x n`
SUMMABILITY: |cosTermC x n| = |x|^(2n)/(2n)! = (|x|^•/•!) ∘ (n↦2n); |sinTermC x n| = (|x|^•/•!)∘(n↦2n+1).
Both are the banked factorial majorant COMPOSED with an INJECTIVE reindex (n↦2n, n↦2n+1), so
`Summable.comp_injective` + `cut_summable_of_abs` gives summability. (Cheap — no new majorant.)

════════════════════════════════════════════════════════════════════════════
## S4 — DECOMPOSITION (this node's boundary; the seed says trig is normal multi-node shape)

THIS NODE (N323) banks the SOLID definitional layer — the analog of the first half of ContinuumExp:
  1. cosTermC, sinTermC, cutCos, cutSin (defs).
  2. summability (comp_injective on the banked majorant).
  3. base values: cutCos 0 = 1, cutSin 0 = 0.
  4. parity: cutCos(-x) = cutCos x (even), cutSin(-x) = -cutSin x (odd) — termwise, cheap.
  5. hasSum lemmas (limits pass through the tsum).
  6. a W8 non-vacuity costume (a WRONG base value / parity fails to compile).
IF the Pythagorean identity (Cauchy-product, S5) MEASURES tractable within budget, INCLUDE it here (it is
the theory-native heart). ELSE child it as the single successor.

THE SINGLE SUCCESSOR (ONE-SUCCESSOR RAIL): if Pythagorean+addition+cutPi remain → a DIRECTED
decompose-remainder child "N### — build cutSin²+cutCos²=1 (Born-unit-circle) + cutPi (period/zero)".
When ALL π-machinery is banked, ITS successor resumes B2 (derive c via cutPi). Never both, never zero.

════════════════════════════════════════════════════════════════════════════
## S5 — THE PYTHAGOREAN IDENTITY (the theory-native heart; measured route)

cutCos² + cutSin² via `tsum_mul_tsum_eq_tsum_sum_antidiagonal` (the SAME Cauchy machinery as cutExp_add).
The identity reduces (regrouping by power x^(2m)) to the combinatorial fact
`∑_{even j} C(2m,j) = ∑_{odd j} C(2m,j)` for m≥1 (i.e. `∑_j (-1)^j C(2m,j) = (1-1)^(2m) = 0`), with the
x^0 coefficient = 1. This needs a power-shift reindex (sin·sin level n → x^(2(n+1))). MEASURE its cost in
a bounded probe BEFORE committing; if the reindex is heavy (W9), child it. NEVER assert the identity.

════════════════════════════════════════════════════════════════════════════
## GUARDS (seed relaxes none)
G1 no asserted values (identities FALL OUT of the series). G2 no empirical number in any proof (π≈3.14 is
removable prose/costume ONLY; cutPi DEFINED structurally). G4 DERIVED not POSITED (built from series,
never axiomatized; cutPi CONSTRUCTED as a zero/period, never `import Real.pi`). G5 physics-words-removable
(essentially none — pure analysis; "Gauss-sphere" is removable prose). G6 foundations-only ⊆
{propext,Classical.choice,Quot.sound}, no sorry/axiom/native_decide/maxHeartbeats-raise. ⚠ CRUX
ℝ-VIGILANCE / UNEARNED-IMPORT: ground field the DERIVED ℝ Cut + banked cutExp machinery; NEVER
`import Mathlib...Real`/`Real.pi`/`Real.sin`/`Real.cos`/`Complex` as CONTENT. Mathlib = MACHINERY (Tactic,
tsum, Summable.comp_injective, order typeclasses) on the DERIVED Cut only. W8 non-vacuity: a WRONG
identity fails a costume.
