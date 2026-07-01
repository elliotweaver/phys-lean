/-
  Phys.Algebra.TowerGatherCanonicalDirectSum — N233.
  ===========================================================================
  THE CANONICAL INTERNAL g₂-EQUIVARIANT DIRECT SUM `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.

  THE ARC. N219–N232 built the four AMBIENT g₂-equivariant mutually-orthogonal idempotents on
  `End ℚ ImO`, resolving the identity `projTrivial + proj7 + proj14 + proj27 = id`, with ranges the
  four g₂-submodules `trivialLine` (1), `range crossEmb` (7), `range imRepL` (14), `tracelessSym`
  (27). But the decomposition lived ONLY as a projector identity: the chain did NOT yet carry the
  four submodules PACKAGED as a genuine Mathlib canonical internal direct sum.

  This node banks that single object. Let
      `fourSummands : Fin 4 → Submodule ℚ (End ℚ ImO)`
          `:= ![trivialLine, range crossEmb, range imRepL, tracelessSym]`   (the 1, 7, 14, 27),
      `fourProj    : Fin 4 → End ℚ (End ℚ ImO)`
          `:= ![projTrivial, proj7, proj14, proj27]`                        (the matched projectors).
  Then:

      ★★★ `fourSummands_isInternal : DirectSum.IsInternal fourSummands`
          — the canonical internal direct sum `End ℚ ImO = (1) ⊕ (7) ⊕ (14) ⊕ (27)`,

  proved through the four banked idempotents:
   * `proj_fix` — each `fourProj i` FIXES its own summand `fourSummands i` (banked
     `projTrivial_apply_triv`/`proj7_apply_fun`/`proj14_apply_adj`/`proj27_apply_tracefree`);
   * `proj_kill` — each `fourProj i` KILLS every OTHER summand `fourSummands j` (`j ≠ i`), i.e.
     `fourSummands j ≤ ker (fourProj i)` (the twelve banked cross-annihilations via
     `*_apply_skew`/`*_apply_self`/`*_apply_fun`/`*_apply_adj`/`*_apply_tracefree`/`*_apply_triv`
     composed with `crossEmb_range_le_so7'`/`imRep_range_le_so7`/`trivialLine_le_selfAdj`/
     `tracelessSym_le_selfAdj`);
   * `fourSummands_iSup_eq_top : iSup fourSummands = ⊤` — from the banked FOUR-WAY RESOLUTION
     `projTrivial_add_proj27_add_proj7_add_proj14` (every `X` is the sum of its four projector-images,
     each in a summand);
   * `fourSummands_iSupIndep : iSupIndep fourSummands` — for each `i`, a vector in
     `fourSummands i ⊓ (⨆ j≠i, fourSummands j)` is FIXED by `fourProj i` (it is in summand `i`) AND
     KILLED by `fourProj i` (the sup of the others lies in `ker (fourProj i)`), hence `0`;
   * IsInternal via Mathlib `DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top`.

  Banked ALSO:
   * ★ THE DIMENSION IDENTITY `fourSummands_finrank_sum` :
       `finrank (1) + finrank (7) + finrank (14) + finrank (27) = 1+7+14+27 = 49 = finrank (End ℚ ImO)`
     (banked `finrank_trivialLine`/`finrank_crossEmb_range`/`finrank_imRep_range`/
     `finrank_tracelessSym_eq_27`/`finrank_end_eq_49`) — an independent CONSISTENCY witness.
   * ★ EACH SUMMAND g₂-STABLE `fourSummands_adEnd_inv` : `X ∈ fourSummands i ⟹ adEnd D X ∈ fourSummands i`
     (banked `trivialLine_adEnd_inv`/`crossEmb_range_g2_invariant`/`imRep_range_g2_invariant`/
     `tracelessSym_adEnd_inv`) — the direct sum is one of g₂-MODULES, not merely of subspaces.
   * capstone `canonical_internal_direct_sum_structure` bundling IsInternal + dim identity + each
     summand g₂-stable — the single object `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` as the canonical internal
     g₂-equivariant direct sum.

  ONE CAUSE, THE PACKAGED FACE. The whole N219–N232 projector arc — born of the same octonionic
  Born positivity (so(7) as the skew half) and the same non-associativity (so(7) = 14 ⊕ 7) and the
  same metric trace (ℚ·id inside the symmetric side) — now stands as ONE Mathlib `IsInternal`
  object. "One object" in the most literal sense: the internal direct sum.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/trivial-rep/fundamental/adjoint/
  traceless/metric/projector/module/representation): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for
  `ImO = ker(star+1)`, the four submodules `{trivialLine, range crossEmb, range imRepL, tracelessSym}`
  of `End ℚ ImO` form an internal direct sum, with dimensions `1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO)`,
  and each is preserved by `X ↦ ⁅imRep D, X⁆`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only the banked N232 `TowerGatherAmbientProjection1And27` (transitively the whole
  tower: `projTrivial`/`proj7`/`proj14`/`proj27` and their `*_apply_*`/range/finrank/orthogonality/
  four-way-resolution facts; `trivialLine`/`tracelessSym`/`crossEmb`/`imRepL`; the g₂-invariance facts
  `trivialLine_adEnd_inv`/`tracelessSym_adEnd_inv`/`crossEmb_range_g2_invariant`/`imRep_range_g2_invariant`;
  the `le_so7`/`le_selfAdj` inclusions; `adEnd`/`adEnd_apply`/`derivationLieQ`/`ImO`; the finrank facts
  `finrank_trivialLine`/`finrank_crossEmb_range`/`finrank_imRep_range`/`finrank_tracelessSym_eq_27`/
  `finrank_end_eq_49`) + Mathlib `DirectSum.IsInternal`/`isInternal_submodule_of_iSupIndep_of_iSup_eq_top`/
  `iSupIndep`/`iSup`/`Fin`-indexing MACHINERY on the DERIVED objects. Ground = derived ℚ; NO Mathlib ℝ/ℂ
  as content; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation (only the synthInstance ceiling for the ℚ-End instance
  diamond inherited from N227–N232, not a proof-search raise).
