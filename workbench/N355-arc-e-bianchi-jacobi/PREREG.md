# N355 — arc-E E2-route: THE (differential) BIANCHI IDENTITY IS THE JACOBI IDENTITY of the look-back-transport commutator, over the derived ℝ Cut.

## SELECT (FRESH worker, theory-native FIRST — QUIET-DRIFT + anti-bullshit gate, S1–S4)

DIRECTED single successor of N354 (E1-Einstein), which banked the EINSTEIN TENSOR
`G_μν = Ric_μν − ½ R g_μν` + its dimension-forced trace-reversal. Gate-fast on N354 VERIFIED GREEN
(`/tmp/n354_gate.log`: GATE-FAST PASSED, D0–D6, C379 bites 1=379, 17 decls foundations-only). FRESH
node N355 — resume-check confirmed no prior N355 workbench (`ls workbench/N35*` shows only
N350–N354). Derived from scratch.

### The theory-native question asked FIRST (do NOT run on the ticket's framing).
The ticket toward E2 offered two beats: (a) the contracted Bianchi / covariant divergence
`∇^μ G_μν = 0` computed via the banked N350 operator-derivative applied to the metric tensor field;
(b) Lovelock's uniqueness stated on the banked einstein tensor (a LITERATURE IMPORT / HIDDEN JOINT).

Ask the theory-native question FIRST (SOUL QUIET DRIFT): what does the FOLD say about "the LHS of
Einstein's equations is divergence-free" that the textbook does not? In standard GR, the contracted
Bianchi `∇^μ G_μν = 0` (what makes `G_μν` the unique consistent source-coupling) FOLLOWS from the
DEEPER (second/differential) Bianchi identity `∇_[a R_bc]de = 0`, which the textbook proves by a
coordinate computation on the Riemann tensor's derivatives (a genuine second-order grind).

THE ANSWER (measured — probe1, probe2, probe_axioms all EXIT 0, foundations-only): in THIS framework
curvature is NOT a tensor written down by hand — it is the COMMUTATOR of the two look-back transports
(banked N348: `lbCurv k₁ k₂ = [Γ₁,Γ₂]`, `Γ = lbConn k = ½·η·k`). And the (differential) Bianchi
identity FOR A COMMUTATOR-CURVATURE connection IS the JACOBI IDENTITY of the transport bracket. So
the identity that the textbook grinds coordinate-by-coordinate DISSOLVES: it is `lie_jacobi` applied
to the banked transports, FORCED by the ASSOCIATIVITY of operator composition on the banked derived
carrier `MetricEnd = Module.End Cut STVC` (the `leibniz_lie` law grounding `lie_jacobi` on `MetricEnd`
holds precisely because operator composition is associative). This is a genuine W1-step-2 DISSOLUTION
— the theory makes a hard standard fact fall out of the trunk.

### THE MEASUREMENT (decisive — probe1, probe2, probe_axioms, all EXIT 0, foundations-only).
- `lbCurv_eq_bracket`: the banked curvature IS the Mathlib Lie bracket `⁅lbConn k₁, lbConn k₂⁆` of
  the associative endomorphism ring `MetricEnd` (`(LieRing.of_associative_ring_bracket …).symm`). THE
  LOAD-BEARING CONNECTION — ties the banked derived curvature (N348) to the Lie structure whose
  Jacobi identity is the Bianchi identity. New content: no prior module states this.
- `covTransport k C := ⁅lbConn k, C⁆` — the covariant-transport (adjoint) action `[Γ(k), ·]`, the
  algebraic part of the exterior covariant derivative `D` acting on a curvature-valued object;
  bilinear (covTransport_add/smul_left/right) from bracket bilinearity + transport linearity (N347).
- ★★★ `bianchi_jacobi`: `D_{k₁}R(k₂,k₃) + D_{k₂}R(k₃,k₁) + D_{k₃}R(k₁,k₂) = 0` — the cyclic sum of
  the covariant-transport action on the curvature of the other two loop directions VANISHES. Closes
  by `rw [lbCurv_eq_bracket ×3]; exact lie_jacobi (lbConn k₁) (lbConn k₂) (lbConn k₃)`.
- ★★★ `bianchi_from_associativity`: bundles the load-bearing connection (curvature = bracket) with
  the Bianchi identity, exhibiting the divergence structure as the fold's own operator-composition
  associativity carried by the look-back transport.
- W8: `curvBracket_ne_zero` (the concrete curvature-bracket is nonzero), `covTransport_curv_ne_zero`
  (the covariant transport of a concrete curvature is nonzero — first component ⅛), `bianchi_nonvacuous`
  (the Bianchi cancellation is a real cancellation of nonzero terms, not vacuous 0=0).

