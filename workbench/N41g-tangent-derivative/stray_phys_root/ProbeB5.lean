import Phys.Algebra.DerivationOAutomorphism
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology
noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- assume the proved pieces
variable (vector_tangent : ∀ (M : Matrix (Fin 8) (Fin 8) Cut) (v : Fin 8 → Cut),
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • M) *ᵥ v - v))
      (𝓝[≠] (0 : Cut)) (𝓝 (M *ᵥ v)))
variable (dM_smul : ∀ (t : Cut) (D' : Module.End Cut (O Cut)),
    derivMatrix (t • D') = t • derivMatrix D')

-- coordOCut of the smul-exp
example (t : Cut) (D' : Module.End Cut (O Cut)) (x : O Cut) :
    coordOCut (expO ((t • D').restrictScalars ℤ) x)
      = expMap (t • derivMatrix D') *ᵥ coordOCut x := by
  rw [coordOCut_expO, dM_smul]

-- coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x  (n=1)
example (D' : Module.End Cut (O Cut)) (x : O Cut) :
    coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x := by
  have h := expO_matrix_rep D' 1 x
  simpa using h

-- THE TRANSPORT: coordOCut is a homeomorphism (continuous + symm continuous), linear.
-- want: Tendsto (fun t => t⁻¹ • (expO((t•D').restrict) x - x)) (𝓝[≠]0) (𝓝 (D' x))
example (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x))
      (𝓝[≠] (0 : Cut)) (𝓝 (D' x)) := by
  -- coordOCut is a homeomorphism
  have hhomeo : Filter.Tendsto coordOCut (𝓝 (D' x)) (𝓝 (coordOCut (D' x))) :=
    coordOCut_continuous.tendsto _
  -- It suffices to prove the image Tendsto and pull back by coordOCut.symm continuity.
  -- Use: coordOCut ∘ (diff quotient) → coordOCut (D' x), then apply symm.
  have himg : Tendsto (fun t : Cut => coordOCut (t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (coordOCut (D' x))) := by
    have hrw : (fun t : Cut => coordOCut (t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x)))
        = (fun t : Cut => t⁻¹ • (expMap (t • derivMatrix D') *ᵥ coordOCut x - coordOCut x)) := by
      funext t
      rw [map_smul, map_sub, coordOCut_expO, dM_smul]
    rw [hrw]
    have htgt : coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x := by
      have h := expO_matrix_rep D' 1 x; simpa using h
    rw [htgt]
    exact vector_tangent (derivMatrix D') (coordOCut x)
  -- pull back: apply coordOCut.symm (continuous), and coordOCut.symm (coordOCut y) = y
  have := (coordOCut_symm_continuous.tendsto (coordOCut (D' x))).comp himg
  simp only [Function.comp_def, LinearEquiv.symm_apply_apply] at this
  exact this

end
end Phys.Algebra
