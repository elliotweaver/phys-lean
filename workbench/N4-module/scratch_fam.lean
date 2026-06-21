import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- indexed imaginary basis family
def ebasis : Fin 7 → O ℚ
  | 0 => ⟨⟨⟨0,1⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 1 => ⟨⟨⟨0,0⟩,⟨1,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 2 => ⟨⟨⟨0,0⟩,⟨0,1⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 3 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨1,0⟩,⟨0,0⟩⟩⟩
  | 4 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,1⟩,⟨0,0⟩⟩⟩
  | 5 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨1,0⟩⟩⟩
  | 6 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,1⟩⟩⟩

set_option maxHeartbeats 4000000

-- all imaginary
theorem ebasis_imag (i : Fin 7) : star (ebasis i) = -(ebasis i) := by
  fin_cases i <;> (ext <;> simp [ebasis])

-- all Nrm = 1
theorem ebasis_nrm (i : Fin 7) : Nrm (ebasis i) = (1 : H ℚ) := by
  fin_cases i <;>
    (rw [Nrm_def]; ext <;>
      simp [ebasis, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])
