# N165 — PREREG (frozen before compute)

## MEASURE-FIRST verdict (done before any production edit)

The three banked levers:
- N131 `bvIsomLin_polar_path_decomp`: arbitrary `IsBvIsomLin S` ⟹ `S = k·γ(1)`, where
  `k := S∘(p^{1/2})⁻¹` is a QvC-isometry (conjunct h7 `IsQvIsomC (S.comp …)`), and
  `γ(1) = specOpN (cutSqrt∘c) u` is a GENERAL EvC-positive self-adjoint operator (h4 IsEvCOpSqrt,
  h5 IsEvCSymm, h6 EvC-positive on [0,1]). The reconstruction conjunct h8:
  `(S.comp (specOpN (cutSqrt∘c)⁻¹ u)).comp (γ 1) = S`, i.e. `k.comp (γ 1) = S` (= `k * γ(1)`).
- N164 `joinedIdQvC_boostEndC` (forward boost `a²−b²=1`, `0<a` is JoinedIdQvC) and
  `joinedIdQvC_boost_compact` (`boostEndC a b * k` JoinedIdQvC for ANY JoinedIdQvC `k`).
- N163 `joinedIdQvC_of_timeFixing_evCOrth_SO9` (a time-fixing EvC-orthogonal det-+1 QvC-isom is
  JoinedIdQvC) + `joinedIdQvC_of_xtFixing_det_one`.
- N157 engine `joinedIdQvC_mul` / `joinedIdQvC_listProd` / `joinedIdQvC_isQvIsomC` (the non-vacuity).

THE RESIDUAL (genuine, as the task flagged): `γ(1) = specOpN (cutSqrt∘c) u` is a GENERAL positive
self-adjoint operator, NOT a single `boostEndC`. The banked affine cone-path `specPathOp` connecting
`id → γ(1)` stays POSITIVE but LEAVES the isometry group (the intermediate positive operators are not
QvC-isometries), so it does NOT witness `JoinedIdQvC (γ 1)`. Establishing the general positive-part
factor as JoinedIdQvC needs a path of *isometries* (a spectral t-power `specOpN (cutSqrt(c i)^t) u`
steered hyperbolic boost-family, or the KAK frame decomposition of the positive part into a product
of single-axis boosts each reached by N164's `boostPath`). This is a dedicated W1 dissolution node.

## WHAT IS BANKABLE NOW (this node)
Two clean forward theorems, fully proved from the banked engine, NON-VACUOUS, phrased in JoinedIdQvC:

(A) THE EXPLICIT KAK PRODUCT ASSEMBLY — for a forward boost `boostEndC a b` (`a²−b²=1`, `0<a`) and
    a compact factor `k` satisfying N163's time-fixing/EvC-orthogonal/det-+1 hypotheses, the polar
    product `boostEndC a b * k` is the NON-VACUOUS `JoinedIdQvC`. (= `joinedIdQvC_boost_compact`
    instantiated at the N163-certified compact factor.) This is the FULL SO⁺(1,9) identity-component
    element in the canonical KAK shape (boost · time-fixing SO(9) rotation), proved end-to-end.

(B) THE POLAR REDUCTION — for an arbitrary `IsBvIsomLin S`, the converse polar decomposition writes
    `S = k * γ(1)` with `k` a QvC-isometry compact factor and `γ(1)` a positive self-adjoint operator,
    AND: IF the positive part `γ(1)` is `JoinedIdQvC` AND the compact factor `k` is `JoinedIdQvC`,
    THEN `S` is `JoinedIdQvC` (via `joinedIdQvC_mul` on `k * γ(1) = S`). This isolates the SINGLE
    residual (positive-part JoinedIdQvC) cleanly — the global assembly stands on one open lemma, the
    way N104/N132 reduced converse generation to one word-membership residual.

(C) W8 WITNESS — the concrete product `boostEndC (5/3) (4/3) * octBlockEndC so9WitnessR` (a genuine
    boost times a genuine axis-MOVING det-+1 SO(9) rotation, neither the identity) is `JoinedIdQvC`,
    by (A) on `joinedIdQvC_so9Witness_via_assembly`. Distinguishing read-off for the costume.

## GO / NO-GO
- GO if (A) and (B) compile clean foundations-only and (C) is a genuine non-identity product.
- The general positive-part-JoinedIdQvC lemma is NOT attempted here (dedicated W1 child N166).

## KILL (instrument-failure classifier)
- Any single tactic with no output > 90s on these goals, or RSS climbing into GB, or `whnf` timeout
  on a `Module.End` product goal (the N163 coercion-ambiguity pitfall) → INSTRUMENT failure, cure
  with explicit `Module.End Cut STVC` ascription + `Module.End.mul_apply`/`Module.End.mul_eq_comp`,
  NOT an inflated ceiling, NOT a theory fight.
- If the simple wiring (A)/(B) unexpectedly fights → return to trunk: these are one-line
  `joinedIdQvC_mul` applications; a fight means a coercion/defeq mismatch, fix the ascription.

## ANTI-VACUITY (W8)
Costume C197, value `1 = 165` (DISTINCT from C196 `1=164`, C195 `1=163`, …). The wrong claim must
reduce to a false numeric `1 = 165` and fail to compile. Result phrased in `JoinedIdQvC` (never the
vacuous `JoinedIdC`); `joinedIdQvC_isQvIsomC` forces a genuine isometry; the W8 product MOVES an axis.

## NEXT NODE (childed onto the chain tail)
N166 — creative theory-native dissolution: the GENERAL positive-part factor `γ(1) = specOpN (cutSqrt∘c) u`
of the converse polar decomposition is `JoinedIdQvC` (a path of ISOMETRIES from id to γ(1) — the
spectral t-power hyperbolic boost-family / KAK frame product), closing (B)'s residual into the
UNCONDITIONAL full SO⁺(1,9) identity component for EVERY proper orthochronous g.
