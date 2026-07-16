import Phys.Algebra.LorentzContinuumLieAlgebra
import Phys.Algebra.LorentzContinuumPolar
import Phys.Cascade.ComplexUnit

namespace Phys.Algebra.R2Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

theorem cd_two_torsion_free {A : Type*} [Add A] [Zero A]
    (htf : ∀ a : A, a + a = 0 → a = 0) :
    ∀ y : CD A, y + y = 0 → y = 0 := by
  intro y hy
  have hre : y.re + y.re = 0 := by have := congrArg CD.re hy; simpa using this
  have him : y.im + y.im = 0 := by have := congrArg CD.im hy; simpa using this
  ext
  · exact htf y.re hre
  · exact htf y.im him

theorem oCut_two_torsion_free : ∀ y : O Cut, y + y = 0 → y = 0 :=
  cd_two_torsion_free (cd_two_torsion_free (Dbl.two_torsion_free (fun _ h => cut_add_self_zero h)))

def foldResidual (look : O Cut → O Cut) (x : O Cut) : O Cut := look x - x

-- (c) linearity for ANY fold, derived from fold_eq_neg (NOT posited)
theorem foldResidual_eq_neg_two_smul {look : O Cut → O Cut} (h : IsFold look) (x : O Cut) :
    foldResidual look x = (-2 : Cut) • x := by
  unfold foldResidual
  rw [fold_eq_neg h x, neg_smul, two_smul]
  abel

-- (a) res x = 0 ↔ x = 0
theorem foldResidual_eq_zero_iff {look : O Cut → O Cut} (h : IsFold look)
    (x : O Cut) : foldResidual look x = 0 ↔ x = 0 := by
  unfold foldResidual
  rw [sub_eq_zero]
  constructor
  · intro hx; exact fold_self_blind h oCut_two_torsion_free x hx
  · intro hx; rw [hx, fold_void h]

-- (b) Born self-overlap strictly positive on nonzero states
theorem foldResidual_born_pos {look : O Cut → O Cut} (h : IsFold look)
    {x : O Cut} (hx : x ≠ 0) :
    0 < gFormC (foldResidual look x) (foldResidual look x) := by
  have hne : foldResidual look x ≠ 0 := fun hc => hx ((foldResidual_eq_zero_iff h x).mp hc)
  exact gFormC_pos_of_ne_zero hne

-- ★ weld: residual's Born self-overlap = 4× the state's (fixed positive multiple)
theorem foldResidual_born_eq {look : O Cut → O Cut} (h : IsFold look) (x : O Cut) :
    gFormC (foldResidual look x) (foldResidual look x) = 4 * gFormC x x := by
  rw [foldResidual_eq_neg_two_smul h, gFormC_smul_left, gFormC_smul_right]
  ring

theorem foldResidual_one_pos {look : O Cut → O Cut} (h : IsFold look) :
    0 < gFormC (foldResidual look (1 : O Cut)) (foldResidual look 1) := by
  rw [foldResidual_born_eq h, gFormC_one]; norm_num

def foldResidualMap : Module.End Cut (O Cut) := (-2 : Cut) • LinearMap.id

theorem foldResidualMap_apply {look : O Cut → O Cut} (h : IsFold look) (x : O Cut) :
    foldResidualMap x = foldResidual look x := by
  show (-2 : Cut) • (LinearMap.id x) = _
  rw [LinearMap.id_apply, foldResidual_eq_neg_two_smul h]

end

end Phys.Algebra.R2Probe

-- axiom audit
open Phys.Algebra.R2Probe in
#print axioms oCut_two_torsion_free
open Phys.Algebra.R2Probe in
#print axioms foldResidual_eq_zero_iff
open Phys.Algebra.R2Probe in
#print axioms foldResidual_eq_neg_two_smul
open Phys.Algebra.R2Probe in
#print axioms foldResidual_born_pos
open Phys.Algebra.R2Probe in
#print axioms foldResidual_born_eq
open Phys.Algebra.R2Probe in
#print axioms foldResidual_one_pos
open Phys.Algebra.R2Probe in
#print axioms foldResidualMap_apply
