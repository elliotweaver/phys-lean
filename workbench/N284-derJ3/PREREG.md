# N284 — PREREG: THE DERIVED ARENA'S JORDAN-DERIVATION LIE ALGEBRA (f₄-AMBIENT) + THE BUNDLED g₂ EMBEDDING

## TARGET (theory-native, selected S1–S4, comments 189–190)
Assemble the derivation algebra of the maximal matter arena's Jordan product — the ambient in which
`f₄ = Der(J₃(O))` lives — as a genuine derived `LieSubalgebra`, and EMBED the derived gauge
`g₂ = Der(O ℚ)` into it as a BUNDLED, INJECTIVE Lie homomorphism that lands SKEW-ADJOINT in the
banked positive-definite trace form `jTraceForm` (the unique invariant form). This is the named
ASCENT (N283 INPUT A) the ≥11×-deferred ★2 front structurally requires: the single simple ambient
with a unique invariant form. It bundles TWO explicitly-deferred objects: N269's un-bundled
`g₂⊆f₄` LieHom and N274's deferred "full f₄ = Der(J₃(O)) determination" (first rung).

## WHY THIS NODE (repeated-deferral rail, SOUL)
★2 deferred ≥11× (N253–N258, N281, N283) for the SAME posit-risk reason: the current carriers
(so(7) vector-7, so(8) spinor) are not a single simple ambient with a unique form holding su(2)_L +
colour-neutral u(1)_Y. Rail-step 1 (name the blocker) = N283. This node = rail-step 2: build the
richer DERIVED structure (the arena's derivation algebra) the front needs; child the inner-derivation
complement (where the electroweak directions live) as the single successor.

## OBJECTS TO BANK (all bounded, coordinate-free, banked lemmas only — NO native_decide, NO heartbeat raise)

Namespace `Phys.Algebra`, file `Phys/Algebra/OctonionJordanDerivationAlgebra.lean`.

- B0  `jActL (D : Module.End ℚ (O ℚ)) : Module.End ℚ (Matrix (Fin 3)(Fin 3)(O ℚ))` — jAct bundled as
      a linear endomorphism (toFun = jAct D, map_add' = jAct_add, map_smul' = jAct_smul_matrix; all banked).
- B1  `IsJordanDerivQ (T) : Prop := ∀ A B, T (jb A B) = jb (T A) B + jb A (T B)`.
- B2  `jDer : LieSubalgebra ℚ (Module.End ℚ (Matrix (Fin 3)(Fin 3)(O ℚ)))` — carrier {T | IsJordanDerivQ T},
      via the `derivationLieQ` template. lie_mem' = the bracket-closure calc (standard Leibniz; jb additive
      in each arg via add_mul/mul_add). THE CONTAINER = f₄-ambient (arena's Jordan-derivation algebra).
- B3  `jActL_mem : IsDerivQ D → jActL D ∈ jDer` — the derived gauge sits inside (from banked `jAct_jb`).
- B4  `g2ToJDer : derivationLieQ →ₗ⁅ℚ⁆ jDer` — the BUNDLED LieHom `D ↦ ⟨jActL D, jActL_mem⟩`.
      map_add'/map_smul' from jActL linearity in D; map_lie' = `jActL ⁅D,D'⁆ = ⁅jActL D, jActL D'⁆`
      (Matrix.map_map + linearity, coordinate-free).
- B5  `g2ToJDer_injective` — jActL D = 0 → D = 0 (jAct D (slotA a) = slotA (D a), slotA_inj). So g₂
      embeds FAITHFULLY. [If clean via banked `LieHom.equivRangeOfInjective`+`finrank_derivationQ_eq_14`
      template (N250), add `finrank_g2_image = 14`; else defer to child.]
- B6  `jActL_skew_jTraceForm : IsDerivQ D → reQ (jTraceForm (jAct D A) B) + reQ (jTraceForm A (jAct D B)) = 0`
      — g₂ lands in so(jTraceForm). Proof: `jTraceForm(jAct D A)B + jTraceForm A(jAct D B) =
      trace(jb(jAct D A)B + jb A(jAct D B)) = trace(jAct D (jb A B))` (jAct_jb) `= ∑ D((jb A B)ᵢᵢ)`,
      and `reQ(∑ D(·)) = ∑ reQ(D(·)) = 0` (reQ additive + banked `reQ_deriv_zero`). THE UNIQUE-FORM ANCHOR.
- W8  `g2_image_ne_bot` / non-vacuity: `jActL witnessDerivQ ≠ 0` (slot universality + `witnessDeriv_ne_zero`).
- Capstone `arena_derivation_algebra_structure` bundling: jDer a LieSubalgebra ∧ g2ToJDer injective LieHom
      ∧ skew in jTraceForm ∧ `jordan_cap_pinned_at_three` in the TYPE (NOT carrier-agnostic; grounded on
      the banked arena + banked g₂ + banked positive-definite jTraceForm).

## COSTUME (C313)
Bite at the embedding being genuine / the skew-defect. Candidate: a wrong claim that jActL collapses
(e.g. image = ⊥, or a wrong nonzero coordinate of `jAct witnessDerivQ (slot …)`) reduces to `3 = 313`
(or `2 = 313`). Finalize the exact numeric after the probe.

## SCOPE / HONESTY (what is NOT claimed)
- NOT the ★2 mixing-angle VALUE (INPUT B, human-gated CHAIN RUNWAY — sin²θ_W = tree ratio RG-run, needs
  derived dynamics not in the chain; NOT invented).
- NOT `f₄ ⊋ g₂` properly (the inner-derivation complement innerMul ∈ jDer — needs the linearized Jordan
  identity by polarizing jdef_H3, a W9 risk) — DEFERRED to the single successor child.
- NOT the electroweak factors placed inside f₄, NOT the convention-free electroweak ratio (needs the
  complement first).
- NOT "= the physical F₄ / the Albert automorphism group" as literal identity (jDer is the arena's
  Jordan-derivation Lie algebra; the Hermitian-27 restriction / e₆ tower is downstream). Removable prose.

## FREE-FLOATING CHECK
Container TYPE mentions `Matrix (Fin 3)(Fin 3)(O ℚ)` (banked arena) + jb (banked arena bracket).
HEADLINE (B4/B6) is ABOUT banked `derivationLieQ` (=g₂, 14-dim) + banked positive-definite `jTraceForm`.
Capstone carries `jordan_cap_pinned_at_three`. Octonion-specific anchor: g₂=Der(O) is 14-dim
(Der(ℂ)=0, Der(ℍ)≠g₂) and the arena is cap-forced at 3 — the embedding is genuine only at the terminal
rung. NOT generic-over-arbitrary-algebra.

## COST BUDGET / KILL (W9)
Every brick coordinate-free from banked lemmas. KILL: if any single obligation needs `native_decide`,
a `maxHeartbeats` raise above default, or a coordinate `ring` over full 3×3×8 expansion, STOP — that
signals a wrong framing; measure/decompose. Expected olean: LIGHT (no coordinate bash). Probe first.
