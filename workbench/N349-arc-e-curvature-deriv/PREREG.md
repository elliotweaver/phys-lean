# N349 — arc-E E1c-scalar: the THEORY-NATIVE curvature scalar = the Born self-overlap of the non-closure, and the fiber-trace NO-GO

## SELECT (FRESH worker, theory-native FIRST — QUIET DRIFT guard, S1–S4)

DIRECTED successor of N348 (E1c, `Phys/Algebra/SpacetimeCurvature.lean`), which banked the CURVATURE
= the two look-back transports failing to commute `lbCurv k₁ k₂ = [Γ₁,Γ₂] = ¼(ηk₁ηk₂−ηk₂ηk₁)`, its
2-form structure, non-vacuity, and the heart (`curvature_from_compatible_transports`). N348 is the
ALGEBRAIC (Γ∧Γ / commutator) part of the linearized Riemann `F = dΓ + Γ∧Γ`. Gate-fast GREEN (verified
`/tmp/n348_gate.log`: D0–D6, C373 bites 1=373, 14 decls foundations-only).

**Theory-native question asked FIRST (QUIET DRIFT):** the ticket offers (a) the derivative-level
Riemann `∂Γ−∂Γ`, or (b) "the Ricci/scalar TRACE of `lbCurv`." Before touching either, ask what the
THEORY says the scalar contraction of the non-closure IS — and MEASURE whether the standard trace even
delivers content here.

**The MEASUREMENT (probe1/probe2, both compile clean):**
1. `LinearMap.trace Cut STVC` DOES elaborate — `Module.Free`/`Module.Finite Cut STVC` are banked.
2. **`LinearMap.trace Cut STVC (lbCurv k₁ k₂) = 0` IDENTICALLY** — proved via `trace_mul_comm`
   (trace of a commutator vanishes). So the ticket's candidate (b) in its NAIVE reading — "scalar
   curvature = the endomorphism trace of the non-closure" — is FORCED TO ZERO. The standard
   scalar-by-basis-trace move is CONTENT-FREE on the commutator curvature.
3. The banked **Born self-overlap** `EvC` (N58, the trunk primitive Born = self-overlap = positivity)
   APPLIES to the curvature output vector `lbCurv k₁ k₂ p`, is `≥ 0` (`EvC_nonneg`), vanishes iff the
   curvature vector vanishes (`EvC_eq_zero_iff`, positive-definiteness), and — for the concrete pair
   `(timeProj, offDiagVar)` at `(0,1,0)` — is strictly positive (probe: the curvature vector is `≠ 0`).
4. Topology lives ONLY on `Cut` (order topology, N34); there is NO banked topology on `STVC`/`MetricEnd`
   ⟹ the operator-valued `∂Γ` limit (candidate (a)) is a genuine heavy multi-node W1 build (needs the
   operator-field directional-derivative infrastructure on the derived-ℝ tangent structure — not banked).

**THE THEORY-NATIVE REDIRECT (the QUIET-DRIFT lesson, exactly):** the standard move (contract the
curvature with a generic basis trace) gives ZERO — it is blind to the non-closure. The theory delivers
the scalar contraction MORE DIRECTLY: the fold's OWN positive form, the Born self-overlap `EvC`, is the
theory-native contraction — `bornCurv p k₁ k₂ := EvC (lbCurv k₁ k₂ p) (lbCurv k₁ k₂ p)`. It is the
positive scalar magnitude of the non-closure obstruction: `≥ 0` (Born positivity — the trunk primitive),
`= 0 ⇔ curvature vector = 0` (a FAITHFUL measure, positive-definite), orientation-INDEPENDENT (the ± of
the antisymmetric 2-form squares away — the density does not see loop orientation), quadratic in the
variation (Born self-overlap is quadratic), and — for the concrete pair — strictly POSITIVE. The fold's
positive form SEES the non-closure the endomorphism trace cannot. **This is the theory delivering the
contraction the field would reach for a basis trace to compute — the QUIET DRIFT correction in action.**

