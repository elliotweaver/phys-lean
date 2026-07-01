/-
  Phys.Algebra.TowerGatherFFTCommutantG2 — N236.
  ===========================================================================
  THE g₂-EQUIVARIANT ENDOMORPHISM SPACE OF `7 ⊗ 7` AND THE FFT LOWER BOUND
  `4 ≤ dim End_{g₂}(End ℚ ImO)`.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.

  THE NAMED ASCENT. N234 MEASURED that the irreducibility of the 27 (`tracelessSym`) reduces to the
  g₂ First Fundamental Theorem endomorphism count `dim End_{g₂}(7 ⊗ 7) = 4`: with N233's four
  DISTINCT-dimension summands `1, 7, 14, 27` (pairwise non-isomorphic ⟹ each multiplicity ≥ 1,
  orthogonal), `dim End_{g₂}(7 ⊗ 7) = Σ mᵢ²`, so `Σ mᵢ² = 4` over ≥ 4 terms each ≥ 1 forces EXACTLY
  four multiplicity-one irreducibles. N235 banked the GENERATORS of the g₂-invariant algebra (the
  metric `δ = gForm`, the associative 3-form `φ = assoc3`, its dual `ψ = coassoc4`, all g₂-invariant).

  This node banks the NEXT forward brick of that ascent: the g₂-equivariant endomorphism space
  itself, as a finrank-carrying object, together with the near-free LOWER half of the count.

      ★ `commutantG2 : Submodule ℚ (End ℚ (End ℚ ImO))`
          `:= {T | ∀ D : derivationLieQ, adEnd D ∘ T = T ∘ adEnd D}`   — the COMMUTANT of the
          adjoint g₂-action `adEnd D : X ↦ ⁅imRep D, X⁆`, i.e. `End_{g₂}(End ℚ ImO)`.

      ★★★ `four_le_finrank_commutantG2 : 4 ≤ finrank ℚ commutantG2`   — the FFT LOWER bound.

  THE LOWER BOUND, near-free from the banked projectors. N233's four AMBIENT g₂-EQUIVARIANT
  projectors `![projTrivial, proj7, proj14, proj27]` (= `fourProj`) all LIE in `commutantG2` (banked
  `projTrivial_equivariant`/`proj7_equivariant`/`proj14_equivariant`/`proj27_equivariant`), and they
  are ℚ-LINEARLY INDEPENDENT: they are mutually-ORTHOGONAL nonzero IDEMPOTENTS (`fourProj_mul_self`
  idempotency + `fourProj_mul_ne` orthogonality from the banked twelve cross-annihilations +
  `fourProj_ne_zero` from the banked nonzero finrank-ranges). Right-multiplying a vanishing
  combination `∑ gᵢ • fourProj i = 0` by `fourProj j` isolates `g j • fourProj j = 0`, hence
  `g j = 0`. So the evaluation map `liftComm : (Fin 4 → ℚ) →ₗ commutantG2`, `g ↦ ∑ gᵢ • (projector i)`,
  is INJECTIVE, and `4 = finrank (Fin 4 → ℚ) ≤ finrank commutantG2` (Mathlib
  `LinearMap.finrank_le_finrank_of_injective`).

  ONE CAUSE, THE COMMUTANT FACE. The same four idempotents that (N219–N232) resolved the identity
  and (N233) packaged the internal direct sum `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` are, because each COMMUTES
  with the adjoint g₂-action, four independent g₂-module endomorphisms — the `Σ mᵢ² ≥ 4` half of the
  FFT count, read straight off the banked equivariance.

  W9 INSTRUMENT NOTE. The naive route `LinearIndependent ℚ fourProj` + `fintype_card_le_finrank`
  TIMED OUT at `whnf` (even at 800000 heartbeats): the `LinearIndependent` definition unfolds
  pathologically on the two-level space `End ℚ (End ℚ ImO)` through the Cayley–Dickson instance
  diamond (`LinearMap.addCommMonoid` vs `AddCommGroup.toAddCommMonoid`). DISSOLVED — not by raising
  the ceiling — by RESTRUCTURING to an explicit injective linear map `(Fin 4 → ℚ) →ₗ commutantG2`
  (`Fintype.linearCombination`) + `LinearMap.finrank_le_finrank_of_injective`, which routes through
  submodule instances and `Function.Injective` and never unfolds the heavy `LinearIndependent` def.
  A tactic-SELECTION fix (W9.4 structure-over-expansion), NO proof-search heartbeat raise.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/gauge/gather/equivariant/module/
  representation/commutant): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)`, the
  set of endomorphisms of `End ℚ ImO` commuting with every `X ↦ ⁅imRep D, X⁆` is a ℚ-submodule, the
  four banked idempotents `![projTrivial, proj7, proj14, proj27]` all lie in it and are linearly
  independent, so its dimension is at least `4`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only the banked N233 `TowerGatherCanonicalDirectSum` (transitively the whole
  projector tower: `fourProj`/`projTrivial`/`proj7`/`proj14`/`proj27` + their equivariance/
  idempotency/orthogonality/nonzero-range facts; `adEnd`/`imRep`/`derivationLieQ`/`ImO`) and N235
  `TowerGatherInvariantFormsG2` (the FFT generators the child will contract) + Mathlib
  `Fintype.linearCombination`/`finrank_le_finrank_of_injective`/`finrank_fin_fun`/`Fin`-indexing
  MACHINERY on the DERIVED objects. Ground = derived ℚ; NO Mathlib ℝ/ℂ as content; nothing posited;
  no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no proof-search heartbeat inflation (only the synthInstance ceiling for the
  ℚ-End instance diamond inherited from N227–N233).
-/
import Phys.Algebra.TowerGatherCanonicalDirectSum
import Phys.Algebra.TowerGatherInvariantFormsG2

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227–N233); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) THE g₂-EQUIVARIANT ENDOMORPHISM SPACE (the commutant of `adEnd`). -/

/-- ★ `commutantG2` — the g₂-EQUIVARIANT endomorphism space of `End ℚ ImO`, i.e. the COMMUTANT of
    the adjoint g₂-action `adEnd D : X ↦ ⁅imRep D, X⁆`: all `T : End ℚ (End ℚ ImO)` with
    `adEnd D ∘ T = T ∘ adEnd D` for every `D ∈ derivationLieQ`. This is `End_{g₂}(End ℚ ImO)`, the
    object whose dimension the g₂ First Fundamental Theorem computes to be exactly `4`. -/
def commutantG2 : Submodule ℚ (Module.End ℚ (Module.End ℚ ImO)) where
  carrier := {T | ∀ D : derivationLieQ, adEnd D * T = T * adEnd D}
  zero_mem' := by intro D; rw [mul_zero, zero_mul]
  add_mem' := by
    intro S T hS hT D
    rw [mul_add, add_mul, hS D, hT D]
  smul_mem' := by
    intro c T hT D
    rw [mul_smul_comm, smul_mul_assoc, hT D]

@[simp] theorem mem_commutantG2 {T : Module.End ℚ (Module.End ℚ ImO)} :
    T ∈ commutantG2 ↔ ∀ D : derivationLieQ, adEnd D * T = T * adEnd D := Iff.rfl

/-! ## (2) THE FOUR BANKED PROJECTORS LIE IN THE COMMUTANT (banked equivariance). -/

/-- The trivial-line projector commutes with the adjoint g₂-action (banked `projTrivial_equivariant`). -/
theorem projTrivial_mem_commutantG2 : projTrivial ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, projTrivial_equivariant]

/-- The fundamental-7 projector commutes with the adjoint g₂-action (banked `proj7_equivariant`). -/
theorem proj7_mem_commutantG2 : proj7 ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, proj7_equivariant]

/-- The adjoint-14 projector commutes with the adjoint g₂-action (banked `proj14_equivariant`). -/
theorem proj14_mem_commutantG2 : proj14 ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, proj14_equivariant]

/-- The traceless-symmetric-27 projector commutes with the adjoint g₂-action (banked `proj27_equivariant`). -/
theorem proj27_mem_commutantG2 : proj27 ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, proj27_equivariant]

/-- All four banked projectors `fourProj i` lie in the commutant. -/
theorem fourProj_mem_commutantG2 : ∀ i : Fin 4, fourProj i ∈ commutantG2 := by
  intro i
  fin_cases i
  · exact projTrivial_mem_commutantG2
  · exact proj7_mem_commutantG2
  · exact proj14_mem_commutantG2
  · exact proj27_mem_commutantG2

/-! ## (3) THE FOUR PROJECTORS ARE ORTHOGONAL NONZERO IDEMPOTENTS. -/

/-- Each `fourProj j` is idempotent (banked pointwise idempotency). -/
theorem fourProj_mul_self : ∀ j : Fin 4, fourProj j * fourProj j = fourProj j := by
  intro j
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply]
  fin_cases j
  · exact projTrivial_projTrivial X
  · exact proj7_proj7 X
  · exact proj14_proj14 X
  · exact proj27_proj27 X

/-- Distinct `fourProj i`, `fourProj j` are orthogonal (the banked twelve cross-annihilations). -/
theorem fourProj_mul_ne : ∀ i j : Fin 4, i ≠ j → fourProj i * fourProj j = 0 := by
  intro i j hij
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, LinearMap.zero_apply]
  fin_cases i <;> fin_cases j
  all_goals first
    | exact absurd rfl hij
    | (show projTrivial (proj7 X) = 0; exact projTrivial_proj7 X)
    | (show projTrivial (proj14 X) = 0; exact projTrivial_proj14 X)
    | (show projTrivial (proj27 X) = 0; exact projTrivial_proj27 X)
    | (show proj7 (projTrivial X) = 0; exact proj7_projTrivial X)
    | (show proj7 (proj14 X) = 0; exact proj7_proj14 X)
    | (show proj7 (proj27 X) = 0; exact proj7_proj27 X)
    | (show proj14 (projTrivial X) = 0; exact proj14_projTrivial X)
    | (show proj14 (proj7 X) = 0; exact proj14_proj7 X)
    | (show proj14 (proj27 X) = 0; exact proj14_proj27 X)
    | (show proj27 (projTrivial X) = 0; exact proj27_projTrivial X)
    | (show proj27 (proj7 X) = 0; exact proj27_proj7 X)
    | (show proj27 (proj14 X) = 0; exact proj27_proj14 X)

/-- Each `fourProj j` is nonzero (its banked range has nonzero dimension `1, 7, 14, 27`). -/
theorem fourProj_ne_zero : ∀ j : Fin 4, fourProj j ≠ 0 := by
  intro j
  fin_cases j
  · show projTrivial ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range projTrivial) = 1 := finrank_projTrivial_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)
  · show proj7 ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range proj7) = 7 := finrank_proj7_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)
  · show proj14 ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range proj14) = 14 := finrank_proj14_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)
  · show proj27 ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range proj27) = 27 := finrank_proj27_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)

/-! ## (4) THE LIFT INTO THE COMMUTANT AND THE INJECTIVE EVALUATION MAP. -/

/-- The lift of the four banked projectors into the commutant subtype. -/
def bComm : Fin 4 → commutantG2 := fun i => ⟨fourProj i, fourProj_mem_commutantG2 i⟩

/-- The evaluation map `(Fin 4 → ℚ) →ₗ commutantG2`, `g ↦ ∑ gᵢ • (projector i)`. Its injectivity is
    the linear independence of the four orthogonal nonzero idempotents. -/
def liftComm : (Fin 4 → ℚ) →ₗ[ℚ] commutantG2 := Fintype.linearCombination ℚ bComm

/-- The evaluation map is INJECTIVE: if `∑ gᵢ • fourProj i = 0` then right-multiplying by
    `fourProj j` and using orthogonality + idempotency + nonzero isolates each `g j = 0`. -/
theorem liftComm_injective : Function.Injective liftComm := by
  rw [injective_iff_map_eq_zero]
  intro g hg
  have hval : (∑ i, g i • fourProj i) = 0 := by
    have := congrArg (Subtype.val) hg
    rw [ZeroMemClass.coe_zero] at this
    rw [← this, liftComm, Fintype.linearCombination_apply, AddSubmonoidClass.coe_finset_sum]
    simp only [SetLike.val_smul, bComm]
  funext j
  have hmul : (∑ i, g i • fourProj i) * fourProj j = 0 := by rw [hval, zero_mul]
  rw [Finset.sum_mul] at hmul
  have hsingle : ∑ i, g i • fourProj i * fourProj j = g j • fourProj j := by
    rw [Finset.sum_eq_single_of_mem j (Finset.mem_univ j)]
    · rw [smul_mul_assoc, fourProj_mul_self]
    · intro i _ hij
      rw [smul_mul_assoc, fourProj_mul_ne i j hij, smul_zero]
  rw [hsingle] at hmul
  rcases smul_eq_zero.1 hmul with h | h
  · exact h
  · exact absurd h (fourProj_ne_zero j)

/-! ## (5) ★★★ THE FFT LOWER BOUND. -/

/-- ★★★ THE FFT LOWER BOUND `4 ≤ dim End_{g₂}(End ℚ ImO)`. The four banked g₂-equivariant projectors
    span a `4`-dimensional subspace of the commutant `commutantG2`, via the injective linear map
    `liftComm : (Fin 4 → ℚ) →ₗ commutantG2` (Mathlib `finrank_le_finrank_of_injective` +
    `finrank_fin_fun`). This is the `Σ mᵢ² ≥ 4` half of the g₂ First Fundamental Theorem count. -/
theorem four_le_finrank_commutantG2 : 4 ≤ Module.finrank ℚ commutantG2 := by
  have h1 : Module.finrank ℚ (Fin 4 → ℚ) ≤ Module.finrank ℚ commutantG2 :=
    liftComm.finrank_le_finrank_of_injective liftComm_injective
  rwa [Module.finrank_fin_fun] at h1

/-! ## CAPSTONE. -/

/-- ★★★ THE FFT LOWER-BOUND TOOLKIT on the banked tower: the g₂-equivariant endomorphism space
    `commutantG2 = End_{g₂}(End ℚ ImO)` contains all four banked projectors `fourProj i`, which are
    linearly independent, so `4 ≤ finrank commutantG2` — the `Σ mᵢ² ≥ 4` half of the g₂ First
    Fundamental Theorem count `dim End_{g₂}(7 ⊗ 7) = 4`. -/
theorem fft_lower_bound_toolkit :
    (∀ i : Fin 4, fourProj i ∈ commutantG2) ∧
    Function.Injective liftComm ∧
    4 ≤ Module.finrank ℚ commutantG2 :=
  ⟨fourProj_mem_commutantG2, liftComm_injective, four_le_finrank_commutantG2⟩

end

end Phys.Algebra
