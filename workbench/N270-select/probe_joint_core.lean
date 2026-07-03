/- PROBE B (N270 SELECT): the JOINT colour-isospin neutral core = fold's real unit line. -/
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def kap1O : O ℚ := kappaO (1 : H ℚ)

def cU1 : O ℚ →ₗ[ℚ] ℚ where
  toFun x := x.re.re.im
  map_add' x y := by simp [CD.add_re, CD.add_im]
  map_smul' c x := by simp [cd_qsmul_re, cd_qsmul_im]

def cKap : O ℚ →ₗ[ℚ] ℚ where
  toFun x := x.im.re.re
  map_add' x y := by simp [CD.add_re, CD.add_im]
  map_smul' c x := by simp [cd_qsmul_re, cd_qsmul_im]

theorem cU1_one : cU1 (1 : O ℚ) = 0 := by simp [cU1]
theorem cU1_u1 : cU1 u1 = 1 := by simp [cU1, u1]
theorem cU1_kap : cU1 kap1O = 0 := by simp [cU1, kap1O, kappaO]
theorem cKap_one : cKap (1 : O ℚ) = 0 := by simp [cKap]
theorem cKap_u1 : cKap u1 = 0 := by simp [cKap, u1]
theorem cKap_kap : cKap kap1O = 1 := by simp [cKap, kap1O, kappaO]

/-- CRUX: span{1,u1} ⊓ span{1,κO1} = span{1}. -/
theorem joint_core_eq_span_one :
    Submodule.span ℚ {(1 : O ℚ), u1} ⊓ Submodule.span ℚ {(1 : O ℚ), kap1O}
      = Submodule.span ℚ {(1 : O ℚ)} := by
  apply le_antisymm
  · rintro x ⟨hxu, hxk⟩
    rw [SetLike.mem_coe, Submodule.mem_span_pair] at hxu
    rw [SetLike.mem_coe, Submodule.mem_span_pair] at hxk
    obtain ⟨a, b, hab⟩ := hxu
    obtain ⟨c, d, hcd⟩ := hxk
    -- cKap: from hab, cKap x = a*0 + b*0 = 0; from hcd, cKap x = c*0 + d*1 = d ⟹ d = 0
    have hd : d = 0 := by
      have h1 : cKap x = 0 := by rw [← hab]; simp [cKap_one, cKap_u1]
      have h2 : cKap x = d := by rw [← hcd]; simp [cKap_one, cKap_kap]
      rw [h2] at h1; exact h1
    -- cU1: from hcd (d=0), x = c•1; so x ∈ span{1}
    rw [hd, zero_smul, add_zero] at hcd
    rw [← hcd]
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)
  · rw [Submodule.span_le]
    intro x hx
    rw [Set.mem_singleton_iff] at hx; subst hx
    exact ⟨Submodule.subset_span (by simp), Submodule.subset_span (by simp)⟩

end Phys.Algebra.HJ

section AxCheck
#print axioms joint_core_eq_span_one
end AxCheck
