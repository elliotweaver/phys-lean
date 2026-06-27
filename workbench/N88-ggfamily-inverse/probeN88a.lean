import Phys.Algebra.LorentzContinuumResolutionId

namespace Phys.Algebra.ProbeN88

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- (A) injective idempotent endomorphism = id
theorem injective_idem_eq_id (P : Module.End Cut STVC)
    (hidem : P.comp P = P) (hinj : Function.Injective P) :
    P = LinearMap.id := by
  apply LinearMap.ext
  intro v
  have h1 : P (P v) = P v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hidem
    simpa [LinearMap.comp_apply] using this
  have := hinj h1
  simpa using this

-- (B) P := specOpN 1 u is idempotent (orthonormal u)
theorem specOpN_one_idem {n : ℕ} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN (fun _ => (1:Cut)) u).comp (specOpN (fun _ => (1:Cut)) u)
      = specOpN (fun _ => (1:Cut)) u := by
  rw [specOpN_comp horth]
  congr 1
  funext i
  ring

-- (C) P v = 0 ⟹ specOpN c u v = 0  (orthonormal u)
theorem specOpN_ker_sub_of_one {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (v : STVC) (hv : specOpN (fun _ => (1:Cut)) u v = 0) :
    specOpN c u v = 0 := by
  -- every EvC (u k) v = 0, so specOpN c u v = ∑ (c k * EvC (u k) v) • u k = 0
  have hzero : ∀ k, EvC (u k) v = 0 := by
    intro k
    have hread := specOpN_EvC_read (l := fun _ => (1:Cut)) horth v k
    rw [hv] at hread
    -- hread : EvC (u k) 0 = 1 * EvC (u k) v
    rw [EvC_symm (u k) 0, EvC_zero_left] at hread
    rw [one_mul] at hread
    exact hread.symm
  rw [specOpN_apply]
  apply Finset.sum_eq_zero
  intro k _
  rw [hzero k, mul_zero, zero_smul]

-- (D) ★ THE SPANNING LEMMA: orthonormal + injective specOpN c u ⟹ ∑ projC u_i = id
theorem specOpN_resolution_of_injective {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hinj : Function.Injective (specOpN c u)) :
    (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
  rw [← specOpN_one_eq_sum_projC u]
  apply injective_idem_eq_id _ (specOpN_one_idem horth)
  -- specOpN 1 u is injective: its kernel is inside ker (specOpN c u) = 0
  rw [injective_iff_map_eq_zero]
  intro v hv
  exact hinj (by rw [specOpN_ker_sub_of_one horth v hv, map_zero])

end

end Phys.Algebra.ProbeN88
