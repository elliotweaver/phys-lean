/-
  Phys.Algebra.TowerGatherSymAntisymDecomp — N227.
  ===========================================================================
  THE SYMMETRIC / ANTISYMMETRIC SPLIT OF `7 ⊗ 7`:
    `End ℚ ImO  =  Sym²7 (28)  ⊕  Λ²7 (21 = so(7))`   as g₂-modules.

  A still-deeper cut of the gather frontier (N218T/N219/…/N225/N226), under the OVERNIGHT
  PRIORITY LOCK. The chain STAYS ON THE GATHER.

  THE ARC SO FAR. N223 showed both the fundamental 7 (`crossOp a`) and the adjoint g₂ = Der(O ℚ)
  (`imRep D`) land in ONE `so(7) = skewAdjointLieSubalgebra bornBil` on the banked fundamental
  7-module `ImO`. N224 embedded the 7 as `crossEmb`. N225 proved the ANTISYMMETRIC side
  `so(7) = Λ²7 = 21 = imRep(g₂) ⊕ crossEmb(7) = 14 ⊕ 7`. N226 built the g₂-equivariant projector
  WITHIN `so(7)`.

  BUT the whole `so(7)` arc lives entirely on the ANTISYMMETRIC (skew-adjoint) half of `7 ⊗ 7`.
  The tensor square of the fundamental 7 decomposes as `7 ⊗ 7 = Sym²7 ⊕ Λ²7`, i.e. as g₂-modules
  `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`, where `Λ²7 = so(7) = 14 ⊕ 7` (the 21) is the banked N225 arena and
  `Sym²7 = 1 ⊕ 27` (the 28) is the SYMMETRIC complement — the metric/trace-carrying side, which the
  so(7) arc never touched. N227 builds that split on the banked tower and proves it a decomposition
  of g₂-MODULES:

  (1) THE BORN-ADJOINT INVOLUTION. `bAdj φ := bornBil.leftAdjointOfNondegenerate _ φ`, the transpose
      of `φ ∈ End ℚ ImO` w.r.t. the Born form. Because `bornBil` is SYMMETRIC (banked
      `bornBil_isSymm`, N225) and NONDEGENERATE (banked `bornBil_nondegenerate`, N225), `bAdj` is an
      INVOLUTION (`bAdj_involutive`), ℚ-linear (`bAdj_add`/`bAdj_smul`/`bAdj_sub`/`bAdj_neg`),
      anti-multiplicative (`bAdj_mul`), and fixes the identity (`bAdj_one`).

  (2) THE CHARACTERIZATION. `mem_self_iff`: `φ ∈ selfAdjointSubmodule bornBil ↔ bAdj φ = φ`;
      `mem_skew_iff`: `φ ∈ skewAdjointSubmodule bornBil ↔ bAdj φ = −φ`.

  (3) ★★★ THE DECOMPOSITION (the crux). `selfSkew_isCompl`:
        `IsCompl (selfAdjointSubmodule bornBil) (skewAdjointSubmodule bornBil)`.
      Disjoint: `φ = bAdj φ = −φ ⇒ 2·φ = 0 ⇒ φ = 0` (characteristic 0). Codisjoint: the canonical
      split `φ = ½(φ + bAdj φ) + ½(φ − bAdj φ)` — self part + skew part. `End = Sym² ⊕ Λ²`.

  (4) THE DIMENSIONS. `finrank_end_eq_49`: `finrank (End ℚ ImO) = 49` (`Module.finrank_linearMap` +
      banked `finrank_ImO = 7`, N22). `finrank_selfAdj_eq_28`: the SYMMETRIC side has finrank `28`
      (`Submodule.finrank_add_eq_of_isCompl` + banked `finrank_so7_eq_21`, N225: `49 − 21 = 28`).
      `28 = 1 + 27`: the trivial rep plus the traceless-symmetric 27.

  (5) BOTH SUMMANDS ARE g₂-SUBMODULES. `adEnd D : Module.End ℚ (End ℚ ImO)`, `X ↦ ⁅imRep D, X⁆` (the
      adjoint g₂-action on `7 ⊗ 7`). `skewAdj_adEnd_inv`: `so(7)` closed (Mathlib
      `isSkewAdjoint_bracket` + banked `imRep_mem_so7`, N223). `selfAdj_adEnd_inv`: the SYMMETRIC
      side closed — from `bAdj` anti-multiplicative and `imRep D` skew (`bAdj (imRep D) = −imRep D`),
      the commutator preserves self-adjointness. So `7 ⊗ 7 = 28 ⊕ 21` INTO g₂-submodules.

  (6) W8 NON-VACUITY. `one_mem_selfAdj`: `1 ∈ self` (the symmetric side is nonzero — it carries the
      trivial rep `1 = ℚ·id`, the `1` of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`); `one_adEnd_zero`:
      `adEnd D 1 = 0` (the identity is g₂-invariant — the trivial rep read off explicitly).

  Capstone `sym_antisym_decomposition_structure` bundles isCompl + dims (28, 21, 49) + both
  g₂-stable.

  ONE CAUSE, ANOTHER FACE. The same Born POSITIVITY that (N223–N225) makes `so(7)` the skew half is
  precisely the symmetric nondegenerate form whose transpose involution `bAdj` splits `End` into its
  symmetric and antisymmetric halves. The antisymmetric half is the banked `so(7) = 14 ⊕ 7`; the
  symmetric half `28 = 1 ⊕ 27` — carrying the trivial (metric) rep — is opened here, both as
  g₂-submodules of the gather obstruction's `7 ⊗ 7` arena on the banked tower.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/fundamental/adjoint/module/
  representation/tensor/metric): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)`,
  the Born form `bornBil`, `imRep D = D|ImO` — the transpose involution `bAdj` of the nondegenerate
  symmetric `bornBil` on `End ℚ ImO` splits it as a complemented direct sum of its fixed
  (self-adjoint, finrank 28) and anti-fixed (skew-adjoint, finrank 21; total 49) submodules, each
  closed under `X ↦ ⁅imRep D, X⁆`, with `1` in the self-adjoint part and `⁅imRep D, 1⁆ = 0`. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation (only a synthInstance ceiling for the ℚ-End
  instance diamond, not a proof-search raise).
-/
import Phys.Algebra.TowerGatherObstructionComplementSo7
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) THE BORN-ADJOINT INVOLUTION on `End ℚ ImO`. -/

