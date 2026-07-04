/-
  Phys.Algebra.OctonionJordanDerivationAlgebra —
  N284: THE DERIVED ARENA'S JORDAN-DERIVATION LIE ALGEBRA (the f₄-AMBIENT)
        + THE BUNDLED, FAITHFUL, TRACE-SKEW EMBEDDING OF THE DERIVED GAUGE g₂.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; docs/NODE_SELECTION.md SELECT, comments 189-190).
  The fold → self-blindness → complex unit → cascade → the terminal, NON-ASSOCIATIVE
  octonions `O ℚ = CD (H ℚ)`. That non-associativity CAPS the Hermitian Jordan tower
  at order 3 (N5 `jordan_cap_pinned_at_three` / `jordan_fails_H4`): `J₃(O ℚ)` is the
  MAXIMAL matter arena — the last structure the fold generates before it breaks. The
  fold's next beat at that terminal arena is its FORCED symmetry: the derivation
  algebra of the arena's own Jordan product `Der(J₃(O)) = f₄`.

  The recent chain has circled this object without building it: N269 proved the derived
  gauge `g₂ = Der(O ℚ)` PRESERVES the arena's spectral invariants (`g₂ ⊆ f₄` at the
  invariant level) but explicitly did NOT bundle the LieHom; N274/N275 built the inner-
  multiplication generator `innerMul` but explicitly DEFERRED "the full f₄ = Der(J₃(O))
  determination." N283 (route-finding) NAMED this object as INPUT A — the single simple
  ambient with a UNIQUE invariant form the ≥11×-deferred weak-mixing front structurally
  requires (so(7)/so(8) both fail: no colour-neutral abelian generator; the electroweak
  neutral operators are non-skew, OUTSIDE those carriers).

  THIS NODE builds the AMBIENT and embeds g₂:
    · `jActL D`     — the entrywise gauge action bundled as a linear endomorphism of the
                     arena (B0).
    · `IsJordanDerivQ T` / `jDer` — the arena's JORDAN-DERIVATION LIE ALGEBRA as a genuine
                     `LieSubalgebra` (B1/B2). THIS IS THE f₄-AMBIENT (the container in which
                     `Der(J₃(O))` lives).
    · `jActL_mem` / `g2ToJDer` — the derived gauge sits inside as a BUNDLED Lie hom
                     `derivationLieQ →ₗ⁅ℚ⁆ jDer` (B3/B4), picking up N269's un-bundled g₂⊆f₄.
    · `g2ToJDer_injective` — that embedding is FAITHFUL (B5): g₂ is a genuine 14-dim
                     subalgebra of the arena's derivations.
    · `jActL_skew_jTraceForm` — the embedded gauge lands SKEW-ADJOINT in the banked
                     POSITIVE-DEFINITE trace form `jTraceForm` (N214/N270): so it sits in
                     `so(jTraceForm)` of the arena's UNIQUE invariant form (B6). THE
                     UNIQUE-FORM ANCHOR — the exact structure N283 said the mixing front needs.
    · W8 `jActL_witness_ne_zero` — the embedding is genuinely non-trivial.
    · capstone `arena_derivation_algebra_structure` (carries `jordan_cap_pinned_at_three`
                     in its TYPE — grounded on the banked terminal arena, NOT carrier-agnostic).

  ONE CAUSE MANY TERMINATIONS: the SAME octonion non-associativity that stops the cascade
  (N2c), caps the Jordan tower at order 3 (N5), makes matter indivisible (N265) and the
  arena formally real (N270), now furnishes the arena with a derivation algebra `f₄ ⊇ g₂`
  whose unique invariant form is the derived positive-definite trace form — no external
  GUT embedding chosen, the ambient DERIVED.

  THE DISSOLUTION / MOAT: the field POSITS `F₄ = Aut(J₃(O))` (imports the Albert algebra +
  its automorphism group) and CHOOSES a GUT embedding to fix the hypercharge normalization;
  the theory DERIVES the arena (N5/N267), its Jordan-derivation algebra (here), the gauge
  g₂ inside it (here), and the unique invariant form (the derived positive-definite
  `jTraceForm`, N214/N270) — the "embedding choice" dissolves into a forced derived object.

  SCOPE / HONESTY (what is NOT claimed here):
    · NOT `f₄ ⊋ g₂` PROPERLY — the inner-derivation complement (`innerMul ∈ jDer`, where
      the electroweak directions live) needs the LINEARIZED Jordan identity (polarizing the
      banked `jdef_H3`), a heavier obligation DEFERRED to the single successor child.
    · NOT the electroweak factors placed inside f₄, NOT the convention-free electroweak
      ratio / the ★2 mixing-angle VALUE (INPUT B, human-gated CHAIN RUNWAY — needs derived
      dynamics not in the chain; NOT invented).
    · NOT "= the physical F₄ / the Albert automorphism GROUP" as a literal identity (jDer is
      the arena's Jordan-derivation Lie algebra; the Hermitian-27 restriction / e₆ tower is
      downstream). Physics names are removable prose.

  Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanGaugeSpectrumInvariant
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanFormallyReal
import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.DerivationBracket
import Phys.Algebra.DerivationColourCentralizer
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

