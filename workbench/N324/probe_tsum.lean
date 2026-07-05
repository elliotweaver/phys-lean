import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

def ccCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * cosTermC b kl.2
def ssCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * sinTermC b kl.2

axiom ccProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => cosTermC a p.1 * cosTermC b p.2)
axiom ssProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => sinTermC a p.1 * sinTermC b p.2)
axiom ccCoeff_summable (a b : Cut) : Summable (ccCoeff a b)
axiom ssCoeff_summable (a b : Cut) : Summable (ssCoeff a b)
axiom cutCos_mul_cutCos (a b : Cut) : cutCos a * cutCos b = ∑' N, ccCoeff a b N
axiom cutSin_mul_cutSin (a b : Cut) : cutSin a * cutSin b = ∑' N, ssCoeff a b N
axiom cosTermC_add_succ (a b : Cut) (N : ℕ) :
    cosTermC (a + b) (N + 1) = ccCoeff a b (N + 1) - ssCoeff a b N
axiom cosTermC_add_zero (a b : Cut) : cosTermC (a + b) 0 = ccCoeff a b 0

/-- ADDITION FORMULA: cutCos(a+b) = cutCos a cutCos b − cutSin a cutSin b. -/
theorem cutCos_add (a b : Cut) :
    cutCos (a + b) = cutCos a * cutCos b - cutSin a * cutSin b := by
  rw [cutCos_mul_cutCos, cutSin_mul_cutSin]
  -- cutCos(a+b) = ∑' cosTermC(a+b)
  have hsum : cutCos (a + b) = cosTermC (a + b) 0 + ∑' N, cosTermC (a + b) (N + 1) := by
    unfold cutCos; exact (cosTermC_summable (a + b)).tsum_eq_zero_add
  rw [hsum, cosTermC_add_zero]
  -- ∑' N, cosTermC(a+b)(N+1) = ∑' N, (ccCoeff(N+1) - ssCoeff N)
  have hcongr : (fun N => cosTermC (a + b) (N + 1)) = fun N => ccCoeff a b (N + 1) - ssCoeff a b N := by
    funext N; exact cosTermC_add_succ a b N
  rw [hcongr]
  -- shifted summability
  have hccshift : Summable (fun N => ccCoeff a b (N + 1)) :=
    (ccCoeff_summable a b).comp_injective (add_left_injective 1)
  have hsplit : (∑' N, (ccCoeff a b (N + 1) - ssCoeff a b N))
      = (∑' N, ccCoeff a b (N + 1)) - ∑' N, ssCoeff a b N :=
    hccshift.tsum_sub (ssCoeff_summable a b)
  rw [hsplit]
  -- ccCoeff 0 + ∑' ccCoeff(N+1) = ∑' ccCoeff
  have hccfull : ccCoeff a b 0 + ∑' N, ccCoeff a b (N + 1) = ∑' N, ccCoeff a b N :=
    ((ccCoeff_summable a b).tsum_eq_zero_add).symm
  rw [← add_sub_assoc, hccfull]

end
end ContinuumQ
end Phys.Foundation
