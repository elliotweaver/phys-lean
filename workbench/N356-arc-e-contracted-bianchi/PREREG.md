# N356 — arc-E E2-route: THE DIVERGENCE STRUCTURE OF GRAVITY IS THE ONE BRACKET-JACOBI — the Ricci identity [D_a,D_b]C = ⁅R(a,b),C⁆, the naive scalar divergence BLIND (self-blindness at conservation), the metric term bracket-inert, over the derived ℝ Cut.

## SELECT (FRESH worker, theory-native FIRST — QUIET-DRIFT + anti-bullshit gate + MEASURE-FIRST)

DIRECTED single successor of N355 (E2-route), which banked the (differential) BIANCHI IDENTITY as
the JACOBI IDENTITY of the look-back-transport commutator (`bianchi_jacobi`, `lbCurv_eq_bracket`,
`covTransport`). Gate-fast on N355 VERIFIED GREEN (`/tmp/n355_gate.log`: GATE-FAST PASSED, D0–D6,
C380 bites 1=380, 13 decls foundations-only). FRESH node N356 — resume-check: `ls workbench/N35*`
showed no prior N356 workbench. Derived from scratch. HEAD 7100e0f, clean tree, build green.

### The theory-native question asked FIRST (do NOT run on the ticket's framing).
The ticket toward E2 offered as the immediate beat option (a): "CONTRACT the banked differential
Bianchi (N355 `bianchi_jacobi`) — raise + trace it via the banked BvC metric-raise — to derive the
divergence-freeness ∇^μ G_μν = 0 of the banked einstein tensor." AND CRUCIALLY the ticket ITSELF
flagged the hard-won lesson: "MEASURE whether the contraction of bianchi_jacobi carries content or
is blind (recall the N349/N352 fiber-trace lesson HARD — the naive contraction may be blind and the
genuine divergence may need the soldered/metric-raise structure)."

I MEASURED FIRST (probe1, probe2, probe3, probe4, probe_nv, probe_axioms — all EXIT 0,
foundations-only). THE MEASUREMENT WAS DECISIVE AND MATCHED THE FEARED CASE:

### THE MEASUREMENT (decisive).
- **`divFiberTrace_blind`** (probe1/2/4): `trace (covTransport k C) = 0` IDENTICALLY. Because
  `covTransport k C = ⁅Γk, C⁆` is a BRACKET, and `LinearMap.trace_lie` gives `trace ⁅f,g⁆ = 0`
  (trace of a commutator, cyclicity). So the "obvious" contraction of the differential Bianchi —
  reading ∇^μ as the endomorphism FIBER trace of the covariantly-transported curvature — is
  CONTENT-FREE. **THE N349 FIBER-TRACE NO-GO RECURRING AT THE CONSERVATION LEVEL.** The whole
  differential Bianchi, fiber-traced, is a VACUOUS 0=0=0 (`bianchi_fiberTrace_vacuous`). Blind on
  every index — even soldered (probe2 M3): `trace (covTransport (Gsol X) T) = 0` too.
- **`ricci_identity`** (probe3/4): the GENUINE contentful theory-native operator identity is the
  RICCI IDENTITY: `D_a(D_b C) − D_b(D_a C) = ⁅R(a,b), C⁆`. The commutator of two covariant
  transports acting on `C` equals BRACKETING WITH THE CURVATURE. Curvature = the failure of
  covariant DERIVATIVES to commute — EXACTLY mirroring N348 (curvature = the failure of the
  TRANSPORTS to commute). Closes by `lie_lie` (= the Jacobi identity). **THE SAME JACOBI that gives
  N355's differential Bianchi gives this — the divergence structure of gravity is the ONE
  bracket-Jacobi of the derived transports.**
- **`einstein_covTransport_eq_ricci`** (probe2/4): `covTransport k (einsteinRaiseMap G) =
  covTransport k (ricciRaiseMap G)`. The ½R·id trace-reversal metric term is BRACKET-INERT
  (`⁅Γk, ½R·id⁆ = 0`, since id=1 commutes). So at the algebraic (bracket) layer the covariant
  transport of the Einstein endomorphism EQUALS that of the Ricci endomorphism — the metric term's
  contribution to conservation lives ENTIRELY in its DERIVATIVE (∇_ν R, the childed derivative
  layer). This is the STRUCTURAL reason the genuine ∇^μ G_μν = 0 needs the derivative layer, not
  the bracket layer.
- W8 NON-VACUITY (`ricciId_rhs_ne_zero`, probe_nv): `⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆
  ≠ 0` (first component at (0,1,0) is −⅛ ≠ 0). The Ricci identity is a real identity of nonzero
  curvature, not vacuous.

