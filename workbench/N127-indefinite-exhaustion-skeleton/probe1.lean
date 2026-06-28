import Phys.Algebra.LorentzContinuumGenerationNullPeel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## PROBE1 — the indefinite finrank-strong-recursion skeleton over the 10-dim STVC.
    fixSubmoduleM / mem_fixSubmoduleM / IsBvIsomLin already banked in N125.  -/

/-- fixSubmoduleM has finrank ≤ 10 (a submodule of STVC, finrank_STVC N122). -/
theorem fixSubmoduleM_finrank_le (S : Module.End Cut STVC) :
    Module.finrank Cut (fixSubmoduleM S) ≤ 10 := by
  rw [← finrank_STVC]
  exact Submodule.finrank_le (fixSubmoduleM S)

/-- The identity's fixed subspace is ⊤. -/
theorem fixSubmoduleM_id :
    fixSubmoduleM (LinearMap.id : Module.End Cut STVC) = ⊤ := by
  rw [Submodule.eq_top_iff']
  intro p
  rw [mem_fixSubmoduleM, LinearMap.id_apply]

/-- The identity's fixed subspace has finrank 10. -/
theorem fixSubmoduleM_id_finrank :
    Module.finrank Cut (fixSubmoduleM (LinearMap.id : Module.End Cut STVC)) = 10 := by
  rw [fixSubmoduleM_id, finrank_top, finrank_STVC]

/-- ★★ BASE CASE / TERMINATION: a fixed-subspace-full-rank (finrank = 10) operator is the identity. -/
theorem isom_fix_full_eq_id_M (S : Module.End Cut STVC)
    (hfix : Module.finrank Cut (fixSubmoduleM S) = 10) :
    S = LinearMap.id := by
  have htop : fixSubmoduleM S = ⊤ :=
    Submodule.eq_top_of_finrank_eq (by rw [hfix, finrank_STVC])
  apply LinearMap.ext
  intro p
  have hp : p ∈ fixSubmoduleM S := htop ▸ Submodule.mem_top
  rw [mem_fixSubmoduleM] at hp
  rw [hp, LinearMap.id_apply]

/-- ★★ THE FINRANK-STRONG-RECURSION SKELETON (aux), by strong induction on
    m = 10 − finrank (fixSubmoduleM S). -/
theorem reflection_exhaustion_M_aux
    (refl : Set (Module.End Cut STVC))
    (oracle : ∀ T : Module.End Cut STVC, IsBvIsomLin T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsBvIsomLin (R * T) ∧
          Module.finrank Cut (fixSubmoduleM T)
            < Module.finrank Cut (fixSubmoduleM (R * T))) :
    ∀ (m : ℕ) (S : Module.End Cut STVC), IsBvIsomLin S →
      10 - Module.finrank Cut (fixSubmoduleM S) = m →
      S ∈ Submonoid.closure refl := by
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro S hS hm
    by_cases hid : S = LinearMap.id
    · rw [hid]
      have hone : (LinearMap.id : Module.End Cut STVC) = (1 : Module.End Cut STVC) := rfl
      rw [hone]; exact Submonoid.one_mem _
    · obtain ⟨R, hRmem, hRinv, hRT, hlt⟩ := oracle S hS hid
      have hle : Module.finrank Cut (fixSubmoduleM (R * S)) ≤ 10 := fixSubmoduleM_finrank_le _
      set m' := 10 - Module.finrank Cut (fixSubmoduleM (R * S)) with hm'
      have hm'lt : m' < m := by rw [← hm, hm']; omega
      have hRSmem : (R * S) ∈ Submonoid.closure refl := ih m' hm'lt (R * S) hRT rfl
      have hRclos : R ∈ Submonoid.closure refl := Submonoid.subset_closure hRmem
      have hkey : S = R * (R * S) := by rw [← mul_assoc, hRinv, one_mul]
      rw [hkey]
      exact Submonoid.mul_mem _ hRclos hRSmem

/-- ★★ THE FINRANK-STRONG-RECURSION SKELETON: given the peel ORACLE, every BvC-isometry of STVC is a
    finite product of reflections from `refl`. -/
theorem reflection_exhaustion_M
    (refl : Set (Module.End Cut STVC))
    (oracle : ∀ T : Module.End Cut STVC, IsBvIsomLin T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsBvIsomLin (R * T) ∧
          Module.finrank Cut (fixSubmoduleM T)
            < Module.finrank Cut (fixSubmoduleM (R * T)))
    (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure refl :=
  reflection_exhaustion_M_aux refl oracle _ S hS rfl

/-- ★★ THE CONCRETE REDUCTION: plugging N125's anisotropic peel oracle `houseHolderM_oracle` into the
    skeleton reduces the FULL SO⁺(1,9) exhaustion to the single remaining question — every non-identity
    BvC-isometry has SOME moved vector with anisotropic difference. -/
theorem reflection_exhaustion_M_aniso
    (haniso_exists : ∀ T : Module.End Cut STVC, IsBvIsomLin T → T ≠ LinearMap.id →
        ∃ v : STVC, T v ≠ v ∧ BvC (T v - v) (T v - v) ≠ 0)
    (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure houseHolderMSet := by
  apply reflection_exhaustion_M houseHolderMSet ?_ S hS
  intro T hT hid
  obtain ⟨v, hv, haniso⟩ := haniso_exists T hT hid
  exact houseHolderM_oracle T hT hv haniso

end

end Phys.Algebra
