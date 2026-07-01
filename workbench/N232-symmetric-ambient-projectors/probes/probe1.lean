/-
  N232 PROBE — the SYMMETRIC-SIDE ambient projectors projTrivial / proj27.
  Standalone probe: full production candidate, measured before promotion (SOUL / W9).
-/
import Phys.Algebra.TowerGatherAmbientProjection7And14

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) THE AMBIENT TRIVIAL-LINE PROJECTOR `projTrivial`.

    Factored through the banked `projSym` (N230): `projTrivial X = (trace (projSym X) / 7) • 1`.
    This dissolves the classical "skew ⟹ traceless" fact — kills-so(7) is free from
    `projSym_apply_skew`. -/

/-- ★ THE AMBIENT PROJECTOR onto the trivial line `ℚ·1`, along `tracelessSym ⊕ so(7)`:
    `X ↦ (trace (projSym X) / 7) • 1`. Factored through the banked symmetric retraction `projSym`. -/
noncomputable def projTrivial : Module.End ℚ (Module.End ℚ ImO) :=
  LinearMap.smulRight ((7⁻¹ : ℚ) • (LinearMap.trace ℚ ImO ∘ₗ projSym)) (1 : Module.End ℚ ImO)

theorem projTrivial_apply (X : Module.End ℚ ImO) :
    projTrivial X = ((7⁻¹ : ℚ) * LinearMap.trace ℚ ImO (projSym X)) • (1 : Module.End ℚ ImO) := by
  rw [projTrivial, LinearMap.smulRight_apply]
  simp [LinearMap.smul_apply, LinearMap.comp_apply, smul_eq_mul]

/-- Every image of `projTrivial` lies in the trivial line `ℚ·1`. -/
theorem projTrivial_apply_mem (X : Module.End ℚ ImO) : projTrivial X ∈ trivialLine := by
  rw [projTrivial_apply]
  exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)

/-- `projTrivial` fixes the identity: `projTrivial 1 = 1` (via `projSym 1 = 1`, `trace 1 = 7`). -/
theorem projTrivial_one : projTrivial (1 : Module.End ℚ ImO) = 1 := by
  rw [projTrivial_apply, projSym_apply_self one_mem_selfAdj, trace_one_eq_seven]
  norm_num

/-- `projTrivial` fixes elements of the trivial line `ℚ·1`. -/
theorem projTrivial_apply_triv {X : Module.End ℚ ImO} (hX : X ∈ trivialLine) :
    projTrivial X = X := by
  rw [trivialLine, Submodule.mem_span_singleton] at hX
  obtain ⟨c, hc⟩ := hX
  rw [← hc, map_smul, projTrivial_one]

/-- `projTrivial` kills the traceless-symmetric side `tracelessSym`. -/
theorem projTrivial_apply_tracefree {X : Module.End ℚ ImO} (hX : X ∈ tracelessSym) :
    projTrivial X = 0 := by
  obtain ⟨hself, hker⟩ := hX
  rw [projTrivial_apply, projSym_apply_self hself, LinearMap.mem_ker.1 hker]
  simp

/-- `projTrivial` kills so(7) (the whole skew side): `projSym` already sends it to `0`. -/
theorem projTrivial_apply_skew {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).skewAdjointSubmodule) : projTrivial X = 0 := by
  rw [projTrivial_apply, projSym_apply_skew hX, map_zero]
  simp

/-- `projTrivial` is idempotent. -/
theorem projTrivial_idem : IsIdempotentElem projTrivial := by
  rw [IsIdempotentElem]
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply]
  exact projTrivial_apply_triv (projTrivial_apply_mem X)

/-- Pointwise idempotence. -/
theorem projTrivial_projTrivial (X : Module.End ℚ ImO) :
    projTrivial (projTrivial X) = projTrivial X :=
  projTrivial_apply_triv (projTrivial_apply_mem X)

/-- The range of `projTrivial` is exactly the trivial line `trivialLine`. -/
theorem projTrivial_range : LinearMap.range projTrivial = trivialLine := by
  apply le_antisymm
  · rintro _ ⟨X, rfl⟩; exact projTrivial_apply_mem X
  · rintro X hX; exact ⟨X, projTrivial_apply_triv hX⟩

