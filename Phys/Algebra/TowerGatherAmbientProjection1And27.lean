/-
  Phys.Algebra.TowerGatherAmbientProjection1And27 — N232.
  ===========================================================================
  THE AMBIENT g₂-EQUIVARIANT TRIVIAL-LINE (1) AND TRACELESS-SYMMETRIC (27) PROJECTORS, AND THE
  FULL FOUR-WAY RESOLUTION OF IDENTITY `7 ⊗ 7 = 1 ⊕ 27 ⊕ 7 ⊕ 14 = id`.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.

  THE ARC. N227 split `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21 = so(7))`. N228 split the symmetric side
  further into g₂-SUBMODULES `Sym²7 = 1 (trivialLine) ⊕ 27 (tracelessSym)`, but ONLY as submodules.
  N229/N230 built the AMBIENT retractions `projSo7`/`projSym` with `projSym + projSo7 = id`. N231
  split the SKEW side into ambient projectors `proj7`/`proj14` (`so(7) = 14 ⊕ 7`), banking the
  THREE-WAY resolution `projSym + proj7 + proj14 = id`.

  This node is the SYMMETRIC PARTNER of N231: it lifts N228's `trivialLine`/`tracelessSym` to genuine
  AMBIENT projectors on `End ℚ ImO`, splitting N230's `projSym`, and banks the FULL FOUR-WAY
  resolution binding all four projectors:

      projTrivial : End ℚ ImO → End ℚ ImO,   range = trivialLine   (1),   idempotent, g₂-equivariant;
      proj27      : End ℚ ImO → End ℚ ImO,   range = tracelessSym  (27),  idempotent, g₂-equivariant;
      projTrivial + proj27 = projSym    (refines the symmetric side),
      ★★ projTrivial X + proj27 X + proj7 X + proj14 X = X    (FOUR-WAY: 1 ⊕ 27 ⊕ 7 ⊕ 14 = 49),
      all pairwise compositions among {projTrivial, proj27, proj7, proj14} vanish (ORTHOGONALITY).

  THE TRUNK-NATIVE DESIGN (dissolving the classical hard fact). The naive trivial-line projector
  `X ↦ (trace X / 7) • 1` would need the classical fact "skew-adjoint w.r.t. a symmetric nondegenerate
  form ⟹ traceless" to kill so(7) — NOT banked, a genuine side-quest. Instead we FACTOR THROUGH the
  banked symmetric retraction `projSym` (N230):

      projTrivial X := (trace (projSym X) / 7) • 1     (= smulRight ((7⁻¹) • (trace ∘ projSym)) 1).

  Every hard step then falls out of banked facts: killing so(7) is `projSym_apply_skew` (`projSym`
  already sends the skew side to `0`); fixing `1` is `projSym_apply_self one_mem_selfAdj` +
  `trace_one_eq_seven` (`7/7 = 1`); traceless-of-image is `trace(projSym X) − trace(projSym X) = 0`;
  g₂-equivariance is BOTH sides `= 0` (LHS a commutator trace via `projSym_equivariant` + `trace_lie`,
  RHS `adEnd D` of a scalar multiple of `1` via `one_adEnd_zero`).

  THE OBJECTS (derived, not posited).
   * `projTrivial := smulRight ((7⁻¹ : ℚ) • (trace ℚ ImO ∘ₗ projSym)) 1` — the AMBIENT trivial-line
      (metric `ℚ·id`) projector, factored through N230's `projSym`.
   * `proj27 := projSym − projTrivial` — the AMBIENT traceless-symmetric projector (the complementary
      symmetric part).

  Structure:
   (1) `projTrivial` — idempotent (`projTrivial_idem`), `projTrivial_range = trivialLine`,
       `finrank = 1`; fixes `1` (`projTrivial_one`) and the trivial line (`projTrivial_apply_triv`),
       kills `tracelessSym` (`projTrivial_apply_tracefree`) and so(7) (`projTrivial_apply_skew`),
       image in `trivialLine` (`projTrivial_apply_mem`).
   (2) `proj27` — idempotent (`proj27_idem`), `proj27_range = tracelessSym`, `finrank = 27`; fixes
       `tracelessSym` (`proj27_apply_tracefree`), kills the trivial line (`proj27_apply_triv`) and
       so(7) (`proj27_apply_skew`), image in `tracelessSym` (`proj27_apply_mem`).
   (3) `projTrivial_add_proj27 : projTrivial X + proj27 X = projSym X` — refines N230's `projSym`.
   (4) ORTHOGONALITY among {projTrivial, proj27, proj7, proj14}: all cross compositions vanish.
   (5) ★★ FOUR-WAY RESOLUTION `projTrivial_add_proj27_add_proj7_add_proj14 :
       projTrivial X + proj27 X + proj7 X + proj14 X = X` (via (3) + N231 `projSym_add_proj7_add_proj14`).
   (6) ★★★ g₂-EQUIVARIANCE `projTrivial_equivariant` / `proj27_equivariant` — both commute with `adEnd D`.
   (7) capstone `ambient_four_way_projection_structure`.

  ONE CAUSE, THE COMPLETE FACE. The same Born POSITIVITY that made `so(7)` the skew half of `7 ⊗ 7`
  (N223–N227), the same octonionic non-associativity that split `so(7) = 14 ⊕ 7` (N28/N225), and the
  same metric trace (the derived `finrank ImO = 7`) that isolated `ℚ·id` inside the symmetric side
  (N228) now deliver an AMBIENT FOUR-WAY g₂-equivariant resolution of the identity on the whole
  `7 ⊗ 7`: `1 ⊕ 27 ⊕ 7 ⊕ 14`. N231 gave the three-way (leaving the symmetric side one lump `projSym`);
  this node splits that lump into the trivial line and the traceless-symmetric 27, completing the full
  internal g₂-equivariant direct-sum decomposition as four mutually-orthogonal ambient idempotents.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/trivial-rep/traceless/metric/
  fundamental/adjoint/projector/module/representation): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for
  `ImO = ker(star+1)`, the Born form `bornBil`, `imRep D = D|ImO`: the ambient idempotent
  `smulRight ((7⁻¹)•(trace ∘ projSym)) 1` has range `trivialLine` (finrank 1); the difference
  `projSym − projTrivial` is idempotent with range `tracelessSym` (finrank 27); the two are orthogonal,
  sum to `projSym`, each commutes with `X ↦ ⁅imRep D, X⁆`, and together with `proj7`/`proj14` (N231)
  sum to the identity. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only the banked N231 `TowerGatherAmbientProjection7And14` (transitively the whole
  tower: `proj7`/`proj14`/`proj7_apply_self`/`proj7_apply_mem`/`proj7_apply_adj`/`proj14_apply_self`/
  `proj14_apply_mem`/`proj14_apply_fun`/`projSym_add_proj7_add_proj14`/`projSym`/`projSym_apply_self`/
  `projSym_apply_skew`/`projSym_apply_mem`/`projSym_equivariant`/`crossEmb_range_le_so7'`/
  `imRep_range_le_so7`/`trivialLine`/`tracelessSym`/`trace_one_eq_seven`/`finrank_trivialLine`/
  `finrank_tracelessSym_eq_27`/`trivialLine_le_selfAdj`/`tracelessSym_le_selfAdj`/`one_mem_selfAdj`/
  `one_adEnd_zero`/`adEnd`/`bornBil`/`ImO`/`imRep`/`derivationLieQ`, N228/N227/…) + Mathlib
  `LinearMap.smulRight`/`trace`/`trace_lie`/`comp` MACHINERY on the DERIVED objects. Ground = derived ℚ;
  NO Mathlib ℝ/ℂ as content; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation (only the synthInstance ceiling for the ℚ-End instance
  diamond inherited from N227–N231, not a proof-search raise).
-/
import Phys.Algebra.TowerGatherAmbientProjection7And14

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227–N231); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) THE AMBIENT TRIVIAL-LINE PROJECTOR `projTrivial`.

    Factored through the banked `projSym` (N230): `projTrivial X = (trace (projSym X) / 7) • 1`.
    This dissolves the classical "skew ⟹ traceless" fact — killing so(7) is free from
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

/-- ★★★ g₂-EQUIVARIANCE of the trivial-line projector:
    `projTrivial (adEnd D X) = adEnd D (projTrivial X)`. BOTH sides vanish: the LHS trace is a
    commutator trace (`trace_lie`, via `projSym_equivariant`), the RHS is `adEnd D` of a scalar
    multiple of `1` (`one_adEnd_zero`). -/
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

/-- ★★★ g₂-EQUIVARIANCE of the traceless-symmetric projector:
    `proj27 (adEnd D X) = adEnd D (proj27 X)`. Since `proj27 = projSym − projTrivial` and both are
    equivariant. -/
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
