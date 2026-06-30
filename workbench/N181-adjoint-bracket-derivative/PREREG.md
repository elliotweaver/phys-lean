# N181 PREREG — THE ADJOINT-FLOW DERIVATIVE (the non-abelian first-order bracket)

FROZEN before compute. (THE ONE LAW reframe applied up front.)

## The front chosen (front (i), reframed)
Front (i) is the FULL non-abelian first-order bracket. N180 deferred `[exp(sD),exp(tE)] ≈ id + st·⁅D,E⁆`
because the 2-parameter group commutator needs the SECOND-order Taylor of exp over Cut (unbanked).

THE ONE LAW / W1 REFRAME (the trunk makes the hard thing easy): the SAME first-order bracket content
is captured by the ONE-PARAMETER ADJOINT (conjugation) FLOW derivative
    d/dt ( exp(tD) · E · exp(−tD) )|₀ = ⁅D, E⁆ = D·E − E·D
which needs ONLY the FIRST-order tangent (banked-style scalar power-series deriv `cut_powerseries_deriv`
+ the matrix entry tangent `expMap_entry_tangent` N41g) + matrix-mul continuity. The conjugation flow
makes the non-abelian bracket FIRST-order. This is the genuine non-abelian content (recovers ⁅M,A⁆,
nonzero exactly when M,A don't commute), NOT the abelian N180 case.

W4.5 note: the chain has banked the major physics joints (cascade stop N2c, generation cap N5,
Der(O)=g₂ N20, SU(3)⊂G₂ colour 3⊕3̄⊕1 N42a/b/c, (1,9) signature N43, Pin/Spin/O(1,9) N142–173,
continuous exp/log/power/spectral flow N174–176, one-param + commuting flow N177/N180, abstract
group objects N178/N179). N176–N180 are five lateral flow/group nodes. Front (ii) (specPow↔expOEquiv)
MEASURED as restatement-risk (W8 vacuity). Front (i)-reframed OPENS genuinely-new structure: the
group conjugation flow ↔ the algebra bracket — the adjoint representation tangent `ad = d/dt Ad(exp)`.

## The math route (each step a banked lever)
Let P(t)=expMap(t•M), Q(t)=expMap(t•(−M))=expMap(−(t•M)). Then P·Q=1 (`expMap_mul_neg` N40).
  (1) IDENTITY (all t): P·A·Q − A = (P·A − A·P)·Q   [uses A=(A·P)·Q=A·(P·Q)=A].
  (2) smul pull: t⁻¹•((P·A−A·P)·Q) = (t⁻¹•(P·A−A·P))·Q   [smul_mul_assoc].
  (3) t⁻¹•(P·A−A·P) = T·A − A·T  where T(t):=t⁻¹•(expMap(t•M)−1)   [smul_mul_assoc, distrib].
  (4) T → M entrywise  [= `expMap_entry_tangent` N41g, restated entrywise].
  (5) matrix-mul-of-tendsto (entrywise finite sum): T·A → M·A, A·T → A·M ⟹ T·A−A·T → M·A−A·M.
  (6) Q → 1 entrywise  [continuity at 0, DERIVED from the tangent: P−1 = t·T, t→0, T bdd ⟹ P→1].
  (7) (t⁻¹•(P·A−A·P))·Q → (M·A−A·M)·1 = ⁅M,A⁆   [matrix-mul-of-tendsto].

## Deliverables (matrix level + operator transport)
- matrix-mul-of-tendsto helper (entrywise).
- expMap continuity at 0 (entrywise, from the tangent).
- adjMap_tangent (★★ THE HEADLINE matrix adjoint tangent → ⁅M,A⁆).
- derivMatrix transport: ⁅derivMatrix D', derivMatrix E'⁆ = derivMatrix ⁅D',E'⁆ (ring hom preserves
  bracket) — so the adjoint flow of derivMatrix D' on derivMatrix E' has derivative derivMatrix⁅D',E'⁆.
- W8 non-vacuity: a concrete NON-commuting pair whose adjoint-flow derivative ⁅M,A⁆ ≠ 0
  (distinct from N180's abelian/commuting case).

## GO / NO-GO
GO if probe1 (matrix-mul-tendsto + continuity-at-0) compiles foundations-only under KILL.
NO-GO→DECOMPOSE if the matrix-mul-tendsto or the assembly exceeds KILL: child a smaller piece.

## KILL (instrument-failure thresholds, W9)
- 90s per obligation (lake env lean isolated). 150s per probe file. If any single obligation
  exceeds 90s → it is an INSTRUMENT failure: decompose, do NOT inflate maxHeartbeats.
- NO native-kernel-bypass, NO monolithic ring/decide over expanded coordinates, NO inflated
  maxHeartbeats. Everything is finite (Fin 8) sums + Tendsto algebra — must stay light.

## Costume (next id C213) — must BITE a WRONG claim, DISTINCT false numeric (use 1=181)
The adjoint-flow derivative genuinely recovers ⁅M,A⁆ on a NON-commuting witness pair; the WRONG
claim that it vanishes (the flow is trivial / abelian) forces a false `1 = 181` in Cut via a
witness coordinate where ⁅M,A⁆ reads a nonzero value.

## Anti-vacuity (W8)
The headline must GENUINELY recover ⁅M,A⁆ (non-abelian), verified on a NON-commuting pair with
nonzero bracket — NOT the N180 abelian case. Deleting physics words leaves a real Tendsto identity.
