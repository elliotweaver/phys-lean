# N2 — THE CASCADE AND ITS STOP — PREREG (frozen BEFORE production code)

*Frozen at the start of the N2 run. Do NOT edit to fit the result. This fixes what counts as
success BEFORE the theorems are banked. N2 is the crown node and is LARGE — this PREREG covers
the FIRST bankable rung (the forced complex unit) and commits to DECOMPOSING the remainder
(doubling cascade ℍ→𝕆 + the proved stop) into a linked child, per RUNBOOK W3.*

## The node (full target, ROADMAP N2)
DERIVE — not posit — the forced sequence of structures the fold generates, and prove it
TERMINATES at a specific point (a proved impossibility, not an asserted halt). Each rung is a
theorem; the stop is a theorem. The field POSITS its starting algebra; here it is DERIVED from
N1 with the stop PROVED. Crown jewel: deriving what everyone posits.

## The forward derivation (the honest cascade — NOT assumed backward)
The trunk gives two facts this run uses, both upstream, neither a new posit:
- N1 (banked): the fold is `look x = -x` (`fold_eq_neg`), and `look² = id` (`fold_involutive`),
  with `look² = id` pointedly NOT `-id` — N1 explicitly left "the complex unit J²=−1" for N2.
- Born = self-overlap = positivity (trunk primitive, SOUL): the self-overlap form is positive.
  Its faithful formalization on the base line is a linearly-ordered (commutative) ring: the
  self-overlap of a state with itself, `x·x`, is `≥ 0`. This is NOT a new hypothesis — it is the
  positivity primitive of the trunk, instantiated on the base carrier.

RUNG 1 (this run) — **recursive self-blindness forces the complex unit.**
The "square root of the fold" is an operation `J` with `J∘J = look = (−·)`, i.e. a `J` with
`J² = −id`. As a SCALAR on the base line this means `j·j = −1`.
- **Obstruction (positivity forbids it on the line):** on the ordered base line, `j·j ≥ 0 > −1`,
  so `∀ j, j·j ≠ −1`. The square root of the fold CANNOT live on the line. (PROVED — this is the
  forcing: the line is too small; a new dimension is forced.)
- **Resolution (the minimal carrier is the double):** the minimal carrier on which `J²=−id`
  exists is the 2-dimensional double `R × R`, with `J = (0,1)` the quarter-turn `(a,b) ↦ (−b,a)`.
  Writing `(a,b) = a·1 + b·J` and imposing `J² = −1` with bilinearity **FORCES** the product
  `(a,b)·(c,d) = (a·c − b·d, a·d + b·c)` (the Cayley–Dickson double of the line; the base
  conjugation/fold is trivial, `conj = id`). The product is not chosen — it is forced by `J²=−1`.
- **The complex unit is DERIVED:** in the double, `J·J = (−1,0) = −1`. So `J² = −1` — the complex
  unit N1 deferred is now a THEOREM, living on the forced double, not posited.

The remainder of the cascade (RUNG 2 ℍ: doubling again loses commutativity; RUNG 3 𝕆: doubling
again loses associativity; STOP: the next double loses the composition/Born law because 𝕆 is
non-associative — one cause, many terminations) is DECOMPOSED into a linked child node N2b.

## What must FOLLOW this run (proved theorems in Phys/Cascade/RecursiveFold.lean)
1. **obstruction** — on the ordered base line `∀ j, j·j ≠ -1` (positivity forbids the scalar
   square root of the fold). Genuine content: uses order essentially.
2. **the double is a real algebra** — `R × R` with the forced product is a commutative ring
   (a real `CommRing` instance, so the structure did not collapse / is not ad hoc).
3. **the forced product matches the look-back doubling** — the product is the Cayley–Dickson
   double specialized to the trivial base fold (`conj = id`), recorded as the definitional `mul`.
4. **complex unit DERIVED** — `J := (0,1)` satisfies `J * J = -1` in the double. (★ This is the
   `J² = −1` N1 deferred — now a theorem, FORCED by the doubling, not posited.)
5. **`J` is genuinely new (2-dimensionality / non-vacuity)** — the line embeds `ι : R → R×R`,
   `a ↦ (a,0)`, as an injective ring hom, and `J` is NOT in its image (`∀ a, J ≠ ι a`), so the
   double strictly extends the line and `J` is a new generator. (Anti-W8: the unit is non-trivial.)
6. **the obstruction is tight / order is load-bearing** — exhibit a NON-ordered base
   (`ZMod 5`) where `j·j = −1` DOES have a solution: the square root of the fold lives on the
   line once positivity is dropped. This proves the order hypothesis in (1) is essential and is
   the positive complement of the costume.

## Non-vacuity witness (anti-W8)
Concrete base `R = ℚ` (linearly ordered field): `∀ j : ℚ, j·j ≠ −1` non-vacuous (`1·1 = 1 ≠ −1`);
the double `ℚ × ℚ` has `J = (0,1)`, `J·J = (−1,0) = −1`, and `J ≠ (a,0)` for every `a`. The
complex unit is non-vacuously NEW.

## GO / NO-GO bars
- GO iff ALL of (1)–(6) are proved in `Phys/Cascade/RecursiveFold.lean`, foundations-only
  (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}), no sorry/axiom/native_decide,
  no bridge marker; gate.sh green; the costume BITES (claiming the square root of the fold exists
  on the ORDERED line is rejected by the kernel); physics-words-removable holds (delete
  "fold/look-back/complex unit/Born" → a complete theorem about the ordered ring and its forced
  2-dim doubling remains, no gap); the remainder is DECOMPOSED into a linked child N2b.
- NO-GO if the complex unit is obtained by IMPORTING ℂ or by POSITING `J²=−1` (it must be DERIVED
  on the forced double from the obstruction); if the product is pulled from a hat rather than
  forced by `J²=−1`+bilinearity; if the costume does not bite (obstruction vacuous); if any
  physics word is load-bearing; if the double's ring instance is faked (sorry/admit).

## KILL conditions (a fight = INSTRUMENT failure, never theory failure — THE ONE LAW / W5)
- If the complex unit "won't derive," the framing is wrong, not the theory. Return to the trunk:
  the obstruction (positivity forbids `j²=−1` on the line) + the forced double IS the derivation;
  it cannot fail. Do NOT add a hypothesis to force `J²=−1`; do NOT import ℂ; do NOT weaken to "we
  posit a complex unit." If a ring-instance proof is merely tedious, that is labor, not a fight —
  grind it honestly (W1.1: build the structure, do not panic).
- If I reach to DEFINE the double as `ℂ` from Mathlib, STOP: that imports the answer. The double
  is `R × R` with the product FORCED by `J²=−1`; the complex algebra is what we DERIVE, never import.
- Do NOT hardcode the number of cascade steps. RUNG 1 banks the complex unit; the stop is proved
  in the child by a FORCED impossibility (composition law dies), never an asserted halt.

## Drift-trap checklist (must all stay TRUE)
- [ ] No ℂ/ℍ/𝕆 imported. The double is `R × R` with a product forced by `J²=−1`+bilinearity.
- [ ] The complex unit `J²=−1` is DERIVED on the forced double (obstruction → resolution), not posited.
- [ ] Costume bites (square root of the fold on the ORDERED line is rejected by the kernel).
- [ ] Order (positivity) is load-bearing (ZMod 5 complement: `j²=−1` solvable without order).
- [ ] Physics words removable with zero logical gap.
- [ ] Remainder (ℍ→𝕆→stop) DECOMPOSED into a linked child; board stays single-flight (linear).
