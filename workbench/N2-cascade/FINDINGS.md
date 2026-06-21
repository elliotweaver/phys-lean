# N2 rung 1 — FINDINGS (post-run, the actual result)

*Written AFTER the run. Records what was actually proved, the concurrency event, and the
decomposition handoff. The frozen contract is PREREG.md (do not edit that to fit this).*

## Result: GO. Rung 1 of the cascade is BANKED.
`Phys/Cascade/ComplexUnit.lean` — 29 theorems, gate-green (D0–D6), foundations-only
(`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}), STANDARD met
(unbroken / complete / physics-words-removable), 5 costumes bite.

## What got proved (the forced first rung, derived FORWARD from N1)
THE NOTION (rooted in N1):
- `IsFoldRoot J := IsFold (fun x => J (J x))` — a *square root of the fold*. Defined via N1's
  `IsFold`, so the chain back to the fold is explicit.
- `isFoldRoot_iff` : a fold-root squares to `-id` (`J (J x) = -x`). Uses N1's `fold_eq_neg`.

THE OBSTRUCTION (positivity forbids it on the line — two independent proofs, ONE cause):
- `scalar_isFoldRoot_iff` : scaling by `j` is a fold-root iff `j*j = -1`.
- `sqrt_fold_not_on_line` : on an ordered ring, `j*j ≠ -1` (self-overlap `≥ 0 > -1`).
- `foldRoot_forces_even_dim` : ★ THE WHY-DOUBLE LAW — a real-linear fold-root forces EVEN
  dimension (`det(J)² = (-1)^dim ≥ 0`). The base (dim 1, odd) is blocked.
- `no_foldRoot_dim1`, `no_foldRoot_dim1_of_evenLaw` : no fold-root on ℝ — proved directly AND
  as a corollary of the even-dim law, making explicit they are the SAME positivity fact.

THE RESOLUTION (doubling 1 → 2; the algebra and its product are FORCED):
- `J₂` on `ℝ × ℝ`, `J₂_isFoldRoot`, `J₂_self_blind` (via N1's `fold_self_blind`) — the minimal
  even dimension ACHIEVES a self-blind fold-root operator.
- `Dbl R` + `instance : CommRing (Dbl R)` — THE COMPLEX ALGEBRA over any base ring (the cascade
  object; N2b doubles it again to ℍ). Did not collapse.
- `Dbl.mul_forced` : ★ THE PRODUCT IS FORCED — any unital bilinear product with `J*J = -1` is
  UNIQUELY the Cayley–Dickson product. The crown defense: the product is derived, not chosen.
- `Dbl.J_mul_J` : ★ THE COMPLEX UNIT, DERIVED — `J*J = -1` in the forced algebra. The unit N1
  deferred, now a theorem.
- `Dbl.J_self_blind` (via N1's `fold_self_blind`), `Dbl.J_not_scalar`, `Dbl.J_nonvacuous`.

## Tightness / anti-vacuity (anti-W8)
- `sqrt_fold_on_unordered_line` : `2*2 = -1` in `ZMod 5` — drop the order and the root reappears
  on the line. Proves the obstruction is POSITIVITY, not algebra; the order hypothesis is
  load-bearing. (This is the positive complement of costume C4.)
- `obstruction_nonvacuous` over ℚ, `J_nonvacuous` over ℚ.
- 5 costumes bite (C1 N1 + C2 dim-1 + C3 swap-sign + C4 ordered-line root + C5 algebra-unit sign).

## Concurrency event (W4 fork — handled, see task comment 31)
The dispatcher DOUBLE-SPAWNED this task: PID 85857 (== run-16 lock 53493, me) and PID 85856
(duplicate, no lock). The duplicate wrote a complete operator-style rung-1 body
(`ComplexUnit.lean` with the even-dim law, `J₂`, FoldRoot costumes) during my run; I independently
wrote a forced-algebra body (`RecursiveFold.lean`). I SIGTERM'd the duplicate (reaped) BEFORE any
build to restore single-flight, then CONVERGED both correct bodies into one `ComplexUnit.lean`
(kept the duplicate's why-double law + my forced-product algebra), deleting `RecursiveFold.lean`.
No work from either worker was discarded; both were correct foundations-only Lean.

## Decomposition (RUNBOOK W3): rung 1 banked, remainder → child N2b
N2's full target (the whole cascade + the proved STOP) is large. Rung 1 (the forced complex unit)
is banked here. The remainder — RUNG 2 (double again → quaternions, lose commutativity), RUNG 3
(double again → octonions, lose associativity), and the proved STOP (the next double loses the
composition/Born law because 𝕆 is non-associative — "one cause, many terminations") — is enqueued
as the linked child N2b. N2 (this task) is completed as "decomposed: rung 1 done, N2b enqueued".
