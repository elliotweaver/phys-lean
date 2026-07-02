# N164 PREREG — THE BOOST / POLAR NON-COMPACT FACTOR → full SO⁺(1,9) identity component as JoinedIdQvC

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (front (i), measured-cheapest)
The N163 time-fixing SO(9) compact factor is BANKED (`joinedIdQvC_of_timeFixing_evCOrth_SO9`).
The residual to the full orthochronous proper Lorentz identity component is the NON-compact
boost factor + the polar assembly. The boost `boostEndC a b (t,x,v) = (a·t+b·x, b·t+a·x, v)`
(N129) is a QvC-isometry on the unit hyperbola `a²−b²=1` (`boostEndC_isQvIsomC`), and FIXES the
octonion block (acts only on the (t,x) plane).

GOAL: prove `JoinedIdQvC (boostEndC a b)` for every boost on the hyperbola through 1 — a
continuous, isometric, 1-parameter path of boosts from `boostEndC 1 0 = 1` to the target boost,
the HYPERBOLIC analogue of N159's `octPlaneRot` circle path. Then (if turns allow) the polar
assembly `g = boost · compact` glued by `joinedIdQvC_mul`.

## THE STEERING DECISION (the measured smallest obligation, W1/W9)
Two candidate hyperbola parametrizations through (a,b)=(1,0):
  - ROUTE A (rational hyperbolic-cayley): `a=(1+m²)/(1−m²)`, `b=2m/(1−m²)`. Then a²−b²=1
    identically. PRO: rational ⟹ continuous via the banked `LinearOrderedField+OrderTopology`
    machinery (like cayleyC/cayleyS). CON: POLES at m=±1, so only `ContinuousOn (Ioo −1 1)` —
    needs a ContinuousOn-flavored JoinedIdQvC path on a sub-interval, OR reaches only |b/a|<1
    (the full proper-orthochronous boost branch, which is exactly the one connected component —
    every real boost has |v|<1, so this is SUFFICIENT, not a restriction).
  - ROUTE B (sqrt steering): `a = cutSqrt(1+s²)`, `b = s`. Then a²−b²=1 identically, NO poles
    (1+s²≥1 always), GLOBALLY continuous IF `cutSqrt` is continuous. CON: `cutSqrt_continuous`
    is NOT banked (only cutSqrt_sq/_unique/_pos/_nonneg/_zero/_one). Building it = extra cost.

MEASURE-FIRST verdict will be set by the probe: pick whichever core compiles cheapest.
Preference: ROUTE A on the segment `uIcc 0 m` with m ranging over (−1,1) reuses N159's path
template (continuous via rational ops, `octPlaneRotPath_cont` pattern) and reaches EVERY boost
on the connected branch through 1 — the boost is ONE connected branch (no antipode issue),
so a single segment-style path through 1 suffices (THE ONE LAW: don't fight for the full
non-compact hyperbola; the identity component is one branch). If ROUTE A's pole-avoidance
fights, ROUTE B with a cheap `cutSqrt` continuity lemma.

## GO / NO-GO
- GO: a continuous isometric path `boostPath : Cut → End` (in endOpC) with `boostPath 0 = 1`,
  `boostPath` reaching the target boost, every point a QvC-isometry ⟹ `JoinedIdQvC (boostEndC a b)`
  for a (the relevant branch of) boosts, phrased in the NON-VACUOUS JoinedIdQvC; gate D0–D6
  green; costume C196 bites a WRONG boost-path / isometry / JoinedIdQvC claim; foundations-only;
  committed + LEDGER + ROADMAP; next node childed.
- PARTIAL/DECOMPOSE: bank the boost-path lemma `joinedIdQvC_boostEndC` alone; child the polar
  assembly `joinedIdQvC g = boost · compact`.
- NO-GO/BLOCK: if BOTH steerings fight after measure+reframe, honest W1 dissolution ticket.

## KILL (instrument-failure thresholds — a fight past these is INSTRUMENT, not theory)
- Any single tactic on the path-continuity or isometry obligation running >60s in a bounded
  probe ⟹ INSTRUMENT wall: decompose the obligation, do NOT inflate maxHeartbeats.
- The coercion-ambiguity pitfall (N163): `IsQvIsomC (a*k)` whnf-timeout ⟹ explicit
  `Module.End Cut STVC` ascription on the product, `Module.End.mul_apply`. NOT a theory fight.
- ≥2 probe runs ending at full budget banking nothing ⟹ W1 dissolution ticket.

## NON-VACUITY (W8)
The target MUST be the NON-VACUOUS `JoinedIdQvC` (not the vacuous `JoinedIdC`). The boost path
must STAY in the isometry group (every point a QvC-isometry on the hyperbola). Costume C196:
a WRONG boost-path/isometry/JoinedIdQvC claim reduces to a false numeric DISTINCT from the
banked battery (… C195 1=163) — use 1=164.

## PHYSICS-WORDS-REMOVABLE
Delete boost/Lorentz/hyperbola/rapidity/sinh/cosh/KAK/polar/compact/isometry/JoinedIdQvC/path:
the statement must stand as pure math — a continuous 1-parameter family of `Cut`-linear
endomorphisms of STVC, each preserving the indefinite form QvC, from the identity to a given
`(a·t+b·x, b·t+a·x, v)` with `a²−b²=1`, lies in a preconnected set of QvC-form-preservers
containing 1.
