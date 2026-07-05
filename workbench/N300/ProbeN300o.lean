import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Eidem (i : Fin 3) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.diagonal (fun k => if k = i then 1 else 0)
noncomputable def diagPart (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if i = j then C i j else 0)
noncomputable def pairPart (i0 j0 : Fin 3) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0) then C i j else 0)

-- (A) pure decomposition (no reQ) — this shape WORKED in ProbeN300i
theorem full_decomp (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    C = diagPart C + pairPart 0 1 C + pairPart 0 2 C + pairPart 1 2 C := by
  apply Matrix.ext; intro i j
  simp only [diagPart, pairPart, Matrix.add_apply, Matrix.of_apply]
  fin_cases i <;> fin_cases j <;> simp

-- (B) diagPart of a Hermitian C = Σ reQ(C_ii) • E_ii
theorem diagPart_herm {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) :
    diagPart C = (reQ (C 0 0)) • Eidem 0 + (reQ (C 1 1)) • Eidem 1 + (reQ (C 2 2)) • Eidem 2 := by
  have hd : ∀ i, star (C i i) = C i i := by
    intro i; have := congrFun (congrFun hC i) i; rwa [Matrix.conjTranspose_apply] at this
  have hsc : ∀ i, C i i = (reQ (C i i)) • (1 : O ℚ) := fun i => selfconj_eq_smul (hd i)
  apply Matrix.ext; intro i j
  simp only [diagPart, Matrix.of_apply, Matrix.add_apply, Eidem, Matrix.smul_apply,
    Matrix.diagonal_apply, smul_ite, smul_zero]
  fin_cases i <;> fin_cases j <;>
    simp only [Fin.isValue, if_true, if_false, add_zero, zero_add] <;>
    first
      | rfl
      | (rw [show ((0:Fin 3)=1)=False by simp, show ((0:Fin 3)=2)=False by simp,
             show ((1:Fin 3)=0)=False by simp, show ((1:Fin 3)=2)=False by simp,
             show ((2:Fin 3)=0)=False by simp, show ((2:Fin 3)=1)=False by simp]; simp [← hsc])
      | (rw [← hsc]; simp)

#print axioms full_decomp
#print axioms diagPart_herm
end Phys.Algebra.HJ