-/
import Phys.Algebra.TowerGatherAmbientProjection1And27

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227–N232); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) THE FOUR g₂-SUBMODULES AND THE FOUR MATCHED PROJECTORS. -/

/-- ★ THE FOUR g₂-SUBMODULES of `End ℚ ImO`: `1 ⊕ 7 ⊕ 14 ⊕ 27`. Indexed by `Fin 4` as
    `![trivialLine, range crossEmb, range imRepL, tracelessSym]` — the trivial line (1), the
    fundamental (7 = `range crossEmb`), the adjoint (14 = `range imRepL`), the traceless-symmetric (27). -/
def fourSummands : Fin 4 → Submodule ℚ (Module.End ℚ ImO) :=
  ![trivialLine, LinearMap.range crossEmb, LinearMap.range imRepL, tracelessSym]

/-- The four matched AMBIENT projectors `![projTrivial, proj7, proj14, proj27]` (N231/N232), each
    retracting `End ℚ ImO` onto the corresponding summand. -/
def fourProj : Fin 4 → Module.End ℚ (Module.End ℚ ImO) :=
  ![projTrivial, proj7, proj14, proj27]

@[simp] theorem fourSummands_zero : fourSummands 0 = trivialLine := rfl
@[simp] theorem fourSummands_one : fourSummands 1 = LinearMap.range crossEmb := rfl
@[simp] theorem fourSummands_two : fourSummands 2 = LinearMap.range imRepL := rfl
@[simp] theorem fourSummands_three : fourSummands 3 = tracelessSym := rfl

/-! ## (2) THE FIX / KILL POINTWISE LEMMAS from the banked projectors. -/

/-- Each projector `fourProj i` FIXES its own summand `fourSummands i` (banked
    `projTrivial_apply_triv`/`proj7_apply_fun`/`proj14_apply_adj`/`proj27_apply_tracefree`). -/
theorem proj_fix : ∀ (i : Fin 4), ∀ X ∈ fourSummands i, fourProj i X = X := by
  intro i X hX
  fin_cases i
  · exact projTrivial_apply_triv hX
  · exact proj7_apply_fun hX
  · exact proj14_apply_adj hX
  · exact proj27_apply_tracefree hX

/-- Each projector `fourProj i` KILLS every OTHER summand: `fourSummands j ≤ ker (fourProj i)` for
    `j ≠ i` — the twelve banked cross-annihilations. -/
