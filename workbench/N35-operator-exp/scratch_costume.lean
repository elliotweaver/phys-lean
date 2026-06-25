import Phys.Foundation.ContinuumArchimedean

namespace Counterexamples
open Phys.Foundation Phys.Foundation.ContinuumQ Filter
open scoped Topology

noncomputable section

-- WRONG: the constant-0 sequence's ciSup-limit over the derived ℝ equals 1.
-- cut_tendsto_atTop_ciSup makes it tend to (⨆ _, 0); cut_const_tendsto makes it tend to 0;
-- limit uniqueness (Hausdorff, banked t2Space_cut) forces (⨆ _, 0) = 0, so the claim → (0:Cut)=1.
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