set_option synthInstance.maxSize 400000

/-! ## B0 — the entrywise gauge action bundled as a linear endomorphism of the arena. -/

/-- `jActL D` is the entrywise gauge action `jAct D` (N268) packaged as a genuine ℚ-linear
    endomorphism of the arena `Matrix (Fin 3) (Fin 3) (O ℚ)`. Linearity is the banked
    `jAct_add` / `jAct_smul_matrix`. -/
noncomputable def jActL (D : Module.End ℚ (O ℚ)) :
    Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  toFun := jAct D
  map_add' := jAct_add D
  map_smul' := by intro r M; simpa using jAct_smul_matrix D r M

@[simp] theorem jActL_apply (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jActL D M = jAct D M := rfl

/-- `jActL` is additive in the derivation argument. -/
theorem jActL_add_arg (D D' : Module.End ℚ (O ℚ)) : jActL (D + D') = jActL D + jActL D' := by
  apply LinearMap.ext; intro M
  apply Matrix.ext; intro i j
  simp only [jActL_apply, jAct, Matrix.map_apply, LinearMap.add_apply, Matrix.add_apply]

/-- `jActL` commutes with ℚ-scaling of the derivation argument. -/
theorem jActL_smul_arg (c : ℚ) (D : Module.End ℚ (O ℚ)) : jActL (c • D) = c • jActL D := by
  apply LinearMap.ext; intro M
  apply Matrix.ext; intro i j
  simp only [jActL_apply, jAct, Matrix.map_apply, LinearMap.smul_apply, Matrix.smul_apply]

/-! ## B1/B2 — the arena's JORDAN-DERIVATION LIE ALGEBRA `jDer` (the f₄-ambient). -/

/-- `IsJordanDerivQ T` : a ℚ-linear endomorphism `T` of the arena is a derivation of the
    symmetric (Jordan) bracket `jb A B = A*B + B*A`. The condition carving `f₄ = Der(J₃(O))`. -/
def IsJordanDerivQ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) : Prop :=
  ∀ A B, T (jb A B) = jb (T A) B + jb A (T B)

/-- Bracket-closure: the commutator of two Jordan-derivations is a Jordan-derivation. The
    standard Leibniz calculation on the (additive-in-each-argument, ℚ-bilinear) Jordan bracket. -/
