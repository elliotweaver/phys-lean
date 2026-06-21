# N2a — THE COMPLEX UNIT — FINDINGS (numerics-with-teeth)

Script: `workbench/N2a-complex-unit/numerics.py` (exact `Fraction` linear algebra; no floats
in any decision).

## What the probe showed
A **fold-root** is a real-linear operator `J` with `J ∘ J = look = -id` (N1's fold). Asking on
which real dimensions a fold-root exists:

- **dim 1 (the base carrier ℝ): NONE.** A linear endo of ℝ is `c·(·)`; a fold-root needs
  `c² = -1`, which has no real solution. The exact rational scan finds no `c`, and structurally
  `c² ≥ 0` for every real `c`. ★ The blocker is **positivity itself** — `c² ≥ 0` is the trunk's
  Born = self-overlap positivity. The fold's own positivity is what blinds it to its root inside
  the base carrier.
- **dim 2 (the doubled carrier ℝ×ℝ): EXISTS.** `J₂(a,b) = (-b, a)`, matrix `[[0,-1],[1,0]]`,
  satisfies `J₂² = -id` (fold-root), is **self-blind** (`det(J₂ - I) = 2 ≠ 0` ⇒ only fixed
  point is `0`), and is a **NEW** operator (`J₂ ≠ id`, `J₂ ≠ -id`). Read out: `J₂·(a+bi) = i·z`
  — the law `J₂² = -1` IS the complex unit, constructed on the real plane, never imported.

## The doubling law (why the carrier is FORCED to double 1 → 2)
For `J² = -id` on dim `n`: `det(J)² = det(-id) = (-1)ⁿ`. Since `det(J)² ≥ 0` over ℝ, odd `n`
forces `(-1)ⁿ = -1 ≥ 0`, impossible — **fold-roots live only in EVEN dimension**. The base
(dim 1, odd) is blocked; the minimal nontrivial even dimension is 2. So the obstruction does not
merely "permit" doubling — it FORCES it. (The general even-dim theorem belongs to the N2b
doubling ticket; the concrete dim-1-no / dim-2-yes pair already proves the forced first step and
is what N2a banks. Deferring the general law is decomposition, NOT scope-reduction — per PREREG.)

## The teeth (the garbage witnesses the kernel MUST reject)
- **(A) WRONG CONTINUATION** — a *linear* fold-root at the odd base dim 1: needs `c² = -1`,
  false over ℝ. (Linearity is load-bearing: a *non-linear* set-map square root of `-id` on ℝ
  does exist, so the obstruction is a real theorem about the LINEAR/operator structure — exactly
  the algebra cascade's setting.) The Lean costume claims a linear `J : ℝ →ₗ[ℝ] ℝ` fold-root and
  must be rejected.
- **(B) WRONG STOP** — the swap map `Jswap(a,b) = (b,a)`, matrix `[[0,1],[1,0]]`, has
  `Jswap² = +id`, NOT `-id`. Claiming it is a fold-root (the "complex unit") is FALSE and must be
  rejected. (Guards against banking *any* dim-2 involution as the complex unit; the sign matters.)

## Non-vacuity (anti-W8)
`J₂(1,0) = (0,1) ≠ (1,0)` (genuinely moves the witness) and `J₂(J₂(1,0)) = (-1,0) = -(1,0)`
(the fold-root law holds non-vacuously). A real fold-root exists at dim 2 (structure inhabited);
the dim-1 obstruction is a real contradiction (`c² = -1` vs `c² ≥ 0`), not a vacuous statement.

## Verdict against the prereg
GO. Obstruction (dim 1) is a proved contradiction; resolution (dim 2) is an explicit, self-blind,
NEW fold-root = the complex unit `J² = -1`, BUILT on the real plane (no ℂ / `Complex.I`
imported). Self-blindness of the complex unit DESCENDS from N1's `fold_self_blind` (the chain is
unbroken: J₂∘J₂ IS the fold, ℝ×ℝ is 2-torsion-free). Both costumes are FALSE ⇒ teeth bite.
Physics words removable: the entire content is mathematics about square roots of `-id` on real
vector spaces. The full cascade (doubling operation, the tower ℝ→ℂ→ℍ→𝕆, and the proved STOP)
is the N2b child — this rung banks the forced FIRST doubling.
