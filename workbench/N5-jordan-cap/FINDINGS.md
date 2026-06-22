# N5b — THE JORDAN CAP'S POSITIVE EDGE (H₃(𝕆) IS Jordan): FINDINGS

Target: prove `jdef (Hm …) (Hm …) = 0` for the general Hermitian 3×3 over the terminal
algebra `O ℚ` — pinning N5's cap EXACTLY at 3 (Part 1 proved failure at n≥4). The cap value
3 = the exact gap between `𝕆` ALTERNATIVE (kept) and ASSOCIATIVE (lost at the cascade stop).

## STATUS after run 45 (W3 decompose)
- **BANKED this node**: `Phys/Algebra/Alternative.lean` (the MOAT LEVER) +
  `Phys/Algebra/HermitianJordan/Setup.lean` (the carrier). Both compile, oleans exist,
  foundations-only (`#print axioms ⊆ {propext, Classical.choice, Quot.sound}` — verified).
- **CHILDED**: the order-3 Jordan-identity assembly (`jdef_H3 = 0`) — the heavy structural
  fact — onto the chain tail as a dedicated W1 dissolution node.

## THE STRUCTURAL TRUTH (decisive, from the workbench — this is what the child uses)
`free_defect.py` + `assoc_decompose2.py`: **every one of the 9 defect entries lies ENTIRELY
in the octonion ASSOCIATOR ideal** — the associative+central collapse of each entry is
EXACTLY 0 (0 nonzero (reals,word) groups out of 216 terms/entry). So each entry is a sum of
octonion associators `[x,y,z]=(xy)z−x(yz)`, and is killed by the **alternating-form laws**
banked in `Alternative.lean` (`assoc_swap12/23`, `alt_left/right/flex`, the Moufang trio).
This is the moat route: the field POSITS `H₃(𝕆)` is the (Albert) Jordan algebra; we DERIVE
it from the cascade's own alternativity. NO Mathlib JordanAlgebra/exceptional import.

## ⛔ DEAD ROUTES — DO NOT RE-RUN ANY OF THESE (W9.5 anti-circling)
All four are brute whole-expression normalizers over fully-expanded coordinates. Each was
MEASURED in a bounded probe this run (or by run 42/43). All are INSTRUMENT-WALL casualties
(W9). The absence of an `.olean` for any Entry file is proof they are unbuildable as written.

| # | route | result | evidence |
|---|-------|--------|----------|
| 1 | brute **ℚ-coordinate `ring`** on diagonal entry (Entry00, `maxHeartbeats 4e7`) | 16 min, RSS >9 GB, SIGTERM, ZERO output | operator note run #44; orig run 42 OOM-crashed |
| 2 | **`noncomm_ring` over the associative base H** (split outer CD layer only; Entry01–22) | LOGICALLY INSUFFICIENT — cannot ever close | `freeH_test.py`: 88–148 nonzero residual terms/entry in the FREE ASSOCIATIVE *-ring. The identity needs quaternion trace/norm CENTRALITY, not just associativity of H. |
| 3 | brute **abstract-`CD (CD B)` `ring`** (4 B-coords/octonion, star opaque) | 357 s, RSS 6 GB, FAILED (`simp` max-recursion + `ring` reports noncommutative) | `probe_abstractB.lean` → `/tmp/probe_abs.log` |
| 4 | brute **ℚ-coordinate `ring` on OFF-diagonal entry (0,1)** (`maxHeartbeats 2e6`) | 71 s, RSS 4.3 GB, deterministic timeout at `whnf` | `probe_off01.lean` → `/tmp/probe_off01.log` |

KEY LESSON (THE ONE LAW / W9.4): the brute coordinate/normalizer form is a SMELL that the
structural reduction is being skipped. The defect IS a sum of associators (route truth above);
attack it through the banked alternating-form lemmas, NOT by expanding 6–8 octonions into
48 ℚ-coordinates and calling `ring`.

## THE CHILD'S JOB (the dissolution)
Assemble `jdef_H3 = 0` entrywise WITHOUT a brute normalizer:
1. Reduce each matrix entry of `jdef (Hm A) (Hm B)` to a Lean expression in the octonion
   entries `a,b,c,p,q,r`, their `star`s, and the central reals `ocR dᵢ`, via `Matrix.mul_apply`
   + `Fin.sum_univ_three` + the `Hm`/`ocR` defs (CHEAP — no `ring`, just `simp` unfolding).
2. Rewrite the resulting degree-4 octonion polynomial as an explicit ℤ-combination of
   associators `assoc x y z` (the workbench `assoc_decompose*.py` give the exact combination
   per entry; port that bookkeeping).
3. Kill each associator with the banked alternating-form lemmas + centrality of `ocR`
   (real diagonal commutes & associates — see workbench `scratch_diag3.lean` `ocR_comm`,
   `ocR_assocL/M/R`, which compile cheaply and should be promoted into Setup or a helper).
   This is the classical Jacobson/Schafer "H₃ over an alternative ring is Jordan" proof; in
   Lean it is multi-page associator algebra, no automation — hence a dedicated node.
4. Each entry as its OWN lemma in its OWN file (freeze-on-compile, W9.3 banks the olean once).
   Add the H3 wrong-cap costume back (`jdef`-entry ≠ 0 → false core) once `entry_00` exists.

Carrier + lever are READY and banked; the child only needs the associator bookkeeping.