/-- The transpose of `φ` with respect to the Born form: the unique `bAdj φ` with
    `bornBil (bAdj φ x) y = bornBil x (φ y)`. Exists because `bornBil` is nondegenerate. -/
def bAdj (φ : Module.End ℚ ImO) : Module.End ℚ ImO :=
  (bornBil).leftAdjointOfNondegenerate bornBil_nondegenerate φ

/-- `bAdj φ` is the left adjoint of `φ` for `bornBil`. -/
theorem bAdj_pair (φ : Module.End ℚ ImO) :
    LinearMap.IsAdjointPair bornBil bornBil (bAdj φ) φ :=
  bornBil.isAdjointPairLeftAdjointOfNondegenerate bornBil_nondegenerate φ

/-- The uniqueness characterization of the Born-adjoint. -/
theorem bAdj_eq_iff (ψ φ : Module.End ℚ ImO) :
    LinearMap.IsAdjointPair bornBil bornBil ψ φ ↔ ψ = bAdj φ :=
  bornBil.isAdjointPair_iff_eq_of_nondegenerate bornBil_nondegenerate ψ φ

/-- Symmetry of the Born form: `bornBil x y = bornBil y x` (banked `bornBil_isSymm`, N225). -/
theorem bornBil_symm (x y : ImO) : bornBil x y = bornBil y x := bornBil_isSymm.eq x y

/-- Because `bornBil` is symmetric, an adjoint pair may be swapped. -/
theorem isAdjointPair_swap {f g : Module.End ℚ ImO}
    (h : LinearMap.IsAdjointPair bornBil bornBil f g) :
    LinearMap.IsAdjointPair bornBil bornBil g f := by
  intro x y
  calc bornBil (g x) y = bornBil y (g x) := bornBil_symm _ _
    _ = bornBil (f y) x := (h y x).symm
    _ = bornBil x (f y) := bornBil_symm _ _

/-- `bAdj` is an INVOLUTION: `bAdj (bAdj φ) = φ` (uses symmetry of `bornBil`). -/
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

/-- `bAdj` is ANTI-multiplicative for composition: `bAdj (φ * ψ) = bAdj ψ * bAdj φ`. -/
theorem bAdj_mul (φ ψ : Module.End ℚ ImO) : bAdj (φ * ψ) = bAdj ψ * bAdj φ := by
  symm; rw [← bAdj_eq_iff]; exact (bAdj_pair ψ).mul (bAdj_pair φ)

/-- `bAdj` fixes the identity. -/
theorem bAdj_one : bAdj (1 : Module.End ℚ ImO) = 1 :=
  ((bAdj_eq_iff 1 1).1 LinearMap.isAdjointPair_one).symm

/-! ## (2) SELF- / SKEW-ADJOINT CHARACTERIZATION. -/

