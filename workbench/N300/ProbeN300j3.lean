import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE J3 — φ as trace ∘ (a genuine ℚ-linear map hermSub → End hermSub). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- LmulH C : End hermSub, built from Lmul on the arena but landing in End hermSub.
-- Define the underlying map hermSub → hermSub for a FIXED Hermitian representative, packaged so
-- the whole assignment C ↦ LmulH C is ℚ-linear (proofs are Props, so linearity holds).
noncomputable def LmulHfun (C : hermSub) (X : hermSub) : hermSub :=
  ⟨(Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))) (X : Matrix (Fin 3) (Fin 3) (O ℚ)),
    lmul_mapsTo ((mem_hermSub).1 C.2) X X.2⟩

noncomputable def LmulH (C : hermSub) : Module.End ℚ hermSub where
  toFun := LmulHfun C
  map_add' X Y := by apply Subtype.ext; simp only [LmulHfun, Submodule.coe_add, map_add]
  map_smul' r X := by apply Subtype.ext; simp only [LmulHfun, SetLike.val_smul, map_smul, RingHom.id_apply]

-- C ↦ LmulH C is ℚ-linear (this is the KEY — no dependent-proof obstruction now)
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
  map_smul' r C := by rw [LmulH_smul, LinearMap.map_smul, smul_eq_mul, RingHom.id_apply]

#print axioms phi

end Phys.Algebra.HJ
