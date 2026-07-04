import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

-- Probe the assembly steps assuming the two verified levers as axioms-for-probe (sorry stubs).
-- verified: inner_leibniz_two (abstract) and jdef_herm.
axiom jdef_herm_stub (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) (hB : Bᴴ = B) :
    jdef A B = 0

-- Hermitian closed under addition
theorem herm_add {A B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) (hB : Bᴴ = B) :
    (A + B)ᴴ = A + B := by rw [conjTranspose_add, hA, hB]

-- (5) STEP: d + d = 0  when A,B,X,Y Hermitian, using inner_leibniz_two (spelled) + jdef_herm.
-- First check: d + d = 0 → d = 0 in this module (NoZeroSMulDivisors ℚ).
example (d : Matrix (Fin 3) (Fin 3) (O ℚ)) (h : d + d = 0) : d = 0 := by
  have h2 : (2:ℚ) • d = 0 := by rw [two_smul]; exact h
  rcases smul_eq_zero.mp h2 with hz | hz
  · norm_num at hz
  · exact hz

end Phys.Algebra.HJ
