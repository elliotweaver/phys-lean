# N157 — PREREG (frozen before production compute)

Task: t_8e91e2b0. Node N157. Date: 2026-06-28.

## FIRST ACT — MEASURE-FIRST FINDINGS (THE ONE LAW fired)

The ticket's priority (i) was: discharge `hgivens` of N156's `bvIsom_joinedIdC_of_axisRotWord`
(every compact QvC-isometry k is a finite product of unit-axis Givens rotations axisRotLin e c s)
→ "the FULL SO⁺(1,9) path-connectedness UNCONDITIONALLY (∀ S, IsBvIsomLin S → JoinedIdC S)".

I MEASURED the smallest obligations BEFORE committing and found TWO fatal problems with the
literal target — both instances of THE ONE LAW (the target fights me because the framing drifted):

### FINDING 1 — `hgivens` is UNSATISFIABLE as stated.
`bvIsom_joinedIdC_of_axisRotWord`'s `hgivens` hypothesis quantifies over ALL `IsQvIsomC k`.
But `IsQvIsomC k := ∀ p, QvC (k p) = QvC p` is the FULL indefinite O(1,9) isometry group (QvC =
t² − x² − gFormC v v, signature (1,9)). Every `axisRotLin e c s` FIXES the time coordinate
(`axisRotLin_apply` first component is literally `p.1`), so every Givens word fixes time. A BOOST
`boostEndC a b` is `IsQvIsomC` (it is `IsBvIsomLin` → `bvIsomLin_isQvIsomC`) but MOVES time. So
"every QvC-isometry is a time-fixing Givens word" is FALSE — `hgivens` can never be supplied for
the full QvC group. The hypothesis as written ranges over the wrong set.

### FINDING 2 — the conclusion `JoinedIdC` is VACUOUS (PROVED in Lean, Probe.lean).
`JoinedIdC g := ∃ Conn, IsPreconnected Conn ∧ 1 ∈ Conn ∧ g ∈ Conn` places NO constraint that
`Conn` consists of isometries. The ambient `Module.End Cut STVC` is a topological vector space
in `endOpC`; the convex segment `segLin g t := (1−t)•1 + t•g` is continuous (each eval is
`(1−t)•v + t•(g v)`, continuous), with preconnected image, joining `1` (t=0) to `g` (t=1).
⟹ `joinedIdC_everything : ∀ g, JoinedIdC g` — PROVED foundations-only (Probe.lean, 37s, axioms
{propext, Classical.choice, Quot.sound}). So `JoinedIdC g` is TRUE FOR EVERY OPERATOR. The
N152–N156 "path-connectedness" arc, stated via `JoinedIdC`, proves a VACUOUS conclusion: in
`bvIsom_joinedIdC_of_axisRotWord` the hypothesis `IsBvIsomLin S` does ZERO logical work — `JoinedIdC S`
holds for any S whatsoever. This is the physics-words-removable test failing at the predicate level:
delete "isometry/path-connected" and the theorem says "every operator lies in a preconnected set
with 1", which is just the connectedness of the vector space — load-bearing physics word = a HOLE.

Additional structural fact (not separately probed, standard): even the CORRECTED target
"∀ S IsBvIsomLin → reachable-within-the-group" is FALSE for the full BvC group — O(1,9) has 4
components; `-1` (PT) is `IsBvIsomLin` (BvC(−p,−q)=BvC p q) but reverses time-orientation, so it is
NOT in the identity component. Only the IDENTITY COMPONENT (SO⁺) is path-connected to 1.

## THE TRUNK-NATIVE REFRAME (what this node actually banks)

The honest, non-vacuous object is the GROUP-CONSTRAINED path-component predicate:

  `JoinedIdQvC g := ∃ Conn, (∀ x ∈ Conn, IsQvIsomC x) ∧ IsPreconnected Conn ∧ 1 ∈ Conn ∧ g ∈ Conn`

— g is reachable from 1 by a preconnected set THAT STAYS IN THE ISOMETRY GROUP. PROVED in ProbeB.lean
(7.9s, clean): the full engine carries over NON-VACUOUSLY because `axisRotPath_isQvIsomC` (N156)
makes the rotation path a path OF ISOMETRIES:
  - `joinedIdQvC_one`, `joinedIdQvC_mul` (engine — connecting set stays in the group via
    right-translate `A·b` which preserves isometry since b is an isometry), `joinedIdQvC_listProd`,
  - `joinedIdQvC_axisRotLin` (the NON-VACUOUS general-axis base case — needs the UNIT axis `he`),
  - `joinedIdQvC_axisRotProd` (a finite UNIT-axis Givens word is JoinedIdQvC, non-vacuously),
  - ★ `joinedIdQvC_isQvIsomC` (THE NON-VACUITY — a JoinedIdQvC operator MUST be a QvC-isometry, so
    unlike JoinedIdC it is NOT satisfied by arbitrary operators; THIS is the load-bearing
    distinction the whole arc was missing).

This is genuinely NEW structure (it repairs the vacuity) and is the correct per-factor lever the
SO(9) exhaustion feeds. It also makes the conditional honest: an `IsQvIsomC k` presented as a
unit-axis Givens word is `JoinedIdQvC`, and `JoinedIdQvC` is a real (group-internal) reachability.

## GO / NO-GO

GO (primary, BANKABLE this run): bank the corrected non-vacuous `JoinedIdQvC` engine + the
non-vacuous general-axis base case + the Givens-word product + the non-vacuity lemma
`joinedIdQvC_isQvIsomC`. This is the immediately-bankable structural piece (W3) that repairs the
vacuity of the N152–N156 predicate and is the correct lever for the exhaustion. All PROVED clean
in ProbeB (7.9s).

GO (secondary, if turns allow): wire the genuine compact-factor exhaustion. The genuine factor
`k` (from `bvIsomLin_compact_factor_spec` N131) is EvC-orthogonal AND a QvC-isometry; the
deflation strand (N115/N116 `deflateNinth_step`/`deflate_factorization`) + the SO8 reflection
exhaustion skeleton (N123 `reflection_exhaustion`) are the engines. MEASURE whether the full
recursion to a unit-axis Givens word closes; if it RESISTS, DECOMPOSE (bank the JoinedIdQvC engine,
child the genuine SO(9) Givens-word exhaustion on the time-fixing compact factor).

NO-GO: do NOT re-prove `JoinedIdC`-flavored statements (vacuous). Do NOT supply `hgivens` for the
full QvC group (unsatisfiable). Do NOT claim "∀ IsBvIsomLin → JoinedId*" unconditionally (false —
4 components). Do NOT weaken to close; do NOT add a hypothesis to force a vacuous pass.

## KILL (W9 — instrument-failure threshold)

KILL = 90s per single obligation. If any obligation exceeds 90s in an isolated probe → declare
INSTRUMENT failure, decompose/reframe, do NOT inflate maxHeartbeats. Max runtime 2700s/45min;
checkpoint+commit the JoinedIdQvC engine by ~50% budget; FINALIZE (commit + gate-bg + child +
complete) with turns to spare.

## COSTUME (C189) — must BITE a wrong claim, distinct false numeric.
Plan: a WRONG JoinedIdQvC / non-vacuity / general-axis base-case / Givens-word read-off forces a
false numeric DISTINCT from the banked battery (… C188 1=156). Use `1 = 157`. The general-axis
quarter-turn `axisRotLin e 0 1` is JoinedIdQvC (non-vacuously, unit axis), and as an isometry
genuinely reads a coordinate; a wrong claim forces `1 = 157` in Cut.
