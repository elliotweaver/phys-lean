import Phys.Algebra.TowerGatherObstructionComplementSo7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

set_option synthInstance.maxHeartbeats 1000000

noncomputable def bAdj (φ : Module.End ℚ ImO) : Module.End ℚ ImO :=
  (bornBil).leftAdjointOfNondegenerate bornBil_nondegenerate φ

theorem bAdj_pair (φ : Module.End ℚ ImO) :
    LinearMap.IsAdjointPair bornBil bornBil (bAdj φ) φ :=
  bornBil.isAdjointPairLeftAdjointOfNondegenerate bornBil_nondegenerate φ

theorem bAdj_eq_iff (ψ φ : Module.End ℚ ImO) :
    LinearMap.IsAdjointPair bornBil bornBil ψ φ ↔ ψ = bAdj φ :=
  bornBil.isAdjointPair_iff_eq_of_nondegenerate bornBil_nondegenerate ψ φ

theorem bornBil_symm (x y : ImO) : bornBil x y = bornBil y x := bornBil_isSymm.eq x y

theorem bAdj_involutive (φ : Module.End ℚ ImO) : bAdj (bAdj φ) = φ := by
  symm; rw [← bAdj_eq_iff]; intro x y
  have h1 : bornBil x (bAdj φ y) = bornBil (bAdj φ y) x := bornBil_symm _ _
  have h2 : bornBil (bAdj φ y) x = bornBil y (φ x) := bAdj_pair φ y x
  have h3 : bornBil y (φ x) = bornBil (φ x) y := bornBil_symm _ _
  rw [h1, h2, h3]

theorem bAdj_add (φ ψ : Module.End ℚ ImO) : bAdj (φ + ψ) = bAdj φ + bAdj ψ := by
  symm; rw [← bAdj_eq_iff]; exact (bAdj_pair φ).add (bAdj_pair ψ)

theorem bAdj_sub (φ ψ : Module.End ℚ ImO) : bAdj (φ - ψ) = bAdj φ - bAdj ψ := by
  symm; rw [← bAdj_eq_iff]; exact (bAdj_pair φ).sub (bAdj_pair ψ)

theorem bAdj_smul (c : ℚ) (φ : Module.End ℚ ImO) : bAdj (c • φ) = c • bAdj φ := by
  symm; rw [← bAdj_eq_iff]; exact (bAdj_pair φ).smul c

/-- `bAdj` is anti-multiplicative for composition. -/
theorem bAdj_mul (φ ψ : Module.End ℚ ImO) : bAdj (φ * ψ) = bAdj ψ * bAdj φ := by
  symm; rw [← bAdj_eq_iff]; exact (bAdj_pair ψ).mul (bAdj_pair φ)

theorem mem_self_iff (φ : Module.End ℚ ImO) :
    φ ∈ (bornBil).selfAdjointSubmodule ↔ bAdj φ = φ := by
  rw [LinearMap.mem_selfAdjointSubmodule]
  exact ⟨fun h => ((bAdj_eq_iff φ φ).1 h).symm, fun h => (bAdj_eq_iff φ φ).2 h.symm⟩

theorem bAdj_neg (φ : Module.End ℚ ImO) : bAdj (-φ) = - bAdj φ := by
  rw [← neg_one_smul ℚ φ, bAdj_smul, neg_one_smul]

theorem mem_skew_iff (φ : Module.End ℚ ImO) :
    φ ∈ (bornBil).skewAdjointSubmodule ↔ bAdj φ = -φ := by
  rw [LinearMap.mem_skewAdjointSubmodule]
  constructor
  · intro h
    have hp : LinearMap.IsAdjointPair bornBil bornBil (-φ) φ := by
      intro x y; have := h x y
      simp only [LinearMap.neg_apply, map_neg] at this ⊢; linarith
    exact ((bAdj_eq_iff (-φ) φ).1 hp).symm
  · intro h
    have hp : LinearMap.IsAdjointPair bornBil bornBil (-φ) φ := (bAdj_eq_iff (-φ) φ).2 h.symm
    intro x y; have := hp x y
    simp only [LinearMap.neg_apply, map_neg] at this ⊢; linarith

/-! ## THE DECOMPOSITION: End = self ⊕ skew (Sym² ⊕ Λ²). -/

theorem selfSkew_disjoint :
    (bornBil).selfAdjointSubmodule ⊓ (bornBil).skewAdjointSubmodule = ⊥ := by
  rw [eq_bot_iff]
  intro φ hφ
  rw [Submodule.mem_inf] at hφ
  obtain ⟨hs, hk⟩ := hφ
  rw [mem_self_iff] at hs
  rw [mem_skew_iff] at hk
  have hneg : φ = -φ := hs.symm.trans hk
  have h2 : (2 : ℚ) • φ = 0 := by
    rw [two_smul]; nth_rewrite 2 [hneg]; abel
  rcases smul_eq_zero.1 h2 with h | h
  · norm_num at h
  · rw [Submodule.mem_bot]; exact h

theorem selfSkew_codisjoint :
    (bornBil).selfAdjointSubmodule ⊔ (bornBil).skewAdjointSubmodule = ⊤ := by
  rw [eq_top_iff]
  intro φ _
  -- φ = (1/2)(φ + bAdj φ) + (1/2)(φ - bAdj φ)
  set s : Module.End ℚ ImO := (2⁻¹ : ℚ) • (φ + bAdj φ) with hs_def
  set k : Module.End ℚ ImO := (2⁻¹ : ℚ) • (φ - bAdj φ) with hk_def
  have hsmem : s ∈ (bornBil).selfAdjointSubmodule := by
    rw [mem_self_iff, hs_def, bAdj_smul, bAdj_add, bAdj_involutive, add_comm]
  have hkmem : k ∈ (bornBil).skewAdjointSubmodule := by
    rw [mem_skew_iff, hk_def, bAdj_smul, bAdj_sub, bAdj_involutive]
    simp only [smul_sub, neg_sub]
  have hsum : s + k = φ := by
    rw [hs_def, hk_def, ← smul_add]
    have : (φ + bAdj φ) + (φ - bAdj φ) = (2 : ℚ) • φ := by rw [two_smul]; abel
    rw [this, smul_smul]; norm_num
  rw [← hsum]
  exact Submodule.add_mem_sup hsmem hkmem

theorem selfSkew_isCompl :
    IsCompl (bornBil).selfAdjointSubmodule (bornBil).skewAdjointSubmodule :=
  ⟨disjoint_iff.2 selfSkew_disjoint, codisjoint_iff.2 selfSkew_codisjoint⟩

end Phys.Algebra
