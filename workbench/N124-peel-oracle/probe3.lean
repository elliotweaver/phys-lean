import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def houseHolder (a : O Cut) : O Cut →ₗ[Cut] O Cut :=
  LinearMap.id - (2 * (gFormC a a)⁻¹) • (LinearMap.smulRight (gFormCRight a) a)

theorem houseHolder_apply (a v : O Cut) :
    houseHolder a v = v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a := by
  unfold houseHolder
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show v - (2 * (gFormC a a)⁻¹) • (gFormCRight a v • a) = _
  rw [smul_smul]; rfl

theorem houseHolder_fixes_ortho {a u : O Cut} (h : gFormC a u = 0) :
    houseHolder a u = u := by
  rw [houseHolder_apply, h, mul_zero, zero_smul, sub_zero]

theorem gFormC_houseterm (x y a : O Cut) (s t : Cut) :
    gFormC (x - s • a) (y - t • a)
      = gFormC x y - t * gFormC x a - s * gFormC a y + s * t * gFormC a a := by
  simp only [sub_eq_add_neg, gFormC_add_left, gFormC_add_right, gFormC_neg_left,
    octRefl_gFormC_neg_right, gFormC_smul_left, gFormC_smul_right]
  ring

theorem houseHolder_isom {a : O Cut} (ha : gFormC a a ≠ 0) :
    IsGFormCIsom (houseHolder a) := by
  intro u v
  rw [houseHolder_apply, houseHolder_apply, gFormC_houseterm, gFormC_symm u a]
  field_simp; ring

theorem houseHolder_involutive {a : O Cut} (ha : gFormC a a ≠ 0) :
    houseHolder a * houseHolder a = 1 := by
  apply LinearMap.ext
  intro v
  rw [Module.End.mul_apply, houseHolder_apply, houseHolder_apply]
  have hinner : gFormC a (v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a)
      = gFormC a v - (2 * (gFormC a a)⁻¹ * gFormC a v) * gFormC a a := by
    rw [sub_eq_add_neg, gFormC_add_right, octRefl_gFormC_neg_right, gFormC_smul_right]; ring
  rw [hinner]
  have hcoef : (2 * (gFormC a a)⁻¹ * gFormC a v)
      + (2 * (gFormC a a)⁻¹ * (gFormC a v - (2 * (gFormC a a)⁻¹ * gFormC a v) * gFormC a a)) = 0 := by
    field_simp; ring
  rw [sub_sub, ← add_smul, hcoef, zero_smul, sub_zero]; rfl

/-! ## THE ORACLE. -/

/-- The alphabet of Householder reflections of nonzero-Born vectors. -/
def houseHolderSet : Set (Module.End Cut (O Cut)) :=
  { R | ∃ a : O Cut, gFormC a a ≠ 0 ∧ R = houseHolder a }

/-- Bilinear sub-expansion in the left slot. -/
theorem gFormC_sub_left (x y w : O Cut) : gFormC (x - y) w = gFormC x w - gFormC y w := by
  rw [sub_eq_add_neg, gFormC_add_left, gFormC_neg_left, ← sub_eq_add_neg]

/-- A composite of two Born-isometries is a Born-isometry. -/
theorem IsGFormCIsom.comp {R T : O Cut →ₗ[Cut] O Cut}
    (hR : IsGFormCIsom R) (hT : IsGFormCIsom T) : IsGFormCIsom (R * T) := by
  intro u v
  rw [Module.End.mul_apply, Module.End.mul_apply, hR, hT]

/-- A Born-isometry `T ≠ id` has a moved vector. -/
theorem isom_ne_id_has_moved {T : O Cut →ₗ[Cut] O Cut} (hid : T ≠ LinearMap.id) :
    ∃ v : O Cut, T v ≠ v := by
  by_contra h
  push_neg at h
  exact hid (LinearMap.ext h)

/-- ★★ THE PEEL ORACLE: for a non-identity Born-isometry `T`, the Householder reflection
    `R := houseHolder (T v − v)` at a moved vector `v` is an involution, `R · T` is a Born-isometry,
    and its fixed subspace STRICTLY contains `fixSubmodule T` — so the finrank strictly grows. -/