theorem proj_kill : ∀ (i j : Fin 4), j ≠ i → fourSummands j ≤ LinearMap.ker (fourProj i) := by
  intro i j hij X hX
  rw [LinearMap.mem_ker]
  fin_cases i
  · fin_cases j
    · exact absurd rfl hij
    · exact projTrivial_apply_skew (crossEmb_range_le_so7' hX)
    · exact projTrivial_apply_skew (imRep_range_le_so7 hX)
    · exact projTrivial_apply_tracefree hX
  · fin_cases j
    · exact proj7_apply_self (trivialLine_le_selfAdj hX)
    · exact absurd rfl hij
    · exact proj7_apply_adj hX
    · exact proj7_apply_self (tracelessSym_le_selfAdj hX)
  · fin_cases j
    · exact proj14_apply_self (trivialLine_le_selfAdj hX)
    · exact proj14_apply_fun hX
    · exact absurd rfl hij
    · exact proj14_apply_self (tracelessSym_le_selfAdj hX)
  · fin_cases j
    · exact proj27_apply_triv hX
    · exact proj27_apply_skew (crossEmb_range_le_so7' hX)
    · exact proj27_apply_skew (imRep_range_le_so7 hX)
    · exact absurd rfl hij

/-! ## (3) `iSup fourSummands = ⊤` from the FOUR-WAY RESOLUTION. -/

/-- The four projector-images land in their respective summands (unfolding `![…]`). -/
theorem term0_mem (X : Module.End ℚ ImO) : projTrivial X ∈ fourSummands 0 := projTrivial_apply_mem X
theorem term1_mem (X : Module.End ℚ ImO) : proj7 X ∈ fourSummands 1 := proj7_apply_mem X
theorem term2_mem (X : Module.End ℚ ImO) : proj14 X ∈ fourSummands 2 := proj14_apply_mem X
theorem term3_mem (X : Module.End ℚ ImO) : proj27 X ∈ fourSummands 3 := proj27_apply_mem X

/-- ★ `iSup fourSummands = ⊤`: every `X` is the sum of its four projector-images
    (banked `projTrivial_add_proj27_add_proj7_add_proj14`), each in a summand. -/
theorem fourSummands_iSup_eq_top : iSup fourSummands = ⊤ := by
  rw [eq_top_iff]
  intro X _
  have hle : ∀ i, fourSummands i ≤ iSup fourSummands := fun i => le_iSup fourSummands i
  have h4 : projTrivial X + proj27 X + proj7 X + proj14 X = X :=
    projTrivial_add_proj27_add_proj7_add_proj14 X
  rw [← h4]
  refine Submodule.add_mem _ (Submodule.add_mem _ (Submodule.add_mem _ ?_ ?_) ?_) ?_
  · exact hle 0 (term0_mem X)
  · exact hle 3 (term3_mem X)
  · exact hle 1 (term1_mem X)
  · exact hle 2 (term2_mem X)

/-! ## (4) `iSupIndep fourSummands` from FIX + KILL. -/

/-- ★ `iSupIndep fourSummands`: a vector in `fourSummands i ⊓ (⨆ j≠i, fourSummands j)` is FIXED by
    `fourProj i` (it is in summand `i`, `proj_fix`) AND KILLED by `fourProj i` (the sup of the others
    lies in `ker (fourProj i)`, `proj_kill`), hence `0`. -/
theorem fourSummands_iSupIndep : iSupIndep fourSummands := by
  rw [iSupIndep_def]
  intro i
  rw [Submodule.disjoint_def]
  intro x hxi hxsup
  have hfix : fourProj i x = x := proj_fix i x hxi
  have hsuple : (⨆ (j) (_ : j ≠ i), fourSummands j) ≤ LinearMap.ker (fourProj i) :=
    iSup₂_le (fun j hj => proj_kill i j hj)
  have hkill : fourProj i x = 0 := LinearMap.mem_ker.1 (hsuple hxsup)
  rw [hfix] at hkill
  exact hkill

/-! ## (5) ★★★ THE CANONICAL INTERNAL DIRECT SUM. -/

/-- ★★★ THE CANONICAL INTERNAL DIRECT SUM `End ℚ ImO = trivialLine ⊕ range crossEmb ⊕ range imRepL ⊕
    tracelessSym` — i.e. `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` — via Mathlib
    `isInternal_submodule_of_iSupIndep_of_iSup_eq_top` from the independence and spanning proved above. -/
theorem fourSummands_isInternal : DirectSum.IsInternal fourSummands :=
  DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top
    fourSummands_iSupIndep fourSummands_iSup_eq_top

/-! ## (6) ★ THE DIMENSION IDENTITY. -/

/-- The four summand dimensions are `1, 7, 14, 27` (banked finrank facts). -/
theorem fourSummands_finrank_values :
    Module.finrank ℚ (fourSummands 0) = 1 ∧ Module.finrank ℚ (fourSummands 1) = 7
      ∧ Module.finrank ℚ (fourSummands 2) = 14 ∧ Module.finrank ℚ (fourSummands 3) = 27 :=
  ⟨finrank_trivialLine, finrank_crossEmb_range, finrank_imRep_range, finrank_tracelessSym_eq_27⟩

/-- ★ THE DIMENSION IDENTITY `1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO)` — an independent
    CONSISTENCY witness of the direct sum (banked finrank facts). -/
theorem fourSummands_finrank_sum :
    Module.finrank ℚ (fourSummands 0) + Module.finrank ℚ (fourSummands 1)
      + Module.finrank ℚ (fourSummands 2) + Module.finrank ℚ (fourSummands 3)
    = Module.finrank ℚ (Module.End ℚ ImO) := by
  show Module.finrank ℚ trivialLine + Module.finrank ℚ (LinearMap.range crossEmb)
      + Module.finrank ℚ (LinearMap.range imRepL) + Module.finrank ℚ tracelessSym
    = Module.finrank ℚ (Module.End ℚ ImO)
  rw [finrank_trivialLine, finrank_crossEmb_range, finrank_imRep_range,
      finrank_tracelessSym_eq_27, finrank_end_eq_49]

/-! ## (7) ★ EACH SUMMAND A g₂-SUBMODULE. -/

/-- ★ EACH SUMMAND is g₂-STABLE under the adjoint action `adEnd D : X ↦ ⁅imRep D, X⁆`
    (banked `trivialLine_adEnd_inv`/`crossEmb_range_g2_invariant`/`imRep_range_g2_invariant`/
    `tracelessSym_adEnd_inv`) — the direct sum is one of g₂-MODULES, not merely of subspaces. -/
theorem fourSummands_adEnd_inv :
    ∀ (i : Fin 4) (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ fourSummands i → adEnd D X ∈ fourSummands i := by
  intro i D X hX
  fin_cases i
  · exact trivialLine_adEnd_inv D X hX
  · rw [adEnd_apply]; exact crossEmb_range_g2_invariant D hX
  · rw [adEnd_apply]; exact imRep_range_g2_invariant D hX
  · exact tracelessSym_adEnd_inv D X hX

/-! ## CAPSTONE. -/

/-- ★★★ THE CANONICAL INTERNAL g₂-EQUIVARIANT DIRECT SUM `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` on the banked
    tower. The four g₂-submodules `![trivialLine, range crossEmb, range imRepL, tracelessSym]` of
    `End ℚ ImO` form a Mathlib internal direct sum (`DirectSum.IsInternal`), their dimensions
    `1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO)`, and each is preserved by the adjoint g₂-action
    `adEnd D`. The whole N219–N232 projector arc, packaged into a single object. -/
theorem canonical_internal_direct_sum_structure :
    DirectSum.IsInternal fourSummands ∧
    (Module.finrank ℚ (fourSummands 0) = 1 ∧ Module.finrank ℚ (fourSummands 1) = 7
      ∧ Module.finrank ℚ (fourSummands 2) = 14 ∧ Module.finrank ℚ (fourSummands 3) = 27) ∧
    (Module.finrank ℚ (fourSummands 0) + Module.finrank ℚ (fourSummands 1)
      + Module.finrank ℚ (fourSummands 2) + Module.finrank ℚ (fourSummands 3)
        = Module.finrank ℚ (Module.End ℚ ImO)) ∧
    (∀ (i : Fin 4) (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ fourSummands i → adEnd D X ∈ fourSummands i) :=
  ⟨fourSummands_isInternal, fourSummands_finrank_values, fourSummands_finrank_sum,
   fourSummands_adEnd_inv⟩

end

end Phys.Algebra
