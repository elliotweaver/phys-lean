import Phys.Algebra.LorentzContinuumLieAlgebra
import Phys.Algebra.LorentzContinuumPolar
import Phys.Cascade.ComplexUnit

namespace Phys.Algebra.R2Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- 2-torsion-free lift through one CD doubling
theorem cd_two_torsion_free {A : Type*} [Add A] [Zero A]
    (htf : ∀ a : A, a + a = 0 → a = 0) :
    ∀ y : CD A, y + y = 0 → y = 0 := by
  intro y hy
  have hre : y.re + y.re = 0 := by have := congrArg CD.re hy; simpa using this
  have him : y.im + y.im = 0 := by have := congrArg CD.im hy; simpa using this
  ext
  · exact htf y.re hre
  · exact htf y.im him

-- concrete: O Cut = CD (CD (Dbl Cut)) is 2-torsion-free
theorem oCut_two_torsion_free : ∀ y : O Cut, y + y = 0 → y = 0 :=
  cd_two_torsion_free (cd_two_torsion_free (Dbl.two_torsion_free (fun r h => cut_add_self_zero h)))

-- the self-residual of a fold
def foldResidual (look : O Cut → O Cut) (x : O Cut) : O Cut := look x - x

-- (a) res x = 0 ↔ x = 0
theorem foldResidual_eq_zero_iff {look : O Cut → O Cut} (h : IsFold look)
    (x : O Cut) : foldResidual look x = 0 ↔ x = 0 := by
  unfold foldResidual
  rw [sub_eq_zero]
  constructor
  · intro hx; exact fold_self_blind h oCut_two_torsion_free x hx
  · intro hx; rw [hx, fold_void h]

-- (c) linearity: res x = (-2) • x for the fold = negation
theorem foldResidual_neg_eq (x : O Cut) :
    foldResidual (fun y => -y) x = (-2 : Cut) • x := by
  show -x - x = (-2 : Cut) • x
  rw [neg_smul, two_smul]
  abel

-- (b) Born self-overlap strictly positive on nonzero states
theorem foldResidual_born_pos {look : O Cut → O Cut} (h : IsFold look)
    {x : O Cut} (hx : x ≠ 0) :
    0 < gFormC (foldResidual look x) (foldResidual look x) := by
  have hne : foldResidual look x ≠ 0 := fun hc => hx ((foldResidual_eq_zero_iff h x).mp hc)
  exact gFormC_pos_of_ne_zero hne

-- ★ the weld: residual's Born self-overlap is exactly 4× the state's own
theorem foldResidual_born_eq (x : O Cut) :
    gFormC (foldResidual (fun y => -y) x) (foldResidual (fun y => -y) x)
      = 4 * gFormC x x := by
  rw [foldResidual_neg_eq, gFormC_smul_left, gFormC_smul_right]
  ring

-- non-vacuity: bites on the unit
theorem foldResidual_one_pos :
    0 < gFormC (foldResidual (fun y => -y) (1 : O Cut)) (foldResidual (fun y => -y) 1) := by
  rw [foldResidual_born_eq, gFormC_one]; norm_num

-- linearity as a type fact
def foldResidualMap : Module.End Cut (O Cut) := (-2 : Cut) • LinearMap.id

theorem foldResidualMap_apply (x : O Cut) :
    foldResidualMap x = foldResidual (fun y => -y) x := by
  show (-2 : Cut) • (LinearMap.id x) = _
  rw [LinearMap.id_apply, foldResidual_neg_eq]

end

end Phys.Algebra.R2Probe
