import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000
set_option maxHeartbeats 1000000

noncomputable section

-- The two sides as bilinear forms on ImO.
-- LHS(a,b) = traceForm7 (crossEmb a) (crossEmb b)  [crossEmb : ImO →ₗ End, traceForm7 bilinear]
-- RHS(a,b) = -6 * gForm ↑a ↑b

-- Is traceForm7 (as A C ↦ trace(A*C)) bilinear? It's LinearMap.trace ℚ ImO (A*C). Build the bilinear map.
-- Approach: use LinearMap.trace which is linear; A*C is bilinear in (A,C); compose.

-- Test: can we reduce ∀ a b, P a b to basis via Basis.ext-style?
-- Build LHS as a bilinear form ImO →ₗ ImO →ₗ ℚ and RHS likewise, then Basis.ext_bilinear... 
-- Mathlib: LinearMap.ext_basis / Basis.ext. For bilinear: use bb.ext then bb.ext.

-- Simplest: prove ∀ a b, via `bb.ext` applied to the ℚ-linear map (fun a => (fun b => LHS) - (fun b => RHS)).
-- Let's just test the crossEmb linearity + traceForm7 bilinearity are available and the reduction closes.

example (a b : ImO) :
    traceForm7 (crossEmb a) (crossEmb b) = -6 * gForm (a : O ℚ) (b : O ℚ) := by
  -- reduce to basis bb (= bvec = ⟨imBasis, _⟩)
  -- LHS bilinear: crossEmb linear, then A ↦ trace(A * crossEmb b) linear, etc.
  -- Define φ a b := traceForm7 (crossEmb a)(crossEmb b) and ψ a b := -6 * gForm a b, both bilinear.
  -- Use Basis.ext twice.
  sorry

-- First just check the pieces exist:
#check @crossEmb          -- ImO →ₗ[ℚ] End
#check @LinearMap.trace
#check @Module.Basis.ext
example (M N : Module.End ℚ ImO) : traceForm7 M N = LinearMap.trace ℚ ImO (M * N) := rfl

-- crossEmb linearity:
example (a b : ImO) (r : ℚ) : crossEmb (r • a) = r • crossEmb a := by rw [map_smul]
example (a b : ImO) : crossEmb (a + b) = crossEmb a + crossEmb b := by rw [map_add]

end
end Phys.Algebra
