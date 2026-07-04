# N285 — PREREG

## NODE
**THE DERIVED HERMITIAN MATTER ARENA'S DERIVATION LIE ALGEBRA `derH3 = Der(H₃(O ℚ)) = f₄`
— THE GENUINE AMBIENT (INPUT A) ON THE CORRECT CARRIER, with the derived gauge g₂ re-seated
faithfully & trace-skew inside it, and the measured evidence that N284's full-space `jDer`
is structurally insufficient.**

File: `Phys/Algebra/OctonionJordanHermDerivationAlgebra.lean`, namespace `Phys.Algebra.HJ`.

## WHY THIS NODE (theory-native, from the SELECT thread comments 191–194)
- N284 built `jDer` = Jordan-derivations of `jb` on the FULL matrix space `M₃(O ℚ)` and called it
  the "f₄-ambient." MEASURED (exact Fraction octonion arithmetic, `workbench/N285-select/`):
  `jb` is a genuine Jordan bracket ONLY on the HERMITIAN arena `H₃(O)` (banked `jdef_H3`); over
  the full space the inner-derivation commutators `innerMul = [L_A, L_B]` are NOT derivations of
  `jDer` (`innerMul(Herm) ∉ jDer`, 60/60 nonzero on general X,Y). So the full-space object EXCLUDES
  the inner-derivation complement where the electroweak directions live.
- The genuine `f₄ = Der(J₃(O))` is the derivation Lie algebra of the HERMITIAN arena `H₃(O ℚ)` —
  the arena N267 cap-forced (carrier `Hm`), which `jdef_H3` makes a genuine Jordan algebra and
  `jAct_Hm` shows g₂ preserves. Every downstream ★2 node (electroweak factors as commuting
  subalgebras with the unique invariant form, N283 INPUT A) must work inside IT.
- This is the SELECT redirect the architecture exists for: a fresh measure-first worker found N284's
  finishing worker seated the ambient on the wrong carrier, and re-seats it.

## MAGNITUDE (what will be PROVED — the theorems, bounded)
On `Matrix (Fin 3) (Fin 3) (O ℚ)` over the derived `O ℚ`, using `Aᴴ = A` for "Hermitian":
1. `jb_herm`, `innerMul_herm`, `jAct_herm` — `jb`/`innerMul`/`jAct D` PRESERVE the Hermitian
   subspace (coordinate-free; de-risked GREEN).
2. `IsHermJordanDerivQ T` := `(∀ M, Mᴴ=M → (T M)ᴴ = T M) ∧ (∀ A B, Aᴴ=A → Bᴴ=B →
   T (jb A B) = jb (T A) B + jb A (T B))` — the Hermitian-restricted Jordan-derivation predicate.
3. `hermJordanDerivQ_bracket` — the carrier is BRACKET-CLOSED (the LieSubalgebra crux; de-risked
   GREEN ~11s).
4. `derH3 : LieSubalgebra ℚ (Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))` — the GENUINE
   `f₄ = Der(J₃(O))` (add/zero/smul/lie closure).
5. `jActL_mem_derH3` — g₂ = `jActL D` (for `IsDerivQ D`) sits inside `derH3` (via `jAct_Hm`
   Hermitian-preservation + `jAct_jb` Jordan-deriv law).
6. `g2ToDerH3 : derivationLieQ →ₗ⁅ℚ⁆ derH3` — the BUNDLED, FAITHFUL Lie hom (injective via
   `slotA_inj`), re-seating N284's embedding on the correct carrier.
