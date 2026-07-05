# N298 — PREREG (directed route-finder; W1 step 2 REFRAME succeeded → the FORCED core, remainder childed)

## DECISION (fresh-context; the ticket's target reframed through the trunk, S3 ALIGN-then-REFINE)
**N298 — THE INVARIANCE (ASSOCIATIVITY) OF THE DERIVED CARTAN–KILLING TRACE FORM, AND THE
CONSEQUENT ANNIHILATION OF THE LINEAR TRACE BY THE f₄-GENERATORS.**

The ticket's leading target — "derH3 kills jTr for EVERY T, splitting L = ℚ·1 ⊕ L₀ as f₄-modules"
— is, on honest inspection, NOT forceable from the banked `IsHermJordanDerivQ` predicate alone.
The predicate gives only the Leibniz law (`T (jb A B) = jb (T A) B + jb A (T B)`) + Hermitian
preservation. From Leibniz alone, `jTr(T A) = 0 ∀A` is EQUIVALENT to `T` being `jTraceForm`-skew,
and NEITHER is derivable from the other without the independent theorem **Der(H₃O) = InnDer**
(every Jordan derivation of H₃(O) is inner — Chevalley–Schafer). That is a genuine structural
theorem, not a rewrite. So the FULL-predicate claim is W1-hard and is CHILDED.

BUT W1 step 2 (reframe through the trunk) DISSOLVES the FORCED part cleanly. The theory-native
object is not the abstract predicate — it is the **derived trace form itself**. A Cartan–Killing
form's defining property is INVARIANCE (associativity): `⟨AB, C⟩ = ⟨A, BC⟩`. Over the octonions
the PRODUCT is non-associative, yet the REAL-PART TRACE is associative (`reQ_mul_assoc3`, N209 —
the trunk fact the calibration 3-form already rests on). Lifted to 3×3 matrices this gives the
trace form's associativity, and from THAT the f₄-GENERATORS — both the entrywise g₂-derivations
`jActL D` and the inner-derivation complement `innerMul A B = ⁅Lmul A, Lmul B⁆` (N274, the very
`f₄ ⊋ g₂` complement) — annihilate the linear trace. This is the FORCED, W9-free core the ticket
was reaching for, and it does NOT need Der(H₃O)=InnDer.

## MEASUREMENTS (workbench/N298/probe1.py, exact-Fraction octonion + numpy, EXIT 0)
- (1) reQ-trace CYCLICITY `reQ tr(XY)=reQ tr(YX)`: max resid 3.6e-15 (exact).
- (2) reQ-trace ASSOCIATIVITY `reQ tr((XY)Z)=reQ tr(X(YZ))`: 2.8e-14 (exact) — despite non-assoc.
- (3) TRACE-FORM INVARIANCE (reQ) `reQ jTF(jb A B,C)=reQ jTF(A,jb B C)`: 8.5e-14 (exact).
- (4) FULL (non-reQ) trace-form assoc FAILS: residual 303 — so the identity is a reQ fact,
  bridged to the banked octonion-valued `jTr` on the HERMITIAN arena via reality (jTr H = ocR rtr H).
- (5) innerMul kills jTr: general args reQ 8.5e-14; Hermitian args FULL 6.4e-14; imag part 2.8e-14.
- (6) reality: for Hermitian args, `T A` is Hermitian (2.1e-14) ⇒ diagonal real ⇒ jTr real.
- (7) FALSE-ROUTE reconfirm: `innerMul A B M ≠ [[A,B],M]` residual 150 (N297's W9 diagnosis holds;
  the trace-of-commutator route is DEAD — this is genuinely the reQ-associativity route).

## DE-RISK (workbench/N298/ProbeN298{,b,c,d}.lean, `$LAKE env lean`, EXIT 0 — 8–14s LIGHT each)
- ProbeN298:  `rtr_mul_comm` (reQ-trace cyclicity, matrix level).
- ProbeN298b: `rtr_mul_assoc` (reQ-trace associativity, matrix level, via 27× `reQ_mul_assoc3`).
- ProbeN298c: `rtr_jb_assoc` (trace-form associativity `rtr(jb(jb A B)C)=rtr(jb A(jb B C))`, via
  cyclicity+assoc), `innerMul_kills_rtr` (via assoc + jb symmetry), `jActL_kills_rtr` (via
  `derivQ_reQ_zero`). ALL banked-lever, W9-free.
- ProbeN298d: `herm_jTr_eq_ocR_rtr` (reality bridge, via `selfconj_eq_smul` + `ocR`).
All LIGHT (≤14s), NO native_decide, NO octonion coordinate ring, NO maxHeartbeats raise.

