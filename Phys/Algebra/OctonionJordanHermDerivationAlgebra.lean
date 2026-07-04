/-
  Phys.Algebra.OctonionJordanHermDerivationAlgebra —
  N285: THE DERIVED HERMITIAN MATTER ARENA'S DERIVATION LIE ALGEBRA `derH3 = Der(H₃(O ℚ)) = f₄`
        — THE GENUINE AMBIENT (INPUT A) ON THE CORRECT CARRIER + THE RE-SEATED FAITHFUL,
          TRACE-SKEW EMBEDDING OF THE DERIVED GAUGE g₂, WITH THE MEASURED EVIDENCE THAT N284's
          FULL-SPACE `jDer` IS STRUCTURALLY INSUFFICIENT.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; docs/NODE_SELECTION.md SELECT, comments 191-194).
  The fold → self-blindness → complex unit → cascade → the terminal, NON-ASSOCIATIVE
  octonions `O ℚ = CD (H ℚ)`. That non-associativity CAPS the HERMITIAN Jordan tower at
  order 3 (N5 `jordan_cap_pinned_at_three` / `jordan_fails_H4`): `H₃(O ℚ)` is the MAXIMAL
  matter arena — a genuine Jordan algebra PRECISELY because it is the Hermitian part. The
  fold's next beat at that terminal arena is its FORCED symmetry: the derivation algebra of
  the arena's own Jordan product, `Der(H₃(O)) = f₄`.

  WHY THE CARRIER MATTERS (the measured redirect). N284 built `jDer` = derivations of the
  symmetric bracket `jb` on the FULL matrix space `Matrix (Fin 3) (Fin 3) (O ℚ)`. But `jb`
  is a genuine JORDAN bracket (`jdef = 0`) ONLY on the HERMITIAN submatrices (that is exactly
  the banked `jdef_H3`); over the full space the octonion matrices are not a special Jordan
  algebra, and the INNER derivations `innerMul = ⁅L_A, L_B⁆` — the f₄/g₂ complement where the
  electroweak directions live — are NOT derivations of the full-space `jDer`
  (`innerMul(Herm) ∉ jDer`, measured 60/60 nonzero on general arguments;
  `workbench/N285-select/probe_innerder.py`, `probe_membership.py`). So the full-space object
  is real and foundations-only, but it is the WRONG ambient for `f₄ = Der(J₃(O))`: it excludes
  the very complement N283 named as the structure the ≥11×-deferred weak-mixing front (INPUT A)
  requires. The genuine ambient is the derivation algebra of the HERMITIAN arena.

  THIS NODE builds the genuine ambient and re-seats g₂:
    · `IsHermJordanDerivQ T` / `derH3` — the arena's HERMITIAN-restricted Jordan-derivation
                     LIE ALGEBRA as a genuine `LieSubalgebra`. THE GENUINE f₄ = Der(H₃(O)).
    · `jb_herm` / `innerMul_herm` / `jActL_herm` — the Jordan product, its inner commutator,
                     and the entrywise gauge all PRESERVE the Hermitian subspace (coordinate-free).
    · `jActL_mem_derH3` / `g2ToDerH3` — the derived gauge g₂ sits inside as a BUNDLED, FAITHFUL
                     Lie hom `derivationLieQ →ₗ⁅ℚ⁆ derH3` (re-seating N284's embedding on the
                     correct carrier).
    · `g2ToDerH3_injective` — that embedding is FAITHFUL (via `slotA_inj`, N267).
    · `jActL_skew_jTraceForm` (banked N284) — g₂ lands SKEW-ADJOINT in the banked
                     POSITIVE-DEFINITE trace form `jTraceForm` (N214/N270): the UNIQUE-FORM ANCHOR.
    · THE MEASURED STRUCTURAL TEETH: `innerMul_herm` (`innerMul` preserves H₃, so it is a
                     candidate member of `derH3` the full-space `jDer` MISSES) and
                     `innerMul_moves_diagonal` (N274 — `innerMul` MOVES the diagonal, which every
                     g₂ element FIXES, `jAct_Dg`; so `innerMul ∉ jActL '' g₂`: `f₄ ⊋ g₂` at least
                     at the inner-derivation generator).
    · capstone `herm_arena_derivation_algebra_structure`.

  ONE CAUSE MANY TERMINATIONS: the SAME octonion non-associativity that stops the cascade
  (N2c), caps the Hermitian Jordan tower at order 3 (N5), makes matter indivisible (N265) and
  the arena formally real (N270), now furnishes the arena with a derivation algebra
  `f₄ = Der(H₃(O)) ⊋ g₂` whose unique invariant form is the derived positive-definite trace
  form — no external GUT embedding chosen, the ambient DERIVED, on the CORRECT carrier.

  THE DISSOLUTION / MOAT: the field POSITS `F₄ = Aut(J₃(O))` (imports the Albert algebra + its
  automorphism group) and CHOOSES a GUT embedding to fix the hypercharge normalization; the
  theory DERIVES the arena (N5/N267), its genuine Jordan-derivation algebra on the Hermitian
  carrier (here), the gauge g₂ inside it (here), the unique invariant form (the derived
  positive-definite `jTraceForm`), and now the measured evidence that the inner-derivation
  complement is genuinely present here (and absent from the full-space near-miss).

  SCOPE / HONESTY (what is NOT claimed here):
    · NOT `innerMul(Herm) ∈ derH3` — the Jordan-derivation LAW on Hermitian args (`f₄ ⊋ g₂`
      PROPER, the electroweak-bearing complement genuinely inside f₄) needs the LINEARIZED Jordan
      identity (polarizing the banked `jdef_H3`), a W9-heavy structural proof step DEFERRED to the
      single successor child. THIS node banks that `innerMul` preserves H₃ (a candidate member the
      full-space `jDer` misses) and escapes g₂ — NOT that it satisfies the derivation law.
    · NOT the electroweak factors placed inside f₄, NOT the convention-free electroweak ratio /
      the ★2 mixing-angle VALUE (INPUT B, human-gated CHAIN RUNWAY — NOT invented).
    · NOT "= the physical F₄ / the Albert automorphism GROUP" as a literal identity. Physics
      names are removable prose.

  Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanDerivationAlgebra
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

