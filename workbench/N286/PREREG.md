# N286 — PREREG

## NODE
**THE INNER-DERIVATION LEIBNIZ LAW `innerMul(Herm) ∈ derH3` (`f₄ ⊋ g₂` PROPER)** — proving
that for Hermitian A,B the arena's inner-multiplication commutator `innerMul A B = ⁅L_A,L_B⁆`
is a GENUINE member of the derived `f₄ = Der(H₃(O)) = derH3` (N285), by LINEARIZING the banked
cap identity `jdef_H3 = 0`.

File: `Phys/Algebra/OctonionJordanInnerDerivationLeibniz.lean`, namespace `Phys.Algebra.HJ`.

## THE ROUTE — DE-RISKED (workbench/N286/, all EXIT 0)
The classical fact "in a Jordan algebra `[L_a,L_b]` is a derivation" is the FULLY LINEARIZED
Jordan identity. Measured the exact linear combination (probe_route.py, exact Fraction octonion
arithmetic on the fold's real table, 0/200 mismatch on GENERAL matrices):

    d(A,B,X,Y) := innerMul A B (jb X Y) − jb (innerMul A B X) Y − jb X (innerMul A B Y)
                = ½·PolJ(B,X,Y;A) − ½·PolJ(A,X,Y;B)

where `PolJ(u,v,w;t)` is the trilinear polarization of `P ↦ jdef P t`:
    PolJ(u,v,w;t) = jdef(u+v+w,t) − jdef(u+v,t) − jdef(u+w,t) − jdef(v+w,t)
                    + jdef(u,t) + jdef(v,t) + jdef(w,t).

★ CRUX (probe_freealg.py): d and the combo are EQUAL as FORMAL elements of the FREE
non-associative, non-commutative ℚ-algebra on {A,B,X,Y} (LHS 48 monomials, RHS 48, diff 0). And
the INTEGER form `d + d = combo` (combo = the 14-term jdef expansion with all integer coeffs) is
ALSO a formal free-ring identity (diff 0). ★ FREENESS (probe_free.py): the identity holds over
the NON-ALTERNATIVE sedenions CD(O) too (0/12) — so it is a FREE `NonAssocRing` identity,
provable in Lean by `simp only [jb, jdef, mul_add, add_mul, ...]; abel` with ZERO octonion
coordinate expansion. **W9 IS DISSOLVED**: the heavy part (coordinates) never enters; the whole
proof is matrix biadditivity + `abel` over an abstract carrier.

## MAGNITUDE (theorems, bounded)
Over `Matrix (Fin 3) (Fin 3) (O ℚ)` (abstract-NonAssocRing where possible):
1. `jdef_two_polar` (ABSTRACT, any NonAssocRing) — the integer free-ring identity
   `2 • d(A,B,X,Y) = PolJ(B,X,Y;A) − PolJ(A,X,Y;B)` where `d`, `PolJ` are spelled out via `jb`.
   Proof: `simp only [jb]; ring_nf`/`abel` after `mul_add`/`add_mul`. NO coordinates.
   (Bank `PolJ` as a def or spell it inline; decide at write time.)
2. `jdef_herm` — for GENERAL Hermitian A,B (`Aᴴ=A`, `Bᴴ=B`), `jdef A B = 0`. Route: reconstruct
   `A = Hm (reQ a00) … a01 a02 …` and `B = Hm …` from Hermiticity (self-adjoint diagonal =
   `ocR ∘ reQ`, banked `ocR_reQ`/`ocR_star`; off-diagonals free with conjugate below), then apply
   banked `jdef_H3`. RISK: the reconstruction `Aᴴ=A → A = Hm …` — de-risk in the probe.
3. `innerMul_leibniz_herm` — for Hermitian A,B,X,Y: `d(A,B,X,Y) = 0`. From (1): `2•d = PolJ(B,X,Y;A)
   − PolJ(A,X,Y;B)`; every `jdef(·,·)` argument in each PolJ is a SUM of Hermitian matrices (hence
   Hermitian, `jb_herm`/add), so each `jdef = 0` by (2) ⟹ `2•d = 0` ⟹ `d = 0` (ℚ-torsion-free /
   `two_nsmul_eq_zero`). Gives the Leibniz law:
     `innerMul A B (jb X Y) = jb (innerMul A B X) Y + jb X (innerMul A B Y)`.
4. `innerMul_mem_derH3` — for Hermitian A,B: `innerMul A B ∈ derH3` (the full `IsHermJordanDerivQ`):
   Hermitian-preservation = banked `innerMul_herm`; Leibniz law = (3). **THE DELIVERABLE.**
5. capstone `inner_derivation_in_f4` — bundles `innerMul (slotA 1)(slotB 1) ∈ derH3` (a CONCRETE
   member) ∧ it moves the diagonal (`innerMul_moves_diagonal`, escapes g₂) ∧ `jordan_fails_H4`
   (cap in the type). This is `f₄ ⊋ g₂` PROPER: the inner-derivation generator is genuinely INSIDE
   the derived f₄ AND outside the entrywise g₂.

## COSTUME (C315)
Anchor a value that BITES on the derivation law being real content, e.g. the nonzero off-diagonal
`reQ ((innerMul (slotA 1)(slotB 1)(Dg 0 0 1)) 1 2)` (the escape witness, N285) packaged
`min 315 (…) = <n>` with RHS 315, so a wrong reading (innerMul trivial / not a member) fails to
compile. Decide exact anchor at costume-writing time.

## STANDARD CHECK (pre-commit)
- UNBROKEN: `jb`/`jdef` (JordanTower), `innerMul`/`innerMul_apply`/`innerMul_moves_diagonal` (N274),
  `jdef_H3`/`Hm`/`Xz`/`Dg` (N5/HermitianJordan), `derH3`/`IsHermJordanDerivQ`/`innerMul_herm`
  (N285), `ocR_reQ`/`ocR_star` (N5b). Nothing posited.
- COMPLETE: all decls foundations-only `[propext, Classical.choice, Quot.sound]`; no
  sorry/axiom/native_decide/maxHeartbeats-raise. Audited vs built olean + D6-fast.
- WORDS-REMOVABLE: delete f₄/g₂/electroweak/gauge: `innerMul A B` is a Hermitian-restricted
  Jordan-derivation (member of the LieSubalgebra `derH3`) that moves the diagonal the entrywise
  image fixes. Pure math; stands.
- NOT free-floating: every headline TYPE mentions the banked `innerMul`/`derH3`/`jb`/`Hm` on
  `Matrix (Fin 3)(Fin 3)(O ℚ)`; capstone carries `jordan_fails_H4`.

## W9 COST BUDGET / KILL
- (1) abstract free-ring identity: `abel` on a biadditive matrix expression — expect LIGHT (like
  `jdef_polar_first`, `polarCross_split` which used `abel` fine). KILL: if `abel`/`ring_nf`
  exceeds ~90s in the bounded probe, DECOMPOSE PolJ into named sub-brackets each `abel`'d once.
- (2) reconstruction: matrix `ext` + `fin_cases` + `ocR_reQ`/`ocR_star` — coordinate-free on the
  diagonal; expect LIGHT. KILL: if the diagonal self-adjoint→ocR step is heavy, isolate as a
  scalar lemma `star z = z → z = ocR (reQ z)` over `O ℚ` (8-coordinate, bounded).
- NO brute coordinate `ring` on octonion products anywhere — the route avoids it by design
  (freeness certificate).

## SUCCESSOR (ONE-SUCCESSOR RAIL)
Exactly ONE: a generic SELECTION ticket (STEP 5) — this dissolution target completes `f₄ ⊋ g₂`
PROPER, so the next node is a fresh theory-native SELECT (no further directed child unless a
sub-obligation decomposes).
