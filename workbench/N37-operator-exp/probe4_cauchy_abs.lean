import Phys.Foundation.ContinuumArchimedean
import Phys.Foundation.ContinuumUniform
import Phys.Foundation.ContinuumTopology
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Order.Filter.CountablyGenerated
import Mathlib.Topology.Order.IsLUB

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology Uniformity

noncomputable section

-- cauchySeq characterization via the abs basis (with sub_zero normalized)
example (u : ℕ → Cut) (hu : CauchySeq u) :
    ∀ ε:Cut, (0:Cut) < ε → ∃ N, ∀ n ≥ N, |u n - u N| < ε := by
  have hbasis : (𝓤 Cut).HasBasis (fun ε:Cut => (0:Cut) < ε)
      (fun ε => {p:Cut×Cut | |p.2 - p.1| < ε}) := by
    rw [cut_uniformity_eq]
    have := (nhds_basis_abs_sub_lt (0:Cut)).comap (fun p:Cut×Cut => p.2 - p.1)
    simpa [sub_zero] using this
  intro ε hε
  rw [hbasis.cauchySeq_iff'] at hu
  obtain ⟨N, hN⟩ := hu ε hε
  refine ⟨N, fun n hn => ?_⟩
  have := hN n hn
  simp only [mem_setOf_eq] at this
  rwa [abs_sub_comm] at this

end

end ContinuumQ
end Phys.Foundation
