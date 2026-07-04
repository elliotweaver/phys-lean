# N285 SELECT — measure-first findings (the f₄ ⊋ g₂ crux)

## THE DISCOVERY (probe_innerder.py, exact Fraction octonion arithmetic, all EXIT 0)

The N284-deferred "inner-derivation complement `innerMul ∈ jDer`" rung is **mis-framed in
N284's chosen carrier.** Measured on the fold's real octonion table:

| test | result |
|---|---|
| (a) innerMul a derivation of `jb` on the FULL M₃(O)? | **200/200 NONZERO defect → NO** |
| (b) innerMul(Hermitian A,B) a derivation on Hermitian args (H₃(O))? | **0/200 defect → YES** |
| (c) innerMul(Herm A,B) preserves the Hermitian subspace? | **200/200 → YES** |
| (d) innerMul moves the diagonal (outside entrywise g₂)? | **YES** (reconfirms N274) |

## WHY THIS REDIRECTS THE SELECT

N284 defined `jDer` = Jordan-derivations of `jb` on the FULL matrix space
`Matrix (Fin 3)(Fin 3)(O ℚ)`. But:

- `jb` is a genuine JORDAN bracket (`jdef = 0`) only on the **Hermitian arena H₃(O)** —
  that is exactly the banked `jdef_H3` / `jordan_cap_pinned_at_three` (N5/N267). Over the
  FULL M₃(O) the octonion matrices are NOT a special Jordan algebra, so `jb` is not Jordan
  there and `jdef ≠ 0` generically.
- Consequently the INNER derivations `innerMul = [L_A, L_B]` — the f₄/g₂ complement where
  the electroweak directions live — are derivations only of the **Hermitian** Jordan
  algebra, NOT of N284's full-space `jDer`. Test (a) proves `innerMul ∉ jDer` in general.

So N284's `jDer` (full matrix space) is the WRONG ambient for `f₄ = Der(J₃(O))`: it is a Lie
algebra of "derivations of the symmetric bracket on all matrices," which EXCLUDES the very
inner derivations the mixing front needs. The genuine `f₄ = Der(H₃(O))` lives on the
HERMITIAN arena `H₃(O ℚ)` — the derived matter arena N267 actually built (`Hm d0 d1 d2 a b c`).

g₂ = jAct happens to land in BOTH (it fixes the diagonal and acts entrywise, so it is a
derivation of both brackets — that is why N284's full-space embedding still type-checked and
gate-passed). The full-space `jDer` is a real, foundations-only object; it is just not the
container that holds the inner-derivation complement. N284's own SCOPE note flagged the inner
complement as "deferred to the single successor child" — the measurement shows the child must
FIRST relocate the ambient onto the Hermitian arena, because the inner derivations are not in
the full-space object at all.

## THE THEORY-NATIVE NEXT NODE

Build `derH3` = the derivation Lie algebra of the DERIVED HERMITIAN matter arena
`H₃(O ℚ)` (the arena N267 cap-forced at order 3, carrier `Hm`), i.e. the genuine
`f₄ = Der(J₃(O))`, and re-seat the derived gauge g₂ inside IT — with the SAME faithful,
trace-skew embedding N284 built, now on the correct (Hermitian) ambient. This is the ambient
that actually contains the inner-derivation complement, hence the structure N283 named as
INPUT A. Scope this node as the CONTAINER on the right arena + the g₂ rung; the inner-
derivation complement's Leibniz proof (the W9-heavy linearized-Jordan-identity obligation)
is the further child.

## W9 NOTE

- The container `derH3` (a LieSubalgebra on the Hermitian arena) + the g₂ embedding + skew-
  adjointness are BOUNDED (they port N284's proofs onto the Hermitian carrier; g₂'s
  Hermitian-preservation is banked `jAct_Hm`).
- The inner-derivation Leibniz membership (`innerMul(Herm) ∈ derH3`) is the HARD, W9-flagged
  part (linearized Jordan identity by polarizing `jdef_H3`; brute coordinates measured a
  16min/9GB instrument-wall in Linear.lean). It is DEFERRED to the next child, NOT ground here.
