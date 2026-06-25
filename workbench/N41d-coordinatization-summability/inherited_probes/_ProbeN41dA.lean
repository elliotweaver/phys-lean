import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- LEMMA A: each coordinate of the exp series is abs-summable.
example (D' : Module.End Cut (O Cut)) (x : O Cut) (i : Fin 8) :
    Summable (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|) := by
  have hcongr : (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|)
      = (fun k => |∑ p, expTerm (derivMatrix D') k i p * (coordOCut x) p|) := by
    funext k; rw [expO_term_coord]; rfl
  rw [hcongr]
  -- bound |∑ p, ...| by ∑ p |...|, summable
  apply cut_summable_of_nonneg_of_le (fun k => abs_nonneg _)
    (g := fun k => ∑ p, |expTerm (derivMatrix D') k i p * (coordOCut x) p|)
    (fun k => Finset.abs_sum_le_sum_abs _ _)
  apply summable_sum
  intro p _
  -- |entry * const| = |entry| * |const|, summable since |entry| summable (N40 expTerm_entry_abs_summable)
  have h := expTerm_entry_abs_summable (derivMatrix D') i p
  have : (fun k => |expTerm (derivMatrix D') k i p * (coordOCut x) p|)
      = (fun k => |expTerm (derivMatrix D') k i p| * |(coordOCut x) p|) := by
    funext k; rw [abs_mul]
  rw [this]
  exact h.mul_right _

end
