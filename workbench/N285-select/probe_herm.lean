import Phys.Algebra.OctonionJordanDerivationAlgebra
import Mathlib.Tactic

/-  N285 SELECT — bounded feasibility probe (CORRECTED, all GREEN).
    Confirms the highest-uncertainty bricks compile over `O ℚ` with narCD/srCD, using the
    definitional Hermitian form `Aᴴ = A` (Matrix.IsHermitian typeclass does NOT resolve over the
    non-associative narCD ring, but plain `conjTranspose` + `= A` does).
      (1) `Aᴴ` (conjTranspose) exists over O ℚ.
      (2) `jb` preserves Hermitian  (conjTranspose_mul — star anti-hom, NO associativity).
      (3) `innerMul` preserves Hermitian (difference of jb-preserved).
      (4) `jAct D` preserves Hermitian (via derivQ_star_comm, entrywise).
      (5) THE CRUX: the Hermitian-restricted Jordan-derivation carrier is BRACKET-CLOSED
          (the LieSubalgebra requirement).  ~11s GREEN.  -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

-- (1) conjTranspose over O ℚ
example (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) := Aᴴ

-- (2) jb preserves Hermitian
theorem jb_herm {A B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) (hB : Bᴴ = B) :
    (jb A B)ᴴ = jb A B := by
  unfold jb; rw [conjTranspose_add, conjTranspose_mul, conjTranspose_mul, hA, hB]; abel

-- (3) innerMul preserves Hermitian
example (A B X : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) (hB : Bᴴ = B) (hX : Xᴴ = X) :
    (innerMul A B X)ᴴ = innerMul A B X := by
  rw [innerMul_apply, conjTranspose_sub, jb_herm hA (jb_herm hB hX), jb_herm hB (jb_herm hA hX)]

-- (4) jAct D preserves Hermitian
example (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (hM : Mᴴ = M) : (jAct D M)ᴴ = jAct D M := by
  apply Matrix.ext; intro i j
  have hMji : star (M j i) = M i j := congrFun (congrFun hM i) j
  simp only [conjTranspose_apply, jAct, Matrix.map_apply]
  rw [← derivQ_star_comm D hD, hMji]

-- The Hermitian-restricted Jordan-derivation predicate (the carrier of the genuine f₄ = Der(H₃(O))).
def IsHermJordanDerivQ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) : Prop :=
  (∀ M, Mᴴ = M → (T M)ᴴ = T M) ∧
  (∀ A B, Aᴴ = A → Bᴴ = B → T (jb A B) = jb (T A) B + jb A (T B))

-- (5) THE CRUX — bracket closure of the Hermitian-restricted Jordan-derivation carrier.
theorem herm_jordan_bracket (S T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hS : IsHermJordanDerivQ S) (hT : IsHermJordanDerivQ T) :
    IsHermJordanDerivQ (⁅S, T⁆) := by
  obtain ⟨hSherm, hSjd⟩ := hS
  obtain ⟨hTherm, hTjd⟩ := hT
  constructor
  · intro M hM
    rw [show (⁅S, T⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = S * T - T * S from Ring.lie_def S T]
    simp only [LinearMap.sub_apply, Module.End.mul_apply, conjTranspose_sub]
    rw [hSherm _ (hTherm _ hM), hTherm _ (hSherm _ hM)]
  · intro A B hA hB
    rw [show (⁅S, T⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) = S * T - T * S from Ring.lie_def S T]
    simp only [LinearMap.sub_apply, Module.End.mul_apply]
    rw [hTjd A B hA hB, hSjd A B hA hB]
    simp only [map_add]
    rw [hSjd (T A) B (hTherm A hA) hB, hSjd A (T B) hA (hTherm B hB),
        hTjd (S A) B (hSherm A hA) hB, hTjd A (S B) hA (hSherm B hB)]
    simp only [jb, mul_sub, sub_mul]
    abel_nf

end Phys.Algebra.HJ