### CHOICE.
Build the (differential) Bianchi identity = Jacobi identity on the banked derived objects (N348
`lbCurv`, N347 `lbConn`, `MetricEnd = Module.End Cut STVC`), as the theory-native beat toward E2 that
PRECEDES both option (a) (the coordinate ∇^μG_μν grind) and option (b) (Lovelock). Decls:
`lbCurv_eq_bracket`, `covTransport` (+ apply, add/smul left/right), ★★★ `bianchi_jacobi`,
`covTransport_curv`, ★★★ `bianchi_from_associativity`, W8 `curvBracket_ne_zero` /
`covTransport_curv_ne_zero` / `bianchi_nonvacuous`.

## HONEST GRADE (carry it — do NOT overclaim).
- ⚠ ALGEBRAIC / LEADING-ORDER LAYER. This proves the Bianchi identity for the COMMUTATOR-curvature
  (the `Γ∧Γ` layer, banked N348 `lbCurv`). Following the banked N351 TWO-LAYER reading (the commutator
  is the irreducible curvature; the `dΓ` derivative layer vanishes for integrable fields, measuring
  only non-integrability), this is the theory-native core of the differential Bianchi identity. The
  full nonlinear `F = dΓ + Γ∧Γ` differential Bianchi (with the derivative-layer terms) is childed —
  flagged leading-order/algebraic-layer, exactly like N348/N351. This is the honest content, NOT a
  scope-reduction dressed up.
- ⚠ HIDDEN JOINT — Lovelock still CITED downstream. This node does NOT prove Einstein's equations
  unique. It banks the Bianchi/divergence structure (the theory-native fact that the curvature is
  divergence-free-by-Jacobi). Lovelock's uniqueness (E2 proper) remains a LITERATURE IMPORT / HIDDEN
  JOINT, childed. Flagged honestly.
- MACHINERY node — asserts NO physical value. No κ, no Λ, no field equation written down.

## Target (over `MetricEnd = Module.End Cut STVC` / `STVC`, banked N347 `lbConn` + N348 `lbCurv`)
All theorem TYPES over the banked derived objects. The Lie machinery (`LieRing.ofAssociativeRing`,
`lie_jacobi`, `of_associative_ring_bracket`) is Mathlib MACHINERY on the DERIVED carrier — exactly as
`Phys/Algebra/Derivation.lean` already uses `lie_jacobi` on `Module.End`.

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: the (second/differential) Bianchi identity `∇_[a R_bc]de = 0`, proved by a
coordinate computation on the Riemann tensor's derivatives; its contraction gives `∇^μ G_μν = 0`,
which makes `G_μν` the unique consistent source (forcing `∇^μ T_μν = 0`). In GAUGE THEORY the
curvature 2-form `F = dA + A∧A` satisfies `DF = 0` by the Jacobi identity — a well-known fact.
What the theory DOES to it:
  (1) Built ENTIRELY on the banked derived-ℝ carrier: the curvature is the banked N348 commutator
      `lbCurv = [Γ₁,Γ₂]` of the banked N347 look-back transport `Γ = lbConn = ½·η·k`, NOT a posited
      tensor. `lbCurv_eq_bracket` ties it to the Mathlib Lie bracket of the DERIVED endomorphism ring
      `MetricEnd = Module.End Cut STVC`. So the Bianchi identity is `lie_jacobi` of the DERIVED
      transports — the fold's own structure, not a coordinate identity on a posited chart.
  (2) THE DISSOLUTION (W1 step 2): the textbook grinds the differential Bianchi identity as a
      second-order coordinate computation; here it FALLS OUT of `lie_jacobi`, FORCED by the
      ASSOCIATIVITY of operator composition (the `leibniz_lie` grounding Jacobi on `MetricEnd` IS the
      associativity). ONE CAUSE (composition of look-backs is associative), the divergence structure
      of gravity. The theory makes the hard standard fact easy — the moat.

Words-removable: delete "Bianchi / curvature / transport / covariant / connection / gravity /
spacetime" — a pure statement that over the derived field `Cut`, for the banked linear map
`Γ = lbConn` on `MetricEnd = Module.End Cut STVC` and the banked commutator `lbCurv a b = [Γa,Γb]`,
the cyclic sum `⁅Γk₁,⁅Γk₂,Γk₃⁆⁆ + ⁅Γk₂,⁅Γk₃,Γk₁⁆⁆ + ⁅Γk₃,⁅Γk₁,Γk₂⁆⁆ = 0` (the Jacobi identity of
the associative endomorphism ring), and the terms are genuinely nonzero for the concrete
`timeProj`/`offDiagVar`. Pure Lie-ring/commutator algebra over the derived ℝ. NO theorem STATEMENT
needs a physics word.

NOT free-floating: every TYPE is over `MetricEnd = Module.End Cut STVC` / `STVC` with `lbConn` (banked
N347) and `lbCurv` (banked N348) the concrete banked objects; non-vacuity on the banked
`timeProj`/`offDiagVar`. NOT a generic Lie-algebra abstraction — the bracket is the banked derived
transport commutator, `lbCurv_eq_bracket` instantiates the generic Jacobi to the DERIVED curvature.

