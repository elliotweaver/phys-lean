import Phys.Algebra.LorentzContinuumPolarPositive

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- OBLIGATION: id is EvC-self-adjoint
theorem probe_id_isEvCSymm : IsEvCSymm (LinearMap.id : Module.End Cut STVC) := by
  intro p q; rfl

-- OBLIGATION 2: specOpN with all-ones eigenvalues = projector sum
theorem probe_specOpN_one_eq_sum_projC {n : ℕ} (u : Fin n → STVC) :
    specOpN (fun _ => (1 : Cut)) u = ∑ i, projC (u i) := by
  unfold specOpN
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [one_smul]

-- OBLIGATION 3: the TWO-family composition law
theorem probe_specOpN_comp_two {n : ℕ} {l m : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN l u).comp (specOpN m u) = specOpN (fun i => l i * m i) u := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOpN_apply l u (specOpN m u p),
    specOpN_apply (fun i => l i * m i) u p]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [specOpN_EvC_read horth p i]
  congr 1
  ring

-- OBLIGATION 1: the resolution-of-identity (existence form, the id-trick)
theorem probe_resolution_of_identity :
    ∃ (n : ℕ) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
  obtain ⟨n, l, u, horth, hid⟩ := stvc_selfadj_specExists probe_id_isEvCSymm
  -- l k = 1 for all k via the diagonal reader on id
  have hl : ∀ k, l k = 1 := by
    intro k
    have := specOpN_read (l := l) (u := u) horth k
    rw [← hid] at this
    -- this : EvC (id (u k)) (u k) = l k, i.e. EvC (u k) (u k) = l k
    simp only [LinearMap.id_coe, id_eq] at this
    rw [horth k k] at this
    simp at this
    exact this.symm
  refine ⟨n, u, horth, ?_⟩
  rw [← probe_specOpN_one_eq_sum_projC u]
  rw [hid]
  congr 1
  funext k
  exact (hl k).symm

-- OBLIGATION 4: the operator inverse (parameterized by the resolution hypothesis)
theorem probe_specOpN_inverse {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC))
    (hc : ∀ i, c i ≠ 0) :
    (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id := by
  rw [probe_specOpN_comp_two horth]
  have : (fun i => c i * (c i)⁻¹) = (fun _ => (1 : Cut)) := by
    funext i; rw [mul_inv_cancel₀ (hc i)]
  rw [this, probe_specOpN_one_eq_sum_projC, hres]

end

end Phys.Algebra
