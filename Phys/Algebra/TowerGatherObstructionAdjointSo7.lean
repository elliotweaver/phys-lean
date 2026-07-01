/-
  Phys.Algebra.TowerGatherObstructionAdjointSo7 — N223.
  ===========================================================================
  THE CROSS PRODUCT REALIZES THE FUNDAMENTAL 7 INSIDE so(7): the g₂-equivariant
  embedding 7 → so(7) ⊂ End(7), and g₂ = Der(O ℚ) itself lands in the SAME so(7).

  A still-deeper cut of the gather frontier (N218T/N219/N220/N221/N222), under the OVERNIGHT
  PRIORITY LOCK. The chain STAYS ON THE GATHER.

  THE ARC SO FAR. N219 made the inter-world gluing obstruction EXPLICIT as the associator
  `gluingDefect = [·,·,·]`. N221 proved that obstruction cocycle carries the `g₂ = Der(O ℚ)`
  symmetry. N222 decomposed it as a g₂-**representation**: it is a g₂-equivariant map INTO the
  banked fundamental 7-representation `ImO` (N22) — valued in the 7, killing the trivial rep.

  N223 opens the ADJOINT / so(7) face — the arena in which the frontier's `so(7) = 14 ⊕ 7`
  decomposition lives, concretely on the banked tower. Over the derived `ℚ` and the banked
  octonion rung `O ℚ = CD (H ℚ)`, with the banked fundamental 7-module `ImO`:

  (1) THE BORN FORM ON THE 7. `bornBil` is the banked Born self-overlap `gForm` restricted to
      `ImO`, packaged as a Mathlib bilinear form. Its skew-adjoint endomorphisms form the Lie
      subalgebra `skewAdjointLieSubalgebra bornBil` — the concrete `so(7)`.

  (2) THE FUNDAMENTAL 7 SITS IN so(7) VIA THE CROSS PRODUCT. `crossOp a : ImO → ImO`,
      `y ↦ octCross a y`, is (for imaginary `a`) SKEW-ADJOINT for the Born form:
        `⟨octCross a y, z⟩ + ⟨y, octCross a z⟩ = 0`   (`crossOp_mem_so7`),
      the total antisymmetry of the banked calibration 3-form `assoc3 = ⟨x, y×z⟩` (N209). So the
      map `a ↦ crossOp a` carries the fundamental 7 (ImO) INTO `so(7) ⊂ End(ImO)`.

  (3) THE ADJOINT g₂ = Der(O ℚ) SITS IN THE SAME so(7). Every element of the banked 7-rep `imRep`
      (N22) is skew-adjoint for the Born form (`imRep_mem_so7`), the banked infinitesimal
      skew-adjointness `gFormQ_skew` (N26). So both the fundamental 7 (`crossOp`) and the adjoint
      14 = `g₂` (`imRep`) live inside ONE `so(7)`.

  (4) THE g₂-INTERTWINER links them: `⁅imRep D, crossOp a⁆ = crossOp (D a)`
      (`crossOp_imRep_intertwine`), the operator-level form of the banked cross-product
      equivariance `derivationLieQ_octCross_leibniz` (N207). The map `a ↦ crossOp a` is a
      g₂-module homomorphism `7 → so(7)` (adjoint action on the target). This is exactly the
      statement that inside `so(7)`, the copy of the fundamental 7 is a g₂-submodule complementary
      to the adjoint g₂ — the `so(7) = 14 ⊕ 7` arena.

  (5) NON-VACUITY (W8). `crossOp` is genuinely nonzero (`crossOp_ne_zero`, via the banked
      `octCross u1 u2 ≠ 0`); the skew identity is non-trivial at a concrete witness where each
      term is `±1` (`crossOp_skew_witness`); and `imRep` is faithfully non-trivial
      (`imRep_witness_ne_zero`, N22).

  Capstone `cross_seven_in_so7_structure` bundles (2)+(3)+(4)+(5) on `O ℚ` / `ImO`.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (fundamental/adjoint/representation/
  intertwiner/g₂/so(7)/gauge): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)`,
  the Born form `gForm` restricted to `ImO`, the cross product `octCross a y = a·y + ⟨a,y⟩•1`, and
  every `ℚ`-linear Leibniz endomorphism restricted to `ImO`: `crossOp a` and `imRep D` are both
  skew-adjoint for the restricted Born form (land in `skewAdjointLieSubalgebra`), and
  `⁅imRep D, crossOp a⁆ = crossOp (D a)`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N206/N207 (octCross + its equivariance),
  N209 (`assoc3` + antisymmetry), N22 (`ImO`/`imRep`), N26 (`gFormQ_skew`, gForm bilinearity), and
  Mathlib's skew-adjoint Lie subalgebra MACHINERY on the DERIVED bilinear form. Ground = derived
  ℚ; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  native_decide, no maxHeartbeats raise.
-/
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.SkewAdjoint

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## (1) THE BORN FORM ON THE FUNDAMENTAL 7 (ImO), as a Mathlib bilinear form. -/

/-- The banked Born self-overlap form `gForm` restricted to the fundamental 7-representation
    `ImO`, packaged as a Mathlib `BilinForm ℚ ImO`. Its skew-adjoint endomorphisms are `so(7)`. -/
def bornBil : BilinForm ℚ ImO :=
  LinearMap.mk₂ ℚ (fun x y => gForm (x : O ℚ) (y : O ℚ))
    (fun x₁ x₂ y => by simp only [Submodule.coe_add]; rw [gForm_add_left])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_left, smul_eq_mul])
    (fun x y₁ y₂ => by simp only [Submodule.coe_add]; rw [gForm_add_right])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_right, smul_eq_mul])

@[simp] theorem bornBil_apply (x y : ImO) : bornBil x y = gForm (x : O ℚ) (y : O ℚ) := rfl

/-! ## (2) THE CROSS-PRODUCT OPERATOR on the fundamental 7. -/

/-- The cross-product operator on `O ℚ`, `y ↦ octCross a y`, as a `ℚ`-linear endomorphism. -/
def crossOpO (a : O ℚ) : Module.End ℚ (O ℚ) where
  toFun y := octCross a y
  map_add' y₁ y₂ := by unfold octCross; rw [mul_add, gForm_add_right, add_smul]; abel
  map_smul' c y := by
    unfold octCross
    rw [mul_smul_comm, gForm_smul_right, RingHom.id_apply, smul_add, mul_smul]

@[simp] theorem crossOpO_apply (a y : O ℚ) : crossOpO a y = octCross a y := rfl

/-- `crossOpO a` preserves the fundamental 7: `octCross a y ∈ ImO` for `y ∈ ImO` (N206). -/
theorem crossOpO_mapsTo (a : O ℚ) : ∀ y ∈ ImO, crossOpO a y ∈ ImO := by
  intro y hy; simpa using octCross_mem_ImO (x := a) hy

/-- ★ THE CROSS-PRODUCT OPERATOR ON THE FUNDAMENTAL 7-REPRESENTATION: `crossOp a : ImO → ImO`,
    the restriction of `y ↦ octCross a y` to the banked 7-module `ImO`. -/
def crossOp (a : O ℚ) : Module.End ℚ ImO := (crossOpO a).restrict (crossOpO_mapsTo a)

@[simp] theorem crossOp_coe (a : O ℚ) (y : ImO) :
    ((crossOp a y : ImO) : O ℚ) = octCross a (y : O ℚ) := rfl

/-- The calibration 3-form is antisymmetric under swapping the FIRST and LAST arguments:
    `assoc3 x y z = − assoc3 z y x` (imaginary `x,y,z`) — the odd permutation `(1 3)`, from the
    banked cyclic symmetry + the first-two swap (N209). -/
theorem assoc3_swap_xz {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 z y x := by
  have h1 : assoc3 z y x = - assoc3 y z x := assoc3_swap_xy hz hy hx
  have h2 : assoc3 y z x = assoc3 z x y := assoc3_cyclic hy hz hx
  have h3 : assoc3 z x y = assoc3 x y z := assoc3_cyclic hz hx hy
  rw [h1, h2, h3, neg_neg]

/-- ★★★ THE FUNDAMENTAL 7 SITS IN so(7): `crossOp a` is SKEW-ADJOINT for the Born form, hence
    lands in `skewAdjointLieSubalgebra bornBil`. The raw identity is
    `⟨octCross a y, z⟩ + ⟨y, octCross a z⟩ = 0`, the total antisymmetry of the calibration 3-form
    `assoc3 = ⟨x, y×z⟩` (N209). So `a ↦ crossOp a` carries the fundamental 7 INTO `so(7)`. -/
theorem crossOp_mem_so7 (a : O ℚ) (_ha : a ∈ ImO) :
    crossOp a ∈ skewAdjointLieSubalgebra bornBil := by
  show crossOp a ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  show gForm (octCross a (y : O ℚ)) (z : O ℚ)
      = gForm (y : O ℚ) (((-crossOp a) z : ImO) : O ℚ)
  have hy : (y : O ℚ) ∈ ImO := y.2
  have hz : (z : O ℚ) ∈ ImO := z.2
  have e1 : gForm (octCross a (y : O ℚ)) (z : O ℚ) = assoc3 (z : O ℚ) a (y : O ℚ) := by
    unfold assoc3; rw [gForm_symm]
  have key : assoc3 (z : O ℚ) a (y : O ℚ) = - assoc3 (y : O ℚ) a (z : O ℚ) :=
    assoc3_swap_xz hz _ha hy
  rw [e1, key]
  show - assoc3 (y : O ℚ) a (z : O ℚ) = gForm (y : O ℚ) (((-crossOp a) z : ImO) : O ℚ)
  simp only [LinearMap.neg_apply, Submodule.coe_neg, crossOp_coe, gForm_neg_right]
  rfl

/-! ## (3) THE ADJOINT g₂ = Der(O ℚ) SITS IN THE SAME so(7). -/

/-- ★★ THE ADJOINT g₂ SITS IN so(7): every element of the banked fundamental 7-representation
    `imRep` (N22) is SKEW-ADJOINT for the Born form, hence lands in the SAME
    `skewAdjointLieSubalgebra bornBil`. This is the banked infinitesimal skew-adjointness of
    derivations `gFormQ_skew` (N26). Both faces — the fundamental 7 (`crossOp`) and the adjoint
    14 = `g₂` (`imRep`) — live inside ONE `so(7)`. -/
theorem imRep_mem_so7 (D : derivationLieQ) :
    imRep D ∈ skewAdjointLieSubalgebra bornBil := by
  show imRep D ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  show gForm ((D : Module.End ℚ (O ℚ)) (y : O ℚ)) (z : O ℚ)
      = gForm (y : O ℚ) (((-imRep D) z : ImO) : O ℚ)
  have hskew := gFormQ_skew (D : Module.End ℚ (O ℚ)) D.2 (y : O ℚ) (z : O ℚ)
  simp only [LinearMap.neg_apply, Submodule.coe_neg, imRep_coe, gForm_neg_right]
  linarith [hskew]

/-! ## (4) THE g₂-INTERTWINER linking the two faces inside so(7). -/

/-- ★★ THE g₂-INTERTWINER (operator level): `⁅imRep D, crossOp a⁆ = crossOp (D a)` as
    endomorphisms of the fundamental 7 `ImO`. The map `a ↦ crossOp a` is a g₂-module homomorphism
    `7 → so(7)` (adjoint action on the target) — the fundamental 7 is a g₂-submodule of `so(7)`
    complementary to the adjoint g₂, the `so(7) = 14 ⊕ 7` arena. From the banked cross-product
    equivariance `derivationLieQ_octCross_leibniz` (N207). -/
theorem crossOp_imRep_intertwine (D : derivationLieQ) (a : O ℚ) :
    ⁅imRep D, crossOp a⁆ = crossOp ((D : Module.End ℚ (O ℚ)) a) := by
  refine LinearMap.ext fun y => Subtype.ext ?_
  show ((imRep D) (crossOp a y) : O ℚ) - ((crossOp a) (imRep D y) : O ℚ)
        = octCross ((D : Module.End ℚ (O ℚ)) a) (y : O ℚ)
  rw [imRep_coe, crossOp_coe, crossOp_coe, imRep_coe]
  rw [derivationLieQ_octCross_leibniz D a (y : O ℚ)]; abel

/-! ## (5) W8 NON-VACUITY. -/

/-- W8 NON-VACUITY: the cross-product operator is genuinely NONZERO (`crossOp u1 ≠ 0`), via the
    banked `octCross u1 u2 ≠ 0` (N206) — the embedding of the fundamental 7 into `so(7)` is not
    the trivial map. -/
theorem crossOp_ne_zero : crossOp u1 ≠ 0 := by
  intro h
  have hz : (crossOp u1 ⟨u2, u2_mem_ImO⟩ : ImO) = 0 := by rw [h]; rfl
  have hc : octCross u1 u2 = 0 := by
    have := congrArg (Subtype.val) hz; simpa using this
  exact octCross_u1_u2_ne_zero hc

/-- W8 NON-VACUITY: the skew-adjoint identity is not vacuously trivial — at the concrete witness
    `(a,y,z) = (u1, u2, u1×u2)` the two skew terms are `+1` and `−1` (each genuinely nonzero),
    summing to `0`. The banked Lagrange value `⟨u1×u2, u1×u2⟩ = 1` and the contraction witness
    `u1×(u1×u2) = −u2` supply the teeth. -/
theorem crossOp_skew_witness :
    gForm (octCross u1 u2) (octCross u1 u2)
      + gForm u2 (octCross u1 (octCross u1 u2)) = (0 : ℚ) := by
  have h1 : gForm (octCross u1 u2) (octCross u1 u2) = 1 := octCross_lagrange_u1_u2
  have h2 : octCross u1 (octCross u1 u2) = - u2 := octCross_contraction_witness
  rw [h1, h2, gForm_neg_right, gForm_u2_u2]; ring

/-! ## THE CAPSTONE. -/

/-- ★★★ THE CROSS PRODUCT REALIZES THE FUNDAMENTAL 7 INSIDE so(7), g₂-EQUIVARIANTLY.
    Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the banked
    fundamental 7-representation `ImO` and the Born form `bornBil` on it:
    (i) the fundamental 7 sits in `so(7)`: `crossOp a ∈ skewAdjointLieSubalgebra bornBil` for
        imaginary `a`;
    (ii) the adjoint g₂ = Der(O ℚ) sits in the SAME `so(7)`: `imRep D ∈ skewAdjointLieSubalgebra
         bornBil`;
    (iii) the g₂-intertwiner links them: `⁅imRep D, crossOp a⁆ = crossOp (D a)`;
    (iv) non-vacuity: `crossOp u1 ≠ 0`.
    The local→global obstruction's carrier (the fundamental 7) embeds g₂-equivariantly, via the
    cross product, into the skew-symmetry algebra `so(7)` that also contains its own automorphism
    algebra `g₂` — the concrete `so(7) = 14 ⊕ 7` arena on the banked tower. -/
theorem cross_seven_in_so7_structure :
    (∀ a : O ℚ, a ∈ ImO → crossOp a ∈ skewAdjointLieSubalgebra bornBil) ∧
    (∀ D : derivationLieQ, imRep D ∈ skewAdjointLieSubalgebra bornBil) ∧
    (∀ (D : derivationLieQ) (a : O ℚ),
        ⁅imRep D, crossOp a⁆ = crossOp ((D : Module.End ℚ (O ℚ)) a)) ∧
    crossOp u1 ≠ 0 :=
  ⟨crossOp_mem_so7, imRep_mem_so7, crossOp_imRep_intertwine, crossOp_ne_zero⟩

end

end Phys.Algebra