Temptations REJECTED:
- (drift-A, ticket option (a)) "compute ∇^μ G_μν = 0 by applying the N350 operator-derivative to the
  metric tensor field, coordinate-style" → REJECTED as the FIRST beat. That is the CONTRACTED Bianchi,
  which in standard GR FOLLOWS from the deeper differential Bianchi identity. Asking the theory-native
  question FIRST found the deeper fact (the differential Bianchi = Jacobi), which DISSOLVES rather than
  grinds. The contracted/divergence form (raising + tracing the differential Bianchi) is a childed
  downstream beat once the metric-raise machinery is applied to it.
- (drift-B, QUIET DRIFT) "prove the covariant-transport action is a full linear map + all its adjacent
  properties by routine machinery, and call that the node" → the bilinearity (covTransport_add/smul_*)
  IS included (it falls out of bracket bilinearity + transport linearity, recorded) but is NOT the
  content — the content is `bianchi_jacobi` + the load-bearing `lbCurv_eq_bracket`. Asked the
  theory-native question FIRST.
- (drift-C, over-claim) "state E2 (Lovelock / Einstein's equations unique) in this node" → REJECTED.
  Lovelock is a LITERATURE IMPORT / HIDDEN JOINT, childed. This node banks the Bianchi/divergence
  STRUCTURE (the theory-native fact), not the uniqueness theorem.
- (drift-D, FREE-FLOATING) "state the Jacobi/Bianchi identity generically over an arbitrary Lie ring"
  → FREE-FLOATING trap. REJECTED — every TYPE over `MetricEnd = Module.End Cut STVC` with the banked
  `lbConn`/`lbCurv`; `lbCurv_eq_bracket` instantiates it to the DERIVED curvature; non-vacuity on the
  banked concretes.
- import Mathlib manifold / tensor-curvature / `RiemannianMetric` / covariant-derivative API /
  Mathlib-ℝ as content → UNEARNED-IMPORT + CONTENT-ℝ trap. REJECTED — `LieRing.ofAssociativeRing`,
  `lie_jacobi`, `of_associative_ring_bracket` are Mathlib MACHINERY on the DERIVED carrier (exactly as
  `Phys/Algebra/Derivation.lean` uses `lie_jacobi` on `Module.End`); the curvature is the banked derived
  `lbCurv`, the transport the banked derived `lbConn`, the field the derived `Cut`.

GENUINELY DIFFERENT from textbook GR / from a generic gauge-theory statement: the connection is the
FOLD's look-back transport (banked, DERIVED from `η²=1`, N347), the curvature its commutator (banked
N348), so the Bianchi identity descends from the fold via the derived operator ring's ASSOCIATIVITY —
not posited on a chart, not a generic Lie-algebra fact floating free. The moat is the DERIVATION (the
Bianchi identity of the DERIVED curvature), not the identity itself.

## Guards (SEED_GR relaxes NONE)
G1 no value asserted (machinery; ⅛ and the cancellation FALL OUT of the banked lbConn/lbCurv, never
premised). G2 no empirical number. G3 no scale (Lie-ring/commutator algebra; dimensionless). G4 the
Bianchi identity IS `lie_jacobi` of the banked transports, the curvature IS the banked commutator, NOT
a posited tensor identity; Lovelock (E2 proper) is a childed HIDDEN JOINT, NOT asserted here. G5
words-removable (above). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound} (VERIFIED via
probe_axioms on `lbCurv_eq_bracket` + `bianchi_jacobi`), no sorry/axiom/native-decide/maxHeartbeats.
ℝ-VIGILANCE: built on banked derived-ℝ `Cut` + banked `lbConn`/`lbCurv`/`MetricEnd`; the Lie machinery
(`LieRing.ofAssociativeRing`, `lie_jacobi`, `of_associative_ring_bracket`, `lie_add`/`lie_smul`) is
Mathlib MACHINERY on the derived carrier; NO Mathlib manifold/curvature/covariant-derivative/`Real` as
content. W8 non-vacuity C380 (a wrong-Bianchi / vacuous-cancellation mis-reading reduces to 1=380).
W9 LIGHT (full route + axioms EXIT 0 in ~30s; the heart is `lie_jacobi`, everything else bracket
bilinearity + one concrete component computation; NO maxHeartbeats, NO coordinate bash).

## ONE SUCCESSOR (RAIL): DIRECTED child toward E2 proper (Einstein's equations UNIQUE via Lovelock
literature import applied to the banked einstein tensor — a HIDDEN JOINT, CITED as machinery), OR a
decompose-remainder toward the CONTRACTED Bianchi / covariant divergence `∇^μ G_μν = 0` (raising +
tracing the differential Bianchi via the banked BvC metric-raise + N350 operator-derivative) if E2
needs it as the immediately-preceding beat. Single tail successor; run the pre-complete fork check
(kanban_list, non-terminal successors = exactly 1).