/-- ★ `projTrivial` lands ONTO the FULL 1-dimensional trivial line (banked `finrank_trivialLine`). -/
theorem finrank_projTrivial_range : Module.finrank ℚ (LinearMap.range projTrivial) = 1 := by
  rw [projTrivial_range]; exact finrank_trivialLine

/-! ## (2) THE AMBIENT TRACELESS-SYMMETRIC PROJECTOR `proj27 := projSym − projTrivial`. -/

/-- ★ THE AMBIENT PROJECTOR onto the traceless-symmetric 27 `tracelessSym`: the complementary
    symmetric part of `projSym`. -/
noncomputable def proj27 : Module.End ℚ (Module.End ℚ ImO) := projSym - projTrivial

theorem proj27_apply (X : Module.End ℚ ImO) : proj27 X = projSym X - projTrivial X :=
  LinearMap.sub_apply _ _ _

/-- Every image of `proj27` lies in the traceless-symmetric side `tracelessSym`. -/
theorem proj27_apply_mem (X : Module.End ℚ ImO) : proj27 X ∈ tracelessSym := by
  have hself : proj27 X ∈ (bornBil).selfAdjointSubmodule := by
    -- projSym X is self-adjoint, projTrivial X = c•1 is self-adjoint
    rw [proj27_apply]
    refine Submodule.sub_mem _ (projSym_apply_mem X) ?_
    rw [projTrivial_apply]
    exact Submodule.smul_mem _ _ one_mem_selfAdj
  have htrace : LinearMap.trace ℚ ImO (proj27 X) = 0 := by
    -- trace (projSym X − (trace(projSym X)/7)•1) = trace(projSym X) − trace(projSym X) = 0
    rw [proj27_apply, map_sub, projTrivial_apply, map_smul, trace_one_eq_seven, smul_eq_mul]
    ring
  exact ⟨hself, LinearMap.mem_ker.2 htrace⟩

/-- `proj27` fixes elements of the traceless-symmetric side `tracelessSym`. -/
theorem proj27_apply_tracefree {X : Module.End ℚ ImO} (hX : X ∈ tracelessSym) :
    proj27 X = X := by
  have hself : X ∈ (bornBil).selfAdjointSubmodule := hX.1
  rw [proj27_apply, projSym_apply_self hself, projTrivial_apply_tracefree hX, sub_zero]

/-- `proj27` kills the trivial line `ℚ·1`. -/
theorem proj27_apply_triv {X : Module.End ℚ ImO} (hX : X ∈ trivialLine) :
    proj27 X = 0 := by
  have hself : X ∈ (bornBil).selfAdjointSubmodule := trivialLine_le_selfAdj hX
  rw [proj27_apply, projSym_apply_self hself, projTrivial_apply_triv hX, sub_self]

/-- `proj27` kills so(7) (the whole skew side). -/
theorem proj27_apply_skew {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).skewAdjointSubmodule) : proj27 X = 0 := by
  rw [proj27_apply, projSym_apply_skew hX, projTrivial_apply_skew hX, sub_zero]

/-- `proj27` is idempotent. -/
theorem proj27_idem : IsIdempotentElem proj27 := by
  rw [IsIdempotentElem]
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply]
  exact proj27_apply_tracefree (proj27_apply_mem X)

/-- Pointwise idempotence. -/
theorem proj27_proj27 (X : Module.End ℚ ImO) : proj27 (proj27 X) = proj27 X :=
  proj27_apply_tracefree (proj27_apply_mem X)

/-- The range of `proj27` is exactly the traceless-symmetric 27 `tracelessSym`. -/
theorem proj27_range : LinearMap.range proj27 = tracelessSym := by
  apply le_antisymm
  · rintro _ ⟨X, rfl⟩; exact proj27_apply_mem X
  · rintro X hX; exact ⟨X, proj27_apply_tracefree hX⟩

/-- ★ `proj27` lands ONTO the FULL 27-dimensional traceless-symmetric side
    (banked `finrank_tracelessSym_eq_27`, N228). -/
theorem finrank_proj27_range : Module.finrank ℚ (LinearMap.range proj27) = 27 := by
  rw [proj27_range]; exact finrank_tracelessSym_eq_27

/-! ## (3) `projTrivial + proj27 = projSym` — refines the symmetric retraction. -/

