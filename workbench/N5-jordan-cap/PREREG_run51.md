# N5e run 51 — PREREG (frozen before compute)

## Inherited state (verified)
- All 3 ingredients banked (Alternative, Helpers ocR, CompCentral) — oleans current.
- `Phys/Algebra/HermitianJordan/Linear.lean` UNCOMMITTED from run 50: jb_add_left/right,
  jdef_add_right (pure matrix additivity, `abel`). MEASURED this run: builds 4.2s,
  foundations-style. NOT a W9 fossil — it is cheap real infra. → bank it.
- Core entry (0,0) and (0,1) goals viewed via bounded probes (matrix expansion ~5s, cheap).
  Degree-4 octonion polynomials, ~40-48 monomials each.

## DEAD routes (do NOT re-run — confirmed runs 40-50)
- 4 brute normalizers; dense + CH span solvers; flat abel certificate (5 ways);
  `cdsimp <;> ring` (= simp add_mul/mul_add then ring) on any entry incl. core — KILLED >7GB.
- `cdsimp` ALONE on core (0,1): 43s/3.4GB whnf-timeout.
- matrix-associator combo over {A,B,A²}: NO-SOLUTION (mat_assoc.py).
- Artin 2-generated: core monomials mix up to 4 generators — no free pass.

## GO / NO-GO for THIS run
GO target (in priority):
  1. Bank Linear.lean additivity (certain). Wire into Phys.lean + AxiomAudit. [CERTAIN]
  2. ONE genuinely-new instrument attempt on core (0,0), HARD-BOUNDED, NOT a dead re-run:
     `ext` (to 4 B-coords) then projection-only simp (NO add_mul/mul_add) then `ring`,
     letting ring do the distribution from a less-expanded term (different instrument than
     the measured cdsimp+ring). KILL at 100s wall / 2GB RSS in a backgrounded probe.
  3. If (2) closes (0,0): attempt all 6 independent entries the same way, each its own
     bounded olean; assemble jdef_H3; reassemble jordan_cap_pinned_at_three; costume; gate; commit.
  4. If (2) does NOT close in bound: do NOT grind. Lock the manual sequenced-rewrite for (0,0)
     in a fast Python free-alternative-algebra reducer (scratch) to DE-RISK the next attempt,
     bank Linear.lean, sharpen FINDINGS, child the core close, complete as "decomposed" with
     the new banked infra + the reducer-locked sequence.

## KILL (instrument-failure classifier, W9)
- Any single tactic compile > 100s wall OR > 2GB RSS = INSTRUMENT failure → stop, do not retry,
  classify the route dead, record in FINDINGS.
- ≥2 bounded attempts ending at full budget banking nothing = stop attempting closes this run,
  go to decompose path (4).
- NEVER inflate maxHeartbeats beyond what a correct structural proof needs.
- NEVER run an unbounded compile inside the turn budget — every compile backgrounded + killed.

## STANDARD gate (second gate, mine to apply)
- unbroken: every object derived back to fold or Mathlib; nothing posited.
- complete: #print axioms ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide/bridge.
- physics-words-removable: delete Albert/exceptional/generation → pure statement that the
  symmetrized product on self-adjoint 3×3 over CD(CD B) satisfies the Jordan identity, cap ≤3.
- continuum gate: purely algebraic over ℚ — must NOT trip.

## Single-flight (W4): I am the sole chain tail (t_020a8571). Do NOT fork. If decompose,
## child onto MY task as parent (auto-promotes on completion).
