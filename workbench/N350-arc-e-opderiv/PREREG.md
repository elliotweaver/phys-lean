# N350 — arc-E E1-deriv: THE OPERATOR-FIELD DIRECTIONAL DERIVATIVE on the derived-ℝ tangent structure
# (the dΓ machinery completing F = dΓ + Γ∧Γ), and the transport-commutes-with-derivative heart.

## SELECT (FRESH worker, theory-native FIRST — QUIET DRIFT + REPEATED-DEFERRAL guard, S1–S4)

DIRECTED route-finder successor of N349 (E1c-scalar, `Phys/Algebra/SpacetimeCurvatureScalar.lean`),
which banked the curvature SCALAR (`bornCurv = EvC(R·p)(R·p)`, the fold's Born self-overlap of the
non-closure) + the fiber-trace NO-GO. N349 completed the ALGEBRAIC (Γ∧Γ / commutator + its scalar
magnitude) part of the linearized Riemann. Gate-fast GREEN (verified `/tmp/n349_gate.log`: D0–D6,
C374 bites 1=374, 15 decls foundations-only).

### The REPEATED-DEFERRAL signal — resolved by MEASUREMENT, not a fourth deferral.
The ticket says the operator directional derivative was deferred THREE times (N347/N348/N349), each
for the SAME stated reason: "the banked derivative machinery is SCALAR-only (`cut_powerseries_deriv`
N41g: `Cut → Cut`), and there is NO banked topology on STVC / MetricEnd." The SOUL's
repeated-deferral protocol says: NAME the missing structural fact, then BUILD it (or its smallest
step). So the FIRST act of this SELECT was to MEASURE whether that structural fact is genuinely
missing.

**THE MEASUREMENT (probe1–probe4, all compile clean) — the stated gap was a FALSE ALARM:**
1. `O Cut` DOES carry a full banked topological *-algebra structure: N41b `OctonionTopology.lean`
   (`ContinuousAdd`/`ContinuousMul`/`ContinuousSMul Cut`, `T2`/`T3`, `CompleteSpace`, all transferred
   from the derived ℝ `Cut`). So `STVC = Cut × Cut × O Cut` carries a product topology, and
   `ContinuousAdd STVC` / `ContinuousSMul Cut STVC` / `T2Space STVC` resolve by `inferInstance`.
2. `MetricEnd = Module.End Cut STVC` DOES carry a banked topology: N152
   `LorentzContinuumOperatorTopology.lean` defines `endOpC` — the operator topology (pointwise
   convergence) induced from `STVC → STVC` — with `endOpC_eval_continuous` and `endOpC_continuous_iff`
   (Continuous f ↔ ∀ v, per-vector continuity). The "structure Mathlib lacks" was ALREADY BUILT at N152.
3. So the operator directional derivative is NOT a heavy new-topology W1 build. It is: (a) DEFINE the
   difference-quotient `Tendsto` in `endOpC`; (b) prove the pointwise reduction (the `Tendsto` analogue
   of `endOpC_continuous_iff` — measured, compiles); (c) reduce each per-vector limit to the banked
   scalar limit / continuity over `Cut`.

**Conclusion (honest):** the three prior deferrals were correct GIVEN each worker's knowledge, but the
missing structure was banked at N152/N41b, unknown to those workers. This node does NOT defer a fourth
time — it BUILDS the operator directional derivative on the banked topology. No new axiom, no empirical
number, no posited topology.

### The theory-native question asked FIRST (QUIET DRIFT).
What does the theory say the derivative IS, and what is the FORCED next beat — not "prove properties of
a derivative because that is the obvious next step"?

The fold answer: the derivative is the **C6 eternal-approach, one level up** (exactly as N41g framed the
scalar case: "the SAME C6 eternal-approach ... make a Cut-valued power series DIFFERENTIABLE at 0"). The
transport Γ = lbConn k = ½·η·k is the look-back transport; the physical metric variation is `k = ∂_λ h`,
the directional derivative of the weak field. So the theory-native content is NOT a generic "operator
derivative" library — it is: **the look-back transport COMMUTES with the directional derivative**,
`∂_λ (Γ(h(λ))) = Γ(∂_λ h)` (`lbConn_opderiv`). This is FORCED by the SAME linearity of the transport
(`lbConn_add`/`lbConn_smul`, N347) that forced metric-compatibility — ONE CAUSE (the transport is linear
because η²=1 makes ½·η·(·) linear), TWO terminations: metric-compatibility (N347) AND the derivative
commuting through the transport (here). That is the `dΓ` part of the linearized Riemann: the
derivative-carried piece IS the transport of the second-order field variation, not a new posited object.

