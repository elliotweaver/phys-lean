import Phys.Algebra.TowerGatherElectroweakReductiveLie

/-! N259 scratch 2 — de-risk the full intersection ⊆ direction and the headline. -/

open scoped Classical
noncomputable section

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

set_option synthInstance.maxHeartbeats 400000

-- helper lemmas (proved in scratch_crux)
theorem colourImg_inf_isospinImg :
    colourImg ⊓ isospinImg = Submodule.span ℚ {imRepL DI} := by
  rw [colourImg, isospinImg,
      ← Submodule.map_inf imRepL imRep_injective,
      inf_comm, meet_eq_span_DI, Submodule.map_span]
  simp

theorem chargeLine_inf_hyperLine : chargeLine ⊓ hyperLine = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  rw [Submodule.mem_inf] at hx
  obtain ⟨hxc, hxh⟩ := hx
  rw [chargeLine, Submodule.mem_span_singleton] at hxc
  rw [hyperLine, Submodule.mem_span_singleton] at hxh
  obtain ⟨a, ha⟩ := hxc
  obtain ⟨b, hb⟩ := hxh
  have hax : x = a • chargeOp := ha.symm
  have hbx : x = b • hyperOp := hb.symm
  have key : a * (-6 : ℚ) = 0 := by
    have e1 : traceForm7 x chargeOp = a * traceForm7 chargeOp chargeOp := by
      rw [hax]; simp [traceForm7, map_smul]
    have e2 : traceForm7 x chargeOp = b * traceForm7 hyperOp chargeOp := by
      rw [hbx]; simp [traceForm7, map_smul]
    rw [B_chargeOp_chargeOp_via_isometry] at e1
    rw [traceForm7_symm hyperOp chargeOp, B_chargeOp_hyperOp] at e2
    rw [e1] at e2; simpa using e2.symm
  have ha0 : a = 0 := by
    have h6 : (-6 : ℚ) ≠ 0 := by norm_num
    rcases mul_eq_zero.mp key with h | h
    · exact h
    · exact absurd h h6
  rw [hax, ha0, zero_smul]; exact Submodule.zero_mem _

-- summand locations
theorem chargeLine_le_P7 : chargeLine ≤ LinearMap.range crossEmb := chargeLine_le_range_crossEmb
theorem colourImg_le_P14 : colourImg ≤ LinearMap.range imRepL := colourImg_le_range_imRep
theorem isospinImg_le_P14 : isospinImg ≤ LinearMap.range imRepL := isospinImg_le_range_imRep
theorem hyperLine_le_P7 : hyperLine ≤ LinearMap.range crossEmb := hyperLine_le_range_crossEmb

-- THE HEADLINE intersection.
theorem shared_cartan :
    chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      = Submodule.span ℚ {imRepL DI} := by
  rw [chargeColourLie_toSubmodule, electroweakLie_toSubmodule]
  apply le_antisymm
  · -- ⊆
    intro x hx
    rw [Submodule.mem_inf] at hx
    obtain ⟨hxcc, hxew⟩ := hx
    -- x = c + k, c ∈ chargeLine, k ∈ colourImg
    rw [Submodule.mem_sup] at hxcc
    obtain ⟨c, hc, k, hk, hxck⟩ := hxcc
    -- x = i + h, i ∈ isospinImg, h ∈ hyperLine
    rw [Submodule.mem_sup] at hxew
    obtain ⟨i, hi, h, hh, hxih⟩ := hxew
    -- c + k = i + h  ⟹  k - i = h - c  ∈ P14 ⊓ P7 = ⊥
    have hsum : c + k = i + h := by rw [hxck, hxih]
    have hcombine : k - i = h - c := by
      rw [sub_eq_sub_iff_add_eq_add, add_comm k c, add_comm h i]; exact hsum
    have hki_P14 : k - i ∈ LinearMap.range imRepL :=
      Submodule.sub_mem _ (colourImg_le_P14 hk) (isospinImg_le_P14 hi)
    have hhc_P7 : h - c ∈ LinearMap.range crossEmb :=
      Submodule.sub_mem _ (hyperLine_le_P7 hh) (chargeLine_le_P7 hc)
    have hmem_bot : k - i ∈ (⊥ : Submodule ℚ (Module.End ℚ ImO)) := by
      rw [← inter_eq_bot, Submodule.mem_inf]
      refine ⟨hki_P14, ?_⟩
      rw [hcombine]; exact hhc_P7
    rw [Submodule.mem_bot] at hmem_bot
    have hki : k = i := by rw [← sub_eq_zero]; exact hmem_bot
    have hhc : h = c := by
      have hz : h - c = 0 := by rw [← hcombine, hki]; exact sub_self i
      rw [← sub_eq_zero]; exact hz
    -- c ∈ chargeLine ⊓ hyperLine = ⊥ (since c = h ∈ hyperLine)
    have hc0 : c = 0 := by
      have hcmem : c ∈ chargeLine ⊓ hyperLine := by
        rw [Submodule.mem_inf]; exact ⟨hc, hhc ▸ hh⟩
      rw [chargeLine_inf_hyperLine, Submodule.mem_bot] at hcmem
      exact hcmem
    -- k ∈ colourImg ⊓ isospinImg = span{imRepL DI}
    have hkmem : k ∈ colourImg ⊓ isospinImg := by
      rw [Submodule.mem_inf]; exact ⟨hk, hki ▸ hi⟩
    rw [colourImg_inf_isospinImg] at hkmem
    -- x = c + k = 0 + k = k
    have hxk : x = k := by rw [← hxck, hc0, zero_add]
    rw [hxk]; exact hkmem
  · -- ⊇ : span{imRepL DI} ⊆ both
    rw [Submodule.span_le, Set.singleton_subset_iff]
    have hDI_col : imRepL DI ∈ colourImg := by
      rw [colourImg, Submodule.mem_map]
      exact ⟨DI, by rw [LieSubalgebra.mem_toSubmodule]; exact DI_mem_colour, rfl⟩
    have hDI_iso : imRepL DI ∈ isospinImg := by
      rw [isospinImg, Submodule.mem_map]
      exact ⟨DI, Submodule.subset_span (by simp), rfl⟩
    rw [SetLike.mem_coe, Submodule.mem_inf]
    constructor
    · -- ∈ chargeLine ⊔ colourImg
      exact Submodule.mem_sup_right hDI_col
    · -- ∈ isospinImg ⊔ hyperLine
      exact Submodule.mem_sup_left hDI_iso

end Phys.Algebra
