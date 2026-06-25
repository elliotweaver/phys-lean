/-
  Counterexamples.ContinuumArchimedeanWrongLimitCostume — N35 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N35 ARCHIMEDEAN / C6-eternal-approach convergence rung over the
  DERIVED ℝ `ContinuumQ.Cut`. N35 banks that bounded monotone sequences of the derived ℝ converge,
  in the banked order topology, to their suprema (`cut_tendsto_atTop_ciSup`) — the C6 eternal-
  approach read as an analytic limit — together with limit uniqueness from the banked Hausdorff
  topology (`t2Space_cut`, N34).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the supremum-limit of the
  constant-zero sequence over the derived ℝ is `1` instead of `0`. The banked
  `cut_tendsto_atTop_ciSup` makes the constant-zero sequence tend to `⨆ _, 0`, while
  `cut_const_tendsto` makes it tend to `0`; limit uniqueness in the Hausdorff order topology
  (`tendsto_nhds_unique`) forces `⨆ _, 0 = 0`, so the bogus claim collapses to `(0 : Cut) = 1`,
  which cannot be discharged. If the convergence were hollow — if `cut_tendsto_atTop_ciSup` did
  not actually deliver the order-topology limit, or the derived ℝ were not Hausdorff — this
  costume would be provable; W8 demands it bite. (A constant sequence whose sup-limit is `1`
  rather than `0` is exactly a violation of the monotone-bounded convergence the node banks.)

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ 0 = 1`).
-/
import Phys.Foundation.ContinuumArchimedean

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Filter
open scoped Topology

noncomputable section

/-- WRONG: claiming the supremum-limit of the constant-zero sequence over the derived ℝ is `1`.
    The banked `cut_tendsto_atTop_ciSup` + `cut_const_tendsto` + Hausdorff limit uniqueness force
    `⨆ _, 0 = 0`, so the claim reduces to `(0 : Cut) = 1`. Must FAIL to compile. -/
theorem ciSup_const_zero_BOGUS : (⨆ _ : ℕ, (0 : Cut)) = (1 : Cut) := by
  have hb : BddAbove (Set.range (fun _ : ℕ => (0 : Cut))) := by
    refine ⟨0, ?_⟩; rintro _ ⟨_, rfl⟩; exact le_refl _
  have h1 : Tendsto (fun _ : ℕ => (0 : Cut)) atTop (𝓝 (⨆ _ : ℕ, (0 : Cut))) :=
    cut_tendsto_atTop_ciSup _ monotone_const hb
  have h2 : Tendsto (fun _ : ℕ => (0 : Cut)) atTop (𝓝 (0 : Cut)) := cut_const_tendsto 0
  have hsup : (⨆ _ : ℕ, (0 : Cut)) = 0 := tendsto_nhds_unique h1 h2
  rw [hsup]

end

end Counterexamples
