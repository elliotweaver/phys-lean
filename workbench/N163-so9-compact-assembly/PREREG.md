# N163 PREREG — THE FULL TIME-FIXING SO(9) COMPACT FACTOR ASSEMBLY (peel ∘ closure)

Frozen BEFORE compute. Classifies any fight as INSTRUMENT failure (W5/W9), not theory.

## TARGET (priority (i) — measured the lightest)
Combine N158's time-fixing peel (`joinedIdQvC_of_timeFixing_evCOrth_peel`) with N162's
unconditional octonion-block SO(8) closure (`joinedIdQvC_octBlockEndC_of_det_one`) to reach the
FULL time-fixing SO(9) compact factor as the NON-VACUOUS `JoinedIdQvC`.

## MEASURE-FIRST RESULT (the smallest obligation, computed before committing)
The peel reduces `JoinedIdQvC k` to `JoinedIdQvC (deflateNinth x' v' * k)`. That stabilizer
factor `S₀ := deflateNinth x' v' * k` FIXES BOTH the timelike axis `(1,0,0)` AND the `x`-axis
`(0,1,0)` (deflateNinth fixes time — `axisRotLin` fixes `p.1`; `deflateNinth_step` fixes `x`; `k`
fixes both by hypothesis + the deflation). N162's bridge needs `S₀ = octBlockEndC R` with `R` a
`gFormC`-isometry of `LinearMap.det R = 1`.

THE SINGLE MISSING LINK = an EXTRACTION (genuinely new, reusable, pure-trunk infrastructure):
  **A `QvC`-isometry `g` fixing `(1,0,0)` and `(0,1,0)` equals `octBlockEndC (vBlockEndC g)`,
    and `vBlockEndC g` is a `gFormC`-isometry of `O Cut`.**
PROOF (trunk only, via BvC-orthogonality):
 - `g` linear QvC-isom ⟹ BvC-isom (`linIsom_BvC_preserved`, N51).
 - For `w := g (0,0,v)`: `BvC(w, g(1,0,0)) = BvC((0,0,v),(1,0,0)) = 0` and `g(1,0,0)=(1,0,0)`,
   and `BvC(·,(1,0,0))` reads the t-slot ⟹ `w.1 = 0`. Likewise `BvC(·,(0,1,0))` reads `−x`-slot
   ⟹ `w.2.1 = 0`. So `g(0,0,v) = (0,0,(g(0,0,v)).2.2)`.
 - Decompose `(t,x,v) = t•(1,0,0)+x•(0,1,0)+(0,0,v)`, push `g` through linearity ⟹ `g = octBlockEndC R`.
 - `BvC((0,0,u),(0,0,v)) = −gFormC u v` ⟹ `gFormC (R u)(R v) = gFormC u v` (R is `IsGFormCIsom`).

## THE det+1 CONDITION — HONEST, NOT A WEAKENING
`JoinedIdQvC` is the path-component-of-the-identity predicate. `det` is continuous and `{±1}`-valued
on the isometry group, hence LOCALLY CONSTANT: a `det = −1` element is in the OTHER topological
component and is GENUINELY NOT `JoinedIdQvC`. So `det R = 1` is the EXACT characterization of the
identity component (SO(8) ⊂ O(8) that N162 closed) — requiring it is stating the target correctly,
NOT shrinking it. The full O(9) compact factor is NOT path-connected; only SO(9) (= det+1) is.

## DELIVERABLES (bank-as-you-go)
1. `vBlockEndC g : O Cut →ₗ[Cut] O Cut := v ↦ (g (0,0,v)).2.2`  [def]
2. `qvIsomFixingTX_eq_octBlockEndC` — the EXTRACTION (g = octBlockEndC (vBlockEndC g) + IsGFormCIsom).
3. `joinedIdQvC_of_xtFixing_det_one` — x-FIXING direct case (extraction + N162, no peel).
4. ★★ `joinedIdQvC_of_timeFixing_evCOrth_SO9` — THE ASSEMBLY: k QvC-isom + EvC-orth + time-fixing
   + x-moving (v'≠0) + det(vBlock of stabilizer)=1 ⟹ JoinedIdQvC k. (peel + extraction + N162.)
5. W8 costume C195 + a non-vacuity witness theorem.

## GO / NO-GO
GO if the extraction compiles cheaply (pure trunk, no heavy tactic) and the assembly is a direct
compose of three banked theorems. NO-GO / DECOMPOSE if the extraction's linearity push or the
octBlockEndC equality needs a heavy normalizer — then bank the extraction alone and child the rest.

## KILL (instrument-failure thresholds)
- Any single tactic > 60s on the extraction or assembly ⟹ STOP, decompose (it is a structural
  reduction, NOT a coordinate bash; brute force is the smell).
- ≥2 probe rounds banking nothing ⟹ W9 dissolution child, not a grind.
- No `maxHeartbeats` inflation. No monolithic `ring`/`decide`/`simp` on expanded STVC coordinates.

## NEXT NODE (child onto chain tail after landing)
N164 — the boost/polar NON-compact factor (a hyperbolic analogue of `octPlaneRot`, the KAK/polar
split) toward the FULL SO⁺(1,9) identity component; OR the x-flip-compensation coset sub-case
(k(0,1,0)=(0,−1,0), v'=0, det+1). Specify against what N163 actually produces.
