import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

def parityLin : Module.End Cut STVC :=
  LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))
def timeRevLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.id : (Cut × O Cut) →ₗ[Cut] (Cut × O Cut))
def ptLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))
@[simp] theorem parityLin_apply (p : STVC) : parityLin p = (p.1, -p.2.1, -p.2.2) := rfl
@[simp] theorem timeRevLin_apply (p : STVC) : timeRevLin p = (-p.1, p.2.1, p.2.2) := rfl
@[simp] theorem ptLin_apply (p : STVC) : ptLin p = (-p.1, -p.2.1, -p.2.2) := rfl

-- W8 pairwise distinctness: evaluate at e₀ = (1,0,0) and ex = (0,1,0).
theorem parity_ne_one : parityLin ≠ (1 : Module.End Cut STVC) := by
  intro h
  have := congrArg (fun f => (f ((0:Cut),(1:Cut),(0:O Cut))).2.1) h
  simp only [parityLin_apply] at this
  -- this : -1 = 1
  norm_num at this

theorem timeRev_ne_one : timeRevLin ≠ (1 : Module.End Cut STVC) := by
  intro h
  have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
  simp only [timeRevLin_apply] at this
  norm_num at this

theorem parity_ne_timeRev : parityLin ≠ timeRevLin := by
  intro h
  have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
  simp only [parityLin_apply, timeRevLin_apply] at this
  norm_num at this

theorem parity_ne_pt : parityLin ≠ ptLin := by
  intro h
  have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
  simp only [parityLin_apply, ptLin_apply] at this
  norm_num at this

theorem timeRev_ne_pt : timeRevLin ≠ ptLin := by
  intro h
  have := congrArg (fun f => (f ((0:Cut),(1:Cut),(0:O Cut))).2.1) h
  simp only [timeRevLin_apply, ptLin_apply] at this
  norm_num at this

theorem pt_ne_one : ptLin ≠ (1 : Module.End Cut STVC) := by
  intro h
  have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
  simp only [ptLin_apply] at this
  norm_num at this

end
end Phys.Algebra