**CHOICE:** build BOTH the NO-GO (`fiberTrace_lbCurv_zero`, the diagnosis that the standard trace route
is content-free — an honest theorem, forced by loop-orientation antisymmetry at the trace level) AND the
theory-native positive scalar `bornCurv` with its full property set. EXACT, W9-light (pure algebra on the
banked objects — `lbCurv`, `EvC`, `Module.End`/`trace`; no derivative machinery, no new topology). The
derivative-carrying `dΓ` part (candidate (a)) is the genuine remaining machinery gap and is childed as a
DIRECTED route-finder (see ONE SUCCESSOR).

## Target (over `MetricEnd = Module.End Cut STVC`, the banked derived-ℝ carrier)
- `fiberTrace_lbCurv_zero (k₁ k₂) : LinearMap.trace Cut STVC (lbCurv k₁ k₂) = 0` — the naive fiber-trace
  scalar-curvature reading is FORCED TO ZERO (trace of a commutator). The standard route is content-free.
- `curvSampleVec : STVC := (0,1,0)` — the concrete witness vector.
- `bornCurv (p) (k₁ k₂) : Cut := EvC (lbCurv k₁ k₂ p) (lbCurv k₁ k₂ p)` — the theory-native scalar.
- `bornCurv_nonneg` : `0 ≤ bornCurv p k₁ k₂` — Born positivity (the trunk primitive).
- `bornCurv_self_zero` : `bornCurv p k k = 0` — degenerate loop, no density.
- `bornCurv_flat_left/right` : `bornCurv p 0 k = 0`, `bornCurv p k 0 = 0` — no variation, no density.
- `bornCurv_orient_indep` : `bornCurv p k₁ k₂ = bornCurv p k₂ k₁` — the ± loop orientation squares away.
- `bornCurv_eq_zero_iff` : `bornCurv p k₁ k₂ = 0 ↔ lbCurv k₁ k₂ p = 0` — FAITHFUL measure (pos-def).
- `bornCurv_smul_left/right` : `bornCurv p (c•k₁) k₂ = c^2 * bornCurv p k₁ k₂` — QUADRATIC in the variation.
- `bornCurv_parallel` : `bornCurv p k (c•k) = 0` — parallel variations enclose no area.
- ★★ `bornCurv_ne_zero` / `bornCurv_pos` (W8 NON-VACUITY, C374): `0 < bornCurv curvSampleVec timeProj
  offDiagVar` — the fold's Born form genuinely SEES the non-closure; spacetime's curvature has a positive
  Born measure.
- ★★★ `curvature_scalar_positive_not_trace` (THE HEART): the naive fiber trace is identically zero, YET
  the theory-native Born self-overlap scalar is strictly positive for the concrete pair — the fold's own
  positive form measures the non-closure the endomorphism trace cannot see.

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: the Ricci scalar `R = g^{μν} R_μν = g^{μν} R^λ_μλν` — a basis/metric trace of the
Riemann tensor, posited and computed by contracting indices; "scalar curvature."
What the theory DOES to it: (1) it MEASURES that the naive analogue — the endomorphism basis trace of the
banked commutator curvature — is FORCED TO ZERO (`trace_mul_comm`), i.e. the standard move is content-free
here (an honest NO-GO, not swept under the rug); (2) it identifies the theory-native scalar contraction as
the fold's OWN positive form, the Born self-overlap `EvC` (N58, the trunk primitive Born = self-overlap =
positivity), giving `bornCurv = EvC(R·p, R·p)` — a POSITIVE, orientation-independent, positive-DEFINITE
(faithful) magnitude of the non-closure, DERIVED from the banked `lbCurv`/`EvC`, not posited.
Words-removable: delete "curvature / Riemann / Ricci / scalar / gravity / loop / non-closure" — a pure
statement that over the derived field `Cut`, for endomorphisms `Γᵢ = ½ηkᵢ` with `η²=1`, the endomorphism
trace of the commutator `[Γ₁,Γ₂]` is `0`, while the banked positive-semidefinite form `EvC` evaluated on
the commutator's image vector is `≥ 0`, `= 0 ⇔ that vector = 0`, orientation-independent, quadratic in
`k`, and strictly positive for the concrete `(timeProj, offDiagVar)` at `(0,1,0)`; pure linear/ring
algebra + the banked positive-definite form. NOT free-floating: every TYPE mentions the banked
`MetricEnd = Module.End Cut STVC`, the banked `lbCurv`, the banked `EvC`/`STVC`.

