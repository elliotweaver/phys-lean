/- PROBE (N271): the ISOSPIN-neutral core of the full carrier O ℚ = span{1, κO1} (the N266 twin),
   and the JOINT colour∧isospin-neutral core = span{1} (the fold's scalar unit). -/
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The isospin-neutral core of the full 8-dim matter carrier `O ℚ`. -/

/-- The joint kernel of the three weak-isospin generators {DI,DJ,DK} acting on the FULL carrier
    `O ℚ` (not just the vector 7 = `ImO`, where N256 found `span{κO1}`). -/
noncomputable def matterIsospinNeutral : Submodule ℚ (O ℚ) :=
  LinearMap.ker ((DI : Module.End ℚ (O ℚ))) ⊓ LinearMap.ker ((DJ : Module.End ℚ (O ℚ)))
    ⊓ LinearMap.ker ((DK : Module.End ℚ (O ℚ)))

/-- ⊇ : `span{1, κO1}` is isospin-neutral. -/
theorem span_one_kap_le_matterIsospinNeutral :
    Submodule.span ℚ {(1 : O ℚ), kappaO 1} ≤ matterIsospinNeutral := by
  rw [Submodule.span_le]
  intro x hx
  simp only [SetLike.mem_coe, matterIsospinNeutral, Submodule.mem_inf, LinearMap.mem_ker]
  rcases hx with h1 | hk
  · rw [h1]
    exact ⟨⟨derivQ_one _ DI.2, derivQ_one _ DJ.2⟩, derivQ_one _ DK.2⟩
  · rw [Set.mem_singleton_iff] at hk; rw [hk]
    exact ⟨⟨D_kappaO_one_zero hI DI.2, D_kappaO_one_zero hJ DJ.2⟩, D_kappaO_one_zero hK DK.2⟩

/-- ⊆ (THE CRUX): every isospin-neutral `x` lies in `span{1, κO1}`. Split `x = reQ x • 1 + w`,
    `w ∈ ImO`; each isospin generator kills `x` and kills `reQ x • 1` (`derivQ_one`), so it kills
    `w`, hence `⟨w,_⟩ ∈ isospinInvariants = span{κO1}` (N256). Direct twin of N266's colour crux. -/
theorem matterIsospinNeutral_le_span_one_kap :
    matterIsospinNeutral ≤ Submodule.span ℚ {(1 : O ℚ), kappaO 1} := by
  intro x hx
  obtain ⟨⟨hxI, hxJ⟩, hxK⟩ := hx
  rw [LinearMap.mem_ker] at hxI hxJ hxK
  set w : O ℚ := x - (reQ x) • (1 : O ℚ) with hw
  have hwIm : w ∈ ImO := by
    rw [mem_ImO, hw]
    have ht := trace_id x
    have hs1 : star ((reQ x) • (1 : O ℚ)) = (reQ x) • (1 : O ℚ) := by
      have h := starL.map_smul (reQ x) (1 : O ℚ)
      simp only [starL_apply, star_one] at h
      exact h
    rw [star_sub, hs1]
    linear_combination (norm := module) ht
  -- helper: each isospin generator kills w
  have kill : ∀ D : derivationLieQ, (D : Module.End ℚ (O ℚ)) x = 0 →
      (D : Module.End ℚ (O ℚ)) w = 0 := by
    intro D hDx
    have h1 : (D : Module.End ℚ (O ℚ)) ((reQ x) • (1 : O ℚ)) = 0 := by
      rw [map_smul, derivQ_one _ D.2, smul_zero]
    rw [hw, map_sub, hDx, h1, sub_zero]
  have hker : (⟨w, hwIm⟩ : ImO) ∈ isospinInvariants := by
    refine ⟨⟨LinearMap.mem_ker.mpr ?_, LinearMap.mem_ker.mpr ?_⟩, LinearMap.mem_ker.mpr ?_⟩
    · apply Subtype.ext; rw [imRep_coe]; exact kill DI hxI
    · apply Subtype.ext; rw [imRep_coe]; exact kill DJ hxJ
    · apply Subtype.ext; rw [imRep_coe]; exact kill DK hxK
  rw [isospinInvariants_eq_span_kap, Submodule.mem_span_singleton] at hker
  obtain ⟨c, hc⟩ := hker
  have hwc : w = c • (kappaO 1 : O ℚ) := by
    have := congrArg (Subtype.val) hc
    simpa [kap1', SetLike.val_smul] using this.symm
  have hxsplit : x = (reQ x) • (1 : O ℚ) + c • (kappaO 1 : O ℚ) := by
    rw [← hwc, hw]; abel
  rw [hxsplit]
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by left; rfl))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by right; rfl))

