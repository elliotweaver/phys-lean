import Phys.Algebra.HermitianJordan.Setup

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- Validate the assembler dispatch with ABSTRACT entry hypotheses (cheap, no octonion compute).
example (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (h00 : M 0 0 = 0) (h01 : M 0 1 = 0) (h02 : M 0 2 = 0)
    (h10 : M 1 0 = 0) (h11 : M 1 1 = 0) (h12 : M 1 2 = 0)
    (h20 : M 2 0 = 0) (h21 : M 2 1 = 0) (h22 : M 2 2 = 0) :
    M = 0 := by
  refine Matrix.ext (fun i j => ?_)
  rw [Matrix.zero_apply]
  fin_cases i <;> fin_cases j
  · exact h00
  · exact h01
  · exact h02
  · exact h10
  · exact h11
  · exact h12
  · exact h20
  · exact h21
  · exact h22
