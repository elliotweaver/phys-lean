/-
  Phys.Algebra.TowerGatherFFTPeirceReduction — N237.
  ===========================================================================
  THE PEIRCE REDUCTION OF THE g₂-EQUIVARIANT ENDOMORPHISM ALGEBRA, AND THE
  SHARPENING OF THE FFT UPPER BOUND `finrank ℚ commutantG2 ≤ 4` TO THE SINGLE
  CRISP CONTAINMENT `commutantG2 ≤ commutantSpan`.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.

  THE NAMED ASCENT (N234 → N235 → N236 → THIS). N234 MEASURED that the irreducibility of the 27
  (`tracelessSym`) reduces to the g₂ First Fundamental Theorem endomorphism count
  `dim End_{g₂}(7 ⊗ 7) = 4`. N235 banked the GENERATORS of the g₂-invariant algebra (the metric
  `δ = gForm`, the associative 3-form `φ = assoc3`, its dual `ψ = coassoc4`). N236 banked the
  commutant object `commutantG2 = End_{g₂}(End ℚ ImO)` together with the FFT LOWER bound
  `4 ≤ finrank ℚ commutantG2` (the four banked g₂-equivariant projectors are linearly independent
  members). THIS node banks the forward structural skeleton the UPPER bound needs, and pins the
  genuine hard core to one crisp, non-circular containment.

  THE RECONNAISSANCE VERDICT (why the pillar/Schur route to `≤ 4` is PROVABLY CIRCULAR). Via the
  four banked projectors `eᵢ = fourProj i` (a complete orthogonal idempotent system, `∑ eᵢ = 1`),
  every `T ∈ commutantG2` Peirce-expands `T = ∑ᵢⱼ eᵢ T eⱼ`, and `eᵢ · commutantG2 · eⱼ ≅
  Hom_{g₂}(Vⱼ, Vᵢ)`, so `dim commutantG2 = Σᵢⱼ dim Hom_{g₂}(Vⱼ, Vᵢ)`. Closing this at `4` needs the
  DIAGONAL `dim End_{g₂}(Vᵢ) = 1` — for the 27 this IS the target irreducibility, so the route is
  circular. The ONLY non-circular route is the DIRECT invariant count `dim (ImO^{⊗4})^{g₂} ≤ 4`
  (self-dual via the definite `bornBil`) — the genuine g₂ First Fundamental Theorem, which is
  Mathlib-absent (no compact-group Reynolds averaging over ℚ, no highest-weight/Casimir toolkit).

  WHAT THIS NODE BANKS (the tractable, non-circular forward brick — W9.8 bank-as-you-go).
      ★ `commutantG2` is a UNITAL ℚ-SUBALGEBRA of `End ℚ (End ℚ ImO)` (`one_mem_commutantG2`,
        `mul_mem_commutantG2`).
      ★ the four banked projectors are a COMPLETE ORTHOGONAL IDEMPOTENT SYSTEM inside it:
        `fourProj_sum_eq_one : ∑ i, fourProj i = 1` (on top of N236's idempotency/orthogonality).
      ★ THE PEIRCE EXPANSION `peirce_expand : T = ∑ᵢ ∑ⱼ eᵢ T eⱼ` for every `T`, with each corner
        `corner_mem_commutantG2 : eᵢ T eⱼ ∈ commutantG2` — the explicit reduction of any commuting
        endomorphism to its sixteen corners.
      ★ the SPAN object `commutantSpan := span ℚ (range fourProj) ≤ commutantG2`, of dimension
        `≤ 4` (`finrank_commutantSpan_le_four`).
      ★★★ THE REDUCTION `finrank_commutantG2_le_four_of_le_span` /
        `finrank_commutantG2_eq_four_of_le_span`: the ENTIRE FFT upper bound (and, with N236's
        lower bound, the exact count `= 4`) follows from the single crisp containment
        `commutantG2 ≤ commutantSpan` — "every g₂-commuting endomorphism of `7 ⊗ 7` is a
        ℚ-combination of the four projectors." This is the honest hard core, conditionalized: the
        node asserts NOTHING about the count unconditionally; it names the one remaining obligation.

  THE HARD CORE, CHILDED. `commutantG2 ≤ commutantSpan` is exactly the g₂ FFT count rephrased (it
  forces `finrank commutantG2 ≤ finrank commutantSpan ≤ 4`, and with N236's `4 ≤ finrank
  commutantG2` gives `= 4`). It is Mathlib-absent invariant-theory machinery — a genuine multi-node
  ASCENT (W1 step 1: BUILD it forward). Childed as the next dissolution node on the tail; this node
  banks the reduction and BLOCKS behind it. A stalled board with an honest block + a queued
  dissolution ticket is CORRECT; a "done" node asserting the count would be the worst failure.

  ONE CAUSE, THE PEIRCE FACE. The same four idempotents that resolved the identity (N219–N232),
  packaged the internal direct sum (N233), and gave the FFT lower bound (N236) here reduce ANY
  g₂-commuting endomorphism to its sixteen Peirce corners — the structural skeleton on which the
  invariant count is read off.

  W9 INSTRUMENT NOTE (inherited N236). `LinearIndependent`/heavy defs unfold pathologically on the
  two-level `End ℚ (End ℚ ImO)` via the Cayley–Dickson instance diamond (whnf timeout even at 800k
  heartbeats). Every proof here routes through operator-level `Module.End.mul_apply` + pointwise
  `LinearMap.ext` + submodule membership + `finrank_mono`/`finrank_range_le_card`, NEVER through
  `LinearIndependent` def unfolding. The equality count uses N236's banked lower bound directly, so
  the pathological `= 4`-for-`commutantSpan` route is avoided entirely. Only the inherited
  synthInstance ceiling for the ℚ-End instance diamond; NO proof-search heartbeat raise.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/gauge/gather/equivariant/module/
  representation/commutant/Peirce): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for
  `ImO = ker(star+1)`, the set of endomorphisms of `End ℚ ImO` commuting with every
  `X ↦ ⁅imRep D, X⁆` is a unital ℚ-subalgebra; the four banked idempotents sum to `1`; every
  element equals the sum of its sixteen `eᵢ · _ · eⱼ` corners, each again in the set; the span of
  the four idempotents has dimension `≤ 4` and lies in the set; hence if the set is contained in
  that span, its dimension is `≤ 4` (and, with the banked `4 ≤ dim`, exactly `4`). No theorem
  STATEMENT needs a physics word.

  UNBROKEN. Imports only the banked N236 `TowerGatherFFTCommutantG2` (transitively N233's projector
  tower `fourProj`/`projTrivial`/`proj7`/`proj14`/`proj27` + orthogonality/idempotency/equivariance,
  `adEnd`/`imRep`/`derivationLieQ`/`ImO`; and the commutant object + lower bound) + Mathlib
  `Submodule.span`/`finrank_mono`/`finrank_range_le_card`/`Finset.sum_mul`/`Finset.mul_sum`
  MACHINERY on the DERIVED objects. Ground = derived ℚ; NO Mathlib ℝ/ℂ as content; nothing posited;
  no bridge (the reduction is a proved IMPLICATION, not an assertion of the count).

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no proof-search heartbeat inflation (only the synthInstance ceiling for the
  ℚ-End instance diamond inherited from N227–N236).
-/
import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227–N236); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) `commutantG2` IS A UNITAL ℚ-SUBALGEBRA. -/

/-- The identity endomorphism lies in the commutant (`adEnd D · 1 = 1 · adEnd D`). -/
theorem one_mem_commutantG2 : (1 : Module.End ℚ (Module.End ℚ ImO)) ∈ commutantG2 := by
  intro D; rw [mul_one, one_mul]

/-- The commutant is closed under composition: if `S, T` both commute with every `adEnd D`, so
    does `S * T`. -/
theorem mul_mem_commutantG2 {S T : Module.End ℚ (Module.End ℚ ImO)}
    (hS : S ∈ commutantG2) (hT : T ∈ commutantG2) : S * T ∈ commutantG2 := by
  intro D
  calc adEnd D * (S * T) = (adEnd D * S) * T := by rw [mul_assoc]
    _ = (S * adEnd D) * T := by rw [hS D]
    _ = S * (adEnd D * T) := by rw [mul_assoc]
    _ = S * (T * adEnd D) := by rw [hT D]
    _ = (S * T) * adEnd D := by rw [mul_assoc]

/-! ## (2) THE FOUR PROJECTORS SUM TO THE IDENTITY (complete orthogonal idempotent system). -/

/-- ★ `∑ i, fourProj i = 1`: the four banked projectors resolve the identity (banked four-way
    resolution `projTrivial_add_proj27_add_proj7_add_proj14`). With N236's `fourProj_mul_self`
    (idempotency) and `fourProj_mul_ne` (orthogonality), the `fourProj i` are a COMPLETE ORTHOGONAL
    IDEMPOTENT SYSTEM in the subalgebra `commutantG2`. -/
theorem fourProj_sum_eq_one : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := by
  apply LinearMap.ext; intro X
  rw [LinearMap.sum_apply, Fin.sum_univ_four, Module.End.one_apply]
  show projTrivial X + proj7 X + proj14 X + proj27 X = X
  have h := projTrivial_add_proj27_add_proj7_add_proj14 X
  have hperm : projTrivial X + proj7 X + proj14 X + proj27 X
      = projTrivial X + proj27 X + proj7 X + proj14 X := by abel
  rw [hperm, h]

/-! ## (3) THE PEIRCE EXPANSION `T = ∑ᵢ ∑ⱼ eᵢ T eⱼ` AND CORNER MEMBERSHIP. -/

/-- ★ THE PEIRCE EXPANSION. Since `∑ eᵢ = 1`, every endomorphism `T` of `End ℚ ImO` expands as the
    sum of its sixteen Peirce corners `eᵢ T eⱼ`. Purely algebraic (a ring identity from
    `fourProj_sum_eq_one`), routed through `Finset.sum_mul`/`Finset.mul_sum` — no heavy unfolding. -/
theorem peirce_expand (T : Module.End ℚ (Module.End ℚ ImO)) :
    T = ∑ i, ∑ j, fourProj i * T * fourProj j := by
  have hsum : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := fourProj_sum_eq_one
  calc T = (∑ i, fourProj i) * T * (∑ j, fourProj j) := by rw [hsum, one_mul, mul_one]
    _ = ∑ i, ∑ j, fourProj i * T * fourProj j := by
        rw [Finset.sum_mul, Finset.sum_mul]
        apply Finset.sum_congr rfl; intro i _
        rw [Finset.mul_sum]

/-- ★ Each Peirce corner `eᵢ T eⱼ` of a commuting `T` again lies in the commutant (the commutant is
    a subalgebra containing every `eᵢ`, banked `fourProj_mem_commutantG2`). -/
theorem corner_mem_commutantG2 (T : Module.End ℚ (Module.End ℚ ImO)) (hT : T ∈ commutantG2)
    (i j : Fin 4) : fourProj i * T * fourProj j ∈ commutantG2 :=
  mul_mem_commutantG2 (mul_mem_commutantG2 (fourProj_mem_commutantG2 i) hT)
    (fourProj_mem_commutantG2 j)

/-! ## (4) THE SPAN OF THE FOUR PROJECTORS, AND THE `≤ 4` DIMENSION OF THAT SPAN. -/

/-- `commutantSpan` — the ℚ-span of the four banked projectors inside `End ℚ (End ℚ ImO)`. The
    (banked, N236) FFT LOWER bound shows it is 4-dimensional; the FFT UPPER bound is exactly the
    claim that the whole commutant `commutantG2` is contained in it. -/
def commutantSpan : Submodule ℚ (Module.End ℚ (Module.End ℚ ImO)) :=
  Submodule.span ℚ (Set.range fourProj)

/-- `commutantSpan ≤ commutantG2`: each spanning generator `fourProj i` lies in the commutant
    (banked `fourProj_mem_commutantG2`), so their span does too. -/
theorem commutantSpan_le_commutantG2 : commutantSpan ≤ commutantG2 := by
  rw [commutantSpan, Submodule.span_le]
  rintro T ⟨i, rfl⟩
  exact fourProj_mem_commutantG2 i

/-- `finrank ℚ commutantSpan ≤ 4`: a span of `4` vectors has dimension at most `4`
    (`finrank_range_le_card`). -/
theorem finrank_commutantSpan_le_four : Module.finrank ℚ commutantSpan ≤ 4 := by
  have h := finrank_range_le_card (R := ℚ) fourProj
  rw [Fintype.card_fin] at h
  exact h

/-! ## (5) ★★★ THE REDUCTION: THE FFT UPPER BOUND FROM THE CRISP CONTAINMENT. -/

/-- ★★★ THE FFT UPPER BOUND, REDUCED. If the g₂-equivariant endomorphism space `commutantG2` is
    contained in the span of the four banked projectors (`commutantG2 ≤ commutantSpan` — "every
    g₂-commuting endomorphism of `7 ⊗ 7` is a ℚ-combination of the four projectors", the genuine
    g₂ First Fundamental Theorem count, Mathlib-absent and CHILDED), then `finrank ℚ commutantG2 ≤ 4`.
    A proved IMPLICATION — the node asserts nothing about the count unconditionally. -/
theorem finrank_commutantG2_le_four_of_le_span
    (H : commutantG2 ≤ commutantSpan) : Module.finrank ℚ commutantG2 ≤ 4 :=
  (Submodule.finrank_mono H).trans finrank_commutantSpan_le_four

/-- ★★★ THE EXACT g₂ FFT COUNT, REDUCED. The crisp containment `commutantG2 ≤ commutantSpan`
    (childed hard core) closes the exact endomorphism count `dim End_{g₂}(7 ⊗ 7) = 4`: the upper
    bound from the containment, the lower bound `4 ≤ finrank ℚ commutantG2` banked in N236
    (`four_le_finrank_commutantG2`). This is the value that, over N233's four DISTINCT-dimension
    summands `1, 7, 14, 27` (each multiplicity `≥ 1`, orthogonal), forces `Σ mᵢ² = 4` ⟹ four
    multiplicity-one irreducibles ⟹ the 27 (`tracelessSym`) IRREDUCIBLE. -/
theorem finrank_commutantG2_eq_four_of_le_span
    (H : commutantG2 ≤ commutantSpan) : Module.finrank ℚ commutantG2 = 4 :=
  le_antisymm (finrank_commutantG2_le_four_of_le_span H) four_le_finrank_commutantG2

/-! ## CAPSTONE. -/

/-- ★★★ THE FFT PEIRCE-REDUCTION TOOLKIT on the banked tower. The g₂-equivariant endomorphism space
    `commutantG2 = End_{g₂}(End ℚ ImO)` is a unital ℚ-subalgebra; the four banked projectors sum to
    `1`, so every element Peirce-expands into its sixteen corners, each again in the subalgebra;
    their span `commutantSpan ≤ commutantG2` has dimension `≤ 4`; and the ENTIRE FFT count
    `dim End_{g₂}(7 ⊗ 7) = 4` reduces to the single crisp containment `commutantG2 ≤ commutantSpan`
    (the genuine hard core, CHILDED). -/
theorem fft_peirce_reduction_toolkit :
    (1 : Module.End ℚ (Module.End ℚ ImO)) ∈ commutantG2 ∧
    (∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO))) ∧
    (∀ T : Module.End ℚ (Module.End ℚ ImO), T = ∑ i, ∑ j, fourProj i * T * fourProj j) ∧
    commutantSpan ≤ commutantG2 ∧
    Module.finrank ℚ commutantSpan ≤ 4 ∧
    (commutantG2 ≤ commutantSpan → Module.finrank ℚ commutantG2 = 4) :=
  ⟨one_mem_commutantG2, fourProj_sum_eq_one, peirce_expand, commutantSpan_le_commutantG2,
    finrank_commutantSpan_le_four, finrank_commutantG2_eq_four_of_le_span⟩

end

end Phys.Algebra