/-- Self-adjoint ↔ fixed by the Born-adjoint. -/
theorem mem_self_iff (φ : Module.End ℚ ImO) :
    φ ∈ (bornBil).selfAdjointSubmodule ↔ bAdj φ = φ := by
  rw [LinearMap.mem_selfAdjointSubmodule]
  exact ⟨fun h => ((bAdj_eq_iff φ φ).1 h).symm, fun h => (bAdj_eq_iff φ φ).2 h.symm⟩

/-- Skew-adjoint ↔ negated by the Born-adjoint. -/
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

/-! ## (3) ★★★ THE DECOMPOSITION `End = self ⊕ skew`  (`7⊗7 = Sym² ⊕ Λ²`). -/

/-- The self-adjoint and skew-adjoint submodules meet only in `0` (characteristic 0). -/
theorem selfSkew_disjoint :
    (bornBil).selfAdjointSubmodule ⊓ (bornBil).skewAdjointSubmodule = ⊥ := by
  rw [eq_bot_iff]
  intro φ hφ
  rw [Submodule.mem_inf] at hφ
  obtain ⟨hs, hk⟩ := hφ
  rw [mem_self_iff] at hs
  rw [mem_skew_iff] at hk
  have hneg : φ = -φ := hs.symm.trans hk
  have h2 : (2 : ℚ) • φ = 0 := by rw [two_smul]; nth_rewrite 2 [hneg]; abel
  rcases smul_eq_zero.1 h2 with h | h
  · norm_num at h
  · rw [Submodule.mem_bot]; exact h

/-- Every endomorphism splits as `½(φ + bAdj φ) + ½(φ − bAdj φ)` — self part + skew part. -/
theorem selfSkew_codisjoint :
    (bornBil).selfAdjointSubmodule ⊔ (bornBil).skewAdjointSubmodule = ⊤ := by
  rw [eq_top_iff]
  intro φ _
  set s : Module.End ℚ ImO := (2⁻¹ : ℚ) • (φ + bAdj φ) with hs_def
  set k : Module.End ℚ ImO := (2⁻¹ : ℚ) • (φ - bAdj φ) with hk_def
  have hsmem : s ∈ (bornBil).selfAdjointSubmodule := by
    rw [mem_self_iff, hs_def, bAdj_smul, bAdj_add, bAdj_involutive, add_comm]
  have hkmem : k ∈ (bornBil).skewAdjointSubmodule := by
    rw [mem_skew_iff, hk_def, bAdj_smul, bAdj_sub, bAdj_involutive]
    simp only [smul_sub, neg_sub]
  have hsum : s + k = φ := by
    rw [hs_def, hk_def, ← smul_add]
    have hh : (φ + bAdj φ) + (φ - bAdj φ) = (2 : ℚ) • φ := by rw [two_smul]; abel
    rw [hh, smul_smul]; norm_num
  rw [← hsum]
  exact Submodule.add_mem_sup hsmem hkmem

/-- ★★★ `End ℚ ImO = self ⊕ skew` as an internal direct sum: `Sym²7 ⊕ Λ²7`. -/
theorem selfSkew_isCompl :
    IsCompl (bornBil).selfAdjointSubmodule (bornBil).skewAdjointSubmodule :=
  ⟨disjoint_iff.2 selfSkew_disjoint, codisjoint_iff.2 selfSkew_codisjoint⟩

/-! ## (4) THE DIMENSIONS `49 = 28 + 21`. -/

/-- `finrank (End ℚ ImO) = 49 = 7·7` (banked `finrank_ImO = 7`, N22). -/
theorem finrank_end_eq_49 : Module.finrank ℚ (Module.End ℚ ImO) = 49 := by
  show Module.finrank ℚ (ImO →ₗ[ℚ] ImO) = 49
  rw [Module.finrank_linearMap, finrank_ImO]

/-- ★★ The SYMMETRIC side is 28-dimensional: `49 − 21`. `28 = 1 + 27`. -/
theorem finrank_selfAdj_eq_28 :
    Module.finrank ℚ (bornBil).selfAdjointSubmodule = 28 := by
  have h := Submodule.finrank_add_eq_of_isCompl selfSkew_isCompl
  rw [finrank_end_eq_49, finrank_so7_eq_21] at h
  omega

/-! ## (5) BOTH SUMMANDS ARE g₂-SUBMODULES under `X ↦ ⁅imRep D, X⁆`. -/

