import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Membership: a unit-imaginary bimultiplication lies in genIsomMonoidC2.
theorem probe_biMul_imag_mem_gen2 (u : O Cut) (hu : gFormC u u = 1) :
    (biMulFun u u : Function.End STVC) ∈ genIsomMonoidC2 := by
  apply Submonoid.subset_closure
  apply Set.mem_union_right
  exact ⟨u, u, hu, hu, rfl⟩

-- A concrete second imaginary unit j := iota(e2 : H Cut) in O Cut, and whether it
-- anticommutes with e₂.  Probe the anticommutation numerically via a coordinate.
-- First: does j satisfy star j = -j ?
theorem probe_j_imag : star (CD.iota (CD.e2 : H Cut) : O Cut) = -(CD.iota (CD.e2 : H Cut) : O Cut) := by
  ext <;> simp [CD.iota, CD.e2]

-- e₂ * j  vs  j * e₂  : anticommute?  (e₂ = ⟨0,1⟩ in O = CD(H), j = ⟨e2H, 0⟩)
theorem probe_e2_j_anticomm :
    (CD.e2 : O Cut) * (CD.iota (CD.e2 : H Cut) : O Cut)
      = -((CD.iota (CD.e2 : H Cut) : O Cut) * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota] <;> ring

end

end Phys.Algebra
