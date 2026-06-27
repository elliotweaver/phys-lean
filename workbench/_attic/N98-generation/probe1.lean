import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- CANDIDATE A: distinct-units two-sided generator sends real axis 1 to the product unit u·u'.
theorem probe_distinct_one (u u' : O Cut) :
    biMulFun u u' ((0 : Cut), (0 : Cut), (1 : O Cut)) = ((0 : Cut), (0 : Cut), u * u') := by
  simp only [biMulFun, one_mul]

-- CANDIDATE B: the 2-plane SWAP — sends the product unit u·u' back to 1.
-- (u·u')·u' = u·(u'·u') = u·(-1) = -u  [mul_mul_right, hsqu'], then u·(-u) = -(u·u) = 1 [hsqu].
theorem probe_distinct_prod (u u' : O Cut) (hsqu : u * u = -1) (hsqu' : u' * u' = -1) :
    biMulFun u u' ((0 : Cut), (0 : Cut), u * u') = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  simp only [biMulFun]
  have h : u * ((u * u') * u') = 1 := by
    rw [mul_mul_right u u', hsqu', mul_neg_one]
    rw [show u * -u = -(u * u) from mul_neg u u, hsqu, neg_neg]
  rw [h]

-- CANDIDATE membership: distinct biMulFun u u' ∈ genIsomMonoidC2 (Born units).
theorem probe_distinct_mem (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    (biMulFun u u' : Function.End STVC) ∈ genIsomMonoidC2 := by
  apply Submonoid.subset_closure
  apply Set.mem_union_right
  exact ⟨u, u', hu, hu', rfl⟩

-- CONCRETE: compute e₂·ιe₂ coordinates (to anchor W8 teeth). Probe its components.
theorem probe_e2_je2_value :
    (CD.e2 : O Cut) * (je2 : O Cut) = (CD.e2 : O Cut) * (je2 : O Cut) := rfl

-- W8 anchor candidate: read a coordinate of biMulFun e₂ ιe₂ (0,0,1) = (0,0, e₂·ιe₂).
-- need to see what e₂·ιe₂ is concretely. Let's check if it equals iota(iota(e2)) or similar.
#check @biMulFun_isom

end

end Phys.Algebra
