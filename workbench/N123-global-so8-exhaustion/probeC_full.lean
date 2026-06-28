import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The fixed submodule of an operator and the codimension bookkeeping. -/

def fixSubmodule (S : O Cut →ₗ[Cut] O Cut) : Submodule Cut (O Cut) :=
  LinearMap.ker (S - LinearMap.id)

theorem mem_fixSubmodule (S : O Cut →ₗ[Cut] O Cut) (v : O Cut) :
    v ∈ fixSubmodule S ↔ S v = v := by
  unfold fixSubmodule
  rw [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

theorem fixSubmodule_finrank_le (S : O Cut →ₗ[Cut] O Cut) :
    Module.finrank Cut (fixSubmodule S) ≤ 8 := by
  rw [← finrank_O_eq_eight_Cut]
  exact Submodule.finrank_le (fixSubmodule S)

theorem fixSubmodule_id : fixSubmodule (LinearMap.id : O Cut →ₗ[Cut] O Cut) = ⊤ := by
  rw [Submodule.eq_top_iff']
  intro v
  rw [mem_fixSubmodule, LinearMap.id_apply]

theorem fixSubmodule_id_finrank :
    Module.finrank Cut (fixSubmodule (LinearMap.id : O Cut →ₗ[Cut] O Cut)) = 8 := by
  rw [fixSubmodule_id, finrank_top, finrank_O_eq_eight_Cut]

/-! ## BASE CASE / TERMINATION. -/

theorem isom_fix_full_eq_id (S : O Cut →ₗ[Cut] O Cut)
    (hfix : Module.finrank Cut (fixSubmodule S) = 8) :
    S = LinearMap.id := by
  have htop : fixSubmodule S = ⊤ :=
    Submodule.eq_top_of_finrank_eq (by rw [hfix, finrank_O_eq_eight_Cut])
  apply LinearMap.ext
  intro v
  have hv : v ∈ fixSubmodule S := htop ▸ Submodule.mem_top
  rw [mem_fixSubmodule] at hv
  rw [hv, LinearMap.id_apply]

/-! ## The isometry predicate and the concrete grounding of the alphabet. -/

def IsGFormCIsom (S : O Cut →ₗ[Cut] O Cut) : Prop :=
  ∀ u v : O Cut, gFormC (S u) (S v) = gFormC u v

/-- The banked bisector reflection's octonion-block v-block IS a bilinear `gFormC`-isometry:
    `gFormC (octReflBlock e w u) (octReflBlock e w v) = gFormC u v`. The diagonal preservation
    `octReflBlock_gFormC_diag` (N121) polarized to bilinear (`gFormC_polarize`, N112). The
    alphabet member is a genuine isometry. -/
theorem octReflBlock_isGFormCIsom {e w : O Cut} (hne : e - w ≠ 0) :
    IsGFormCIsom (octReflBlock e w) :=
  fun u v => gFormC_polarize (octReflBlock e w) (fun x => octReflBlock_gFormC_diag hne x) u v

/-! ## THE ABSTRACT FINRANK-STRONG-RECURSION SKELETON. -/

/-- Helper, by strong induction on the fixed-subspace codimension `m = 8 − finrank (fixSubmodule S)`:
    given a peel ORACLE — for any non-identity isometry `T` there is an involutive reflection `R`
    from the alphabet `refl` whose composite `R · T` is again an isometry with a STRICTLY LARGER
    fixed subspace — every isometry `S` is a finite product of reflections. -/
theorem reflection_exhaustion_aux
    (refl : Set (Module.End Cut (O Cut)))
    (oracle : ∀ T : O Cut →ₗ[Cut] O Cut, IsGFormCIsom T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsGFormCIsom (R * T) ∧
          Module.finrank Cut (fixSubmodule T)
            < Module.finrank Cut (fixSubmodule (R * T))) :
    ∀ (m : ℕ) (S : O Cut →ₗ[Cut] O Cut), IsGFormCIsom S →
      8 - Module.finrank Cut (fixSubmodule S) = m →
      S ∈ Submonoid.closure refl := by
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro S hS hm
    by_cases hid : S = LinearMap.id
    · rw [hid]
      have hone : (LinearMap.id : O Cut →ₗ[Cut] O Cut) = (1 : Module.End Cut (O Cut)) := rfl
      rw [hone]; exact Submonoid.one_mem _
    · obtain ⟨R, hRmem, hRinv, hRT, hlt⟩ := oracle S hS hid
      have hle : Module.finrank Cut (fixSubmodule (R * S)) ≤ 8 := fixSubmodule_finrank_le _
      set m' := 8 - Module.finrank Cut (fixSubmodule (R * S)) with hm'
      have hm'lt : m' < m := by rw [← hm, hm']; omega
      have hRSmem : (R * S) ∈ Submonoid.closure refl := ih m' hm'lt (R * S) hRT rfl
      have hRclos : R ∈ Submonoid.closure refl := Submonoid.subset_closure hRmem
      have hkey : S = R * (R * S) := by rw [← mul_assoc, hRinv, one_mul]
      rw [hkey]
      exact Submonoid.mul_mem _ hRclos hRSmem

/-- ★★ THE GLOBAL OCTONION-BLOCK EXHAUSTION (abstract form): given the peel oracle, every
    `gFormC`-isometry on the terminal algebra `O Cut` is a finite product of reflections from the
    alphabet `refl`. The `m = 8 − finrank (fixSubmodule S)` specialization of the recursion
    skeleton — the well-founded descent on the fixed-subspace codimension, the involution
    reassembly `S = R · (R · S)`, the depth bounded by `finrank (O Cut) = 8`. -/
theorem reflection_exhaustion
    (refl : Set (Module.End Cut (O Cut)))
    (oracle : ∀ T : O Cut →ₗ[Cut] O Cut, IsGFormCIsom T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsGFormCIsom (R * T) ∧
          Module.finrank Cut (fixSubmodule T)
            < Module.finrank Cut (fixSubmodule (R * T)))
    (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    S ∈ Submonoid.closure refl :=
  reflection_exhaustion_aux refl oracle _ S hS rfl

/-! ## W8 teeth — the alphabet is concretely non-vacuous, the fixed subspace concrete. -/

/-- W8 — the concrete banked reflection `octReflBlock e₂ je2` is a genuine bilinear isometry, and
    its fixed submodule contains the unit-imaginary axis `ke2je2` (it FIXES it,
    `octReflBlock_witness`, N121). The abstract `fixSubmodule` tied to a concrete alphabet member. -/
theorem octReflBlock_witness_mem_fix :
    (ke2je2 : O Cut) ∈ fixSubmodule (octReflBlock (CD.e2 : O Cut) (je2 : O Cut)) := by
  rw [mem_fixSubmodule]
  exact octReflBlock_witness

end

end Phys.Algebra
