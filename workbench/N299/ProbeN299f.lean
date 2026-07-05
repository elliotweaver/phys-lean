import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

def hermSub : Submodule ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  carrier := { M | Mᴴ = M }
  add_mem' := by intro a b ha hb; simp only [Set.mem_setOf_eq, conjTranspose_add] at *; rw [ha, hb]
  zero_mem' := by simp only [Set.mem_setOf_eq, conjTranspose_zero]
  smul_mem' := by intro c a ha; simp only [Set.mem_setOf_eq] at *; rw [conjTranspose_smul, star_trivial, ha]

theorem mem_hermSub {M : Matrix (Fin 3) (Fin 3) (O ℚ)} : M ∈ hermSub ↔ Mᴴ = M := Iff.rfl
theorem lmul_mapsTo {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    ∀ X ∈ hermSub, (Lmul A) X ∈ hermSub := fun X hX => by
  rw [mem_hermSub] at hX ⊢; simp only [Lmul_apply]; exact jb_herm hA hX
theorem derH3_mapsTo {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3) :
    ∀ X ∈ hermSub, T X ∈ hermSub := fun X hX => by rw [mem_hermSub] at hX ⊢; exact hT.1 X hX
theorem TA_herm {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3)
    {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) : (T A)ᴴ = T A := hT.1 A hA

-- APPROACH: prove the composite-difference identity, feed to trace via Ring.lie_def inside trace_lie.
-- Instead of matching a bracket in the STATEMENT, state the restricted identity as composites,
-- then close the trace goal by rewriting trace_lie's bracket to composites too.
theorem restricted_comm {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    (Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))
      = (T.restrict (derH3_mapsTo hT)) * ((Lmul A).restrict (lmul_mapsTo hA))
        - ((Lmul A).restrict (lmul_mapsTo hA)) * (T.restrict (derH3_mapsTo hT)) := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  have hX : (X : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = X := (mem_hermSub).1 X.2
  have hkey := spectrum_sector_equivariance T hT hA hX
  rw [show (⁅T, Lmul A⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = T * Lmul A - Lmul A * T from Ring.lie_def T (Lmul A)] at hkey
  simp only [LinearMap.sub_apply, Module.End.mul_apply] at hkey ⊢
  simp only [Submodule.coe_sub, LinearMap.restrict_coe_apply]
  rw [← hkey]

theorem derH3_kills_hermTrace {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    LinearMap.trace ℚ hermSub ((Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))) = 0 := by
  rw [restricted_comm hT hA, map_sub, LinearMap.trace_mul_comm, sub_self]

#print axioms derH3_kills_hermTrace

end Phys.Algebra.HJ
