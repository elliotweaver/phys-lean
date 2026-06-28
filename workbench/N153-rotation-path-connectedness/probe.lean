import Phys.Algebra.LorentzContinuumOperatorTopology
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- M1: division continuity over Cut (denominator never zero)
example : Continuous (fun m : Cut => (1 - m^2)/(1 + m^2)) := by
  have hden : ∀ m : Cut, (1 + m^2) ≠ 0 := by
    intro m; positivity
  fun_prop (disch := assumption)

-- Cayley parametrization
def cayleyC (m : Cut) : Cut := (1 - m^2)/(1 + m^2)
def cayleyS (m : Cut) : Cut := (2*m)/(1 + m^2)

-- M1': both continuous
example : Continuous cayleyC := by
  unfold cayleyC
  have : ∀ m : Cut, (1 + m^2) ≠ 0 := by intro m; positivity
  fun_prop (disch := assumption)

example : Continuous cayleyS := by
  unfold cayleyS
  have : ∀ m : Cut, (1 + m^2) ≠ 0 := by intro m; positivity
  fun_prop (disch := assumption)

-- M2: stays on the circle
example (m : Cut) : (cayleyC m)^2 + (cayleyS m)^2 = 1 := by
  unfold cayleyC cayleyS
  have hden : (1 + m^2) ≠ 0 := by positivity
  field_simp
  ring

-- M4: at m=0 it is the identity rotation
example : cayleyC 0 = 1 := by unfold cayleyC; norm_num
example : cayleyS 0 = 0 := by unfold cayleyS; norm_num

-- M3: the rotation path is continuous in endOpC
def rotPath (m : Cut) : Module.End Cut STVC := planeRotLin (cayleyC m) (cayleyS m)

example : Continuous rotPath := by
  rw [endOpC_continuous_iff]
  intro v
  -- each evaluation m ↦ planeRotLin (cayleyC m) (cayleyS m) v, explicit coordinate formula
  have hC : Continuous cayleyC := by
    unfold cayleyC
    have : ∀ m : Cut, (1 + m^2) ≠ 0 := by intro m; positivity
    fun_prop (disch := assumption)
  have hS : Continuous cayleyS := by
    unfold cayleyS
    have : ∀ m : Cut, (1 + m^2) ≠ 0 := by intro m; positivity
    fun_prop (disch := assumption)
  have hrw : (fun m => (rotPath m) v)
      = (fun m => (v.1, cayleyC m * v.2.1 - cayleyS m * reQC v.2.2,
          v.2.2 + (cayleyS m * v.2.1 + (cayleyC m - 1) * reQC v.2.2) • (1 : O Cut))) := by
    funext m; rw [rotPath, planeRotLin_apply]
  rw [hrw]
  apply Continuous.prodMk continuous_const
  apply Continuous.prodMk
  · fun_prop
  · apply Continuous.add continuous_const
    apply Continuous.smul _ continuous_const
    fun_prop

#print axioms planeRotLin_one

end
end Phys.Algebra
