/-
  N176 PROBE — the continuous spectral t-power path. specPow + flow law from cutRpow_add.
-/
import Phys.Algebra.LorentzContinuumSpectralN
import Phys.Foundation.ContinuumLog

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-- The TWO-eigenvalue composition law for an EvC-orthonormal family:
    `specOpN a u ∘ specOpN b u = specOpN (a·b) u`. Generalizes `specOpN_comp` (the a=b case). -/
theorem specOpN_comp_general {n : ℕ} {a b : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN a u).comp (specOpN b u) = specOpN (fun i => a i * b i) u := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOpN_apply a u (specOpN b u p),
    specOpN_apply (fun i => a i * b i) u p]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [specOpN_EvC_read horth p i]
  congr 1
  ring

/-- THE CONTINUOUS SPECTRAL t-POWER: `specPow p l u := specOpN (cutRpow (l·) p) u`. -/
def specPow {n : ℕ} (p : Cut) (l : Fin n → Cut) (u : Fin n → STVC) : Module.End Cut STVC :=
  specOpN (fun i => cutRpow (l i) p) u

/-- ★ THE ONE-PARAMETER FLOW LAW. -/
theorem specPow_flow {n : ℕ} {p q : Cut} {l : Fin n → Cut} (hl : ∀ i, 0 < l i)
    {u : Fin n → STVC} (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specPow p l u).comp (specPow q l u) = specPow (p + q) l u := by
  unfold specPow
  rw [specOpN_comp_general horth]
  congr 1
  funext i
  rw [← cutRpow_add (hl i)]

/-- `specPow 1 l u = specOpN l u`. -/
theorem specPow_one {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 < l i) (u : Fin n → STVC) :
    specPow 1 l u = specOpN l u := by
  unfold specPow
  congr 1
  funext i
  rw [cutRpow_one (hl i)]

/-- `specPow 0 l u = specOpN 1 u`. -/
theorem specPow_zero {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 < l i) (u : Fin n → STVC) :
    specPow 0 l u = specOpN (fun _ => 1) u := by
  unfold specPow
  congr 1
  funext i
  rw [cutRpow_zero (hl i)]

/-- `specPow 2 l u = specOpN (l·l) u`. -/
theorem specPow_two {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 < l i) (u : Fin n → STVC) :
    specPow 2 l u = specOpN (fun i => l i * l i) u := by
  unfold specPow
  congr 1
  funext i
  rw [cutRpow_two (hl i)]

/-- `specPow p l u` is EvC-self-adjoint. -/
theorem specPow_isEvCSymm {n : ℕ} (p : Cut) (l : Fin n → Cut) (u : Fin n → STVC) :
    IsEvCSymm (specPow p l u) :=
  specOpN_isEvCSymm _ _

/-- `specPow p l u` is EvC-positive-semidefinite for `∀ i, 0 < l i`. -/
theorem specPow_nonneg {n : ℕ} {p : Cut} {l : Fin n → Cut} (hl : ∀ i, 0 < l i)
    (u : Fin n → STVC) (r : STVC) :
    0 ≤ EvC (specPow p l u r) r :=
  specOpN_nonneg (fun i => le_of_lt (cutRpow_pos (hl i) p)) u r

/-- ★ NON-VACUITY: a concrete continuous flow over the mix4 4-frame. -/
theorem specPow_mix4_flow (p q : Cut) :
    (specPow p ![(2:Cut),3,5,8] mix4).comp (specPow q ![(2:Cut),3,5,8] mix4)
      = specPow (p + q) ![(2:Cut),3,5,8] mix4 :=
  specPow_flow (by intro i; fin_cases i <;> norm_num) mix4_orthonormal

#print axioms specOpN_comp_general
#print axioms specPow
#print axioms specPow_flow
#print axioms specPow_one
#print axioms specPow_zero
#print axioms specPow_two
#print axioms specPow_isEvCSymm
#print axioms specPow_nonneg
#print axioms specPow_mix4_flow

end

end Phys.Algebra