/-- The two symmetric-side projectors sum to N230's `projSym`. -/
theorem projTrivial_add_proj27 (X : Module.End ℚ ImO) :
    projTrivial X + proj27 X = projSym X := by
  rw [proj27_apply]; abel

/-! ## (4) ORTHOGONALITY among the four projectors. -/

/-- `projTrivial ∘ proj27 = 0` (images of `proj27` are traceless-symmetric, which `projTrivial`
    kills). -/
theorem projTrivial_proj27 (X : Module.End ℚ ImO) : projTrivial (proj27 X) = 0 :=
  projTrivial_apply_tracefree (proj27_apply_mem X)

/-- `proj27 ∘ projTrivial = 0` (images of `projTrivial` lie in the trivial line, which `proj27`
    kills). -/
theorem proj27_projTrivial (X : Module.End ℚ ImO) : proj27 (projTrivial X) = 0 :=
  proj27_apply_triv (projTrivial_apply_mem X)

/-- `proj7 ∘ projTrivial = 0` (images of `projTrivial` are symmetric, which `proj7` kills). -/
theorem proj7_projTrivial (X : Module.End ℚ ImO) : proj7 (projTrivial X) = 0 :=
  proj7_apply_self (trivialLine_le_selfAdj (projTrivial_apply_mem X))

/-- `projTrivial ∘ proj7 = 0` (images of `proj7` lie in `range crossEmb ⊆ so(7)`, which `projTrivial`
    kills). -/
