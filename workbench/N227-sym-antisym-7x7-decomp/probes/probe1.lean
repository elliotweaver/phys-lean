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

theorem bornBil_symm (x y : ImO) : bornBil x y = bornBil y x :=
  bornBil_isSymm.eq x y

theorem bAdj_involutive (φ : Module.End ℚ ImO) : bAdj (bAdj φ) = φ := by
  symm
  rw [← bAdj_eq_iff]
  intro x y
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

theorem mem_self_iff (φ : Module.End ℚ ImO) :
    φ ∈ (bornBil).selfAdjointSubmodule ↔ bAdj φ = φ := by
  rw [LinearMap.mem_selfAdjointSubmodule]
  constructor
  · intro h; exact ((bAdj_eq_iff φ φ).1 h).symm
  · intro h; exact (bAdj_eq_iff φ φ).2 h.symm

theorem mem_skew_iff (φ : Module.End ℚ ImO) :
    φ ∈ (bornBil).skewAdjointSubmodule ↔ bAdj φ = -φ := by
  rw [LinearMap.mem_skewAdjointSubmodule]
  constructor
  · intro h
    have hp : LinearMap.IsAdjointPair bornBil bornBil (-φ) φ := by
      intro x y; have := h x y; simp only [LinearMap.neg_apply, map_neg] at this ⊢; linarith
    exact ((bAdj_eq_iff (-φ) φ).1 hp).symm
  · intro h
    have hp : LinearMap.IsAdjointPair bornBil bornBil (-φ) φ := (bAdj_eq_iff (-φ) φ).2 h.symm
    intro x y; have := hp x y; simp only [LinearMap.neg_apply, map_neg] at this ⊢; linarith

end Phys.Algebra