### CHOICE.
The ticket's option (a) as-stated (fiber-trace-contract to a scalar ∇^μ G_μν) is measured BLIND.
Rather than force the fiber-trace to be the "divergence" (it is not — it is identically 0), the
theory-native beat toward E2 is to bank the DIVERGENCE STRUCTURE the theory actually delivers:
(1) the RICCI IDENTITY (curvature = failure of covariant derivatives to commute) — the
operator-level prerequisite that makes "covariant derivatives commute up to curvature" precise, the
SAME Jacobi as the differential Bianchi; (2) the NO-GO that the naive scalar divergence is blind
(self-blindness at conservation, the N349 no-go recurring — a genuine theory-native fact, the fold's
signature); (3) the metric-term inertness pinning WHERE the genuine ∇^μ G_μν=0 content lives (the
childed derivative layer). This is a W1-step-2 style clarification: the theory tells us the naive
contraction is blind and reroutes the content to the bracket-Jacobi + the derivative layer.

Decls: `divFiberTrace_blind`, `bianchi_fiberTrace_vacuous`, `covTransport_iterate` (D_a D_b as double
bracket), ★★★ `ricci_identity`, `ricci_identity_curv` (RHS = covTransport-of-curvature form ties to
N355 covTransport_curv), `einstein_covTransport_eq_ricci`, `metric_covTransport_zero`, W8
`ricciId_rhs_ne_zero` / `divergence_structure_nonvacuous`, ★★★ `divergence_from_associativity` (THE
HEART bundled: the Ricci identity ∧ the fiber-trace no-go — the divergence structure is the ONE
bracket-Jacobi, the naive scalar divergence blind by self-blindness).

## HONEST GRADE (carry it — do NOT overclaim).
- ⚠ ALGEBRAIC / LEADING-ORDER (BRACKET) LAYER. This banks the divergence STRUCTURE at the
  commutator/bracket layer (the Γ∧Γ layer, banked N348/N355). The genuine covariant divergence
  ∇^μ G_μν = 0 as a full DERIVATIVE-level identity requires the ∇_ν R gradient term (the derivative
  layer, banked N350 HasOpDerivAt0 machinery, NOT assembled into a full ∇^μ here) — CHILDED. This
  node PROVES the metric term is bracket-inert (so ∇^μG_μν=0's metric contribution IS the derivative
  layer) and banks the bracket-Jacobi structure; it does NOT claim the assembled full ∇^μ G_μν=0.
  Flagged, NOT a scope-reduction dressed up — the honest content.
- ⚠ HIDDEN JOINT — Lovelock still CITED downstream. This node does NOT prove Einstein's equations
  unique. Lovelock's uniqueness (E2 proper) remains a LITERATURE IMPORT / HIDDEN JOINT, childed.
- MACHINERY node — asserts NO physical value. No κ, no Λ, no field equation written down.

## ANTI-BULLSHIT LAW (run in writing).
STANDARD version: the contracted Bianchi ∇^μ G_μν = 0 (contract the second Bianchi identity), making
G_μν the unique consistent source-coupling (forcing ∇^μ T_μν = 0). The textbook computes this by
raising indices and tracing the coordinate second-Bianchi. In gauge theory DF=0 by Jacobi, and the
"Ricci identity" [∇_a,∇_b]V = R(a,b)V is a standard fact.
What the theory DOES to it:
  (1) Built ENTIRELY on the banked derived-ℝ carrier: the curvature is the banked N348 commutator
      lbCurv=[Γ₁,Γ₂] of the banked N347 transport Γ=lbConn=½·η·k, tied to the Mathlib Lie bracket by
      the banked N355 lbCurv_eq_bracket; the covariant transport is the banked N355 covTransport.
      So the Ricci identity is lie_lie of the DERIVED transports — the fold's own structure.
  (2) THE THEORY-NATIVE MEASUREMENT (the moat): the theory PREDICTS and PROVES that the naive scalar
      divergence (the endomorphism fiber trace of the covariantly-transported curvature) is
      IDENTICALLY ZERO — BLIND. This is the fold's SELF-BLINDNESS (the N349 no-go: trace[Γ₁,Γ₂]=0)
      recurring at the CONSERVATION level. The textbook never asks "which contraction carries
      content"; the theory proves the naive one is blind and reroutes the divergence content to the
      bracket-Jacobi (the Ricci identity) + the derivative layer (∇_νR). ONE CAUSE (curvature is a
      commutator, operator composition is associative → Jacobi; the trace of a commutator vanishes →
      the scalar divergence is blind), the divergence structure of gravity.

Words-removable: delete "divergence / Bianchi / Ricci / curvature / transport / covariant /
connection / conservation / Einstein / gravity / spacetime": over the derived field Cut, for the
banked linear map Γ = lbConn on MetricEnd = Module.End Cut STVC and the banked commutator
lbCurv a b = ⁅Γa,Γb⁆: (i) trace ⁅Γk, C⁆ = 0 for all k,C (trace of a bracket); (ii) ⁅Γa,⁅Γb,C⁆⁆ −
⁅Γb,⁅Γa,C⁆⁆ = ⁅⁅Γa,Γb⁆, C⁆ (lie_lie); (iii) ⁅Γk, R − ½s·1⁆ = ⁅Γk, R⁆ (id is central); and the
concrete ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0. Pure Lie-ring/trace/commutator algebra
over the derived ℝ. NO theorem STATEMENT needs a physics word.

