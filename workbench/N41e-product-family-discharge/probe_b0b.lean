import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

def coordSum (w : O Cut) : Cut := ∑ i, |coordOCut w i|

-- abstract per-coordinate bound at m=0, with Cu/Cv opaque + 8 term bounds as linear hints.
set_option linter.unusedSimpArgs false in
example (u v : O Cut) :
    |coordOCut (u * v) 0| ≤ 8 * (coordSum u * coordSum v) := by
  have hu : ∀ i : Fin 8, |coordOCut u i| ≤ coordSum u := fun i =>
    Finset.single_le_sum (f := fun i => |coordOCut u i|) (fun _ _ => abs_nonneg _) (Finset.mem_univ i)
  have hv : ∀ j : Fin 8, |coordOCut v j| ≤ coordSum v := fun j =>
    Finset.single_le_sum (f := fun j => |coordOCut v j|) (fun _ _ => abs_nonneg _) (Finset.mem_univ j)
  -- the 8 coordinate values as named reals; bound each |u_i| and |v_j| by Cu, Cv
  -- expand coord 0
  rw [show coordOCut (u * v) 0 = (u * v).re.re.re from by simp [coordOCut, e0]]
  -- (u*v).re.re.re reduces to an 8-term signed poly in projections.
  simp only [CD.mul_re, CD.add_re, CD.neg_re, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.add_re, Dbl.neg_re, Dbl.star_re', Dbl.star_im']
  -- now goal: |8-term signed poly of projections| ≤ 8*(Cu*Cv)
  trace_state
  sorry

end
end Phys.Algebra
