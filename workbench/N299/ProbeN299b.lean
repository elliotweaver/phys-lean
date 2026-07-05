import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The Hermitian submodule of the arena. -/
def hermSub : Submodule ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  carrier := { M | Mᴴ = M }
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_setOf_eq, conjTranspose_add] at *
    rw [ha, hb]
  zero_mem' := by simp only [Set.mem_setOf_eq, conjTranspose_zero]
  smul_mem' := by
    intro c a ha
    simp only [Set.mem_setOf_eq] at *
    rw [conjTranspose_smul, star_trivial, ha]

theorem mem_hermSub {M : Matrix (Fin 3) (Fin 3) (O ℚ)} : M ∈ hermSub ↔ Mᴴ = M := Iff.rfl

-- finiteness / freeness
example : Module.Finite ℚ hermSub := by infer_instance
example : Module.Free ℚ hermSub := by infer_instance

-- Lmul A maps hermSub → hermSub when A is Hermitian
theorem lmul_mapsTo {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    ∀ X ∈ hermSub, (Lmul A) X ∈ hermSub := by
  intro X hX
  rw [mem_hermSub] at hX ⊢
  simp only [Lmul_apply]
  exact jb_herm hA hX

-- T ∈ derH3 maps hermSub → hermSub
theorem derH3_mapsTo {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3) :
    ∀ X ∈ hermSub, T X ∈ hermSub := by
  intro X hX
  rw [mem_hermSub] at hX ⊢
  exact hT.1 X hX

-- TA is Hermitian for T ∈ derH3, A Hermitian
theorem TA_herm {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3)
    {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) : (T A)ᴴ = T A :=
  hT.1 A hA

/-- ★★★ THE RESTRICTED EQUIVARIANCE: on the Hermitian submodule, `Lmul (T A)` restricts to the
    operator COMMUTATOR `⁅T|_H, (Lmul A)|_H⁆`.  This is N296 `spectrum_sector_equivariance`
    transported to the submodule — the key move that makes the trace-annihilation an
    inner-derivation-FREE consequence of `LinearMap.trace_lie`. -/
theorem restricted_equivariance {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    (Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))
      = ⁅T.restrict (derH3_mapsTo hT), (Lmul A).restrict (lmul_mapsTo hA)⁆ := by
  ext X
  -- reduce to the arena
  simp only [LinearMap.restrict_coe_apply, Ring.lie_def, LinearMap.sub_apply,
    Module.End.mul_apply, LinearMap.restrict_coe_apply]
  -- goal: Lmul (T A) X = T ((Lmul A) X) - (Lmul A) (T X)
  have hX : (X : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = X := (mem_hermSub).1 X.2
  have hkey := spectrum_sector_equivariance T hT hA hX
  -- hkey : ⁅T, Lmul A⁆ X = Lmul (T A) X
  rw [show (⁅T, Lmul A⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = T * Lmul A - Lmul A * T from Ring.lie_def T (Lmul A)] at hkey
  simp only [LinearMap.sub_apply, Module.End.mul_apply] at hkey
  rw [← hkey]

/-- ★★★ THE INNERNESS-FREE TRACE-ANNIHILATION: for every `T ∈ derH3` (every Hermitian Jordan
    derivation) and Hermitian `A`, the Hermitian-arena operator trace of `Lmul (T A)` VANISHES —
    because `Lmul (T A)` restricts to a COMMUTATOR, whose trace is `0` (`LinearMap.trace_lie`).
    NO Chevalley–Schafer innerness theorem is used. -/
theorem derH3_kills_hermTrace {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    LinearMap.trace ℚ hermSub ((Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))) = 0 := by
  rw [restricted_equivariance hT hA, LinearMap.trace_lie]

-- W8: the trace functional is nonzero on the dilation Lmul 1
example : (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
    (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1))
    = (2 : ℚ) • (LinearMap.id : Module.End ℚ hermSub) := by
  ext X
  simp only [LinearMap.restrict_coe_apply, Lmul_apply, LinearMap.smul_apply, LinearMap.id_coe,
    id_eq, SetLike.val_smul]
  -- jb 1 X = 1*X + X*1 = 2X
  unfold jb
  simp only [one_mul, mul_one]
  rw [two_smul]

#print axioms derH3_kills_hermTrace

end Phys.Algebra.HJ
