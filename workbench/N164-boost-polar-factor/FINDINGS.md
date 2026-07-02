# N164 FINDINGS — MEASURE-FIRST verdict (frozen)

## VERDICT: ROUTE B (sqrt steering) — MEASURED CHEAP, ~9s clean compile.

The boost path `boostPath m := boostEndC (cutSqrt(1+m²)) m`:
  - GLOBAL (no poles; 1+m²≥1 always), continuous in endOpC (each coord is a poly/continuous-
    function of m: t-coord = cutSqrt(1+m²)·t + m·x, etc., all continuous since
    `m_cont_cutSqrt_one_add_sq` ✓).
  - starts at 1: `boostPath 0 = boostEndC (cutSqrt 1) 0 = boostEndC 1 0 = 1` (cutSqrt_one).
  - every point a QvC-isometry: `boostEndC_isQvIsomC` needs `a²−b²=1` = `m_iso` ✓
    (`cutSqrt(1+m²)²−m²=1` via cutSqrt_sq).
  - reaches target `boostEndC a₀ b₀` (a₀²−b₀²=1, a₀>0): at m=b₀,
    `boostPath b₀ = boostEndC (cutSqrt(1+b₀²)) b₀ = boostEndC a₀ b₀` since
    `cutSqrt(1+b₀²)=cutSqrt(a₀²)=a₀` = `m_reaches` ✓.

So `JoinedIdQvC (boostEndC a₀ b₀)` for a₀>0 (the forward/proper-orthochronous boost branch —
the ONE connected component through the identity; a₀<0 is the OTHER component, correctly
excluded, like det−1 in N162/N163).

## PROVED MEASURE LEMMAS (all compile, ~9s total, workbench/probes/Measure.lean):
  - m_cutSqrt_monotone : Monotone cutSqrt            (not needed for the path; drop)
  - m_cont_cutSqrt_one_add_sq : Continuous (m ↦ cutSqrt(1+m²))   ★ THE KEY (squeeze)
  - m_iso : (cutSqrt(1+m²))²−m²=1                     ★ isometry condition
  - m_reaches : a²−b²=1 → 0<a → cutSqrt(1+b²)=a       ★ reaches target

## STEERING NOTES (the squeeze proof of continuity, reusable):
  |cutSqrt(1+m²) − cutSqrt(1+m₀²)| ≤ |m²−m₀²|  (denominator ≥1), then squeeze via
  `tendsto_of_tendsto_of_tendsto_of_le_of_le` against the continuous |m²−m₀²|→0.
  Lemma name quirks in this Mathlib: use `lt_or_ge`/`le_or_gt` (NOT le_or_lt/lt_or_le);
  squeeze_zero lives in metric files (unavailable for Cut) — use the order-topology squeeze.

## PRODUCTION PLAN:
  File: Phys/Algebra/LorentzContinuumBoostPolarFactor.lean (import the N163 tail).
  Decls:
    cutSqrt_one_add_sq_cont          (= m_cont_cutSqrt_one_add_sq)
    boostPath (def)                  := fun m => boostEndC (cutSqrt(1+m²)) m
    boostPath_zero                   : boostPath 0 = 1
    boostPath_isQvIsomC              : ∀ m, IsQvIsomC (boostPath m)
    boostPath_cont                   : Continuous boostPath
    boostPath_reaches                : a²−b²=1 → 0<a → boostPath b = boostEndC a b
    boostPath_image_preconnected
    joinedIdQvC_boostEndC            ★ a²−b²=1 → 0<a → JoinedIdQvC (boostEndC a b)
    -- polar assembly (if turns allow):
    joinedIdQvC_boost_compact        ★ JoinedIdQvC (boostEndC a b * k) for k the N163 SO(9) factor
  W8 witness: a concrete non-identity boost moves the timelike axis and is JoinedIdQvC.
  Costume C196: a WRONG boost-path / isometry / JoinedIdQvC claim → false numeric 1=164.
