import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionInvolution

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- bundle gFormC e · as a Cut-linear functional on O Cut (mirror EvCRight). -/
def gFormCRight (e : O Cut) : O Cut →ₗ[Cut] Cut where
  toFun := fun p => gFormC e p
  map_add' := gFormC_add_right e
  map_smul' := fun c p => by simpa using gFormC_smul_right c e p

/-- the Born-orthogonal complement of e within the octonion block. -/
def ePerp (e : O Cut) : Submodule Cut (O Cut) := LinearMap.ker (gFormCRight e)

theorem mem_ePerp (e p : O Cut) : p ∈ ePerp e ↔ gFormC e p = 0 := by
  unfold ePerp; rw [LinearMap.mem_ker]; rfl

theorem gFormCRight_surjective {e : O Cut} (he : gFormC e e = 1) :
    Function.Surjective (gFormCRight e) := by
  intro c
  refine ⟨c • e, ?_⟩
  show gFormC e (c • e) = c
  rw [gFormC_smul_right, he, mul_one]

/-- THE CODIM-ONE DROP. -/
theorem ePerp_finrank {e : O Cut} (he : gFormC e e = 1) :
    Module.finrank Cut (ePerp e) = Module.finrank Cut (O Cut) - 1 := by
  have hrn := (gFormCRight e).finrank_range_add_finrank_ker
  have hr : Module.finrank Cut (LinearMap.range (gFormCRight e)) = 1 := by
    have h : LinearMap.range (gFormCRight e) = ⊤ :=
      LinearMap.range_eq_top.mpr (gFormCRight_surjective he)
    rw [h, finrank_top]; simp
  unfold ePerp
  omega

/-- ★★ THE KEY — the rank-DROP. A gFormC-isometry S that FIXES e maps ePerp e into ePerp e. -/
theorem isom_fixes_mapsTo_ePerp (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) :
    ∀ p ∈ ePerp e, S p ∈ ePerp e := by
  intro p hp
  rw [mem_ePerp] at hp ⊢
  have hpol := gFormC_polarize S hdiag e p
  rw [hfix] at hpol
  rw [hpol, hp]

/-- the restricted block operator on the codim-1 invariant subspace. -/
def isomRestrict (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) :
    Module.End Cut (ePerp e) :=
  S.restrict (isom_fixes_mapsTo_ePerp S hdiag hfix)

theorem isomRestrict_coe (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) (p : ePerp e) :
    ((isomRestrict S hdiag hfix) p : O Cut) = S (p : O Cut) := rfl

/-- ★ the restriction is STILL a gFormC-isometry (closure → recursion). -/
theorem isomRestrict_gFormC_isom (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) (p : ePerp e) :
    gFormC ((isomRestrict S hdiag hfix p : O Cut)) ((isomRestrict S hdiag hfix p : O Cut))
      = gFormC ((p : O Cut)) ((p : O Cut)) := by
  rw [isomRestrict_coe]
  exact hdiag (p : O Cut)

instance ePerp_finite (e : O Cut) : Module.Finite Cut (ePerp e) :=
  Module.Finite.of_injective (ePerp e).subtype Subtype.coe_injective

theorem self_not_mem_ePerp {e : O Cut} (he : gFormC e e = 1) : e ∉ ePerp e := by
  rw [mem_ePerp, he]; exact one_ne_zero

theorem ePerp_ne_top {e : O Cut} (he : gFormC e e = 1) : ePerp e ≠ ⊤ := by
  intro htop
  exact self_not_mem_ePerp he (htop ▸ Submodule.mem_top)

end

end Phys.Algebra