**CHOICE:** build the operator directional-derivative predicate `HasOpDerivAt0` on the banked `endOpC`,
its pointwise-reduction structural heart `hasOpDerivAt0_iff`, uniqueness (`opderiv_unique`, via STVC T2),
the derivative laws (`const_opderiv`, `opderiv_add`, `affine_opderiv`, `quadratic_opderiv` — the last two
are the non-vacuity + the "difference quotient sees only the linear coefficient" fact, the operator
analogue of `cut_powerseries_deriv`'s `→ a₁`), and — THE HEART — `lbConn_opderiv` (transport commutes with
derivative). All EXACT, W9-light (pointwise reduction to banked scalar continuity; probes close in seconds).

## Target (over `MetricEnd = Module.End Cut STVC`, banked `endOpC` N152 + banked `O Cut` topology N41b)
- `HasOpDerivAt0 (H : Cut → MetricEnd) (k) : Prop := Tendsto (s ↦ s⁻¹ • (H s − H 0)) (𝓝[≠] 0) (𝓝 k)`
  — the difference-quotient limit in the banked operator topology.
- `hasOpDerivAt0_iff` : `HasOpDerivAt0 H k ↔ ∀ v, Tendsto (s ↦ s⁻¹•(H s v − H 0 v)) (𝓝[≠]0) (𝓝 (k v))`
  — ★ THE STRUCTURAL HEART: the operator derivative reduces to per-vector STVC limits (the Tendsto
  analogue of the banked `endOpC_continuous_iff`).
- `opderiv_unique` : the operator derivative is unique (per-vector uniqueness via STVC `T2Space` + `LinearMap.ext`).
- `const_opderiv` : `HasOpDerivAt0 (fun _ => A) 0` — a constant field has zero derivative.
- `opderiv_add` : the derivative is additive.
- `affine_opderiv` : `HasOpDerivAt0 (fun t => A₀ + t•A₁) A₁` — the affine field's derivative is the linear coefficient (non-vacuity).
- `quadratic_opderiv` : `HasOpDerivAt0 (fun t => A₀ + t•A₁ + t²•A₂) A₁` — the quadratic term dies; the
  difference quotient sees ONLY the linear coefficient (the operator analogue of `cut_powerseries_deriv`).
- ★★★ `lbConn_opderiv` : if `HasOpDerivAt0 H k` then `HasOpDerivAt0 (fun t => lbConn (H t)) (lbConn k)`
  — THE THEORY-NATIVE HEART: the look-back transport commutes with the directional derivative,
  `∂(Γ∘h) = Γ(∂h)`. The `dΓ` piece of the linearized Riemann IS the transport of the derived field
  variation, forced by the transport's linearity (the same linearity that gave N347 metric-compatibility).
- W8 NON-VACUITY (C375): a WRONG derivative reading fails — e.g. a nonzero constant field would have to
  have a nonzero derivative (`affine_opderiv` with A₀≠0, A₁ the witness; or the quadratic term surviving).
  Concretely: `HasOpDerivAt0 (fun t => lbConn (timeProj + t • offDiagVar)) (lbConn offDiagVar)` and
  `lbConn offDiagVar ≠ 0` — the transport-derivative is a genuine nonzero object.

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: the linearized Riemann `R^ρ_σμν = ∂_μ Γ^ρ_νσ − ∂_ν Γ^ρ_μσ + Γ^ρ_μλ Γ^λ_νσ − …` — the
antisymmetrized DERIVATIVE of the Christoffel symbols (`dΓ`) plus the connection commutator (`Γ∧Γ`). The
`dΓ` part needs a DERIVATIVE of the connection along a coordinate direction.
What the theory DOES to it: (1) it builds the derivative NOT as a coordinate `∂_μ` on a posited manifold
chart, but as the trunk-native difference-quotient `Tendsto` on the banked operator topology `endOpC`
(N152) over the derived ℝ `Cut` — the C6 eternal-approach one level up (N41g's frame); (2) it identifies
the `dΓ` piece with the TRANSPORT of the second-order field variation via `lbConn_opderiv` — the transport
commutes with the derivative because the transport is LINEAR (η²=1), the SAME cause as metric-compatibility.
Words-removable: delete "connection / transport / Christoffel / Riemann / gravity / metric / spacetime" —
a pure statement that over the derived field `Cut`, for a one-parameter family `H : Cut → Module.End Cut STVC`,
the difference quotient `s⁻¹ • (H s − H 0)` converges in the pointwise-induced operator topology iff each
evaluation converges over `Cut`; that the derivative is unique and additive; that `t ↦ A₀ + t•A₁ + t²•A₂`
has difference-quotient limit `A₁`; and that the linear map `g ↦ ½·η·g` (η²=1) commutes with this limit.
Pure topology/limit algebra over the derived ℝ + the banked `endOpC`. NOT free-floating: every TYPE mentions
`MetricEnd = Module.End Cut STVC` / `STVC`, the banked `endOpC`, and (for the heart) the banked `lbConn`.

Temptations REJECTED:
- (drift-A) "build a generic operator directional-derivative library over an arbitrary
  `[TopologicalSpace V] [Module 𝕜 V]`, then instantiate later" → FREE-FLOATING trap. REJECTED: every decl
  is stated at the banked `MetricEnd`/`STVC`/`endOpC`; the heart `lbConn_opderiv` is about the BANKED
  transport, not a generic linear map. (The proofs happen to only use linearity + continuity — that is FINE,
  the TYPES are concrete.)
- (drift-B) "prove a long adjacency list of derivative properties (Leibniz product rule, chain rule,
  second derivative, ...) because that is the obvious next step" → QUIET DRIFT. REJECTED: the theory-native
  FORCED beat is the transport-commutes-with-derivative (`lbConn_opderiv`), the actual `dΓ` piece. The
  product rule etc. are NOT forced by the fold here and would be grinding library machinery. Build ONLY the
  derivative core needed to state the transport-commutation + non-vacuity.
