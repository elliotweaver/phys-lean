# N2b — CASCADE rung 2 (ℍ) + the generic DOUBLING operation — PREREG (frozen BEFORE production code)

*Frozen at the start of the N2b run, BEFORE any production Lean. Do NOT edit to fit the result.
This fixes what counts as success BEFORE the theorems are banked. N2b is LARGE (rungs ℍ, 𝕆 +
the proved STOP); per RUNBOOK W3 this PREREG covers the FIRST bankable part — the generic
Cayley–Dickson DOUBLING operation `CD` and rung 2 (ℍ + the proved LOSS OF COMMUTATIVITY) — and
commits to DECOMPOSING the remainder (rung 3 𝕆 + the proved STOP) into a linked child N2c.*

## What is BANKED upstream (import + USE, do NOT re-derive — RUNBOOK W2)
- N1 (`Phys/Foundation/Fold.lean`): the fold `IsFold look := ∀ x, look x + x = 0`; `fold_eq_neg`,
  `fold_involutive`, `fold_self_blind`.
- N2 rung 1 (`Phys/Cascade/ComplexUnit.lean`): the forced complex ALGEBRA `Dbl R` (a `CommRing`
  over any `CommRing R`), with `Dbl.J_mul_J` (`J*J=−1` DERIVED), `Dbl.mul_forced` (product
  uniquely forced by `J²=−1`+bilinearity), `Dbl.J_self_blind`, `Dbl.decomp`, `Dbl.ι`.

## The forward derivation (the honest cascade — derive forward by DOUBLING, never assume backward)
The cascade advances by ONE operation: the Cayley–Dickson DOUBLE. Rung 1 produced `Dbl R = R×R`
with the conjugation trivial on the base line (`star = id` on the ordered line `R`). Rung 2 is
the SAME doubling applied again — but now to a carrier whose conjugation is NON-trivial.

Generic doubling `CD A` (the operation, to be BUILT — Mathlib lacks a non-associative-closed CD
double; W1.1 "build the structure, do not panic"): elements `(a,b)`, with
- conjugation  `(a,b)* = (a*, −b)`
- product      `(a,b)·(c,d) = (a·c − d*·b , d·a + b·c*)`
This is the Cayley–Dickson construction over a `*`-ring; it specializes to `Dbl`'s product when
`star = id` on the base (the rung-1 case). The complex unit derived at rung 1 makes the base
conjugation NON-trivial (`J* = −J ≠ J`), and THAT non-triviality is the cause below.

RUNG 2 (this run) — **doubling the complex algebra loses commutativity (ℍ).**
`H R := CD (Dbl R)`. Because the base `Dbl R` is commutative AND associative, the double `H R`
stays ASSOCIATIVE (a genuine ring). But because the base conjugation is NON-trivial (`J ≠ J*`),
the double LOSES COMMUTATIVITY. The precise cause (one cause): in `CD A`,
`(ι a)·e₂ = (0, a)` while `e₂·(ι a) = (0, a*)` where `e₂ := (0,1)`; these differ iff `a ≠ a*`.
Taking `a = J` (the rung-1 complex unit, `J ≠ J*`) exhibits a NON-commuting pair in `H R`. The
loss of commutativity is FORCED by the rung-1 complex unit, not asserted.

The remainder (RUNG 3 𝕆: doubling the associative-but-non-commutative `H R` loses associativity;
STOP: doubling the non-associative 𝕆 loses the composition/Born norm law / introduces zero
divisors — one cause, many terminations) is DECOMPOSED into a linked child N2c.

## What must FOLLOW this run (proved theorems in `Phys/Cascade/Quaternion.lean`, foundations-only)
1. **the doubling operation exists** — `CD A` with `Mul`, `Add`, `Neg`, `Zero`, `One`, `Star`
   instances defined uniformly from base operations (the operation reused at every higher rung).
2. **conjugation laws** — on `CD A` the star is involutive, additive, anti-multiplicative,
   `star 1 = 1` (so the doubling carries a genuine `*`-structure to the next rung).
3. **the double of a commutative associative `*`-ring is a RING** — `H R = CD (Dbl R)` is a
   `Ring` (associativity + unitality + distributivity all PROVED): the structure did NOT collapse.
4. **★ LOSS OF COMMUTATIVITY (the rung-2 content)** — `H R` is NOT commutative: exhibit
   `x y : H ℚ` (concretely from `J`) with `x * y ≠ y * x`. A THEOREM, not an assertion.