7. `g2ToDerH3_injective` — faithfulness.
8. `jActL_skew_jTraceForm` reused — g₂ ⊆ derH3 SKEW-ADJOINT in the banked positive-definite
   `jTraceForm` (the unique invariant form; ported from N284's B6).
9. **THE MEASURED STRUCTURAL TEETH** (the load-bearing NEW content vs N284):
   - `innerMul_herm` : `innerMul` preserves H₃ (so it is a candidate member of `derH3` the
     full-space `jDer` misses).
   - `innerMul_not_in_g2` / W8: `innerMul (slotA 1)(slotB 1)(Dg 0 0 1) ≠ 0` moves the diagonal
     (N274 `innerMul_moves_diagonal`), whereas every g₂ element fixes the diagonal (`jAct_Dg`) —
     so `innerMul ∉ jActL '' g₂` (the complement is nonempty, `f₄ ⊋ g₂` at least at the
     inner-derivation generator).
10. capstone `herm_arena_derivation_algebra_structure` — bundles derH3 LieSubalgebra + g2 faithful
    embed + skew + innerMul-preserves-H₃ + innerMul-moves-diagonal + `jordan_cap_pinned_at_three`.

## SCOPE — DEFERRED to the single successor child (W1/W9)
`innerMul(Herm) ∈ derH3` — the Jordan-derivation LAW on Hermitian args (`f₄ ⊋ g₂` PROPER, the
electroweak-bearing complement genuinely inside f₄). This is the linearized-Jordan-identity
obligation by polarizing the banked `jdef_H3` — a W9-heavy structural proof (brute coordinates
measured 16min/9GB in Linear.lean). Childed as a dedicated dissolution node; NOT attempted here.

Also NOT claimed: the electroweak factors placed inside f₄, the convention-free electroweak ratio,
the ★2 mixing-angle VALUE (INPUT B, human-gated CHAIN RUNWAY), "= the physical F₄" (removable prose).

## COSTUME (C314)
Anchor a MEASURED structural certificate that N284's carrier is insufficient / the arena is Hermitian.
Candidate: the number of DIAGONAL entries `innerMul (slotA 1)(slotB 1)(Dg 0 0 1)` moves, or the
count `1` from the innerMul off-diagonal witness reduced through a banked value — packaged as
`min 314 (…) = <n>` with a fresh pair (RHS 314). Decide exact anchor at costume-writing time so it
BITES on a wrong reading (e.g. "innerMul does not escape g₂" or "the arena is the full matrix space").

## STANDARD CHECK (pre-commit)
- UNBROKEN: every object from banked chain (`jb`/`innerMul` N274, `jAct`/`jAct_Hm`/`jAct_jb` N268,
  `jTraceForm` N214, `derivationLieQ` N6, `slotA_inj` N267, `Hm` N5b). Nothing posited.
- COMPLETE: all decls foundations-only `[propext, Classical.choice, Quot.sound]`; no sorry/axiom/
  native_decide/maxHeartbeats-raise. `#print axioms` audited vs built olean + D6-fast.
- WORDS-REMOVABLE: delete gauge/f₄/electroweak/arena/matter: `derH3` a LieSubalgebra of Hermitian-
  restricted Jordan-derivations, `g2ToDerH3` an injective Lie hom skew in `jTraceForm`, `innerMul`
  preserves the Hermitian subspace and escapes the entrywise image — stands as pure math.
- NOT free-floating: every headline TYPE mentions the banked arena `Matrix (Fin 3)(Fin 3)(O ℚ)` /
  `Hm` / `derivationLieQ` / `jTraceForm` / `innerMul`; capstone carries `jordan_cap_pinned_at_three`.

## W9 COST BUDGET / KILL
- Bounded bricks (1–8): each ports N284's coordinate-free proofs; olean expected LIGHT (~30–40s
  like N284). KILL: if any single obligation exceeds ~90s in a bounded probe, MEASURE and decompose.
- NO brute coordinate `ring` on octonion products anywhere in this node (that is the childed W9 part).
- The costume `decide`/value is bounded integer/rational.

## SUCCESSOR (ONE-SUCCESSOR RAIL)
Exactly ONE forward child: the directed W1/W9 dissolution node "`innerMul(Herm) ∈ derH3` — the
inner-derivation Leibniz law by polarizing `jdef_H3`" (REPLACES the generic SELECTION ticket).