- (defer-again) "defer the operator derivative a FOURTH time as still-too-heavy" → REJECTED by the
  MEASUREMENT: the topology is banked (N152/N41b), the pointwise reduction compiles, the heart compiles.
  Deferring again would be treating a MEASURED-light build as a wall — the exact circular-failure trap.
- import Mathlib `HasDerivAt`/`deriv`/`fderiv`/`NormedSpace` and state the derivative through an ℝ-valued
  norm → UNEARNED-IMPORT + CONTENT-ℝ trap (STANDARD §3). REJECTED: the derivative is the bare
  `Filter.Tendsto` over the banked `endOpC` / `𝓝[≠] 0` on `Cut`, EXACTLY as N41g built the scalar case with
  NO `HasDerivAt`/`NormedField`. `Module.End`/`Tendsto`/`nhds`/`induced` are Mathlib MACHINERY on the DERIVED
  carrier.
- claim this node builds the full tensorial Ricci / Einstein tensor → it does NOT. It builds the `dΓ`
  MACHINERY (the operator directional derivative + the transport-commutation). Assembling `dΓ − dΓ + Γ∧Γ`
  into the full derivative-level Riemann and contracting to the tensorial Ricci is childed. Flagged HONESTLY
  as leading-order/machinery.

GENUINELY DIFFERENT from textbook GR: textbook takes `∂_μ Γ` as a coordinate partial derivative on a
posited chart and never asks WHY the connection derivative behaves — it is bookkeeping. Here the derivative
is the fold's C6 eternal-approach on the banked operator topology, and the `dΓ` piece is PROVED to be the
transport of the field's second variation (`lbConn_opderiv`), forced by the transport's linearity — the
SAME η²=1 cause as metric-compatibility. "One cause (η²=1 makes the transport linear), two terminations
(metric-compatibility N347, derivative-commutation here)" is the theory-native heart the textbook does not
articulate.

MACHINERY node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the `dΓ` operator-
derivative machinery + the transport-commutation. The full derivative-level Riemann assembly and the
tensorial Ricci contraction are childed. Flagged in the docstring.

## Guards
G1 no value asserted (machinery). G2 no empirical number. G3 no scale (limit/topology algebra). G4 the
derivative IS the trunk-native difference-quotient Tendsto on the banked operator topology (C6 one level up),
NOT a posited coordinate partial; the transport-commutation is DERIVED from `lbConn`'s banked linearity, not
assumed. G5 words-removable (delete connection/transport/Riemann/gravity → pure limit/topology algebra over
the derived `Cut` + banked `endOpC`). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no
sorry/axiom/native-decide/maxHeartbeats-raise. ℝ-VIGILANCE: built on banked derived-ℝ `Cut` + banked `endOpC`
(N152) + banked `O Cut` topology (N41b) + banked `lbConn` (N347); `Module.End`/`Tendsto`/`nhds`/`induced`/
`continuous_apply` are Mathlib MACHINERY on derived objects (fine, exactly as N152 used them); NO Mathlib
`HasDerivAt`/`deriv`/`fderiv`/`NormedSpace`/`Real` as content. W8 non-vacuity C375 (a wrong derivative
reading — the quadratic term surviving, or a nonzero transport-derivative being zero — fails). W9 LIGHT
(pointwise reduction to banked scalar continuity; all four probes close in seconds, no coordinate bash, no
maxHeartbeats).

## ONE SUCCESSOR (RAIL): DIRECTED child toward the full derivative-level Riemann assembly `dΓ − dΓ + Γ∧Γ`
and the tensorial Ricci contraction, toward E2 (Einstein's equations unique via Lovelock literature import,
applied to the assembled curvature). The `dΓ` machinery (this node) + the banked `Γ∧Γ` (N348) + the banked
scalar magnitude (N349) are the pieces; the next beat assembles them and contracts. Single tail successor;
run the pre-complete fork check.