Temptations REJECTED:
- (b-naive) "the Ricci/scalar = the endomorphism trace of `lbCurv`" → MEASURED to be identically ZERO
  (`trace_mul_comm`). Taking it as "the scalar curvature" would be a content-free result wearing a physics
  word — REJECTED. Instead the zero is banked HONESTLY as a NO-GO (`fiberTrace_lbCurv_zero`) that motivates
  the Born route. This is the QUIET DRIFT catch: the standard basis-trace move is blind here.
- (a) the derivative-carrying `∂Γ−∂Γ` (dΓ) part → needs the multivariate operator-field directional
  derivative on the derived-ℝ tangent structure (banked derivatives `cut_powerseries_deriv` N41g /
  `...Deriv2` N182 are SCALAR `Cut→Cut` only; NO topology on `STVC`/`MetricEnd`) → a genuine heavy W1
  build, CHILDED as a DIRECTED route-finder toward E2.
- import Mathlib Riemannian-manifold / tensor-curvature / `deriv` API and state the scalar generically →
  FREE-FLOATING + UNEARNED-IMPORT, REJECTED. `Module.End`/`LinearMap.trace`/`EvC` are MACHINERY on the
  banked DERIVED carrier; `EvC` is the DERIVED Born form, not a Mathlib inner product.
- claim `bornCurv` IS the tensorial Ricci scalar → it is NOT (that needs the dΓ-carrying Riemann and a
  tensorial index trace); `bornCurv` is a curvature-NORM invariant (⟨R·p, R·p⟩, Kretschmann-type) via the
  fold's Born form. Flagged HONESTLY in the docstring as leading-order/machinery; the tensorial Ricci is
  childed with the derivative machinery.

GENUINELY DIFFERENT from textbook GR: textbook POSITS the Ricci scalar as a metric contraction and computes
it; here the naive endomorphism-trace analogue is PROVED content-free (identically zero — the fold's
loop-orientation antisymmetry at the trace level), and the theory-native scalar is the fold's OWN Born
self-overlap of the non-closure vector — a positive, faithful magnitude the trace cannot see. The "trace is
blind, the Born form sees" contrast is the theory-native heart the textbook does not articulate.

MACHINERY node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the SCALAR MAGNITUDE of
the ALGEBRAIC (commutator) curvature via the fold's Born form (a curvature-norm invariant, NOT the tensorial
Ricci scalar); the derivative (`dΓ`) part and the tensorial Ricci contraction are childed. Flagged in docstring.

## Guards
G1 no value asserted (machinery). G2 no empirical number. G3 no scale (dimensionless/algebraic). G4 the
scalar IS the fold's Born self-overlap of the banked non-closure `lbCurv` (+ the honest trace NO-GO), NOT a
posited Ricci tensor; non-vacuity PROVED. G5 words-removable (delete curvature/Riemann/Ricci/gravity/loop →
pure trace/positive-form algebra over the derived `Cut`). G6 foundations-only ⊆ {propext,Classical.choice,
Quot.sound}, no sorry/axiom/native-decide/maxHeartbeats-raise. ℝ-VIGILANCE: built on banked derived-ℝ `Cut`
+ banked `lbCurv`/`EvC`/`sigOpC`; `Module.End`/`LinearMap.trace`/`Module.Free`/`Module.Finite` are Mathlib
MACHINERY on derived objects (fine); NO Mathlib Real/manifolds/deriv as content. W8 non-vacuity C374 (a
wrong reading — "the curvature scalar is always zero / the trace captures everything" — fails). W9 LIGHT
(pure algebra + banked positive-definiteness; probes close instantly).

## ONE SUCCESSOR (RAIL): DIRECTED route-finder child toward the operator-field directional derivative on the
derived-ℝ tangent structure — the `dΓ` part completing the linearized Riemann `F = dΓ + Γ∧Γ` (banked
`Γ∧Γ` = N348; scalar magnitude = this node), toward the tensorial Ricci and E2 (Einstein's equations unique,
Lovelock literature import). This is the genuine remaining machinery gap (deferred at N347/N348 as a heavy
W1 build; NAMED here per the repeated-deferral guidance — it is a heavy BUILD, not a posit-ceiling, so a
normal directed child, NOT a CHAIN RUNWAY). Single tail successor; run the pre-complete fork check.