theorem houseHolder_oracle (T : O Cut →ₗ[Cut] O Cut) (hT : IsGFormCIsom T)
    (hid : T ≠ LinearMap.id) :
    ∃ R ∈ houseHolderSet, R * R = 1 ∧ IsGFormCIsom (R * T) ∧
      Module.finrank Cut (fixSubmodule T)
        < Module.finrank Cut (fixSubmodule (R * T)) := by
  obtain ⟨v, hv⟩ := isom_ne_id_has_moved hid
  set a : O Cut := T v - v with ha_def
  have hane : a ≠ 0 := sub_ne_zero.mpr hv
  have haa : gFormC a a ≠ 0 := ne_of_gt (gFormC_pos_of_ne hane)
  set R : O Cut →ₗ[Cut] O Cut := houseHolder a with hR_def
  -- the key scalar identity: gFormC a a = 2 * gFormC a (T v)
  have hTvTv : gFormC (T v) (T v) = gFormC v v := hT v v
  have hkey : gFormC a a = 2 * gFormC a (T v) := by
    have e1 : gFormC a (T v) = gFormC (T v) (T v) - gFormC v (T v) := by
      rw [ha_def, gFormC_sub_left]
    have e2 : gFormC a a = gFormC (T v) (T v) - gFormC v (T v) - gFormC v (T v) + gFormC v v := by
      rw [ha_def]
      rw [show (T v - v) = (T v - (1:Cut) • v) by rw [one_smul],
          gFormC_houseterm (T v) (T v) v 1 1, gFormC_symm v (T v)]
      ring
    rw [e1, e2, hTvTv]; ring
  -- O4: R (T v) = v
  have hbne : gFormC a (T v) ≠ 0 := by
    intro h; rw [h, mul_zero] at hkey; exact haa hkey
  have hO4 : R (T v) = v := by
    rw [hR_def, houseHolder_apply]
    have hc : 2 * (gFormC a a)⁻¹ * gFormC a (T v) = 1 := by
      rw [hkey]; field_simp
    rw [hc, one_smul, ha_def]; abel
  -- O5: any T-fixed u is R-fixed, hence (R*T)-fixed
  have hO5 : ∀ u : O Cut, T u = u → (R * T) u = u := by
    intro u hu
    have hortho : gFormC a u = 0 := by
      rw [ha_def, gFormC_sub_left]
      have : gFormC (T v) u = gFormC v u := by
        have := hT v u; rw [hu] at this; exact this
      rw [this]; ring
    rw [Module.End.mul_apply, hu, hR_def, houseHolder_fixes_ortho hortho]
  refine ⟨R, ⟨a, haa, rfl⟩, ?_, ?_, ?_⟩
  · rw [hR_def]; exact houseHolder_involutive haa
  · exact (houseHolder_isom haa).comp hT
  · -- strict growth: fixSubmodule T < fixSubmodule (R*T)
    have hsub : fixSubmodule T ≤ fixSubmodule (R * T) := by
      intro u hu
      rw [mem_fixSubmodule] at hu ⊢
      exact hO5 u hu
    have hvmem : v ∈ fixSubmodule (R * T) := by
      rw [mem_fixSubmodule, Module.End.mul_apply, hO4]
    have hvnotmem : v ∉ fixSubmodule T := by
      rw [mem_fixSubmodule]; exact hv
    have hlt : fixSubmodule T < fixSubmodule (R * T) :=
      lt_of_le_of_ne hsub (fun heq => hvnotmem (heq ▸ hvmem))
    exact Submodule.finrank_lt_finrank_of_lt hlt

/-- ★★ THE FULL OCTONION-BLOCK EXHAUSTION (oracle DISCHARGED): every Born-isometry of the terminal
    algebra `O Cut` is a finite product of Householder reflections. The peel oracle
    `houseHolder_oracle` fed into N123's recursion skeleton `reflection_exhaustion`. -/
theorem gFormC_isom_mem_closure (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    S ∈ Submonoid.closure houseHolderSet :=
  reflection_exhaustion houseHolderSet houseHolder_oracle S hS

end

end Phys.Algebra
