import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000
set_option maxHeartbeats 1000000

noncomputable section

-- Build LHS as a bundled bilinear form: T(A,C)=trace(A*C), then precompose both args with crossEmb.
-- traceBil : End →ₗ[ℚ] End →ₗ[ℚ] ℚ
def traceBil : Module.End ℚ ImO →ₗ[ℚ] Module.End ℚ ImO →ₗ[ℚ] ℚ :=
  LinearMap.compr₂ (LinearMap.mul ℚ (Module.End ℚ ImO)) (LinearMap.trace ℚ ImO)

theorem traceBil_apply (A C : Module.End ℚ ImO) : traceBil A C = traceForm7 A C := rfl

-- LHSbil a b = traceForm7 (crossEmb a)(crossEmb b)
def lhsBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ :=
  (traceBil.comp crossEmb).compl₂ crossEmb

theorem lhsBil_apply (a b : ImO) : lhsBil a b = traceForm7 (crossEmb a) (crossEmb b) := rfl

-- RHSbil = -6 • bornBil   (bornBil a b = gForm ↑a ↑b banked)
def rhsBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ := (-6 : ℚ) • (bornBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ)

theorem rhsBil_apply (a b : ImO) : rhsBil a b = -6 * gForm (a : O ℚ) (b : O ℚ) := by
  show (-6 : ℚ) • bornBil a b = _
  rw [bornBil_apply]; ring

-- The reduction: equal as bilinear forms iff equal on basis bb.
example : lhsBil = rhsBil := by
  apply Module.Basis.ext bb; intro i
  apply Module.Basis.ext bb; intro j
  sorry  -- goal: lhsBil (bb i)(bb j) = rhsBil (bb i)(bb j) -- to fill with the qI/gForm identity

#check @Module.Basis.ext
#check @LinearMap.compr₂
#check @LinearMap.compl₂
#check @LinearMap.mul

end
end Phys.Algebra