theorem projTrivial_proj7 (X : Module.End ℚ ImO) : projTrivial (proj7 X) = 0 :=
  projTrivial_apply_skew (crossEmb_range_le_so7' (proj7_apply_mem X))

/-- `proj14 ∘ projTrivial = 0`. -/
theorem proj14_projTrivial (X : Module.End ℚ ImO) : proj14 (projTrivial X) = 0 :=
  proj14_apply_self (trivialLine_le_selfAdj (projTrivial_apply_mem X))

/-- `projTrivial ∘ proj14 = 0` (images of `proj14` lie in `range imRepL ⊆ so(7)`). -/
theorem projTrivial_proj14 (X : Module.End ℚ ImO) : projTrivial (proj14 X) = 0 :=
  projTrivial_apply_skew (imRep_range_le_so7 (proj14_apply_mem X))

/-- `proj7 ∘ proj27 = 0` (images of `proj27` are symmetric, which `proj7` kills). -/
theorem proj7_proj27 (X : Module.End ℚ ImO) : proj7 (proj27 X) = 0 :=
  proj7_apply_self (tracelessSym_le_selfAdj (proj27_apply_mem X))

/-- `proj27 ∘ proj7 = 0` (images of `proj7` lie in `range crossEmb ⊆ so(7)`, which `proj27` kills). -/
theorem proj27_proj7 (X : Module.End ℚ ImO) : proj27 (proj7 X) = 0 :=
  proj27_apply_skew (crossEmb_range_le_so7' (proj7_apply_mem X))

/-- `proj14 ∘ proj27 = 0`. -/
theorem proj14_proj27 (X : Module.End ℚ ImO) : proj14 (proj27 X) = 0 :=
  proj14_apply_self (tracelessSym_le_selfAdj (proj27_apply_mem X))

/-- `proj27 ∘ proj14 = 0` (images of `proj14` lie in `range imRepL ⊆ so(7)`). -/
theorem proj27_proj14 (X : Module.End ℚ ImO) : proj27 (proj14 X) = 0 :=
  proj27_apply_skew (imRep_range_le_so7 (proj14_apply_mem X))

/-! ## (5) ★★ THE FOUR-WAY RESOLUTION OF IDENTITY. -/

/-- ★★ FOUR-WAY RESOLUTION `projTrivial X + proj27 X + proj7 X + proj14 X = X` — the identity on
    `7 ⊗ 7` splits as `1 ⊕ 27 ⊕ 7 ⊕ 14 = 49` via four commuting, mutually-orthogonal idempotents.
    Combines `projTrivial + proj27 = projSym` with N231's `projSym + proj7 + proj14 = id`. -/
theorem projTrivial_add_proj27_add_proj7_add_proj14 (X : Module.End ℚ ImO) :
    projTrivial X + proj27 X + proj7 X + proj14 X = X := by
  rw [projTrivial_add_proj27]; exact projSym_add_proj7_add_proj14 X

/-! ## (6) ★★★ g₂-EQUIVARIANCE of both new ambient projectors. -/

/-- ★★★ g₂-EQUIVARIANCE of the trivial-line projector: `projTrivial (adEnd D X) = adEnd D (projTrivial X)`.
    BOTH sides vanish: the LHS trace is a commutator trace (`trace_lie`, via `projSym_equivariant`),
    the RHS is `adEnd D` of a scalar multiple of `1` (`one_adEnd_zero`). -/
theorem projTrivial_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    projTrivial (adEnd D X) = adEnd D (projTrivial X) := by
  -- RHS = 0: projTrivial X = c • 1, adEnd D kills 1.
  have hrhs : adEnd D (projTrivial X) = 0 := by
    rw [projTrivial_apply, map_smul, one_adEnd_zero, smul_zero]
  -- LHS = 0: trace (projSym (adEnd D X)) = trace (adEnd D (projSym X)) = trace ⁅imRep D, projSym X⁆ = 0.
  have hlhs : projTrivial (adEnd D X) = 0 := by
    have htr : LinearMap.trace ℚ ImO (projSym (adEnd D X)) = 0 := by
      rw [projSym_equivariant, adEnd_apply]; exact LinearMap.trace_lie _ _
    rw [projTrivial_apply, htr, mul_zero, zero_smul]
  rw [hlhs, hrhs]

/-- ★★★ g₂-EQUIVARIANCE of the traceless-symmetric projector: `proj27 (adEnd D X) = adEnd D (proj27 X)`.
    Since `proj27 = projSym − projTrivial` and both are equivariant. -/
theorem proj27_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    proj27 (adEnd D X) = adEnd D (proj27 X) := by
  rw [proj27_apply, projSym_equivariant, projTrivial_equivariant, proj27_apply, map_sub]

/-! ## CAPSTONE. -/

/-- ★★★ THE AMBIENT g₂-EQUIVARIANT TRIVIAL-LINE (1) AND TRACELESS-SYMMETRIC (27) PROJECTORS +
    THE FULL FOUR-WAY RESOLUTION OF IDENTITY on the banked tower. Both `projTrivial` (range the
    FULL 1-dim `trivialLine`) and `proj27` (range the FULL 27-dim `tracelessSym`) are idempotent,
    mutually orthogonal, sum to N230's `projSym`, each commutes with the adjoint g₂-action `adEnd D`,
    and together with N231's `proj7`/`proj14` resolve the identity:
    `projTrivial + proj27 + proj7 + proj14 = id` — the internal g₂-equivariant direct sum
    `7 ⊗ 7 = 1 ⊕ 27 ⊕ 7 ⊕ 14`. -/
theorem ambient_four_way_projection_structure :
    IsIdempotentElem projTrivial ∧
    IsIdempotentElem proj27 ∧
    LinearMap.range projTrivial = trivialLine ∧
    LinearMap.range proj27 = tracelessSym ∧
    Module.finrank ℚ (LinearMap.range projTrivial) = 1 ∧
    Module.finrank ℚ (LinearMap.range proj27) = 27 ∧
    (∀ X : Module.End ℚ ImO, projTrivial X + proj27 X = projSym X) ∧
    (∀ X : Module.End ℚ ImO, proj27 (projTrivial X) = 0) ∧
    (∀ X : Module.End ℚ ImO, projTrivial (proj27 X) = 0) ∧
    (∀ X : Module.End ℚ ImO,
      projTrivial X + proj27 X + proj7 X + proj14 X = X) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      projTrivial (adEnd D X) = adEnd D (projTrivial X)) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      proj27 (adEnd D X) = adEnd D (proj27 X)) :=
  ⟨projTrivial_idem, proj27_idem, projTrivial_range, proj27_range,
   finrank_projTrivial_range, finrank_proj27_range, projTrivial_add_proj27,
   proj27_projTrivial, projTrivial_proj27, projTrivial_add_proj27_add_proj7_add_proj14,
   projTrivial_equivariant, proj27_equivariant⟩

end

end Phys.Algebra