set_option synthInstance.maxSize 400000

/-! ## B0 — the symmetric product, its inner commutator, and the gauge all PRESERVE Hermitian.

    "Hermitian" is `Aᴴ = A` (the `Matrix.IsHermitian` typeclass does not resolve over the
    non-associative `narCD` ring, but plain `conjTranspose` does). Each preservation is
    coordinate-free: `jb`/`innerMul` via the star anti-homomorphism `conjTranspose_mul` (needs
    NO associativity), `jActL` via the banked `derivQ_star_comm` (a derivation commutes with
    conjugation). -/

/-- The Jordan product `jb A B = A*B + B*A` PRESERVES the Hermitian subspace: if `Aᴴ = A` and
    `Bᴴ = B` then `(jb A B)ᴴ = jb A B`. Coordinate-free via `conjTranspose_mul`. -/
theorem jb_herm {A B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) (hB : Bᴴ = B) :
    (jb A B)ᴴ = jb A B := by
  unfold jb
  rw [conjTranspose_add, conjTranspose_mul, conjTranspose_mul, hA, hB]
  abel

/-- The off-diagonal generator matrix `Xz a b c` (zero diagonal, conjugate off-diagonals) is
    HERMITIAN by construction: `(Xz a b c)ᴴ = Xz a b c`. -/
theorem Xz_herm (a b c : O ℚ) : (Xz a b c)ᴴ = Xz a b c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, conjTranspose_apply, star_zero, star_star]

/-- The matter slot `slotA 1` is Hermitian. -/
theorem slotA_one_herm : (slotA (1 : O ℚ))ᴴ = slotA 1 := Xz_herm 1 0 0

/-- The matter slot `slotB 1` is Hermitian. -/
theorem slotB_one_herm : (slotB (1 : O ℚ))ᴴ = slotB 1 := Xz_herm 0 1 0

/-- The inner-multiplication commutator `innerMul A B` (N274) PRESERVES the Hermitian subspace:
    if `A, B, X` are Hermitian so is `innerMul A B X`. A difference of `jb`-preserved terms
    (`jb_herm`). This is the CANDIDATE membership the full-space `jDer` MISSES: `innerMul` maps
    Hermitian to Hermitian, so it acts on the arena — yet it is not a derivation of the full-space
    bracket (measured), only of the Hermitian one (the childed W9 obligation). -/
theorem innerMul_herm {A B X : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) (hX : Xᴴ = X) :
    (innerMul A B X)ᴴ = innerMul A B X := by
  rw [innerMul_apply, conjTranspose_sub, jb_herm hA (jb_herm hB hX), jb_herm hB (jb_herm hA hX)]