## SCOPE (banked-lever, W9-free, forward, non-vacuous)
BANK (Phys/Algebra/OctonionJordanTraceFormInvariance.lean, ns Phys.Algebra.HJ):
1. `rtr` — the deep-real linear trace `reQ (jTr ·)` (supporting) + `rtr_expand`/`rtr_add`/`rtr_sub`.
2. `rtr_mul_comm` — reQ-trace CYCLICITY (the matrix lift of `reQ_mul_comm`, N209).
3. `rtr_mul_assoc` — reQ-trace ASSOCIATIVITY (the matrix lift of `reQ_mul_assoc3`, N209).
4. ★★ `traceform_associative` — `rtr (jb (jb A B) C) = rtr (jb A (jb B C))`: the derived
   Cartan–Killing trace form is INVARIANT/associative. THE genuinely-new structural lever.
5. ★★★ `innerMul_kills_trace` — `rtr (innerMul A B M) = 0`: the inner-derivation complement
   (the `f₄ ⊋ g₂` generators, N274) annihilates the linear trace, via (4) + `jb A B = jb B A`.
6. ★★ `jActL_kills_trace` — `rtr (jActL D M) = 0` for `IsDerivQ D`: the entrywise g₂-derivations
   annihilate the linear trace, via `derivQ_reQ_zero` (N-bound).
7. `herm_jTr_eq_ocR_rtr` — reality bridge (Hermitian ⇒ jTr = ocR rtr): connects the octonion-valued
   `jTr` (N214) to `rtr` so the killers read on the banked trace.
8. W8: a concrete NONZERO trace witness contrasting the killers (e.g. `rtr 1 = 3 ≠ 0`,
   `rtr (Lmul 1 1) = 6 ≠ 0` from N297 dilation) — the annihilation is non-vacuous.
9. capstone `trace_form_invariance_structure` — bundles: trace-form associativity ∧ innerMul kills
   trace ∧ jActL kills trace ∧ reality bridge ∧ the nonzero contrast ∧ `jordan_fails_H4` in TYPE.

CHILD (the ONE successor, a directed route-finder): "Der(H₃O) = InnDer" (every Jordan derivation
is inner) → the FULL abstract `∀ T ∈ derH3, jTr(T A) = 0` → the f₄-module split L = ℚ·1 ⊕ L₀.
The generators-kill-trace banked here reduces the remaining gap to exactly the innerness theorem.

NOT banked: the full-predicate abstract invariance (childed, needs Der=InnDer); the dim-78 bundled
e₆; the ★5 mass texture VALUE (route-not-yet-found — this trace-form invariance is a rung of the
named ascent); the ★2 mixing VALUE (route-not-yet-found); "= physical trace anomaly" (removable).

## WHY THIS IS THEORY-NATIVE, NOT A STANDARD-MATH ADJACENT LEMMA (anti-bullshit gate)
- FORCED arrow: fold → non-assoc octonions (N2c) → cap H₃(O) (N5) → the derived trace form is a
  Killing form whose invariance IS the octonion reQ-trace associativity (`reQ_mul_assoc3`, N209) —
  a fact FORCED by the SAME non-associativity that stops the cascade (the real part is associative
  precisely because the associator is pure-imaginary). The generators of the derived symmetry then
  kill the grading functional. Every arrow forced; no posit.
- Words removed: over ℚ and O ℚ, for `jb A B = A*B+B*A` on 3×3 matrices: `reQ tr((AB)C) =
  reQ tr(A(BC))`; `reQ tr(jb(jb A B)C) = reQ tr(jb A(jb B C))`; `reQ tr(⁅Lmul A,Lmul B⁆ M) = 0`;
  `reQ tr(map D M) = 0` for D a derivation of O. Pure matrix algebra — stands. A real reason survives.
- Standard temptation NAMED: "prove Der(H₃O)=InnDer, then trace-kill is a one-liner." REJECTED —
  that is the W1-hard theorem; forcing it now would be the standard route. The theory offers the
  SHORTER stroke: the trace form's OWN associativity (from the octonion trunk) kills the trace for
  the GENERATORS directly, no innerness needed. That is the fold-native move; the innerness is childed.
- Free-floating check: every production TYPE mentions the banked derived objects (`jb`, `Lmul`,
  `innerMul`, `jActL`, `jTr`, `Dg`, `O ℚ`, Matrix (Fin 3)); NOT generic over an arbitrary algebra.

## COSTUME
Next BID C327. Bites at the trace-form-invariance / generator-annihilation non-triviality: a WRONG
reading (the trace form is NOT invariant / the f₄-generators do NOT kill the trace / the killers are
vacuous) reduces to a false numeric. Anchor a TRUE nonzero contrast — `rtr (Lmul 1 1) = 6` (the
dilation MOVES the trace, N297 `dilation_moves_trace` + reality) vs the generators killing it —
packaged as `min 327 6 = 6`; the bogus `min 327 6 = 327` reduces to `6 = 327`. Pair fresh, RHS 327.

## FILE
Phys/Algebra/OctonionJordanTraceFormInvariance.lean (ns Phys.Algebra.HJ)
