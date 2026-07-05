import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE I — the slot-vanishing and diagonal reduction, endgame skeleton.
Uses csign (from ProbeN300g) trace-invariance to kill slots; needs decomposition of a
Hermitian C into diag + off-diag pieces that are individually Hermitian. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- A general Hermitian C: diagonal entries self-conjugate (star = itself), off-diag conjugate-paired.
-- KEY FACT for slot-vanishing: if a Hermitian S is supported OFF the diagonal only, then
--   choosing s = (1,1,-1) or similar flips it: for the "row/col k" flip, csign s S = -S needs
--   S_ij = 0 whenever s_i s_j = +1. For a matrix supported at a SINGLE off-diag pair (i0,j0)+(j0,i0),
--   pick s with s_i0 = -1, rest +1 ⟹ s_i0 s_j0 = -1 (kills (i0,j0)&(j0,i0)), all diag s_i s_i=+1.
--   But S is off-diag only, so csign s S = -S EXACTLY iff every nonzero entry has s_i s_j = -1.

-- Rather than a general slot, test: sign s=(−1,1,1) sends any matrix supported on row0/col0 off-diag
-- to its negative on those entries. For E01-type: at (0,1): s0 s1 = -1 ✓; (1,0): s1 s0 = -1 ✓.
-- diag & (1,2),(2,1) unaffected (s=+1). So this s flips slot01 but NOT slot12.

-- The clean decomposition: any Hermitian C = Cd + C01 + C02 + C12 where
--   Cd = diagonal part (Hermitian), Cij = the (i,j)+(j,i) off-diagonal pair (Hermitian).
-- Test the matrix reconstruction identity and Hermiticity of each piece.

-- diagonal projection
noncomputable def diagPart (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if i = j then C i j else 0)
-- off-diag pair (i0,j0)
noncomputable def pairPart (i0 j0 : Fin 3) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0) then C i j else 0)

-- reconstruction: C = diagPart C + pair01 + pair02 + pair12
example (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    C = diagPart C + pairPart 0 1 C + pairPart 0 2 C + pairPart 1 2 C := by
  apply Matrix.ext; intro i j
  simp only [diagPart, pairPart, Matrix.add_apply, Matrix.of_apply]
  fin_cases i <;> fin_cases j <;> simp <;> decide

end Phys.Algebra.HJ
