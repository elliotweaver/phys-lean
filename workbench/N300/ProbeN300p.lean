import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE P — the ENDGAME assembly logic (phi(E_ii) equal, phi(1)=2 finrank, proportionality).
    Uses phi, trace_csign_eq, trace_pconj_eq, csign_flip_pair, decompositions (all proven). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- phi as linear functional (from ProbeN300j3)
noncomputable def LmulHfun (C : hermSub) (X : hermSub) : hermSub :=
  ⟨(Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))) (X : Matrix (Fin 3) (Fin 3) (O ℚ)),
    lmul_mapsTo ((mem_hermSub).1 C.2) X X.2⟩
noncomputable def LmulH (C : hermSub) : Module.End ℚ hermSub where
  toFun := LmulHfun C
  map_add' X Y := by apply Subtype.ext; simp only [LmulHfun, Submodule.coe_add, map_add]
  map_smul' r X := by apply Subtype.ext; simp only [LmulHfun, SetLike.val_smul, map_smul, RingHom.id_apply]
theorem LmulH_add (C D : hermSub) : LmulH (C + D) = LmulH C + LmulH D := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LmulH, LmulHfun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.add_apply,
    Submodule.coe_add, Lmul_apply, jb]
  rw [add_mul, mul_add]; abel
theorem LmulH_smul (r : ℚ) (C : hermSub) : LmulH (r • C) = r • LmulH C := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LmulH, LmulHfun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.smul_apply,
    SetLike.val_smul, Lmul_apply, jb]
  rw [mat_smul_mul, mat_mul_smul, smul_add]
noncomputable def phi : hermSub →ₗ[ℚ] ℚ where
  toFun C := LinearMap.trace ℚ hermSub (LmulH C)
  map_add' C D := by rw [LmulH_add, LinearMap.map_add]
  map_smul' r C := by rw [LmulH_smul, LinearMap.map_smul, RingHom.id_apply, smul_eq_mul]
theorem LmulH_eq_restrict (C : hermSub) :
    LmulH C = (Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict (lmul_mapsTo ((mem_hermSub).1 C.2)) := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LmulH, LmulHfun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.restrict_coe_apply]

-- phi(C) = trace_H((Lmul C).restrict) — bridge to N299
theorem phi_eq_trace (C : hermSub) :
    phi C = LinearMap.trace ℚ hermSub ((Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
      (lmul_mapsTo ((mem_hermSub).1 C.2))) := by
  simp only [phi, LinearMap.coe_mk, AddHom.coe_mk, LmulH_eq_restrict]

-- phi(1) = 2·finrank  (banked dilation_hermTrace via phi_eq_trace on the identity ∈ hermSub)
theorem phi_one : phi ⟨1, one_mem_hermSub⟩ = (2 : ℚ) * (Module.finrank ℚ hermSub : ℚ) := by
  rw [phi_eq_trace]
  -- the restrict here uses lmul_mapsTo of (1:hermSub).2; dilation_hermTrace uses (by simp).
  -- proof-irrelevance in the mapsTo hyp: both are the same operator.
  have : (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict (lmul_mapsTo ((mem_hermSub).1 (⟨1, one_mem_hermSub⟩ : hermSub).2))
       = (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1)) := rfl
  rw [this, dilation_hermTrace]

#print axioms phi_one
end Phys.Algebra.HJ
