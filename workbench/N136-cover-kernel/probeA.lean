/-
  N136 PROBE A v3 — tractability measurement of the cover KERNEL {±1}.
-/
import Phys.Algebra.LorentzContinuumCliffordCoverHomGlobal
import Mathlib.LinearAlgebra.CliffordAlgebra.Conjugation
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- PROBE 1: negate the covering unit, same isometry — THE TWO-TO-ONE. -/
theorem probe_cover_neg_unit {u : CliffCˣ} {g : Module.End Cut STVC}
    (hu : CliffCovers u g) :
    CliffCovers (-u) g := by
  intro v
  have hval : ((-u : CliffCˣ) : CliffC) = -(u : CliffC) := Units.val_neg u
  have hinv : (((-u)⁻¹ : CliffCˣ) : CliffC) = -((u⁻¹ : CliffCˣ) : CliffC) := by
    rw [inv_neg, Units.val_neg]
  rw [hval, hinv, map_neg]
  simp only [_root_.neg_mul, _root_.mul_neg, neg_neg]
  exact hu v

/-- PROBE 2: -1 covers the identity — the nontrivial kernel element. -/
theorem probe_cover_kernel_neg_one :
    CliffCovers (-1 : CliffCˣ) (1 : Module.End Cut STVC) :=
  probe_cover_neg_unit (cliffCovers_one)

/-- PROBE 3a: Invertible (2:Cut) and Nontrivial CliffC. -/
example : Nontrivial CliffC := by
  haveI : Invertible (2 : Cut) := invertibleOfNonzero two_ne_zero
  infer_instance

/-- PROBE 3b: algebraMap Cut CliffC injective (field domain + nontrivial codomain). -/
theorem probe_algebraMap_injective : Function.Injective (algebraMap Cut CliffC) := by
  haveI : Invertible (2 : Cut) := invertibleOfNonzero two_ne_zero
  haveI : Nontrivial CliffC := inferInstance
  exact (algebraMap Cut CliffC).injective

/-- PROBE 3c: 2 ≠ 0 in CliffC. -/
theorem probe_two_ne_zero_cliffC : (2 : CliffC) ≠ 0 := by
  have hinj := probe_algebraMap_injective
  intro h
  have h2C : (algebraMap Cut CliffC (2 : Cut)) = 0 := by rw [map_ofNat]; exact h
  have h20 : (2 : Cut) = 0 := hinj (by rw [h2C, map_zero])
  exact two_ne_zero h20

/-- PROBE 3: -1 ≠ 1 in CliffCˣ. -/
theorem probe_cover_kernel_distinct : (-1 : CliffCˣ) ≠ (1 : CliffCˣ) := by
  intro h
  have hval : ((-1 : CliffCˣ) : CliffC) = ((1 : CliffCˣ) : CliffC) := by rw [h]
  rw [Units.val_neg, Units.val_one] at hval
  have e : (1 : CliffC) + (1 : CliffC) = 0 := by
    have h1 : (1 : CliffC) = -(1 : CliffC) := hval.symm
    nth_rewrite 2 [h1]; exact add_neg_cancel 1
  have h2 : (2 : CliffC) = 0 := by rw [← one_add_one_eq_two]; exact e
  exact probe_two_ne_zero_cliffC h2

end

end Phys.Algebra
