# N348 — arc-E E1c: CURVATURE = the look-back transport's NON-CLOSURE (the transports failing to commute)

## SELECT (fresh worker, theory-native FIRST — QUIET DRIFT guard, S1–S4)
DIRECTED successor of N347 (E1b, the connection = look-back transport `Γ = ½·η·k`, with
metric-compatibility `Γᵀη + ηΓ = k` derived EXACTLY from `η²=1`). E1c builds the NEXT and final
forced object of the E1 diff-geo machinery: the CURVATURE.

**Theory-native question asked FIRST:** what does the theory say curvature IS, and what is its ONE
forced fact? Answer: curvature is NOT a posited tensor. The connection is the fold's LOOK-BACK
TRANSPORT (N347); curvature is what happens when you carry the transport around a LOOP and DO NOT
return where you started — **the transport fails to commute.** This is the fold's self-blindness at
the connection level: the SAME non-closure that appeared at the metric level as N346's residual
`(hη)²` (the self-overlap failing to undo), now at the transport level as the commutator of two
transports `[Γ₁, Γ₂] ≠ 0`.

Deep theory-native point (the heart): EACH individual transport is metric-compatible — it PRESERVES
the Born self-overlap (N347 `metricCompat`). Yet their COMMUTATOR need not vanish. The curvature is
the residual non-closure that survives even when every single transport preserves the self-overlap.
That is precisely the fold's self-blindness: locally the look-back undoes itself (flat, compatible),
globally-around-a-loop it does not (curved).

## The two candidate first-beats (ticket) — pick by the theory
- (a) the **COMMUTATOR / non-closure** of the banked transport `lbConn` at the OPERATOR level
  (curvature as `[Γ,Γ']`-type obstruction, EXACT, no new derivative). This is the algebraic (A∧A /
  field-strength commutator) part of the linearized curvature `F = dΓ + Γ∧Γ`.
- (b) the **DERIVATIVE-level** linearized Riemann `R ~ ∂Γ − ∂Γ` (the `dΓ` part), which needs the
  multivariate directional-derivative machinery producing `k = ∂h` on the derived-ℝ tangent
  structure — a heavier W1 build (banked `cut_powerseries_deriv` N41g / `...Deriv2` N182 are
  SCALAR-only; a genuine multivariate operator derivative on `Cut` is NOT banked).

**CHOICE: (a).** It is the theory-native HEART (curvature = the transport not commuting = the fold's
self-blindness at the connection level), is EXACT and W9-light (pure algebra on the banked objects,
reuses `eta_mul_self`/`lbConn`), and its TYPES all mention the banked `MetricEnd = Module.End Cut
STVC`. The derivative-carrying `dΓ` part (b) is honestly childed to E1c-deriv (E2 is reachable from
weak-field; per SEED_GR §E1 weak-field is sufficient). This is the standard `F = dΓ + Γ∧Γ`
decomposition — I build the `Γ∧Γ` (commutator) part exactly and child the `dΓ` part.

## Target (the SMALLEST forced first beat, W3-decomposed)
Over `MetricEnd = Module.End Cut STVC` (the banked N346/N347 carrier, derived-ℝ):
- `lbCurv k₁ k₂ := lbConn k₁ * lbConn k₂ − lbConn k₂ * lbConn k₁` — the CURVATURE obstruction =
  the two look-back transports failing to commute (`[Γ₁, Γ₂]`).
- `lbCurv_eq` : the explicit closed form `lbCurv k₁ k₂ = ¼ • (η·k₁·η·k₂ − η·k₂·η·k₁)`
  `= ¼ • (η · (k₁·η·k₂ − k₂·η·k₁))` — curvature = `η` times the `η`-twisted commutator of variations.
- ★ `lbCurv_antisymm` : `lbCurv k₁ k₂ = − lbCurv k₂ k₁` — LOOP ORIENTATION (curvature is a 2-form;
  reversing the loop reverses the sign). The forced antisymmetric structure.
- `lbCurv_self` : `lbCurv k k = 0` — a degenerate loop (one direction) encloses no area, no curvature.
- `lbCurv_flat_left/right` : `lbCurv 0 k = 0`, `lbCurv k 0 = 0` — no variation ⟹ no transport ⟹
  no curvature (flat spacetime).
- `lbCurv_add_left/right`, `lbCurv_smul_left/right` : BILINEARITY (curvature is a bilinear 2-form in
  the metric variations).
- `lbCurv_parallel` : `lbCurv k (c • k) = 0` — parallel/proportional variations give no curvature
  (the 2-form is degenerate on parallel directions).
- ★★ W8 NON-VACUITY `lbCurv_ne_zero` : for the concrete pair `(timeProj, offDiagVar)` the curvature
  is NONZERO — spacetime CAN be curved; the fold's non-closure is genuine, not vacuous. (Compute:
  `lbCurv timeProj offDiagVar` applied to `(0,1,0)` has first component `¼ ≠ 0`.)
  Requires a second concrete variation `offDiagVar : (t,x,v) ↦ (x,0,0)` (an off-diagonal/shear
  variation, defined analogously to the banked `timeProj`).
- Deep theory-native theorem (if W9-light): each transport is metric-compatible, yet the curvature
  (their commutator) is a nonzero obstruction — the residual non-closure surviving local compatibility.

