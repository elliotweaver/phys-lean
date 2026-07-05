import Phys.Algebra.OctonionJordanHermTraceCoefficient
import Mathlib.GroupTheory.Perm.Fin

/-! Probe N305 — de-risk the ℤ₃ generation-cycle structure on the cap-forced idempotents.
    All facts are combinatorial over Fin 3 + the banked Eidem/pconj (diagonal 0/1 entries;
    no octonion coordinate blowup). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- the generation 3-cycle
noncomputable def gcyc : Equiv.Perm (Fin 3) := finRotate 3

-- (1) Eidem injective
theorem probe_Eidem_inj : Function.Injective Eidem := by
  intro i j h
  by_cases hij : i = j
  · exact hij
  · exfalso
    have hf : (fun k => if k = i then (1:O ℚ) else 0) = (fun k => if k = j then (1:O ℚ) else 0) :=
      Matrix.diagonal_injective h
    have hc := congrFun hf i
    rw [if_pos rfl, if_neg hij] at hc
    exact one_ne_zero_O hc

-- (2) fixed-point-free
theorem probe_gcyc_fpf : ∀ i, gcyc i ≠ i := by decide

-- (3) order three
theorem probe_gcyc_cube : gcyc * gcyc * gcyc = 1 := by decide
theorem probe_gcyc_ne_one : gcyc ≠ 1 := by decide

-- (4) the cyclic action on idempotents (from banked pconj_Eidem)
theorem probe_pconj_gcyc (i : Fin 3) : pconj gcyc (Eidem i) = Eidem (gcyc.symm i) :=
  pconj_Eidem gcyc i

-- (5) self-blindness: cycle fixes NO generation
theorem probe_gen_no_fixed (i : Fin 3) : pconj gcyc (Eidem i) ≠ Eidem i := by
  rw [probe_pconj_gcyc]
  intro h
  have hsi : gcyc.symm i = i := probe_Eidem_inj h
  have hfix : gcyc i ≠ i := probe_gcyc_fpf i
  apply hfix
  conv_lhs => rw [← hsi]
  rw [Equiv.apply_symm_apply]

-- (6) a transposition self-sees (fixes a generation)
theorem probe_transp_self_sees : pconj (Equiv.swap (0 : Fin 3) 1) (Eidem 2) = Eidem 2 := by
  rw [pconj_Eidem]
  congr 1

-- (7) Unity gather is cycle-invariant
theorem probe_unity_fixed : pconj gcyc (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 1 := by
  unfold pconj
  rw [Matrix.submatrix_one_equiv]

-- (8) self-blind seeing operator (diag 0)
def seeMat : Matrix (Fin 3) (Fin 3) ℚ := Matrix.of (fun i j => if i = j then 0 else 1)
theorem probe_seeMat_diag_zero (i : Fin 3) : seeMat i i = 0 := by simp [seeMat]
theorem probe_seeMat_cycle (i : Fin 3) : seeMat i (gcyc i) = 1 := by
  simp only [seeMat, Matrix.of_apply]; rw [if_neg (fun h => probe_gcyc_fpf i h.symm)]

end Phys.Algebra.HJ
