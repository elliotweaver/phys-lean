/-
  Phys.Algebra.DerivationRep7IsospinBranching — N189: THE ISOSPIN BRANCHING OF THE `7`
  — the SINGLET drops out when `g₂` is restricted to the embedded `su(2)`.
  ===========================================================================
  THE STATE OF THE GAUGE STRUCTURE. The three Standard-Model gauge factors are banked
  INDIVIDUALLY (colour `SU(3) ⊂ G₂ = Der(O)` dim 14 N42/N20, isospin `SU(2) = Der(H)` dim 3
  N184/N185, hypercharge `U(1) = so(2)` dim 1 N186), and the rung-inclusion tower
  `u(1) ↪ su(2) ↪ g₂` is COMPLETE (upper rung `su(2) ↪ g₂` via the doubling `H ↪ O`, N187;
  lower rung `u(1) ↪ su(2)` via the doubling `Dbl ↪ H`, N188). THIS node banks the FIRST
  REPRESENTATION-THEORETIC consequence of the upper embedding: how the `g₂` fundamental
  `7`-representation `ImO` (N22) DECOMPOSES under the embedded weak-isospin `su(2)`.

  ★ THE MECHANISM — componentwise action, the singlet falls out (docs/RUNBOOK W2 import-and-USE,
  W9.4 structure-over-coordinate-expansion). The inner derivations act COMPONENTWISE on the
  doubling `O ℚ = CD (H ℚ) = ⟨H, H⟩` (banked `innerDeriv_apply`:
  `innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩`). Consider the new-dimension unit of the upper
  doubling, `e₄ := ⟨0, 1⟩` (the second-coordinate `1`):

    • `e₄ ∈ ImO`             — it is imaginary (`star e₄ = −e₄`), a genuine vector of the `7`;
    • `innerDeriv q e₄ = 0`  — EVERY inner derivation ANNIHILATES it, because `ad_q 1 = 0`;
                               in particular the WHOLE embedded `su(2) = ⟨innerDeriv hI/J/K⟩`
                               (N187) fixes the line `ℚ·e₄`. THE SINGLET.

  So under the embedded `su(2)`, the `7` contains an invariant `1`-dimensional summand — the
  trivial sub-representation, the SINGLET. Yet the FULL `g₂` admits NO `1`-dimensional
  invariant subspace inside `ImO` (banked N25 `no_one_dim_invariant_ImO`): some
  Leibniz-derivation of `O ℚ` MOVES the line `ℚ·e₄` off itself (`g2_moves_singletLine`).

  ★★ THE BRANCHING. The `7` is `g₂`-IRREDUCIBLE (N22/N25/N26) but `su(2)`-REDUCIBLE: restricting
  the algebra from `g₂` to the embedded `su(2)` BREAKS the irreducible `7` apart, splitting off
  the singlet `ℚ·e₄`. This is exactly the representation-theoretic branching the
  division-algebra-physics field reads off the octonions BY HAND; here it is DERIVED FORWARD,
  joining N187 (the `su(2) ↪ g₂` embedding) to N25 (the `g₂`-irreducibility of the `7`).

  WHAT IS BANKED HERE (forward, foundations-only):
    kappaO                     — the upper-doubling new-dimension embedding `H ℚ →ₗ[ℚ] O ℚ`,
                                 `b ↦ ⟨0, b⟩` (the second-coordinate copy inside `O ℚ`).
    kappaO_one_mem_ImO         — the singlet `e₄ = κO 1 = ⟨0,1⟩` lies in `ImO` (it is a genuine
                                 vector of the `7`).
    kappaO_one_ne_zero         — `e₄ ≠ 0` (a genuine nonzero vector, not the trivial summand).
    innerDeriv_kappaO_one      — ★ EVERY inner derivation annihilates `e₄`: `innerDeriv q e₄ = 0`.
    singlet_fixed_by_isospin   — ★★ the embedded `su(2)` generators fix the singlet line:
                                 `innerDeriv hI/hJ/hK e₄ = 0` (the trivial sub-representation).
    kappaO_one_coord           — the witnessing coordinate `(κO 1).im.re.re = 1`.
    g2_moves_singletLine       — ★★ THE CONTRAST: the FULL `g₂` moves the singlet line off
                                 itself (N25) — `7` is su(2)-reducible but g₂-irreducible.
    isospin_singlet_ne_zero    — ★ W8 NON-VACUITY: the embedded `su(2)` acts NONTRIVIALLY on the
                                 `7` (`innerDeriv hI ≠ 0`), so the reducibility is genuine
                                 structure, not because the action is trivial.

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The field POSITS the algebras
  as disconnected islands and reads each gauge factor and each branching off by hand. Here the
  branching `7 = (su(2)-singlet) ⊕ (rest)` is DERIVED from the cascade's OWN doubling: the
  singlet is precisely the upper-doubling unit `⟨0,1⟩`, fixed because the inner derivations act
  componentwise and `ad_q 1 = 0`. One cause (the doubling), several consequences — the embedding
  (N187), the lower-rung intertwiner (N188), and now the branching of the `7`.

  NO posited su(2)/su(3)/g₂/SU(2)/SU(3)/G₂/Lie-group/rep as content, NO Mathlib ℝ/ℂ as content
  (ℚ is the coefficient field the `Module.End`/`Submodule`/`LinearMap` statements are WRITTEN
  IN, the N6/N16/N22/N25/N42/N184–N188 precedent; the OBJECTS are the derived rungs `H ℚ` (N3)
  and `O ℚ = CD (H ℚ)` (N4) and the derived imaginary subspace `ImO` (N22)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "colour / isospin / 7 / g₂ / su(2) /
  singlet / branching / rep / gauge": what remains is the pure statement that for the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, the second-coordinate unit `⟨0,1⟩` lies in the
  imaginary subspace `ker(star+1)`, is nonzero, and is annihilated by every inner derivation
  `innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩` (because `ad_q 1 = 0`); yet the span of `⟨0,1⟩` is
  NOT invariant under all Leibniz-derivations of `O ℚ` (`no_one_dim_invariant_ImO`). No theorem
  statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationIrreducible
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- THE UPPER-DOUBLING NEW-DIMENSION EMBEDDING `κO : H ℚ → O ℚ`, `b ↦ ⟨0, b⟩` — the
    second-coordinate copy of the quaternion rung inside the octonion rung
    `O ℚ = CD (H ℚ) = ⟨H, H⟩`, complementary to the old line `a ↦ ⟨a, 0⟩`. -/
def kappaO : H ℚ →ₗ[ℚ] O ℚ where
  toFun b := ⟨0, b⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem kappaO_apply (b : H ℚ) : kappaO b = (⟨0, b⟩ : O ℚ) := rfl

/-- The singlet `e₄ := κO 1 = ⟨0,1⟩` lies in `ImO` — it is a genuine vector of the `7`
    (imaginary: `star e₄ = −e₄`). -/
theorem kappaO_one_mem_ImO : kappaO (1 : H ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [kappaO, CD.star_re, CD.star_im]

/-- `e₄ ≠ 0` — a genuine NONZERO vector of the `7`, not the trivial summand. -/
theorem kappaO_one_ne_zero : kappaO (1 : H ℚ) ≠ 0 := by
  intro h
  have h1 := congrArg (fun z : O ℚ => z.im.re.re) h
  simp [kappaO] at h1

/-- ★ EVERY inner derivation ANNIHILATES the singlet `e₄ = ⟨0,1⟩`: `innerDeriv q e₄ = 0`.
    The inner derivations act componentwise (`innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩`) and
    `ad_q 1 = q·1 − 1·q = 0`. -/
theorem innerDeriv_kappaO_one (q : H ℚ) : innerDeriv q (kappaO 1) = 0 := by
  have h : adHom q (1 : H ℚ) = 0 := by simp [adHom_apply]
  ext <;> simp [innerDeriv_apply, kappaO, h]

/-- ★★ THE EMBEDDED `su(2)` FIXES THE SINGLET LINE — the three weak-isospin generators
    `innerDeriv hI/hJ/hK` (N187) all annihilate `e₄ = ⟨0,1⟩`. The trivial
    sub-representation: the `1` inside the branching of the `7`. -/
theorem singlet_fixed_by_isospin :
    innerDeriv (hI : H ℚ) (kappaO 1) = 0 ∧
    innerDeriv (hJ : H ℚ) (kappaO 1) = 0 ∧
    innerDeriv (hK : H ℚ) (kappaO 1) = 0 :=
  ⟨innerDeriv_kappaO_one hI, innerDeriv_kappaO_one hJ, innerDeriv_kappaO_one hK⟩

/-- The witnessing coordinate `(κO 1).im.re.re = 1` — the genuine nonzero value pinning the
    singlet vector. -/
theorem kappaO_one_coord : (kappaO (1 : H ℚ)).im.re.re = 1 := by
  simp [kappaO]

/-- ★★ THE CONTRAST — the FULL `g₂` does NOT fix the singlet line. The span `ℚ·e₄` is a
    `1`-dimensional subspace of `ImO`; by the banked `no_one_dim_invariant_ImO` (N25) no such
    line is invariant under all Leibniz-derivations, so SOME derivation `D ∈ g₂` moves a vector
    of `ℚ·e₄` off the line. Hence the `7` — `g₂`-irreducible (N22/N25/N26) — is `su(2)`-REDUCIBLE:
    restricting the algebra from `g₂` to the embedded `su(2)` SPLITS OFF the singlet. -/
theorem g2_moves_singletLine :
    ∃ D : Module.End ℚ (O ℚ), IsDerivQ D ∧
      ∃ x ∈ Submodule.span ℚ {kappaO (1 : H ℚ)},
        D x ∉ Submodule.span ℚ {kappaO (1 : H ℚ)} := by
  by_contra h
  push Not at h
  apply no_one_dim_invariant_ImO (Submodule.span ℚ {kappaO (1 : H ℚ)})
  · rw [Submodule.span_le, Set.singleton_subset_iff]; exact kappaO_one_mem_ImO
  · rw [finrank_span_singleton kappaO_one_ne_zero]
  · intro D hD x hx; exact h D hD x hx

/-- ★ W8 NON-VACUITY: the embedded `su(2)` acts NONTRIVIALLY on the `7` — the generator
    `innerDeriv hI` is nonzero (N187 `innerDeriv_hI_ne_zero`). So the `su(2)`-reducibility is
    genuine representation structure, NOT a triviality where the algebra acts as zero. -/
theorem isospin_singlet_ne_zero : innerDeriv (hI : H ℚ) ≠ 0 :=
  innerDeriv_hI_ne_zero

end

end Phys.Algebra