/-- ★★★ THE ISOSPIN TWIN of N266: the isospin-neutral core of the full matter carrier is EXACTLY
    `span{1, κO1}` — the real unit line adjoined to the vector-7 isospin singlet. -/
theorem matterIsospinNeutral_eq_span_one_kap :
    matterIsospinNeutral = Submodule.span ℚ {(1 : O ℚ), kappaO 1} :=
  le_antisymm matterIsospinNeutral_le_span_one_kap span_one_kap_le_matterIsospinNeutral

/-! ## The JOINT doubly-neutral core = the fold's scalar unit line span{1}. -/

/-- Coordinate functional picking the `u1` component (`x.re.re.im`). -/
def cU1 : O ℚ →ₗ[ℚ] ℚ where
  toFun x := x.re.re.im
  map_add' x y := by simp [CD.add_re, CD.add_im]
  map_smul' c x := by simp [cd_qsmul_re, cd_qsmul_im]

/-- Coordinate functional picking the `κO1` component (`x.im.re.re`). -/
def cKap : O ℚ →ₗ[ℚ] ℚ where
  toFun x := x.im.re.re
  map_add' x y := by simp [CD.add_re, CD.add_im]
  map_smul' c x := by simp [cd_qsmul_re, cd_qsmul_im]

theorem cU1_one : cU1 (1 : O ℚ) = 0 := by simp [cU1]
theorem cU1_u1 : cU1 u1 = 1 := by simp [cU1, u1]
theorem cU1_kap : cU1 (kappaO 1) = 0 := by simp [cU1, kappaO]
theorem cKap_one : cKap (1 : O ℚ) = 0 := by simp [cKap]
theorem cKap_u1 : cKap u1 = 0 := by simp [cKap, u1]
theorem cKap_kap : cKap (kappaO 1) = 1 := by simp [cKap, kappaO]

/-- CRUX: span{1,u1} ⊓ span{1,κO1} = span{1}. (probe-B route, coordinate functionals.) -/
theorem span_meet_eq_span_one :
    Submodule.span ℚ {(1 : O ℚ), u1} ⊓ Submodule.span ℚ {(1 : O ℚ), kappaO 1}
      = Submodule.span ℚ {(1 : O ℚ)} := by
  apply le_antisymm
  · rintro x ⟨hxu, hxk⟩
    rw [SetLike.mem_coe, Submodule.mem_span_pair] at hxu
    rw [SetLike.mem_coe, Submodule.mem_span_pair] at hxk
    obtain ⟨a, b, hab⟩ := hxu
    obtain ⟨c, d, hcd⟩ := hxk
    have hd : d = 0 := by
      have h1 : cKap x = 0 := by rw [← hab]; simp [cKap_one, cKap_u1]
      have h2 : cKap x = d := by rw [← hcd]; simp [cKap_one, cKap_kap]
      rw [h2] at h1; exact h1
    rw [hd, zero_smul, add_zero] at hcd
    rw [← hcd]
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)
  · rw [Submodule.span_le]
    intro x hx
    rw [Set.mem_singleton_iff] at hx; subst hx
    exact ⟨Submodule.subset_span (by simp), Submodule.subset_span (by simp)⟩

/-- ★★★ THE JOINT DOUBLY-NEUTRAL CORE of the matter carrier is EXACTLY the fold's scalar unit line
    `span{1}` — the piece invisible to BOTH colour AND isospin. -/
theorem matter_joint_neutral_eq_span_one :
    matterColourNeutral ⊓ matterIsospinNeutral = Submodule.span ℚ {(1 : O ℚ)} := by
  rw [matterColourNeutral_eq_span_one_u1, matterIsospinNeutral_eq_span_one_kap,
    span_meet_eq_span_one]

end Phys.Algebra.HJ

section AxCheck
open Phys.Algebra.HJ
#print axioms matterIsospinNeutral_eq_span_one_kap
#print axioms matter_joint_neutral_eq_span_one
end AxCheck
