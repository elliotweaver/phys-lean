import Phys.Cascade.OctonionTopology
import Mathlib.Topology.Algebra.InfiniteSum.Ring
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD
@[reducible] def dblModuleCut : Module Cut (Dbl Cut) where
  one_smul z := by ext <;> simp [Dbl.smul_re]
  mul_smul a b z := by ext <;> simp [Dbl.smul_re] <;> ring
  smul_zero a := by ext <;> simp [Dbl.smul_re]
  smul_add a x y := by ext <;> simp [Dbl.smul_re] <;> ring
  add_smul a b z := by ext <;> simp [Dbl.smul_re] <;> ring
  zero_smul z := by ext <;> simp [Dbl.smul_re]
attribute [local instance] dblModuleCut
@[reducible] def cdModuleCut {A : Type*} [NonAssocRing A] [StarRing A] [Module Cut A] :
    @Module Cut (CD A) _ (by letI := CD.narCD (A := A); infer_instance) := by
  letI := CD.narCD (A := A)
  exact { one_smul := by intro z; ext <;> simp
          mul_smul := by intro a b z; ext <;> simp [mul_smul]
          smul_zero := by intro a; ext <;> simp
          smul_add := by intro a x y; ext <;> simp [smul_add]
          add_smul := by intro a b z; ext <;> simp [add_smul]
          zero_smul := by intro z; ext <;> simp }
noncomputable instance instModuleCutH : Module Cut (H Cut) := cdModuleCut (A := Dbl Cut)
noncomputable instance instModuleCutO : Module Cut (O Cut) := cdModuleCut (A := H Cut)
-- CRITICAL: is the Module-smul DEFEQ to CD.instSMul (the one oCut_continuousSMul uses)?
example (c : Cut) (x : O Cut) : (c • x : O Cut) = (CD.instSMul.smul c x) := rfl
-- so ContinuousSMul transfers:
example : ContinuousSMul Cut (O Cut) := oCut_continuousSMul
end
