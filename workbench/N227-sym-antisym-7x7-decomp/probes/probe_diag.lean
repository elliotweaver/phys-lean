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

theorem isAdjointPair_swap {f g : Module.End ℚ ImO}
    (h : LinearMap.IsAdjointPair bornBil bornBil f g) :
    LinearMap.IsAdjointPair bornBil bornBil g f := by
  intro x y
  calc bornBil (g x) y = bornBil y (g x) := bornBil_symm _ _
    _ = bornBil (f y) x := (h y x).symm
    _ = bornBil x (f y) := bornBil_symm _ _

theorem mem_skew_iff (φ : Module.End ℚ ImO) :
    φ ∈ (bornBil).skewAdjointSubmodule ↔ bAdj φ = -φ := by
  rw [LinearMap.mem_skewAdjointSubmodule]
  constructor
  · intro h
    have hp := isAdjointPair_swap (f := φ) (g := -φ) h
    exact ((bAdj_eq_iff (-φ) φ).1 hp).symm
  · intro h
    have hp : LinearMap.IsAdjointPair bornBil bornBil (-φ) φ := (bAdj_eq_iff (-φ) φ).2 h.symm
    intro x y
    calc bornBil (φ x) y = bornBil y (φ x) := bornBil_symm _ _
      _ = bornBil ((-φ) y) x := (hp y x).symm
      _ = bornBil x ((-φ) y) := bornBil_symm _ _

end Phys.Algebra
