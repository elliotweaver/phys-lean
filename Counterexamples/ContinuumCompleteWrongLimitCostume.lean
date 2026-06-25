/-
  Counterexamples.ContinuumCompleteWrongLimitCostume — N37 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N37 CAUCHY-COMPLETENESS rung over the DERIVED ℝ `ContinuumQ.Cut`.
  N37 banks `instCompleteSpaceCut : CompleteSpace Cut` — every Cauchy sequence of the derived ℝ
  CONVERGES. A complete uniform space lets `CauchySeq.tendsto_limUnder` extract the actual limit
  `limUnder atTop u` of any Cauchy sequence and prove the sequence tends to it; combined with the
  banked Hausdorff topology (`t2Space_cut`, N34) limits are unique.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the limit of the constant-zero
  Cauchy sequence over the derived ℝ is `1` instead of `0`. The banked completeness
  (`instCompleteSpaceCut`) makes the constant-zero sequence tend to `limUnder atTop (fun _ => 0)`
  (via `CauchySeq.tendsto_limUnder`, which REQUIRES `CompleteSpace Cut`), while `tendsto_const_nhds`
  makes it tend to `0`; limit uniqueness in the Hausdorff topology (`tendsto_nhds_unique`) forces
  `limUnder atTop (fun _ => 0) = 0`, so the bogus claim collapses to `(0 : Cut) = 1`, which cannot
  be discharged. If the completeness were hollow — if `instCompleteSpaceCut` did not actually make
  Cauchy sequences converge — `CauchySeq.tendsto_limUnder` would not typecheck and this costume
  could not even be stated; W8 demands it bite once stated. (A Cauchy sequence whose extracted limit
  is `1` rather than its true value `0` is exactly a violation of the completeness the node banks.)

  This costume DIRECTLY exercises the NEW N37 content: `CauchySeq.tendsto_limUnder` is gated on
  `CompleteSpace Cut` (`instCompleteSpaceCut`), so deleting the N37 completeness instance removes
  the instance the costume's first `have` resolves against. The manifest's PASS_SIGNATURE matches
  the elaboration error below (`⊢ 0 = 1`).
-/
import Phys.Foundation.ContinuumComplete

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Filter
open scoped Topology

noncomputable section

/-- WRONG: claiming the limit of the constant-zero Cauchy sequence over the derived ℝ is `1`.
    The banked `instCompleteSpaceCut` (N37) lets `CauchySeq.tendsto_limUnder` extract the limit;
    `tendsto_const_nhds` + Hausdorff limit uniqueness force `limUnder atTop (fun _ => 0) = 0`, so
    the claim reduces to `(0 : Cut) = 1`. Must FAIL to compile. -/
theorem complete_limUnder_const_zero_BOGUS :
    limUnder atTop (fun _ : ℕ => (0 : Cut)) = (1 : Cut) := by
  have hcauchy : CauchySeq (fun _ : ℕ => (0 : Cut)) := cauchySeq_const _
  have h1 : Tendsto (fun _ : ℕ => (0 : Cut)) atTop (𝓝 (limUnder atTop (fun _ : ℕ => (0 : Cut)))) :=
    hcauchy.tendsto_limUnder
  have h2 : Tendsto (fun _ : ℕ => (0 : Cut)) atTop (𝓝 (0 : Cut)) := tendsto_const_nhds
  have hlim : limUnder atTop (fun _ : ℕ => (0 : Cut)) = 0 := tendsto_nhds_unique h1 h2
  rw [hlim]

end

end Counterexamples
