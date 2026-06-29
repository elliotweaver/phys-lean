import Phys.Algebra.LorentzContinuumSO9CompactAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- SMALLEST SUB-OBLIGATION: t-slot vanishing from BvC alone (NO EvC).
theorem timeFixing_xaxis_time_zero {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    (k ((0:Cut), (1:Cut), (0:O Cut))).1 = 0 := by
  have h := linIsom_BvC_preserved hk ((0:Cut), (1:Cut), (0:O Cut)) ((1:Cut), (0:Cut), (0:O Cut))
  rw [htime] at h
  simp only [BvC, gFormC_zero_right', mul_one, mul_zero, sub_zero, zero_mul, zero_sub] at h
  linarith [h]

theorem timeFixing_xaxis_spatial_form {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    k ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (k ((0:Cut), (1:Cut), (0:O Cut))).2.1,
          (k ((0:Cut), (1:Cut), (0:O Cut))).2.2) := by
  have h0 := timeFixing_xaxis_time_zero hk htime
  apply Prod.ext
  · exact h0
  · rfl

-- THE ASSEMBLY (EvC-free): feed the BvC-derived spatial form into N163's _aux.
theorem joinedIdQvC_of_timeFixing_SO9 {k : Module.End Cut STVC}
    (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1) :
    JoinedIdQvC k := by
  have himg := timeFixing_xaxis_spatial_form hk htime
  exact joinedIdQvC_of_timeFixing_evCOrth_SO9_aux hk htime himg hv hdet

end

end Phys.Algebra
