# N66 — PREREG (frozen before compute)

## Node
The POLAR / KAK ASSEMBLY witness (forward frontier priority (i)): the CONCRETE polar
decomposition of a banked isometry `g` over the derived ℝ `Cut`, both factors NONTRIVIAL —
exhibiting `g*∘g` as a banked positive operator, `exp(p) = √(g*g)` delivered by the banked
operator square root, and the compact part `k = g·exp(p)⁻¹` read off and proved EvC-orthogonal.

## The design (reframe through the trunk — Born positivity = the polar positive part)
Build the boost as a `Module.End` (fixing the octonion block `v`, the analogue of the banked
`boostFunC` lifted to a linear map):
  `boostC a b : (t,x,v) ↦ (a•t+b•x, b•t+a•x, v)`.
Trunk facts (all pure (t,x) field arithmetic + the v-block passing through via gFormC):
  • `boostC_isEvCSymm` — EvC-self-adjoint (B* = B).
  • `boostC_comp` — `boostC a b ∘ boostC a' b' = boostC (a·a'+b·b')(a·b'+a'·b)`.
  • `boostC_sq` — `boostC a b ∘ boostC a b = boostC (a²+b²)(2ab)`.
  • `boostC_nonneg` — for `a+b ≥ 0 ∧ a−b ≥ 0`, EvC-positive-semidefinite
       (`a t² + 2b tx + a x² + gFormC v v = (a+b)/2·(t+x)² + (a−b)/2·(t−x)² + gFormC v v ≥ 0`).
  • `boostC_op_sqrt` — for `a+b ≥ 0 ∧ a−b ≥ 0`, `IsEvCOpSqrt (boostC a b) (boostC (a²+b²)(2ab))`
       (B is THE positive operator square root of B²).
  • `boostC_isQvIsomC` — for `a²−b²=1`, `boostC a b` preserves the Minkowski form `QvC`
       (the banked `boostC_isom`, lifted) — connects the operator to a banked ISOMETRY.
The compact factor is the BANKED `blockDiag 1 (−1)` (the octonion-block reflection):
  • `R := blockDiag 1 (−1)` is EvC-self-adjoint (`blockDiag_isEvCSymm`) and an EvC-orthogonal
    INVOLUTION (`R∘R = blockDiag 1 1 = id`, via `blockDiag_comp` + `blockDiag_scalar`), so `R*∘R = id`.
THE POLAR ASSEMBLY:  `polG := R.comp (boostC a b)`  ( = `k·exp(p)` definitionally).
  • `polG_adjoint` — `IsEvCAdjoint polG ((boostC a b).comp R)` (g* = B∘R, from R,B self-adjoint).
  • `polG_starComp_eq` — `g*∘g = boostC (a²+b²)(2ab)` (= B², since R∘R = id).
  • `polG_pos_part` — `IsEvCOpSqrt (boostC a b) (g*∘g)` — exp(p) = √(g*g) = boostC a b.
  • `polG_eq_compact_comp_pos` — `polG = R.comp (boostC a b)` (g = k·exp(p), definitional/rfl).
  • `R_orthogonal` — `R.comp R = id` (k is the compact EvC-orthogonal factor).

## NON-VACUITY (W8) — BOTH factors genuinely nontrivial
  • the compact part `k = blockDiag 1 (−1) ≠ id` (reflects the v-block — `not` id witness).
  • the positive part `boostC (5/3)(4/3) ≠ id` (genuine time–space mix, off-diagonal 4/3 ≠ 0).
  • concrete witness `a=5/3, b=4/3` (a²−b² = 25/9−16/9 = 1, a Lorentz boost): `g*g = boostC (41/9)(40/9)`,
    positive part `boostC (5/3)(4/3)`; eigenvalues at the 45° basis `a+b=3, a−b=1/3`.

## Costume C97 — bites a WRONG POLAR (positive) FACTOR
Claim a WRONG positive part of the concrete `g*g = boostC (41/9)(40/9)`: that
`boostC (5/3)(4/3)` is the op-sqrt would read at the uP eigenblock the eigenvalue
`a+b = 3`; a BOGUS claim that the positive part has uP-eigenvalue `5` (i.e. its square reading
gives `25` against the `g*g` reading `9`) reduces to the FALSE NUMERIC `9 = 25` (uP eigenblock
of `boostC (41/9)(40/9)` is `(a+b)²=9`). DISTINCT from the banked battery
(C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1, C91 25=7, C92 9=10,
C93 9=11, C94 16=15, C95 1=7, C96 25=30) — `9 = 25` is new.

## GO / NO-GO
GO iff: all decls compile foundations-only `[propext, Classical.choice, Quot.sound]`; the polar
assembly verifies `g = k·exp(p)` with BOTH factors nontrivial; costume C97 bites `9 = 25`;
gate D0–D6 green; STANDARD (unbroken/complete/words-removable) applied.
NO-GO → honest W1 dissolution ticket + block (NOT a grind, NOT a scope-reduction).

## KILL (W9 — instrument-failure budget)
KILL = 30 s / single obligation. NO inflated `maxHeartbeats`, NO `native_decide`, NO monolithic
brute over expanded coordinates. If any single proof obligation exceeds 30 s → it is an INSTRUMENT
failure: MEASURE the smallest sub-obligation, DECOMPOSE / reframe through a banked structural
identity (NOT a longer grind). Same engine as N56–N65 (compiled clean ≤ 8–17 s). Checkpoint at
~50% turns; bank-as-you-go (productionize + wire + commit the instant a lemma compiles clean);
run the gate in BACKGROUND; child the next node + complete with turns to spare.

## Childed remainder (W3)
The GLOBAL polar/KAK assembly (EVERY `g ∈ qvIsomMonoidC` so factors — the operator square root of
an ARBITRARY `g*g`, the full n-dim spectral existence) + the compact part via CONNECTEDNESS + the
GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`) +
the full `Spin(9)→SO(9)` exhaustion → childed N67.