## Anti-bullshit gate (ANTI-BULLSHIT LAW, run in writing)
STANDARD version: the Riemann curvature tensor `R^ρ_σμν = ∂_μ Γ^ρ_νσ − ∂_ν Γ^ρ_μσ + Γ^ρ_μλ Γ^λ_νσ −
Γ^ρ_νλ Γ^λ_μσ`, built from Christoffel derivatives AND commutators, posited as the object whose
non-vanishing means curved spacetime; Ricci = a trace, scalar = a further trace.
What the theory DOES to it: (1) grounds `Γ` in the banked look-back transport `lbConn` (N347), not a
posited connection; (2) reads curvature as the NON-CLOSURE obstruction the fold's self-blindness
FORCES — the transports failing to commute — the SAME self-blindness that gave N346's residual
`(hη)²`, NOT a posited tensor (G4); (3) builds the `Γ∧Γ` (commutator) part EXACTLY on the banked
carrier and honestly childs the `dΓ` (derivative) part. Words-removable: delete "curvature / Riemann
/ Ricci / gravity / spacetime / loop" — a pure statement that for the involution `η` (`η²=1`) over
the derived field `Cut`, the endomorphisms `Γᵢ = ½ηkᵢ` have commutator `[Γ₁,Γ₂] = ¼η(k₁ηk₂−k₂ηk₁)`,
antisymmetric in `(k₁,k₂)`, vanishing when `k₁=0` or `k₂=k₁`, nonzero for the concrete pair; pure
noncommutative-ring algebra with a scalar `¼`. NOT free-floating: every TYPE mentions the banked
`MetricEnd = Module.End Cut STVC`, the banked `sigOpC` (η), and the banked `lbConn`.

Temptations REJECTED:
- (a) import Mathlib's Riemannian-manifold / `Manifold`/tensor-curvature API and state curvature
  generically → FREE-FLOATING + UNEARNED-IMPORT, REJECTED. Built on the banked `lbConn`/`sigOpC`;
  `Module.End`/`•`/`noncomm_ring` are MACHINERY on the DERIVED carrier only.
- (b) build the full derivative-carrying Riemann `∂Γ−∂Γ + [Γ,Γ]` now → the `∂Γ` part needs the
  multivariate operator-field derivative on the derived-ℝ tangent structure (banked derivatives are
  SCALAR-only) → W3-CHILDED honestly to E1c-deriv. The `[Γ,Γ]` (commutator, A∧A) part is the
  smallest EXACT forced first beat and is correct + sufficient (weak-field reaches E2/E3, SEED_GR §E1).
- (c) compute the Ricci/scalar trace now → needs the finite-free-basis/finrank of `STVC = Cut × Cut ×
  O Cut` (the O Cut part is 8-dim over Cut) → CHILDED honestly. The commutator obstruction is the
  first beat; the trace contractions are the next.
- (d) claim curvature = `(hη)²` (the N346 residual) as an EXACT identity → NOT exact (metric-level
  vs connection-level manifestations of the same self-blindness); the STRUCTURAL analogy is stated in
  prose only, no false theorem.

GENUINELY DIFFERENT from textbook GR: textbook POSITS the Riemann tensor and checks its non-vanishing;
here curvature IS the commutator of the look-back transports — the fold's self-blindness at the
connection level — and its non-vacuity (spacetime CAN be curved) is a THEOREM on the banked objects,
not an assumption. The "each transport is metric-compatible yet their commutator ≠ 0" reading is the
theory-native heart the textbook does not articulate.

MACHINERY node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the ALGEBRAIC
(commutator / `Γ∧Γ`) part of the curvature; the derivative (`dΓ`) part and the Ricci/scalar traces
are childed. Flagged in the docstring.

## Guards
G1 no value asserted (machinery). G2 no empirical number. G3 no scale (dimensionless/algebraic).
G4 curvature IS the transport's non-closure (commutator of banked `lbConn`), NOT a posited tensor;
non-vacuity PROVED. G5 words-removable (delete curvature/Riemann/gravity/loop → pure ring algebra
about commutators of `½ηk` endomorphisms over the derived `Cut`). G6 foundations-only ⊆
{propext,Classical.choice,Quot.sound}, no sorry/axiom/native-decide/maxHeartbeats-raise. ℝ-VIGILANCE:
built on banked derived-ℝ `Cut` + banked `sigOpC`/`lbConn`; `Module.End`/`LinearMap`/`noncomm_ring`
are Mathlib MACHINERY on derived objects (fine); NO Mathlib Real/manifolds/deriv as content. W8
non-vacuity C373 (a wrong curvature reading — e.g. "curvature always vanishes" — fails). W9 LIGHT
(dimension-free ring algebra + η²=1; probes close fast).

## ONE SUCCESSOR (RAIL): DIRECTED child toward E1c-deriv (the derivative-level Riemann `∂Γ−∂Γ`, or the
Ricci/scalar trace contraction of `lbCurv`) OR toward E2 (Einstein's equations unique, Lovelock as
literature import, applied to the curvature built here). Single tail successor; run the pre-complete
fork check (kanban_list, non-terminal successors = exactly 1).
