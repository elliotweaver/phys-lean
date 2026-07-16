import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Composite

namespace Phys.Quantum.Q3Probe
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open scoped TensorProduct

-- (A) The bell-overlap functional on TwoFibre = bornForm ⊗ bornForm, lifted.
noncomputable def bil2 :
    StateFibre →ₗ[Cut] StateFibre →ₗ[Cut] (TwoFibre →ₗ[Cut] Cut) :=
  TensorProduct.lift (R := Cut) (by
    exact {
      toFun := fun a => {
        toFun := fun b => TensorProduct.lift (LinearMap.mk₂ Cut
          (fun c d => bornForm a c * bornForm b d)
          (by intro c1 c2 d; unfold bornForm; simp [Prod.add_def]; ring)
          (by intro r c d; unfold bornForm; simp [smul_eq_mul]; ring)
          (by intro c d1 d2; unfold bornForm; simp [Prod.add_def]; ring)
          (by intro r c d; unfold bornForm; simp [smul_eq_mul]; ring))
        map_add' := by intro b1 b2; apply TensorProduct.ext'; intro c d; unfold bornForm; simp [Prod.add_def]; ring
        map_smul' := by intro r b; apply TensorProduct.ext'; intro c d; unfold bornForm; simp [smul_eq_mul]; ring }
      map_add' := by intro a1 a2; ext b; apply TensorProduct.ext'; intro c d; unfold bornForm; simp [Prod.add_def]; ring
      map_smul' := by intro r a; ext b; apply TensorProduct.ext'; intro c d; unfold bornForm; simp [smul_eq_mul]; ring })

end Phys.Quantum.Q3Probe