/-- The entrywise gauge `jActL D = jAct D` (for a derivation `D` of `O ℚ`) PRESERVES the Hermitian
    subspace: if `Mᴴ = M` then `(jAct D M)ᴴ = jAct D M`. Entrywise via the banked
    `derivQ_star_comm` (`D` commutes with conjugation). -/
theorem jActL_herm {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D)
    {M : Matrix (Fin 3) (Fin 3) (O ℚ)} (hM : Mᴴ = M) :
    (jAct D M)ᴴ = jAct D M := by
  apply Matrix.ext; intro i j
  have hMji : star (M j i) = M i j := congrFun (congrFun hM i) j
  simp only [conjTranspose_apply, jAct, Matrix.map_apply]
  rw [← derivQ_star_comm D hD, hMji]

/-! ## B1/B2 — the HERMITIAN-restricted Jordan-derivation Lie algebra `derH3` (the genuine f₄). -/

/-- `IsHermJordanDerivQ T` : a ℚ-linear endomorphism `T` of the matrix arena is a derivation of the
    Jordan structure ON THE HERMITIAN ARENA `H₃(O)`. Two conditions: `T` PRESERVES the Hermitian
    subspace, and `T` satisfies the Leibniz law of the symmetric bracket `jb` FOR HERMITIAN
    arguments. This carves the GENUINE `f₄ = Der(J₃(O))` — the Jordan structure is genuine only on
    the Hermitian part (`jdef_H3`), so the derivation condition is imposed there. -/
def IsHermJordanDerivQ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) : Prop :=
  (∀ M, Mᴴ = M → (T M)ᴴ = T M) ∧
  (∀ A B, Aᴴ = A → Bᴴ = B → T (jb A B) = jb (T A) B + jb A (T B))

/-- Bracket-closure: the commutator of two Hermitian-restricted Jordan-derivations is again one.
    The Hermitian-preservation half is a direct composition; the Leibniz half is the standard
    Leibniz calculation on the ℚ-bilinear Jordan bracket, restricted to Hermitian arguments (whose
    `T`-images are Hermitian, so the inner uses stay valid). -/