NOT free-floating: every TYPE is over MetricEnd = Module.End Cut STVC / STVC with lbConn (N347),
lbCurv (N348/N355 lbCurv_eq_bracket), covTransport (N355), einsteinRaiseMap/ricciRaiseMap (N354/N353)
the concrete banked objects; non-vacuity on the banked timeProj/offDiagVar. NOT a generic Lie-algebra
abstraction — the bracket is the banked derived transport commutator; the fiber trace no-go is the
banked derived curvature's; the metric term is the banked N354 einstein endomorphism's.

Temptations REJECTED:
- (drift-A, ticket option (a) as-stated) "fiber-trace-contract bianchi_jacobi to a scalar ∇^μ G_μν=0
  and call it the contracted Bianchi" → MEASURED BLIND (trace_lie). Would be a FALSE node — the
  fiber trace is identically 0, so claiming it "= 0 ⟹ divergence-free" is vacuous, hiding that the
  genuine content is elsewhere. REJECTED by MEASURE-FIRST (the exact N349/N352/N353 lesson the ticket
  warned about). The theory-native content is the bracket-Jacobi (Ricci identity) + the honest no-go.
- (drift-B, over-claim) "assemble the FULL derivative-level ∇^μ G_μν = 0 here" → REJECTED. That needs
  the ∇_ν R gradient (N350 derivative layer) assembled into a full covariant divergence — a heavier
  build, CHILDED. This node banks the bracket-layer structure + the metric-inertness that localizes
  the remaining content, flagged honestly.
- (drift-C, QUIET DRIFT) "prove covTransport is a full Lie module + all adjacent properties, ship" →
  the bilinearity is already banked (N355); the content here is the Ricci identity + the no-go +
  the metric inertness, each theory-native.
- (drift-D, FREE-FLOATING) "state the Ricci identity / trace-of-bracket generically over an arbitrary
  Lie ring" → REJECTED. Every TYPE over MetricEnd with banked lbConn/lbCurv/covTransport; lie_lie/
  trace_lie are Mathlib MACHINERY instantiated to the DERIVED carrier; non-vacuity on banked concretes.
- import Mathlib manifold / tensor-divergence / Real-content → UNEARNED-IMPORT + CONTENT-ℝ trap.
  REJECTED — lie_lie/trace_lie/LieRing.of_associative_ring_bracket/Module.End.one_eq_id are Mathlib
  MACHINERY on the DERIVED carrier (exactly as N355 used lie_jacobi); the objects are the banked
  derived lbConn/lbCurv/covTransport/einsteinRaiseMap.

GENUINELY DIFFERENT from textbook GR: the connection is the FOLD's look-back transport (N347), the
curvature its commutator (N348/N355), so the Ricci identity + the divergence structure descend from
the fold via the derived operator ring's ASSOCIATIVITY; and the theory PROVES the naive scalar
divergence BLIND (self-blindness at conservation) — a fact the textbook, working on a posited chart,
never states. The moat is the DERIVATION + the measured no-go, not the identities.

## Guards (SEED_GR relaxes NONE)
G1 no value asserted (machinery; −⅛ and the vanishing FALL OUT of the banked lbConn/lbCurv, never
premised). G2 no empirical number. G3 no scale (Lie-ring/trace/commutator algebra; dimensionless).
G4 the Ricci identity IS lie_lie of the banked transports, the fiber-trace no-go IS trace_lie of the
banked commutator, the metric inertness IS id-centrality — NOT posited; Lovelock (E2 proper) is a
childed HIDDEN JOINT, NOT asserted here. G5 words-removable (above). G6 foundations-only ⊆
{propext,Classical.choice,Quot.sound} (VERIFIED via probe_axioms on all 4 core theorems), no
sorry/axiom/native-decide/maxHeartbeats. ℝ-VIGILANCE: built on banked derived-ℝ Cut + banked
lbConn/lbCurv/covTransport/einsteinRaiseMap/MetricEnd; the Lie machinery (lie_lie, trace_lie,
LieRing.of_associative_ring_bracket, Module.End.one_eq_id, lie_sub) is Mathlib MACHINERY on the
derived carrier; NO Mathlib manifold/tensor-divergence/Real as content. W8 non-vacuity C381 (a
wrong-divergence / vacuous mis-reading reduces to 1=381). W9 LIGHT (full route + axioms EXIT 0 in
~30s; the heart is lie_lie/trace_lie, everything else bracket algebra + one concrete component;
NO maxHeartbeats, NO coordinate bash).

## ONE SUCCESSOR (RAIL): DIRECTED child toward E2 proper (Einstein's equations UNIQUE via Lovelock
literature import applied to the banked einstein tensor — a HIDDEN JOINT, CITED as machinery), OR a
decompose-remainder toward the DERIVATIVE-LEVEL covariant divergence ∇^μ G_μν=0 (assembling the ∇_νR
gradient via the banked N350 HasOpDerivAt0 into a full ∇^μ) if E2 needs it as the preceding beat.
Single tail successor; run the pre-complete fork check (kanban_list, non-terminal successors = 1).
