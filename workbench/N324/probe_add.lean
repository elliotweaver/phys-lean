import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

/-- two-argument cos·cos Cauchy coefficient -/
def ccCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * cosTermC b kl.2

/-- two-argument sin·sin Cauchy coefficient -/
def ssCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * sinTermC b kl.2

theorem ccProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => cosTermC a p.1 * cosTermC b p.2) :=
  cut_summable_mul_of_abs (cosTermC_abs_summable a) (cosTermC_abs_summable b)

theorem ssProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => sinTermC a p.1 * sinTermC b p.2) :=
  cut_summable_mul_of_abs (sinTermC_abs_summable a) (sinTermC_abs_summable b)

theorem ccCoeff_summable (a b : Cut) : Summable (ccCoeff a b) :=
  summable_sum_mul_antidiagonal_of_summable_mul (ccProd_summable a b)

theorem ssCoeff_summable (a b : Cut) : Summable (ssCoeff a b) :=
  summable_sum_mul_antidiagonal_of_summable_mul (ssProd_summable a b)

/-- cutCos a * cutCos b = ∑'_N ccCoeff a b N -/
theorem cutCos_mul_cutCos (a b : Cut) : cutCos a * cutCos b = ∑' N, ccCoeff a b N := by
  unfold cutCos ccCoeff
  rw [(cosTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (cosTermC_summable b)
    (ccProd_summable a b)]

theorem cutSin_mul_cutSin (a b : Cut) : cutSin a * cutSin b = ∑' N, ssCoeff a b N := by
  unfold cutSin ssCoeff
  rw [(sinTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (sinTermC_summable b)
    (ssProd_summable a b)]

/-- The KEY per-N identity: cosTermC(a+b) N = ccCoeff a b N − ssCoeff a b (N-1),
    where ssCoeff at N=0 is treated by the (N+1) shift. Prove the shifted version:
    cosTermC(a+b)(N+1) = ccCoeff a b (N+1) − ssCoeff a b N, and the base
    cosTermC(a+b) 0 = ccCoeff a b 0. -/

-- base case
example (a b : Cut) : cosTermC (a+b) 0 = ccCoeff a b 0 := by
  unfold cosTermC ccCoeff
  simp [cosTermC]

end
end ContinuumQ
end Phys.Foundation
