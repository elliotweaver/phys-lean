import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- ===== PRODUCTION CANDIDATE SET (full dry-run) =====

-- 1. distinct-units generator carries the real axis 1 ↦ u·u' (a NEW product unit).
theorem N98_swap_one (u u' : O Cut) :
    biMulFun u u' ((0 : Cut), (0 : Cut), (1 : O Cut)) = ((0 : Cut), (0 : Cut), u * u') := by
  simp only [biMulFun, one_mul]

-- 2. distinct-units generator swaps the product unit back: u·u' ↦ 1.
theorem N98_swap_prod (u u' : O Cut) (hsqu : u * u = -1) (hsqu' : u' * u' = -1) :
    biMulFun u u' ((0 : Cut), (0 : Cut), u * u') = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  simp only [biMulFun]
  have h : u * ((u * u') * u') = 1 := by
    rw [mul_mul_right u u', hsqu', mul_neg_one]
    rw [show u * -u = -(u * u) from mul_neg u u, hsqu, neg_neg]
  rw [h]

-- 3. the product unit u·u' is itself a Born unit (gFormC = 1) when u,u' are.
theorem N98_prod_born (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    gFormC (u * u') (u * u') = 1 := by
  rw [gFormC_comp u u', hu, hu', mul_one]

-- 4. the distinct-units generator is a QvC-isometry (already banked biMulFun_isom; restate as ∈).
theorem N98_mem (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    (biMulFun u u' : Function.End STVC) ∈ genIsomMonoidC2 := by
  apply Submonoid.subset_closure
  apply Set.mem_union_right
  exact ⟨u, u', hu, hu', rfl⟩

-- 5. the order-2-on-the-real-axis: applying the generator twice fixes the real axis (the 2-plane
--    is genuinely order-2 there, even though the generator is not a global involution).
theorem N98_order2_one (u u' : O Cut) (hsqu : u * u = -1) (hsqu' : u' * u' = -1) :
    biMulFun u u' (biMulFun u u' ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  rw [N98_swap_one u u', N98_swap_prod u u' hsqu hsqu']

-- ===== CONCRETE W8 (e₂, ιe₂) =====

-- 6. the product unit e₂·ιe₂ lands OFF the real axis: its scalar (real) part is 0.
theorem N98_e2je2_offaxis : ((CD.e2 : O Cut) * (je2 : O Cut)).re.re.re = 0 := by
  simp [CD.e2, CD.iota]

-- 7. ★ W8 TEETH: the concrete generator carries the real axis to a unit whose nonzero coordinate
--    .im.im.re = -1 (distinct from N94's 1↦−1 on-axis and N95's 1↦1 fixed).
theorem N98_e2je2_coord :
    ((biMulFun (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut),(0:Cut),(1:O Cut))).2.2).im.im.re = -1 := by
  rw [N98_swap_one (CD.e2 : O Cut) (je2 : O Cut)]
  simp [CD.e2, CD.iota]

-- 8. concrete e₂,ιe₂ generator ∈ genIsomMonoidC2.
theorem N98_e2je2_mem :
    (biMulFun (CD.e2 : O Cut) (je2 : O Cut) : Function.End STVC) ∈ genIsomMonoidC2 :=
  N98_mem (CD.e2 : O Cut) (je2 : O Cut) e2_gFormC_self je2_gFormC_self

-- 9. concrete swap back, e₂,ιe₂.
theorem N98_e2je2_order2 :
    biMulFun (CD.e2 : O Cut) (je2 : O Cut)
        (biMulFun (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut),(0:Cut),(1:O Cut)))
      = ((0:Cut),(0:Cut),(1:O Cut)) :=
  N98_order2_one (CD.e2 : O Cut) (je2 : O Cut) biMulFun_e2_sq je2_sq

end

end Phys.Algebra
