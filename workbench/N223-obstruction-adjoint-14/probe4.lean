import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.SkewAdjoint

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ===== bornBil (from probe3) =====
def bornBil : BilinForm ℚ ImO :=
  LinearMap.mk₂ ℚ (fun x y => gForm (x : O ℚ) (y : O ℚ))
    (fun x₁ x₂ y => by simp only [Submodule.coe_add]; rw [gForm_add_left])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_left, smul_eq_mul])
    (fun x y₁ y₂ => by simp only [Submodule.coe_add]; rw [gForm_add_right])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_right, smul_eq_mul])

@[simp] theorem bornBil_apply (x y : ImO) : bornBil x y = gForm (x : O ℚ) (y : O ℚ) := rfl

-- ===== crossOp (from probe2) =====
def crossOpO (a : O ℚ) : Module.End ℚ (O ℚ) where
  toFun y := octCross a y
  map_add' y₁ y₂ := by unfold octCross; rw [mul_add, gForm_add_right, add_smul]; abel
  map_smul' c y := by
    unfold octCross
    rw [mul_smul_comm, gForm_smul_right, RingHom.id_apply, smul_add, mul_smul]

@[simp] theorem crossOpO_apply (a y : O ℚ) : crossOpO a y = octCross a y := rfl

theorem crossOpO_mapsTo (a : O ℚ) : ∀ y ∈ ImO, crossOpO a y ∈ ImO := by
  intro y hy; simpa using octCross_mem_ImO (x := a) hy

def crossOp (a : O ℚ) : Module.End ℚ ImO := (crossOpO a).restrict (crossOpO_mapsTo a)

@[simp] theorem crossOp_coe (a : O ℚ) (y : ImO) :
    ((crossOp a y : ImO) : O ℚ) = octCross a (y : O ℚ) := rfl

-- swap13 antisymmetry of assoc3
theorem assoc3_swap_xz {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 z y x := by
  have h1 : assoc3 z y x = - assoc3 y z x := assoc3_swap_xy hz hy hx
  have h2 : assoc3 y z x = assoc3 z x y := assoc3_cyclic hy hz hx
  have h3 : assoc3 z x y = assoc3 x y z := assoc3_cyclic hz hx hy
  rw [h1, h2, h3, neg_neg]

-- ===== (2) crossOp a ∈ so(7): SKEW-ADJOINT for the Born form =====
theorem crossOp_mem_so7 (a : O ℚ) (ha : a ∈ ImO) :
    crossOp a ∈ skewAdjointLieSubalgebra bornBil := by
  show crossOp a ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  -- bornBil (crossOp a y) z = bornBil y (-(crossOp a) z) = - bornBil y (crossOp a z)
  show gForm (octCross a (y : O ℚ)) (z : O ℚ)
      = gForm (y : O ℚ) (((-crossOp a) z : ImO) : O ℚ)
  have hy : (y : O ℚ) ∈ ImO := y.2
  have hz : (z : O ℚ) ∈ ImO := z.2
  have e1 : gForm (octCross a (y : O ℚ)) (z : O ℚ) = assoc3 (z : O ℚ) a (y : O ℚ) := by
    unfold assoc3; rw [gForm_symm]
  have e2 : gForm (y : O ℚ) (octCross a (z : O ℚ)) = assoc3 (y : O ℚ) a (z : O ℚ) := rfl
  have key : assoc3 (z : O ℚ) a (y : O ℚ) = - assoc3 (y : O ℚ) a (z : O ℚ) :=
    assoc3_swap_xz hz ha hy
  rw [e1, key, ← e2]
  simp only [LinearMap.neg_apply, Submodule.coe_neg, crossOp_coe, gForm_neg_right]

-- ===== (3) imRep D ∈ so(7): every derivation is skew for the Born form (N26 gFormQ_skew) =====
theorem imRep_mem_so7 (D : derivationLieQ) :
    imRep D ∈ skewAdjointLieSubalgebra bornBil := by
  show imRep D ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  show gForm ((D : Module.End ℚ (O ℚ)) (y : O ℚ)) (z : O ℚ)
      = gForm (y : O ℚ) (((-imRep D) z : ImO) : O ℚ)
  have hskew := gFormQ_skew (D : Module.End ℚ (O ℚ)) D.2 (y : O ℚ) (z : O ℚ)
  simp only [LinearMap.neg_apply, Submodule.coe_neg, imRep_coe, gForm_neg_right]
  linarith [hskew]

-- ===== (3') the g₂-intertwiner (operator level) =====
theorem crossOp_imRep_intertwine (D : derivationLieQ) (a : O ℚ) :
    ⁅imRep D, crossOp a⁆ = crossOp ((D : Module.End ℚ (O ℚ)) a) := by
  refine LinearMap.ext fun y => Subtype.ext ?_
  show ((imRep D) (crossOp a y) : O ℚ) - ((crossOp a) (imRep D y) : O ℚ)
        = octCross ((D : Module.End ℚ (O ℚ)) a) (y : O ℚ)
  rw [imRep_coe, crossOp_coe, crossOp_coe, imRep_coe]
  rw [derivationLieQ_octCross_leibniz D a (y : O ℚ)]; abel

-- ===== (4) NON-VACUITY: crossOp is nonzero =====
theorem crossOp_ne_zero : crossOp u1 ≠ 0 := by
  intro h
  have : (crossOp u1 ⟨u2, u2_mem_ImO⟩ : ImO) = 0 := by rw [h]; rfl
  have hc : octCross u1 u2 = 0 := by
    have := congrArg (Subtype.val) this
    simpa using this
  exact octCross_u1_u2_ne_zero hc

end

end Phys.Algebra
