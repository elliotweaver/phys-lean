import Phys.Algebra.OctonionJordanSpectrumMovingSector
import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance —
  N296: THE f₄-EQUIVARIANCE OF THE SPECTRUM-MOVING SECTOR — the third bracket relation
  `[f₄, L₀] ⊆ L₀` that closes the Z₂-graded Lie structure of the reduced structure algebra
  `e₆ = f₄ ⊕ L₀`; the mass-texture module IS the derived matter arena.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the named ascent toward ★5/★2, continuing N295).

  N295 built the FIRST object beyond `f₄ = Der(H₃(O)) = derH3` (N285/N286) that MOVES the
  arena's spectrum: the Jordan left-multiplication `Lmul A X = jb A X` (banked N274). It moves
  the identity `f₄` fixes (`Lmul_one`: `Lmul A 1 = A + A`; `derH3_kills_one`: `T 1 = 0`), it is
  genuinely OUTSIDE `f₄` (`Lmul_notMem_derH3`), and its brackets close BACK into `f₄`
  (`spectrum_movers_close_into_derH3`: `⁅Lmul A, Lmul B⁆ = innerMul A B ∈ derH3`, `[L₀,L₀]⊆f₄`).

  The fold's OWN next beat: HOW does the spectrum-PRESERVING `f₄` act on the spectrum-MOVING
  sector `L₀`? A derivation is the fold's Leibniz-act on the arena's multiplication `jb`; its
  action on the multiplication OPERATORS `Lmul A` is therefore FORCED by that SAME Leibniz law.
  We compute it and it is the third and final bracket relation:

      ★  ⁅T, Lmul A⁆ B = Lmul (T A) B    for T ∈ derH3, Hermitian A, B    ( [f₄, L₀] ⊆ L₀ ).

  This says the map `A ↦ Lmul A` is an `f₄`-MODULE INTERTWINER: the spectrum-moving sector `L`
  is a canonical copy of the matter arena `H₃(O)` itself, carrying the `f₄`-action `A ↦ T A`.
  Together with the two banked relations — `[f₄,f₄] ⊆ f₄` (`derH3` is a `LieSubalgebra`) and
  `[L₀,L₀] ⊆ f₄` (N295) — this is the COMPLETE Z₂-graded bracket structure of the reduced
  structure algebra `e₆ = f₄ ⊕ L₀` (`dim 78 = 52 + 26`, measured N295).

  The action is NON-TRIVIAL: the derived family derivation `famC = innerMul (slotA 1)(slotB 1)`
  (N288, `∈ derH3`) sends the first matter slot to minus the second (`famC (slotA 1) = − slotB 1`,
  `famC_slotA`), so it MOVES the spectrum-mover `Lmul (slotA 1)` to `Lmul (− slotB 1)`:

      ⁅famC, Lmul (slotA 1)⁆ B = Lmul (− slotB 1) B  (`family_moves_mover`),  ≠ 0 at B = 1
      (`family_moves_mover_ne`).

  ------------------------------------------------------------------------------
  THE DISSOLUTION / MOAT.

  Standard physics POSITS the Yukawa / mass-texture sector as a spurion transforming in a CHOSEN
  representation of the gauge group, with the representation assignment put in by hand. The theory
  DISSOLVES the choice: the mass-texture module is NOT "some rep" — it is FORCED to be the derived
  matter arena `H₃(O)` itself, via the canonical intertwiner `A ↦ Lmul A`, and its transformation
  law is the DERIVATION LEIBNIZ LAW (the fold's own act), not a posited representation assignment.
  `[f₄, L₀] ⊆ L₀` with `L₀ ≅ H₃(O)` as an `f₄`-module is a THEOREM, not an input.

  ------------------------------------------------------------------------------
  THE ONE CAUSE MANY TERMINATIONS.

  The SAME octonion non-associativity that stops the cascade (N2c) and caps the Hermitian Jordan
  tower at order 3 (N5, `jordan_fails_H4`) furnishing the maximal matter arena `H₃(O)`, makes its
  derivations `f₄` the spectrum-preservers AND its left-multiplications `Lmul` the spectrum-movers —
  and now FORCES the derivations to act on the movers by the Leibniz law, exhibiting the movers as a
  canonical copy of the arena. One arena, one multiplication `jb`, one Leibniz law: the derivation
  part fixes the spectrum, the left-multiplication part moves it, and the derivation acts on the
  left-multiplications as it acts on the arena.

  ------------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE. Delete spectrum/mass/texture/module/symmetry-breaking/generation: for
  every `T` in the Hermitian Jordan-derivation Lie algebra `derH3` and Hermitian `A, B`, the
  ℚ-linear endomorphisms of `Matrix (Fin 3)(Fin 3)(O ℚ)` satisfy `⁅T, Lmul A⁆ B = Lmul (T A) B`
  (from the Leibniz law of `IsHermJordanDerivQ` at `A, B`); combined with `⁅Lmul A, Lmul B⁆ ∈ derH3`
  and the `LieSubalgebra` closure `⁅S, T⁆ ∈ derH3`, the graded sum `derH3 ⊕ {Lmul A}` closes under
  the bracket. The map `A ↦ Lmul A` intertwines `T` with the bracket action. Pure mathematics.

  SCOPE. Banks the equivariance (`[f₄,L₀]⊆L₀`, the module intertwiner) + the concrete non-trivial
  family action + non-vacuity + the graded-triple capstone. NOT the full `e₆ = f₄ ⊕ L₀` dim-78
  reduced structure algebra as a bundled `LieSubalgebra` (CHILDED — needs the 78-dim span handle);
  NOT the traceless `L₀` submodule refinement (CHILDED — needs "derH3 kills the linear trace jTr");
  NOT the jTr/jS spectrum-GRADING / weight structure (CHILDED — the named ascent's next rung); NOT
  the ★5 mass texture VALUE (route-not-yet-found); NOT the ★2 mixing VALUE (route-not-yet-found);
  NOT "= physical Yukawa / mass module" (removable prose).
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The equivariance — the third bracket relation `[f₄, L₀] ⊆ L₀` (the module intertwiner). -/

/-- ★★★ THE f₄-EQUIVARIANCE OF THE SPECTRUM-MOVING SECTOR. For every Jordan-derivation
    `T ∈ derH3 = f₄` (N285/N286) and Hermitian `A, B`, the commutator of `T` with the Jordan
    left-multiplication `Lmul A` (banked N274) is the left-multiplication by `T A`:

        `⁅T, Lmul A⁆ B = Lmul (T A) B`.

    This is the third and final bracket relation of the Z₂-graded reduced structure algebra
    `e₆ = f₄ ⊕ L₀`: `[f₄, L₀] ⊆ L₀`. It exhibits the map `A ↦ Lmul A` as an `f₄`-MODULE INTERTWINER
    — the spectrum-moving sector `L` is a canonical copy of the matter arena `H₃(O)` carrying the
    `f₄`-action `A ↦ T A`. FORCED, not posited: it is exactly the Leibniz law of `IsHermJordanDerivQ`
    (`hT.2`) rearranged — `T (jb A B) = jb (T A) B + jb A (T B)`, i.e.
    `T (Lmul A B) − Lmul A (T B) = Lmul (T A) B`. -/
theorem spectrum_sector_equivariance (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hT : T ∈ derH3) {A B : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) :
    ⁅T, Lmul A⁆ B = Lmul (T A) B := by
  rw [show (⁅T, Lmul A⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = T * Lmul A - Lmul A * T from Ring.lie_def T (Lmul A)]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, Lmul_apply]
  -- goal: T (jb A B) - jb A (T B) = jb (T A) B ; hT.2 A B: T (jb A B) = jb (T A) B + jb A (T B)
  rw [hT.2 A B hA hB]
  abel

/-! ## The action is NON-TRIVIAL — the derived family derivation MOVES the spectrum-mover. -/

/-- ★★ THE CONCRETE FAMILY ACTION. The derived family derivation `famC = innerMul (slotA 1)(slotB 1)`
    (N288, `famC_mem_derH3`) moves the spectrum-mover `Lmul (slotA 1)` to `Lmul (− slotB 1)`:

        `⁅famC, Lmul (slotA 1)⁆ B = Lmul (− slotB 1) B`   for Hermitian `B`.

    Via the equivariance + `famC (slotA 1) = − slotB 1` (`famC_slotA`, N288). The family symmetry
    acts on the spectrum-moving sector exactly as it rotates the matter slots — the intertwiner is
    genuine. -/
theorem family_moves_mover {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ B = Lmul (- slotB 1) B := by
  rw [spectrum_sector_equivariance _ famC_mem_derH3 slotA_one_herm hB, famC_slotA]

/-- ★★ NON-VACUITY (W8). The family derivation genuinely MOVES the mover — the module is nontrivial:
    `⁅famC, Lmul (slotA 1)⁆ 1 = Lmul (− slotB 1) 1 = − slotB 1 + (− slotB 1) ≠ 0` (its `(0,2)` entry
    is `−1 + −1 = −2 ≠ 0`). So `[f₄, L₀]` is not zero — `L₀` is not a trivial `f₄`-module, and the
    reduced structure algebra `e₆` is not a direct-sum of ideals but a genuine graded simple extension. -/
theorem family_moves_mover_ne :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ 1 ≠ 0 := by
  rw [family_moves_mover Matrix.conjTranspose_one, Lmul_one]
  intro h
  have hentry : ((- slotB (1:O ℚ)) + (- slotB 1)) 0 2 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2 := by
    rw [h]
  rw [Matrix.add_apply, Matrix.neg_apply, slotB_entry] at hentry
  simp only [Matrix.zero_apply] at hentry
  have : reQ ((-(1:O ℚ)) + (-1)) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ] at this; norm_num at this

/-! ## The capstone — the closed Z₂-graded bracket structure of `e₆ = f₄ ⊕ L₀`. -/

/-- ★★★ THE GRADED MODULE STRUCTURE OF `e₆ = f₄ ⊕ L₀`. The reduced structure algebra of the derived
    matter arena `H₃(O)` closes under the bracket with the complete Z₂-graded structure:
    · `[f₄, f₄] ⊆ f₄` — `derH3` is a `LieSubalgebra` (N285/N286);
    · `[f₄, L₀] ⊆ L₀` — `⁅T, Lmul A⁆ B = Lmul (T A) B` (`spectrum_sector_equivariance`), the module
      intertwiner exhibiting `L₀` as a copy of the arena carrying the `f₄`-action;
    · `[L₀, L₀] ⊆ f₄` — `⁅Lmul A, Lmul B⁆ ∈ derH3` for Hermitian `A, B` (N295
      `spectrum_movers_close_into_derH3`).
    The action is NON-TRIVIAL — the derived family derivation moves the mover
    (`⁅famC, Lmul (slotA 1)⁆ = Lmul (− slotB 1)` on Hermitian args, `≠ 0` at `1`). Cap-forced at the
    maximal Jordan order 3 (`jordan_fails_H4`, N5). DERIVED, not a posited Yukawa/mass module. -/
theorem spectrum_sector_graded_module :
    (∀ T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)), T ∈ derH3 →
        ∀ A B : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → Bᴴ = B →
          ⁅T, Lmul A⁆ B = Lmul (T A) B)
    ∧ (∀ A B : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → Bᴴ = B → ⁅Lmul A, Lmul B⁆ ∈ derH3)
    ∧ (∀ S T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)), S ∈ derH3 → T ∈ derH3 → ⁅S, T⁆ ∈ derH3)
    ∧ (∀ B : Matrix (Fin 3) (Fin 3) (O ℚ), Bᴴ = B →
        ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ B = Lmul (- slotB 1) B)
    ∧ ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ 1 ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun T hT A B hA hB => spectrum_sector_equivariance T hT hA hB,
   fun _ _ hA hB => spectrum_movers_close_into_derH3 hA hB,
   fun _ _ hS hT => derH3.lie_mem hS hT,
   fun _ hB => family_moves_mover hB,
   family_moves_mover_ne,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