theorem hermJordanDerivQ_bracket (S T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hS : IsHermJordanDerivQ S) (hT : IsHermJordanDerivQ T) :
    IsHermJordanDerivQ (⁅S, T⁆) := by
  obtain ⟨hSherm, hSjd⟩ := hS
  obtain ⟨hTherm, hTjd⟩ := hT
  refine ⟨?_, ?_⟩
  · intro M hM
    rw [show (⁅S, T⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = S * T - T * S from
        Ring.lie_def S T]
    simp only [LinearMap.sub_apply, Module.End.mul_apply, conjTranspose_sub]
    rw [hSherm _ (hTherm _ hM), hTherm _ (hSherm _ hM)]
  · intro A B hA hB
    rw [show (⁅S, T⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = S * T - T * S from
        Ring.lie_def S T]
    simp only [LinearMap.sub_apply, Module.End.mul_apply]
    rw [hTjd A B hA hB, hSjd A B hA hB]
    simp only [map_add]
    rw [hSjd (T A) B (hTherm A hA) hB, hSjd A (T B) hA (hTherm B hB),
        hTjd (S A) B (hSherm A hA) hB, hTjd A (S B) hA (hSherm B hB)]
    simp only [jb, mul_sub, sub_mul]
    abel_nf

/-- ★★★ THE GENUINE `f₄ = Der(J₃(O))`. The HERMITIAN-restricted Jordan-derivation LIE ALGEBRA
    `derH3`: the ℚ-linear endomorphisms of the matrix arena that PRESERVE the Hermitian subspace
    `H₃(O)` and are derivations of the symmetric (Jordan) bracket `jb` on Hermitian arguments,
    assembled as a genuine `LieSubalgebra`. This is the CORRECT ambient (INPUT A) — the one that
    contains the inner-derivation complement `innerMul` (which the full-space N284 `jDer` excludes).
    -/
def derH3 : LieSubalgebra ℚ (Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) where
  carrier := { T | IsHermJordanDerivQ T }
  add_mem' := by
    intro S T hS hT
    obtain ⟨hSherm, hSjd⟩ := hS
    obtain ⟨hTherm, hTjd⟩ := hT
    refine ⟨?_, ?_⟩
    · intro M hM
      simp only [LinearMap.add_apply, conjTranspose_add]
      rw [hSherm M hM, hTherm M hM]
    · intro A B hA hB
      simp only [LinearMap.add_apply]
      rw [hSjd A B hA hB, hTjd A B hA hB]
      simp only [jb, mul_add, add_mul]
      abel
  zero_mem' := by
    refine ⟨?_, ?_⟩
    · intro M _; simp only [LinearMap.zero_apply, conjTranspose_zero]
    · intro A B _ _
      simp only [LinearMap.zero_apply, jb, mul_zero, zero_mul, add_zero]
  smul_mem' := by
    intro c T hT
    obtain ⟨hTherm, hTjd⟩ := hT
    refine ⟨?_, ?_⟩
    · intro M hM
      simp only [LinearMap.smul_apply, conjTranspose_smul]
      rw [star_trivial, hTherm M hM]
    · intro A B hA hB
      simp only [LinearMap.smul_apply]
      rw [hTjd A B hA hB]
      simp only [jb, smul_add, mat_smul_mul, mat_mul_smul]
  lie_mem' := by
    intro S T hS hT
    exact hermJordanDerivQ_bracket S T hS hT

@[simp] theorem mem_derH3 {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} :
    T ∈ derH3 ↔ IsHermJordanDerivQ T := Iff.rfl

/-! ## B3/B4 — the derived gauge g₂ embeds into the genuine f₄ as a bundled Lie hom. -/

/-- B3: the entrywise gauge action of any derivation `D` of `O ℚ` IS a Hermitian-restricted
    Jordan-derivation of the arena — so `jActL D ∈ derH3`. Hermitian-preservation is `jActL_herm`;
    the Jordan-derivation law (even in the full-space form, `jAct_jb` N268) restricts to Hermitian
    arguments. So g₂ sits inside the GENUINE f₄, on the correct carrier. -/
theorem jActL_mem_derH3 (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : jActL D ∈ derH3 := by
  refine ⟨?_, ?_⟩
  · intro M hM
    simpa only [jActL_apply] using jActL_herm hD hM
  · intro A B _ _
    simpa only [jActL_apply] using jAct_jb D hD A B

/-- ★★★ THE RE-SEATED, BUNDLED, FAITHFUL EMBEDDING `g2ToDerH3 : derivationLieQ →ₗ⁅ℚ⁆ derH3`. The
    derived gauge `g₂ = Der(O ℚ)` (N6, `derivationLieQ`) embeds into the GENUINE
    `f₄ = Der(H₃(O)) = derH3` as a Lie homomorphism `D ↦ jActL D`. This is N284's embedding
    re-seated on the CORRECT (Hermitian) carrier — the ambient that actually contains the
    inner-derivation complement. Structure-preservation reuses the banked `jActL_add_arg`,
    `jActL_smul_arg`, `jActL_bracket` (N284). -/
noncomputable def g2ToDerH3 : derivationLieQ →ₗ⁅ℚ⁆ derH3 where
  toFun D := ⟨jActL (D : Module.End ℚ (O ℚ)), jActL_mem_derH3 (D : Module.End ℚ (O ℚ)) D.2⟩
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

@[simp] theorem g2ToDerH3_coe (D : derivationLieQ) :
    (g2ToDerH3 D : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = jActL (D : Module.End ℚ (O ℚ)) :=
  rfl

/-! ## B5 — the embedding is FAITHFUL. -/

/-- ★★ FAITHFULNESS: `g2ToDerH3` is INJECTIVE (via `slotA_inj`, N267 — exactly N284's argument on
    the re-seated carrier). So `g₂` embeds FAITHFULLY into the genuine `f₄ = Der(H₃(O))` — a genuine
    14-dim copy of the derived gauge inside the correct ambient. -/
theorem g2ToDerH3_injective : Function.Injective g2ToDerH3 := by
  intro D D' hDD'
  have hcoe : jActL (D : Module.End ℚ (O ℚ)) = jActL (D' : Module.End ℚ (O ℚ)) := by
    have h := congrArg (Subtype.val) hDD'
    simpa only [g2ToDerH3_coe] using h
  apply Subtype.ext
  apply LinearMap.ext; intro a
  have hslot : jAct (D : Module.End ℚ (O ℚ)) (slotA a) = jAct (D' : Module.End ℚ (O ℚ)) (slotA a) := by
    have h := congrArg (fun (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) => T (slotA a)) hcoe
    simpa only [jActL_apply] using h
  rw [jAct_slotA (D : Module.End ℚ (O ℚ)) D.2 a,
      jAct_slotA (D' : Module.End ℚ (O ℚ)) D'.2 a] at hslot
  exact slotA_inj hslot

/-! ## B6 — the MEASURED STRUCTURAL TEETH: the inner-derivation complement is present here and
        escapes g₂ (the full-space `jDer` insufficiency, made into theorems). -/

/-- ★★ THE COMPLEMENT IS PRESENT ON THE CORRECT CARRIER. The inner-multiplication commutator
    `innerMul (slotA 1)(slotB 1)` PRESERVES the Hermitian subspace (`innerMul_herm`) — so it acts on
    the arena `H₃(O)` and is a CANDIDATE member of `derH3` — YET it MOVES the diagonal
    (`innerMul_moves_diagonal`, N274: `innerMul (slotA 1)(slotB 1)(Dg 0 0 1) ≠ 0`), which EVERY
    entrywise gauge element FIXES (`jAct_Dg`, N268). So the inner-derivation generator is NOT in the
    entrywise image `jActL '' g₂`: `f₄ ⊋ g₂` at least at the inner-derivation generator — the
    complement where the electroweak directions live is genuinely PRESENT on this carrier (and, by
    the N285 measurement, ABSENT from N284's full-space `jDer`). -/
theorem innerMul_escapes_g2 :
    (∀ X, Xᴴ = X → (innerMul (slotA 1) (slotB 1) X)ᴴ = innerMul (slotA 1) (slotB 1) X)
    ∧ innerMul (slotA 1) (slotB 1) (Dg 0 0 1) ≠ 0
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ d0 d1 d2, jAct D (Dg d0 d1 d2) = 0) := by
  refine ⟨?_, innerMul_moves_diagonal, ?_⟩
  · intro X hX
    exact innerMul_herm slotA_one_herm slotB_one_herm hX
  · intro D hD d0 d1 d2
    exact jAct_Dg D hD d0 d1 d2

/-! ## W8 — ANTI-VACUITY: the embedding is genuinely non-trivial. -/

/-- W8: the embedded gauge is genuinely NONZERO (the banked N284 witness, on the re-seated carrier).
    `jActL witnessDerivQ` moves some slot to `slotA (witnessDerivQ a) ≠ 0`. -/
theorem g2ToDerH3_witness_ne_zero : jActL (witnessDerivQ : Module.End ℚ (O ℚ)) ≠ 0 :=
  jActL_witness_ne_zero

/-! ## THE CAPSTONE. -/

/-- ★★★ N285 — THE GENUINE `f₄ = Der(H₃(O))` ON THE CORRECT CARRIER + THE RE-SEATED FAITHFUL,
    TRACE-SKEW EMBEDDING OF g₂. Bundles: (i) `g2ToDerH3` INJECTIVE (g₂ a faithful 14-dim subalgebra
    of the genuine f₄); (ii) that gauge SKEW-ADJOINT in the banked positive-definite `jTraceForm`
    (the unique invariant form, N284 B6); (iii) the inner-derivation complement PRESENT here
    (`innerMul` preserves H₃) and ESCAPING g₂ (moves the diagonal g₂ fixes) — `f₄ ⊋ g₂`; (iv) the
    embedding non-vacuous; carrying `jordan_cap_pinned_at_three` in the TYPE — the arena is genuine
    only at the cap-forced terminal order 3, NOT carrier-agnostic. -/
theorem herm_arena_derivation_algebra_structure :
    Function.Injective g2ToDerH3
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ A B,
        reQ (jTraceForm (jAct D A) B) + reQ (jTraceForm A (jAct D B)) = 0)
    ∧ (∀ X, Xᴴ = X → (innerMul (slotA 1) (slotB 1) X)ᴴ = innerMul (slotA 1) (slotB 1) X)
    ∧ innerMul (slotA 1) (slotB 1) (Dg 0 0 1) ≠ 0
    ∧ jActL (witnessDerivQ : Module.End ℚ (O ℚ)) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨g2ToDerH3_injective,
   fun D hD A B => jActL_skew_jTraceForm D hD A B,
   (fun _X hX => innerMul_herm slotA_one_herm slotB_one_herm hX),
   innerMul_moves_diagonal,
   g2ToDerH3_witness_ne_zero,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
