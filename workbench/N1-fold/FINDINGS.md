# N1 — THE FOLD — FINDINGS (numerics-with-teeth)

Script: `workbench/N1-fold/numerics.py` (exact integer arithmetic on Z/n, n=1..20).

## What the probe showed
The fold law `look(x) + x = 0` holds on every `Z/n` (with `look(x) = -x`). Self-blindness —
"the only fixed point of the look-back is 0" — holds on `Z/n` **iff** `Z/n` is 2-torsion-free,
which for `Z/n` is exactly **n odd**:

- n odd  → fixed points = {0}            → self-blind = TRUE   (2-torsion-free = TRUE)
- n even → fixed points = {0, n/2}       → self-blind = FALSE  (2-torsion-free = FALSE)

`self_blind(n) == two_torsion_free(n)` for ALL tested n (no mismatch). The boundary between
"self-blind" and "not self-blind" is EXACTLY 2-torsion-freeness. Therefore the torsion-free
hypothesis in the Lean theorem `fold_self_blind` is **load-bearing**, not decorative: drop it
and the theorem is FALSE (n=2 is a counterexample).

## The teeth (the garbage witness the kernel MUST reject)
On the char-2 carrier `ZMod 2`, `look(1) = -1 = 1`, so `1` is a NONZERO fixed point of the
fold. Any Lean claim "self-blindness on ZMod 2" (i.e. `∀ x : ZMod 2, look x = x → x = 0`) is
FALSE and must be rejected by the kernel. This is the **costume**: a wrong fold on a char-2
carrier that fails to compile. Its positive complement is banked as the Lean theorem
`fold_char2_has_nonzero_fixed` (ZMod 2 has a nonzero fixed point) — proving the hypothesis is
essential, from inside the trust base.

## Non-vacuity (anti-W8)
Over `ℤ`: `x = 1` is nonzero and `look(1) = -1 ≠ 1`. So "no nonzero fixed point" is
non-vacuously true and nonzero non-fixed states actually exist; the self-blindness theorem is
not vacuously satisfied. Banked as `fold_int_nonzero_not_fixed`.

## Verdict against the prereg
GO. All of (1)–(5) proved in scratch, foundations-only (`#print axioms` ⊆ {propext,
Classical.choice, Quot.sound}; observed [propext] / [propext, Quot.sound]). `look² = id`
(NOT `-id`) — no complex unit smuggled. Costume target identified (char-2 carrier). Physics
words removable: the entire content is a theorem about additive groups; deleting
"fold / look-back / self-blindness / void" leaves a complete, true mathematical statement.