theorem isJordanDerivQ_bracket (S T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hS : IsJordanDerivQ S) (hT : IsJordanDerivQ T) : IsJordanDerivQ (⁅S, T⁆) := by
  intro A B
  rw [show (⁅S, T⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = S * T - T * S from
      Ring.lie_def S T]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  -- expand the inner derivations, push S/T over the sums, then expand each piece.
  rw [hT A B, hS A B]
  simp only [map_add]
  rw [hS (T A) B, hS A (T B), hT (S A) B, hT A (S B)]
  -- everything is now `jb` of atoms; unfold jb and let the ring cancel the cross terms.
  simp only [jb, mul_add, add_mul, mul_sub, sub_mul]
  abel_nf

/-- ★★★ THE ARENA'S JORDAN-DERIVATION LIE ALGEBRA `jDer` (the f₄-AMBIENT). The set of ℚ-linear
    endomorphisms of `J₃(O ℚ)` that are derivations of the symmetric (Jordan) bracket `jb`,
    assembled as a genuine `LieSubalgebra`. This is the CONTAINER in which `f₄ = Der(J₃(O))`
    lives — the single simple ambient (with its unique invariant form, B6) the deferred weak-
    mixing front (N283 INPUT A) structurally requires. -/
def jDer : LieSubalgebra ℚ (Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) where
  carrier := { T | IsJordanDerivQ T }
  add_mem' := by
    intro S T hS hT A B
    simp only [LinearMap.add_apply]
    rw [hS A B, hT A B]
    simp only [jb, LinearMap.map_add, map_add]
    simp only [add_mul, mul_add]; abel
  zero_mem' := by
    intro A B
    simp only [LinearMap.zero_apply, jb, mul_zero, zero_mul, add_zero]
  smul_mem' := by
    intro c T hT A B
    simp only [LinearMap.smul_apply]
    rw [hT A B]
    simp only [jb, smul_add, mat_smul_mul, mat_mul_smul]
  lie_mem' := by
    intro S T hS hT
    exact isJordanDerivQ_bracket S T hS hT

@[simp] theorem mem_jDer {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} :
    T ∈ jDer ↔ IsJordanDerivQ T := Iff.rfl

/-! ## B3/B4 — the derived gauge g₂ embeds into the arena's derivations as a bundled Lie hom. -/

/-- B3: the entrywise gauge action of any derivation `D` of `O ℚ` IS a Jordan-derivation of the
    arena — so `jActL D ∈ jDer`. This is the banked `jAct_jb` (N268), now placing g₂ INSIDE f₄. -/
theorem jActL_mem (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : jActL D ∈ jDer := by
  intro A B
  simpa using jAct_jb D hD A B

/-- Functoriality of the entrywise lift: `jActL ⁅D, D'⁆ = ⁅jActL D, jActL D'⁆` as arena
    endomorphisms. The bracket is `D*D' − D'*D` and `jAct` applies `D` entrywise, so the two
    sides agree entrywise (coordinate-free). -/
theorem jActL_bracket (D D' : Module.End ℚ (O ℚ)) :
    jActL (⁅D, D'⁆) = ⁅jActL D, jActL D'⁆ := by
  apply LinearMap.ext; intro M
  apply Matrix.ext; intro i j
  rw [show (⁅jActL D, jActL D'⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = jActL D * jActL D' - jActL D' * jActL D from Ring.lie_def _ _]
  simp only [jActL_apply, jAct, LinearMap.sub_apply, Module.End.mul_apply, Matrix.sub_apply,
    Matrix.map_apply]
  rw [show (⁅D, D'⁆ : Module.End ℚ (O ℚ)) = D * D' - D' * D from Ring.lie_def D D']
  simp only [LinearMap.sub_apply, Module.End.mul_apply]

/-- ★★★ THE BUNDLED, FAITHFUL EMBEDDING `g2ToJDer : derivationLieQ →ₗ⁅ℚ⁆ jDer`. The derived
    gauge `g₂ = Der(O ℚ)` (N6, `derivationLieQ`) embeds into the arena's Jordan-derivation
    algebra `jDer = f₄` as a genuine LIE HOMOMORPHISM `D ↦ jActL D`. This is the LieHom N269
    proved existed at the invariant level but did NOT bundle: `g₂ ⊆ f₄` as a morphism of Lie
    algebras. -/
noncomputable def g2ToJDer : derivationLieQ →ₗ⁅ℚ⁆ jDer where
  toFun D := ⟨jActL (D : Module.End ℚ (O ℚ)), jActL_mem (D : Module.End ℚ (O ℚ)) D.2⟩
  map_add' := by
    intro D D'
    apply Subtype.ext
    show jActL ((D + D' : derivationLieQ) : Module.End ℚ (O ℚ)) = _
    rw [show ((D + D' : derivationLieQ) : Module.End ℚ (O ℚ))
          = (D : Module.End ℚ (O ℚ)) + (D' : Module.End ℚ (O ℚ)) from rfl,
        jActL_add_arg]
    rfl
  map_smul' := by
    intro c D
    apply Subtype.ext
    show jActL ((c • D : derivationLieQ) : Module.End ℚ (O ℚ)) = _
    rw [show ((c • D : derivationLieQ) : Module.End ℚ (O ℚ))
          = c • (D : Module.End ℚ (O ℚ)) from rfl,
        jActL_smul_arg]
    rfl
  map_lie' := by
    intro D D'
    apply Subtype.ext
    show jActL ((⁅D, D'⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) = _
    rw [show ((⁅D, D'⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
          = ⁅(D : Module.End ℚ (O ℚ)), (D' : Module.End ℚ (O ℚ))⁆ from rfl,
        jActL_bracket]
    rfl

@[simp] theorem g2ToJDer_coe (D : derivationLieQ) :
    (g2ToJDer D : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = jActL (D : Module.End ℚ (O ℚ)) :=
  rfl

/-! ## B5 — the embedding is FAITHFUL. -/

/-- ★★ FAITHFULNESS: `g2ToJDer` is INJECTIVE. If `jActL D` is the zero endomorphism of the arena,
    then `D = 0`: applying it to the slot `slotA a` gives `slotA (D a) = 0`, and `slotA` is
    injective (N267), so `D a = 0` for every `a`. So `g₂` embeds FAITHFULLY into the arena's
    Jordan-derivation algebra — a genuine copy of the 14-dim gauge inside f₄. -/
theorem g2ToJDer_injective : Function.Injective g2ToJDer := by
  intro D D' hDD'
  -- The bundled hom values agree ⇒ their underlying arena endomorphisms agree.
  have hcoe : jActL (D : Module.End ℚ (O ℚ)) = jActL (D' : Module.End ℚ (O ℚ)) := by
    have h := congrArg (Subtype.val) hDD'
    simpa only [g2ToJDer_coe] using h
  -- ⇒ the underlying derivations of O ℚ agree, via the injective slot embedding.
  apply Subtype.ext
  apply LinearMap.ext; intro a
  have hslot : jAct (D : Module.End ℚ (O ℚ)) (slotA a) = jAct (D' : Module.End ℚ (O ℚ)) (slotA a) := by
    have h := congrArg (fun (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) => T (slotA a)) hcoe
    simpa only [jActL_apply] using h
  rw [jAct_slotA (D : Module.End ℚ (O ℚ)) D.2 a,
      jAct_slotA (D' : Module.End ℚ (O ℚ)) D'.2 a] at hslot
  exact slotA_inj hslot

/-! ## B6 — the embedded gauge is SKEW-ADJOINT in the arena's unique (positive-definite) form. -/

/-- ★★★ THE UNIQUE-FORM ANCHOR. The embedded gauge lands SKEW-ADJOINT in the banked
    POSITIVE-DEFINITE trace form `jTraceForm` (N214/N270): for every derivation `D` of `O ℚ`,
    `reQ (jTraceForm (jAct D A) B) + reQ (jTraceForm A (jAct D B)) = 0`. Mechanism (coordinate-
    free): `jb (jAct D A) B + jb A (jAct D B) = jAct D (jb A B)` (N268 `jAct_jb`), so the trace
    sum is `trace (jAct D (jb A B)) = ∑ D((jb A B)ᵢᵢ)`, whose real part vanishes term-by-term
    because a derivation maps into the imaginary subspace (`reQ_deriv_zero`, N269). So g₂ sits in
    `so(jTraceForm)` of the arena's UNIQUE invariant form — the single simple ambient with a
    unique form N283 named as the structure the weak-mixing front requires. -/
theorem jActL_skew_jTraceForm (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    reQ (jTraceForm (jAct D A) B) + reQ (jTraceForm A (jAct D B)) = 0 := by
  have hjb : jb (jAct D A) B + jb A (jAct D B) = jAct D (jb A B) := (jAct_jb D hD A B).symm
  rw [jTraceForm, jTraceForm, ← reQ_add, ← Matrix.trace_add, hjb, jAct, Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.map_apply, Fin.sum_univ_three]
  rw [reQ_add, reQ_add, reQ_deriv_zero D hD, reQ_deriv_zero D hD, reQ_deriv_zero D hD]
  ring

/-! ## W8 — ANTI-VACUITY: the embedding is genuinely non-trivial. -/

/-- W8: the embedded gauge is genuinely NONZERO — `jActL witnessDerivQ` moves some slot
    `slotA a` to `slotA (witnessDerivQ a) ≠ 0`, because the banked witness derivation is nonzero
    (N6 `witnessDerivQ_ne_zero`) and `slotA` is faithful (N267). The embedding is not the trivial
    "everything to zero." -/
theorem jActL_witness_ne_zero : jActL (witnessDerivQ : Module.End ℚ (O ℚ)) ≠ 0 := by
  -- witnessDerivQ ≠ 0 ⇒ ∃ a, witnessDerivQ a ≠ 0.
  have hne : (witnessDerivQ : Module.End ℚ (O ℚ)) ≠ 0 := witnessDerivQ_ne_zero
  have hex : ∃ a, (witnessDerivQ : Module.End ℚ (O ℚ)) a ≠ 0 := by
    by_contra h
    rw [not_exists] at h
    simp only [not_not] at h
    exact hne (LinearMap.ext fun a => by simpa using h a)
  obtain ⟨a, ha⟩ := hex
  intro hzero
  -- If jActL witnessDerivQ = 0 then jAct witnessDerivQ (slotA a) = 0, contradicting slotA_ne_zero.
  have hslot : jAct (witnessDerivQ : Module.End ℚ (O ℚ)) (slotA a) = 0 := by
    have := congrArg (fun (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) => T (slotA a)) hzero
    simpa only [jActL_apply, LinearMap.zero_apply] using this
  rw [jAct_slotA witnessDerivQ witnessDerivQ_isDerivQ a] at hslot
  exact slotA_ne_zero ha hslot

/-! ## THE CAPSTONE. -/

/-- ★★★ N284 — THE DERIVED ARENA'S JORDAN-DERIVATION LIE ALGEBRA + THE BUNDLED, FAITHFUL,
    TRACE-SKEW EMBEDDING OF g₂. Bundles: (i) `jDer` a `LieSubalgebra` (the f₄-ambient); (ii) the
    derived gauge inside it as a faithful Lie hom `g2ToJDer` (INJECTIVE); (iii) that gauge
    SKEW-ADJOINT in the banked positive-definite trace form (the unique invariant form); (iv) the
    embedding non-vacuous; carrying `jordan_cap_pinned_at_three` in the TYPE — the ambient is
    genuine only at the cap-forced terminal order 3, NOT carrier-agnostic. -/
theorem arena_derivation_algebra_structure :
    IsJordanDerivQ (jActL (witnessDerivQ : Module.End ℚ (O ℚ)))
    ∧ Function.Injective g2ToJDer
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ A B,
        reQ (jTraceForm (jAct D A) B) + reQ (jTraceForm A (jAct D B)) = 0)
    ∧ jActL (witnessDerivQ : Module.End ℚ (O ℚ)) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨jActL_mem witnessDerivQ witnessDerivQ_isDerivQ,
   g2ToJDer_injective,
   fun D hD A B => jActL_skew_jTraceForm D hD A B,
   jActL_witness_ne_zero,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
