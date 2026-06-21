# N2b — FINDINGS (numerics-with-teeth, exact rational arithmetic)

Probe: `workbench/N2b-quaternion/numerics.py`. ONE operation — the Cayley–Dickson DOUBLE
`CD A` (re/im pairs with `star (a,b) = (a*, −b)` and product `(a,b)(c,d) = (ac − d* b, da + b c*)`)
— applied repeatedly from the base line `R` (where `star = id`). Exact `Fraction` arithmetic;
each rung's claimed property AND its garbage witness probed.

## Results (all as the theory predicts — the cascade and its stop)

| rung | dim | commutative | associative | norm law N(xy)=N(x)N(y) | division |
|------|-----|-------------|-------------|--------------------------|----------|
| C = CD(R)   | 2  | YES | YES | (yes) | yes |
| H = CD(C)   | 4  | **NO**  | YES | (yes) | yes |
| O = CD(H)   | 8  | NO  | **NO**  | YES | yes (no zero divisors) |
| S = CD(O)   | 16 | NO  | NO  | **NO** (4064 ≠ 4160) | **NO** (zero divisors) |

## The CAUSE chain (one cause, many terminations — each loss caused by the previous rung's loss)
- **H loses commutativity** BECAUSE the base C has `J` with `star J = −J ≠ J`. Canonical witness:
  `ι(J)·e₂ = (0,0,0, 1)` but `e₂·ι(J) = (0,0,0,−1)`. They differ EXACTLY because `star J ≠ J`.
  (This is the rung-2 content of N2b: the rung-1 complex unit is the cause.)
- **O loses associativity** BECAUSE the base H is non-commutative. (rung-3 content → child N2c.)
- **S loses the norm/composition (Born) law + gains zero divisors** BECAUSE the base O is
  non-associative. Structured zero divisor found: `(e₁+e₁₀)(e₅+e₁₄) = 0`. (THE STOP → grandchild.)

## Star is anti-multiplicative at every level: `star(xy) = star(y)·star(x)` ✓ (C, H, O all confirmed).

## Garbage witnesses each rung MUST reject (the costumes, by rung)
- rung 2 (N2b, this node): "H is commutative" is FALSE (concrete non-commuting pair exists);
  "the doubled star is multiplicative not anti-multiplicative" is FALSE at dim 4.
- rung 3 (child N2c): "O is associative" is FALSE (non-associating triple exists).
- stop (grandchild): "S keeps the norm law / has no zero divisors" is FALSE.

## Bankable-this-run conclusion
The doubling `CD` and rung 2 (`H R := CD (Dbl R)`: associative RING, NON-commutative, cause =
base `star ≠ id` witnessed by the rung-1 `J`) are solid and ready for production Lean. Rung 3
(𝕆 non-associativity) + the STOP (norm law dies past 𝕆) are DECOMPOSED into linked child N2c.

## GO/NO-GO DECISION (post-production): GO
Banked, gate-green, STANDARD-met:
- `Phys/Cascade/Double.lean` — the generic Cayley–Dickson doubling `CD A` (one operation reused
  at every rung): `Ring (CD A)` (associativity survives), `StarRing (CD A)` (conjugation
  propagates so the cascade can iterate), `CD.iota_e2_comm_iff` (★ THE ONE CAUSE: the double
  commutes on `ι a, e₂` iff `a = star a`).
- `Phys/Cascade/Quaternion.lean` — rung 2 `H R := CD (Dbl R)`: `Dbl` made a `StarRing`
  (complex conjugation), `Dbl.star_J` (`J* = −J`), `Dbl.J_ne_star_J` (`J ≠ J*` when `2 ≠ 0` —
  the SAME 2-torsion condition the trunk's self-blindness rests on), `H_associative`
  (associativity PRESERVED), `commutativity_cause` / `not_commutative_witness` /
  `not_commutative` (★ loss of commutativity, caused by the rung-1 unit), `comm_products`.
- Costumes C6 (claim `H` commutative → `1 = -1`) and C7 (claim doubled star multiplicative not
  anti → `-1 = 1`) BOTH bite. Gate D0–D6 green; 37 audited theorems foundations-only.
- physics-words-removable: every physics word lives only in docstrings; every statement is pure
  algebra (the CD double of a commutative associative `*`-ring with a non-self-conjugate element
  is an associative non-commutative ring, the non-commutativity caused exactly by that element).

Anti-W8 (too-easy-is-a-bug) cleared: the witness is CONCRETE (`comm_products`: `J` vs `−J`),
associativity is a REAL preserved theorem (the structure didn't collapse), and the `2 ≠ 0`
hypothesis is load-bearing (in char 2 the complex unit is self-conjugate and the loss vanishes).

NOTE (KILL-condition non-trigger): the only "fight" was `J ≠ J*` being FALSE in characteristic 2.
Per THE ONE LAW this was NOT patched with an ad-hoc hypothesis — it was recognised as the SAME
2-torsion-free condition N1's self-blindness already requires (return to the trunk). The
hypothesis `(2 : R) ≠ 0` is the trunk's own positivity/torsion condition, not a new posit.