5. **★ THE CAUSE (one cause)** — non-commutativity traces EXACTLY to the base conjugation:
   `(ι a) * e₂ = e₂ * (ι a) ↔ a = a*` in `CD A`; and `J ≠ J*` in `Dbl R` (`J* = −J`,
   `J ≠ −J` on a nontrivial base). The rung-1 complex unit is the cause of the rung-2 loss.
6. **still associative** — `mul_assoc` holds on `H R` (proved; packaged in the `Ring` instance):
   ℍ keeps associativity even as it loses commutativity (this is what makes the NEXT loss, at 𝕆,
   the genuinely new one).
7. **non-vacuity / the witness genuinely moves** — the non-commuting pair is genuinely distinct
   (the commutator is nonzero over `ℚ`); `H R` strictly extends `Dbl R` (an injective embedding).

## Non-vacuity witness (anti-W8)
Concrete base `R = ℚ`. In `H ℚ = CD (Dbl ℚ)`, with `e₂ := (0,1)` and `ι J := (J,0)`:
`(ι J)·e₂ = (0, J)` and `e₂·(ι J) = (0, J*) = (0,−J)`, and `J ≠ −J` over `ℚ`, so the pair does
NOT commute and the commutator is nonzero. Non-commutativity is non-vacuous.

## GO / NO-GO bars
- GO iff ALL of (1)–(7) are proved in `Phys/Cascade/Quaternion.lean`, foundations-only
  (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}), no sorry/axiom/native_decide,
  no bridge marker; gate.sh green; the rung-2 costume BITES (claiming `H R` is commutative —
  e.g. `∀ x y, x*y = y*x` or `Dbl`-style `CommRing (H ℚ)` — is rejected by the kernel); and a
  WRONG-CONTINUATION costume bites (claiming the doubled conjugation is multiplicative rather
  than anti-multiplicative, i.e. `star (x*y) = star x * star y`, is rejected); physics-words-
  removable holds (delete "quaternion / complex unit / Born / fold" → a complete theorem that the
  Cayley–Dickson double of a commutative associative `*`-ring is an associative NON-commutative
  ring, with the non-commutativity caused by a base element ≠ its conjugate); the remainder
  (𝕆 + STOP) is DECOMPOSED into a linked child N2c (board single-flight, linear chain).
- NO-GO if ℍ is obtained by IMPORTING Mathlib's `Quaternion` (it must be DERIVED by applying the
  doubling `CD` to the banked `Dbl R`); if the product is pulled from a hat rather than the
  Cayley–Dickson double of the rung-1 algebra; if non-commutativity is asserted rather than
  witnessed by a concrete non-commuting pair; if associativity is faked (sorry); if the cause
  (base star ≠ id) is asserted rather than proved; if any physics word is load-bearing.

## KILL conditions (a fight = INSTRUMENT failure, never theory failure — THE ONE LAW / W5)
- If `CD` "won't double" or the Ring instance "won't close," the framing/labor is the issue, not
  the theory. Return to the trunk: the doubling operation is FORCED (it is rung 1's operation
  applied again); the base `Dbl R` is commutative+associative so the double is a ring; the base
  conjugation is non-trivial so commutativity dies. These are computations, not fights. If a ring-
  instance proof is merely tedious, that is LABOR (grind it honestly, W1.1: build the structure).
- If I reach to DEFINE `H R` as Mathlib's `Quaternion`, STOP: that imports the answer. `H R` is
  `CD (Dbl R)` — the double of the DERIVED complex algebra, never imported.
- Do NOT hardcode "the cascade stops at 𝕆." This node banks rung 2; the stop is proved in the
  child N2c by a FORCED impossibility (the composition/Born norm law dies past 𝕆 because 𝕆 is
  non-associative), never an asserted halt or a hardcoded step count.

## Drift-trap checklist (must all stay TRUE)
- [ ] No `Quaternion`/`Octonion` imported. `H R = CD (Dbl R)` is the double of the rung-1 algebra.
- [ ] The doubling `CD` is ONE operation, reused (it is the same operation that built rung 1).
- [ ] Loss of commutativity is a THEOREM (concrete non-commuting pair), not an assertion.
- [ ] The CAUSE (base star ≠ id, witnessed by `J ≠ J*`) is proved and ties back to rung 1.
- [ ] Still associative (`Ring (H R)`) — the loss is exactly commutativity, nothing more.
- [ ] Costume bites two ways: "H commutative" rejected; "star multiplicative not anti" rejected.
- [ ] Physics words removable with zero logical gap.
- [ ] Remainder (𝕆 + STOP) DECOMPOSED into a linked child N2c; board stays single-flight (linear).
