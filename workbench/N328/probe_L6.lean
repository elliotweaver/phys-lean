import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset Topology
open scoped Topology BigOperators

noncomputable section

-- Bring in the two crux limits as hypotheses to measure the ASSEMBLY only.
-- crux1 : Tendsto (fun t => t⁻¹ * cutSin t) (𝓝[≠] 0) (𝓝 1)
-- crux2 : Tendsto (fun t => t⁻¹ * (cutCos t - 1)) (𝓝[≠] 0) (𝓝 0)

-- The difference quotient of cutSin at x, via the addition formula:
--   cutSin(x+h) - cutSin x = cutSin x cutCos h + cutCos x cutSin h - cutSin x
--                          = cutSin x (cutCos h - 1) + cutCos x cutSin h
--   /h : cutSin x * ((cutCos h - 1)/h) + cutCos x * (cutSin h / h)
--   → cutSin x * 0 + cutCos x * 1 = cutCos x

theorem cutSin_hasDeriv_assembly
    (crux1 : Tendsto (fun t : Cut => t⁻¹ * cutSin t) (𝓝[≠] (0:Cut)) (𝓝 1))
    (crux2 : Tendsto (fun t : Cut => t⁻¹ * (cutCos t - 1)) (𝓝[≠] (0:Cut)) (𝓝 0))
    (x : Cut) :
    Tendsto (fun h : Cut => h⁻¹ * (cutSin (x + h) - cutSin x)) (𝓝[≠] (0:Cut)) (𝓝 (cutCos x)) := by
  -- rewrite the difference quotient using the addition formula
  have hrw : (fun h : Cut => h⁻¹ * (cutSin (x + h) - cutSin x))
      = (fun h : Cut => cutSin x * (h⁻¹ * (cutCos h - 1)) + cutCos x * (h⁻¹ * cutSin h)) := by
    funext h
    rw [cutSin_add]
    ring
  rw [hrw]
  have t1 : Tendsto (fun h : Cut => cutSin x * (h⁻¹ * (cutCos h - 1)))
      (𝓝[≠] (0:Cut)) (𝓝 (cutSin x * 0)) := crux2.const_mul _
  have t2 : Tendsto (fun h : Cut => cutCos x * (h⁻¹ * cutSin h))
      (𝓝[≠] (0:Cut)) (𝓝 (cutCos x * 1)) := crux1.const_mul _
  have := t1.add t2
  simpa using this

end
end ContinuumQ
end Phys.Foundation
