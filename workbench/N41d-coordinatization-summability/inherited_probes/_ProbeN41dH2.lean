import Phys.Algebra.DerivationOExpSummable
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- (1) abs-summability of each coordinate sequence of the exp series.
-- e_i(f k) = (expTerm M k *ᵥ coordOCut x) i = ∑_p expTerm M k i p * (coordOCut x) p.
-- abs-summable: finite sum of |expTerm entry|-summable times const.
example (D' : Module.End Cut (O Cut)) (x : O Cut) (i : Fin 8) :
    Summable (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|) := by
  have hcongr : (fun k => |(coordOCut ((1 / (k.factorial : Cut)) • ((D' ^ k) x))) i|)
      = (fun k => |(expTerm (derivMatrix D') k *ᵥ coordOCut x) i|) := by
    funext k; rw [expO_term_coord]
  rw [hcongr]
  -- (expTerm M k *ᵥ v) i = ∑ p, expTerm M k i p * v p
  have hmv : (fun k => |(expTerm (derivMatrix D') k *ᵥ coordOCut x) i|)
      = (fun k => |∑ p, expTerm (derivMatrix D') k i p * (coordOCut x) p|) := by
    funext k; rfl
  rw [hmv]
  -- summable since |∑| ≤ ∑|·|, each |entry * const| summable
  sorry

-- (2) does cut_summable_mul_of_abs feed the product family per coordinate? Check Finset.sum_mul_sum
example (a b : O Cut) :
    a * b = ∑ j, ∑ m, ((coordOCut a j) * (coordOCut b m)) •
      ((coordOCut.symm (Pi.single j 1)) * (coordOCut.symm (Pi.single m 1))) := by
  sorry

end
