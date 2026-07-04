import Phys.Algebra.OctonionJordanSpectrumMovingSector
import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Mathlib.Tactic

/- N296 DE-RISK probe: the f₄-equivariance of the spectrum-moving sector.
   ⁅T, Lmul A⁆ B = Lmul (T A) B  for T ∈ derH3, A,B Hermitian. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- P1: THE CORE EQUIVARIANCE (the Leibniz law rearranged).
theorem probe_equivariance (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hT : T ∈ derH3) {A B : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) :
    ⁅T, Lmul A⁆ B = Lmul (T A) B := by
  rw [show (⁅T, Lmul A⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = T * Lmul A - Lmul A * T from Ring.lie_def T (Lmul A)]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, Lmul_apply]
  rw [hT.2 A B hA hB]
  abel

-- P2: the concrete family action via P1 (famC ∈ derH3, famC (slotA 1) = -slotB 1).
theorem probe_family (B : Matrix (Fin 3) (Fin 3) (O ℚ)) (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ B
      = Lmul (- slotB 1) B := by
  rw [probe_equivariance _ famC_mem_derH3 slotA_one_herm hB, famC_slotA]

-- P3: non-vacuity — the family derivation MOVES the mover applied to the identity.
theorem probe_nonvac : ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ 1 ≠ 0 := by
  rw [probe_family 1 Matrix.conjTranspose_one, Lmul_one]
  intro h
  -- (- slotB 1 + - slotB 1) 0 2 = -1 + -1 = -2 ≠ 0
  have hentry : ((- slotB (1:O ℚ)) + (- slotB 1)) 0 2 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2 := by
    rw [h]
  rw [Matrix.add_apply, Matrix.neg_apply, slotB_entry] at hentry
  simp only [Matrix.zero_apply] at hentry
  have : reQ ((-(1:O ℚ)) + (-1)) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ] at this; norm_num at this

end Phys.Algebra.HJ
