# N58 — PREREG (frozen before compute)

## Node
The GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component
`≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion. The heavy group-manifold core.

## MEASURE-FIRST verdict (before any heavy compile)
The full reverse inclusion is a genuine MULTI-NODE W3 arc: it needs
 (1) a Euclidean reference form + a general operator adjoint w.r.t. it,
 (2) `g*g` self-adjoint + positive-semidefinite,
 (3) an OPERATOR square root over the 10-dim form space (no Mathlib spectral theory over `Cut`),
 (4) the compact rotation part `k` via CONNECTEDNESS (no Mathlib topology of `SO⁺(1,9)` over `Cut`),
 (5) the full `Spin(9)→SO(9)` exhaustion (every spacelike rotation a finite product of `biMulFun`).
None of (3)–(5) is bankable in one run. ⇒ **W3 DECOMPOSE**: bank the immediately-available,
theory-native STRUCTURAL skeleton this run; child the global remainder.

## What this run banks — THE INFINITESIMAL CARTAN DECOMPOSITION
The polar/KAK `g = k·exp(p)` has, as its Lie-algebra shadow, the Cartan split
`𝔰𝔬(1,9) = 𝔨 ⊕ 𝔭` relative to the positive-definite Euclidean reference form `EvC` (the
`(+,+,…,+)` companion of the indefinite Minkowski `BvC`):
  • `EvC p q := p.1·q.1 + p.2.1·q.2.1 + gFormC p.2.2 q.2.2`  (positive-definite, from N56).
  • `EvC` is symmetric `Cut`-bilinear; `EvC p p ≥ 0` and `= 0 ↔ p = 0` (N56 `gFormC_nonneg`/`_eq_zero_iff`).
  • `IsEvCSymm T := ∀ p q, EvC (T p) q = EvC p (T q)`  (the `𝔭` membership predicate).
  • `IsEvCSkew T := ∀ p q, EvC (T p) q + EvC p (T q) = 0`  (the `𝔨` membership predicate).
  • `boostGenC` (N51, the infinitesimal boost) is **EvC-SYMMETRIC** → the noncompact `𝔭` part.
  • `rotGenC a` (a imaginary, N51) is **EvC-SKEW** → the compact `𝔨` part (via `gFormC_skew`).
  • Both are already BvC-skew (N51 `IsInfIsomC`) — so within `infIsomLieAlg`, the EvC-involution
    splits the tangent algebra into the compact (rotation) and noncompact (boost) parts.
This is the genuine theory-native skeleton of the reverse/polar direction, all pure field
arithmetic over the ordered derived ℝ `Cut` (same style as N51 `boostGenC_inf`/`rotGenC_inf`).

## GO / NO-GO
GO: `EvC` + positive-definiteness + the two Cartan-split membership theorems
(`boostGenC` EvC-symmetric, `rotGenC a` EvC-skew for imaginary `a`) compile foundations-only,
fast (cached `lake build Phys`), costume C89 bites a WRONG Cartan-split / EvC-positivity claim.
NO-GO: if even this skeleton fights (it should not — it is N51-style arithmetic), it is an
honest W1 dissolution ticket + block, not a grind.

## KILL budget (W9 — instrument failure, NOT theory failure)
- Each individual lemma compile probe ≤ 60s. The whole new file `lake build`-cached ≤ 90s.
- If any single obligation exceeds 90s → it is an INSTRUMENT wall: STOP, decompose that
  obligation, do NOT inflate maxHeartbeats. (Predecessors N43/44/46/49/50/51 timed out on the
  gate ceremony; N52–N57 landed clean by banking-as-you-go EARLY. Checkpoint ~50% turns,
  finalize with turns to spare. Run the gate in BACKGROUND, never block the turn budget on D6.)

## Anti-vacuity (W8)
Costume C89 must bite a WRONG Cartan-split sign — e.g. claiming `boostGenC` is EvC-SKEW (it is
EvC-symmetric) — reducing to a false numeric at a concrete witness. The WRONG claim must fail
to compile.

## Words-removable
Delete "Lorentz/boost/rotation/Cartan/KAK/polar/compact/noncompact/isometry/Spin/SO(9)/
adjoint/symmetric/skew-as-physics" → over the derived complete ordered field `Cut` and the
Cayley–Dickson double³ `O Cut`, the form `EvC p p = t²+x²+gFormC v v` is `≥ 0` with equality
iff `p = 0`; the linear map `(t,x,v)↦(x,t,0)` satisfies `EvC(Tp)q = EvC p(Tq)`; and
`(t,x,v)↦(0,0,a·v)` for `gFormC a 1 = 0` satisfies `EvC(Tp)q + EvC p(Tq) = 0`. Pure math.

## Child (the global remainder)
N59: the OPERATOR square root over the form space (lifting `cutSqrt`) + the global polar/KAK
exhaustion (`qvIsomMonoidC`|connected `≤ genIsomMonoidC2`) + connectedness + the full
`Spin(9)→SO(9)` exhaustion. An honest W1 heavy remainder.
