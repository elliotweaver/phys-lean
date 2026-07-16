import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- KEY STRUCTURAL FACT: the scalar-curvature gradient IS the fiber trace of the Ricci-endomorphism
    derivative. `R(τ) = trace(ricciRaiseMap(Gτ))`, and trace is linear+continuous, so the scalar
    derivative dR equals `trace(dRic)`. This ties the two sides of the twice-contracted Bianchi
    to ONE operator `dRic`: `∂_ν R = trace(dRic)`, `∇^μ Ric_μν = divCov(dRic)`. -/

-- test: if fun τ => ricciRaiseMap (G τ) has op-derivative dRic, does fun τ => ricciScalar (G τ)
-- = trace ∘ (that) have scalar-derivative trace(dRic)?

-- trace as a continuous linear functional; op-derivative reduces per-vector; need trace continuity.
-- ricciScalar G = LinearMap.trace Cut STVC (ricciRaiseMap G). So ricciScalar (G τ) = trace (E τ)
-- where E τ = ricciRaiseMap (G τ). If HasOpDerivAt0 E dRic, is CutHasDerivAt (trace ∘ E) (trace dRic) 0?

example (E : Cut → MetricEnd) (dRic : MetricEnd) (h : HasOpDerivAt0 E dRic) :
    CutHasDerivAt (fun τ => LinearMap.trace Cut STVC (E τ)) (LinearMap.trace Cut STVC dRic) 0 := by
  unfold CutHasDerivAt HasOpDerivAt0 at *
  have hcongr : (fun s : Cut => s⁻¹ * ((fun τ => LinearMap.trace Cut STVC (E τ)) (0 + s)
        - (fun τ => LinearMap.trace Cut STVC (E τ)) 0))
      = (fun s : Cut => LinearMap.trace Cut STVC (s⁻¹ • (E s - E 0))) := by
    funext s
    simp only [zero_add]
    rw [← map_sub, map_smul, smul_eq_mul]
  rw [hcongr]
  have hcont : Continuous (⇑(LinearMap.trace Cut STVC)) :=
    (LinearMap.trace Cut STVC).continuous_of_finiteDimensional
  exact (hcont.tendsto dRic).comp h

end

end Phys.Algebra
