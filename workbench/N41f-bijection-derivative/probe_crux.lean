import Phys.Algebra.DerivationOProductPreserving

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- CRUX PROBE: the tsum intertwining coordOCut (expO D x) = expMap (derivMatrix D') *ᵥ coordOCut x
-- This is the only W9-exposed piece. MEASURE it.
theorem coordOCut_expO (D' : Module.End Cut (O Cut)) (x : O Cut) :
    coordOCut (expO (D'.restrictScalars ℤ) x)
      = expMap (derivMatrix D') *ᵥ coordOCut x := by
  -- HasSum side: expO is the tsum, summable by expO_summable_restrict
  have hsum : HasSum (fun n => (1 / (n.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ n) x))
      (expO (D'.restrictScalars ℤ) x) := by
    unfold expO
    exact (expO_summable_restrict D' x).hasSum
  -- map by continuous coordOCut
  have hmap := hsum.map (coordOCut.toLinearMap.toAddMonoidHom) coordOCut_continuous
  -- the mapped terms equal the matrix exp terms applied to v
  have hterm : (fun n => coordOCut ((1 / (n.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ n) x)))
      = (fun n => expTerm (derivMatrix D') n *ᵥ coordOCut x) := by
    funext n
    rw [restrictScalars_pow_apply, expO_term_coord]
  -- the matrix side HasSums to expMap M *ᵥ v
  have hmat : HasSum (fun n => expTerm (derivMatrix D') n *ᵥ coordOCut x)
      (expMap (derivMatrix D') *ᵥ coordOCut x) := by
    have := (expMap_hasSum (derivMatrix D')).map (mulVecHom (coordOCut x))
      (mulVecHom_continuous (coordOCut x))
    simpa [mulVecHom] using this
  -- conclude by uniqueness of sums
  have hmap' : HasSum (fun n => expTerm (derivMatrix D') n *ᵥ coordOCut x)
      (coordOCut (expO (D'.restrictScalars ℤ) x)) := by
    have := hmap
    simp only [LinearMap.toAddMonoidHom_coe, LinearEquiv.coe_coe, Function.comp_def] at this
    rw [hterm] at this
    exact this
  exact hmap'.unique hmat

end
end Phys.Algebra