/-- The adjoint g₂-action on `7 ⊗ 7 = End ℚ ImO`: `X ↦ ⁅imRep D, X⁆`. -/
def adEnd (D : derivationLieQ) : Module.End ℚ (Module.End ℚ ImO) where
  toFun X := ⁅imRep D, X⁆
  map_add' X Y := by simp [lie_add]
  map_smul' c X := by simp [lie_smul]

@[simp] theorem adEnd_apply (D : derivationLieQ) (X : Module.End ℚ ImO) :
    adEnd D X = ⁅imRep D, X⁆ := rfl

/-- The SKEW-adjoint side (= `so(7)`) is g₂-stable: the bracket of two skew-adjoint operators is
    skew-adjoint (Mathlib `isSkewAdjoint_bracket`), and `imRep D ∈ so(7)` (banked `imRep_mem_so7`). -/
theorem skewAdj_adEnd_inv (D : derivationLieQ) (X : Module.End ℚ ImO)
    (hX : X ∈ (bornBil).skewAdjointSubmodule) :
    adEnd D X ∈ (bornBil).skewAdjointSubmodule :=
  LinearMap.BilinForm.isSkewAdjoint_bracket _ (imRep_mem_so7 D) hX

/-- ★ The SYMMETRIC side (= `Sym²7 = 28`) is g₂-stable: since `bAdj` is anti-multiplicative and
    `imRep D` is skew (`bAdj (imRep D) = −imRep D`), the commutator `⁅imRep D, X⁆` preserves
    self-adjointness. -/
theorem selfAdj_adEnd_inv (D : derivationLieQ) (X : Module.End ℚ ImO)
    (hX : X ∈ (bornBil).selfAdjointSubmodule) :
    adEnd D X ∈ (bornBil).selfAdjointSubmodule := by
  rw [mem_self_iff] at hX ⊢
  have hA : bAdj (imRep D) = - imRep D := (mem_skew_iff _).1 (imRep_mem_so7 D)
  show bAdj ⁅imRep D, X⁆ = ⁅imRep D, X⁆
  have hbr : (⁅imRep D, X⁆ : Module.End ℚ ImO) = imRep D * X - X * imRep D := Ring.lie_def _ _
  rw [hbr, bAdj_sub, bAdj_mul, bAdj_mul, hA, hX]
  have e1 : X * (-imRep D) = -(X * imRep D) := mul_neg X (imRep D)
  have e2 : (-imRep D) * X = -(imRep D * X) := neg_mul (imRep D) X
  rw [e1, e2]; abel

/-! ## (6) W8 NON-VACUITY: the trivial rep `1` lives in the symmetric side and is g₂-invariant. -/

/-- The identity is self-adjoint (the symmetric side is nonzero — the trivial rep `1 = ℚ·id`). -/
theorem one_mem_selfAdj : (1 : Module.End ℚ ImO) ∈ (bornBil).selfAdjointSubmodule := by
  rw [mem_self_iff]; exact bAdj_one

/-- The identity is g₂-invariant: `⁅imRep D, 1⁆ = 0` — the trivial rep `1` of `7⊗7 = 1⊕7⊕14⊕27`. -/
theorem one_adEnd_zero (D : derivationLieQ) : adEnd D (1 : Module.End ℚ ImO) = 0 := by
  show ⁅imRep D, (1 : Module.End ℚ ImO)⁆ = 0
  have hbr : (⁅imRep D, (1 : Module.End ℚ ImO)⁆ : Module.End ℚ ImO)
      = imRep D * 1 - 1 * imRep D := Ring.lie_def _ _
  rw [hbr]; simp

/-! ## CAPSTONE. -/

/-- ★★★ THE SYMMETRIC / ANTISYMMETRIC SPLIT OF `7 ⊗ 7` on the banked tower:
    `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21 = so(7))`, `49 = 28 + 21`, both g₂-submodules. -/
theorem sym_antisym_decomposition_structure :
    IsCompl (bornBil).selfAdjointSubmodule (bornBil).skewAdjointSubmodule ∧
    Module.finrank ℚ (Module.End ℚ ImO) = 49 ∧
    Module.finrank ℚ (bornBil).selfAdjointSubmodule = 28 ∧
    Module.finrank ℚ (bornBil).skewAdjointSubmodule = 21 ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ (bornBil).selfAdjointSubmodule → adEnd D X ∈ (bornBil).selfAdjointSubmodule) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ (bornBil).skewAdjointSubmodule → adEnd D X ∈ (bornBil).skewAdjointSubmodule) :=
  ⟨selfSkew_isCompl, finrank_end_eq_49, finrank_selfAdj_eq_28, finrank_so7_eq_21,
   selfAdj_adEnd_inv, skewAdj_adEnd_inv⟩

end

end Phys.Algebra
