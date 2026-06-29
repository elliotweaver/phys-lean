# N166 — THE POSITIVE-PART DISSOLUTION (frozen PREREG, before compute)

## Chain position
N165 banked `bvIsomLin_polar_reduction`: an arbitrary BvC-isometry `S = k·p` with `k` a
QvC-isometry, `p = γ(1)` EvC-positive self-adjoint, and the CONDITIONAL
`JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S`. The single residual is `JoinedIdQvC p`.

## MEASURE-FIRST verdict (THE ONE LAW fired)
N165's stated worry: `γ(1)` is a "GENERAL EvC-positive self-adjoint operator", for which
`JoinedIdQvC` would be FALSE (a generic positive operator like `2·id` preserves no indefinite
form). That worry is the DRIFT signal — the framing was wrong. The reframe through the trunk:

In `bvIsomLin_polar_reduction` we have `k * p = S` with BOTH `k` and `S` QvC-isometries
(`k` by N131 h7; `S` by `bvIsomLin_isQvIsomC`). This FORCES `p` to be a QvC-isometry:
  QvC(p q) = QvC(k (p q))   [k isometry]
           = QvC((k*p) q)    [Module.End.mul_apply]
           = QvC(S q)        [k*p = S]
           = QvC q           [S isometry].
So the positive part is NOT a generic positive operator — it is a positive self-adjoint
ISOMETRY (a pure boost). The W8 "generic positive operator" obstruction is DISSOLVED.

This is a pure isometry-group cancellation fact (`p = k⁻¹S`), proved directly without an
inverse. Fully general: `IsQvIsomC k → IsQvIsomC S → k*p = S → IsQvIsomC p`.

## The residual after this dissolution (the genuine W1 heavy remainder)
Knowing `p` is a positive self-adjoint QvC-isometry, closing `JoinedIdQvC p` still needs a
continuous PATH of isometries from `1` to `p`. The naive affine `specPathOp` leaves the
isometry group (confirmed N165). The trunk-native route is the spectral `t`-power
`specOpN (fun i => cutSqrt(c i)^t) u` — which requires a CONTINUOUS REAL POWER `(·)^t` over
the derived ℝ `Cut` (`cutRpow`), GENUINELY MISSING (N96 measure-first flagged it as a W1
heavy remainder) — OR the KAK frame-product of single-axis boosts (eigenframe decomposition
of `p` into commuting `boostEndC` factors, glued by `joinedIdQvC_listProd`). Both are
substantial multi-run nodes. → child the full dissolution.

## GO / NO-GO
- GO (bank): `isQvIsomC_of_mul_eq` (the general cancellation) + `bvIsomLin_polar_part_isQvIsomC`
  (the positive part of the converse polar decomp is a QvC-isometry) + the STRENGTHENED polar
  reduction `bvIsomLin_polar_reduction_isom` recording `IsQvIsomC p` alongside the N165 facts.
  This strictly strengthens N165 and DISSOLVES the W8 obstruction: the residual is now about a
  positive self-adjoint ISOMETRY (a real boost), not a generic positive operator.
- NO-GO (do NOT attempt this run): the continuous real power `cutRpow` over `Cut` and the full
  isometric `t`-power boost-family path; the KAK eigenframe boost-product. These are the W1
  heavy remainder → childed.

## KILL (instrument-failure classifier)
- If `isQvIsomC_of_mul_eq` does not close in a handful of `rw`/`calc` lines, it is an
  INSTRUMENT/coercion problem (the N163 coercion-ambiguity pitfall: ascribe `Module.End Cut STVC`
  explicitly, use `Module.End.mul_apply`), NOT a theory failure — fix the framing, do not grind.
- No inflated `maxHeartbeats`, no monolithic brute. Each lever is a few lines; if any single
  obligation runs >60s in a bounded probe it is mis-framed — STOP and reframe.

## Costume (C198)
A WRONG positive-part / isometry / JoinedIdQvC value: the genuine hyperbola read-off
`(cutSqrt(1+(4/3)²))² − (4/3)² = 1` (`boostPath_iso (4/3)`) claimed `= 166` forces `1 = 166`,
DISTINCT from the banked battery (… C196 1=164, C197 1=165). Must NOT compile.

## STANDARD
Non-vacuous (phrased in `IsQvIsomC`/`JoinedIdQvC`, never the vacuous `JoinedIdC`; the positive
part genuinely preserves the indefinite form). Physics-words-removable. Foundations-only.
