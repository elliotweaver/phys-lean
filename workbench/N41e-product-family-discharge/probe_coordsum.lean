import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- BUILDING BLOCK: each coordinate sequence k ↦ |coordOCut ((1/k!)•((D'^k) x)) i| is summable.
-- coordOCut ((1/k!)•((D'^k) x)) = expTerm (derivMatrix D') k *ᵥ coordOCut x   (banked expO_term_coord)
-- so (coordOCut a_k) i = ∑_p (expTerm M k) i p * (coordOCut x) p
-- |..| ≤ ∑_p |(expTerm M k) i p| * |(coordOCut x) p|, each summable (expTerm_entry_abs_summable).
example (D' : Module.End Cut (O Cut)) (x : O Cut) (i : Fin 8) :
    Summable (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|) := by
  -- rewrite coordOCut term
  have hrw : (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|)
      = (fun k => |((expTerm (derivMatrix D') k) *ᵥ (coordOCut x)) i|) := by
    funext k; rw [expO_term_coord]
  rw [hrw]
  -- mulVec entry = ∑_p M_{ip} * x_p
  have hentry : (fun k => |((expTerm (derivMatrix D') k) *ᵥ (coordOCut x)) i|)
      = (fun k => |∑ p, (expTerm (derivMatrix D') k) i p * (coordOCut x) p|) := by
    funext k; rw [Matrix.mulVec]; rfl
  rw [hentry]
  -- comparison: |∑_p ...| ≤ ∑_p |M_ip||x_p|, summable as finite sum of (expTerm_entry_abs_summable * const)
  apply cut_summable_of_nonneg_of_le (fun k => abs_nonneg _)
    (g := fun k => ∑ p, |(expTerm (derivMatrix D') k) i p| * |(coordOCut x) p|)
  · intro k
    calc |∑ p, (expTerm (derivMatrix D') k) i p * (coordOCut x) p|
        ≤ ∑ p, |(expTerm (derivMatrix D') k) i p * (coordOCut x) p| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ p, |(expTerm (derivMatrix D') k) i p| * |(coordOCut x) p| := by
          apply Finset.sum_congr rfl; intro p _; rw [abs_mul]
  · apply summable_sum
    intro p _
    exact (expTerm_entry_abs_summable (derivMatrix D') i p).mul_right _

end
end Phys.Algebra
