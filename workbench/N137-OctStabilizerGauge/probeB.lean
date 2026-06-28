import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle

namespace Phys.Algebra.N137ProbeB

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- copy of the stabilizer predicate -/
def IsOctStab (S : Module.End Cut STVC) : Prop :=
  IsBvIsomLin S ∧ S mTimeUnit = mTimeUnit ∧ S mSpaceUnit = mSpaceUnit

/-! ## THE SECTION: the octonion-block embedding lands in the stabilizer. -/

theorem octBlockEndC_fixes_mTimeUnit (R : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC R (mTimeUnit : STVC) = mTimeUnit := by
  rw [octBlockEndC_apply]
  show ((1:Cut), (0:Cut), R (0 : O Cut)) = mTimeUnit
  rw [map_zero]; rfl

theorem octBlockEndC_fixes_mSpaceUnit (R : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC R (mSpaceUnit : STVC) = mSpaceUnit := by
  rw [octBlockEndC_apply]
  show ((0:Cut), (1:Cut), R (0 : O Cut)) = mSpaceUnit
  rw [map_zero]; rfl

/-- ★ THE SECTION: `octBlockEndC R` (for `R` a `gFormC`-isometry) is in the octonion-block
    stabilizer — it is a `BvC`-isometry (N129) fixing the (t,x) plane. The gauge group embeds. -/
theorem octBlockEndC_mem_octStab {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsOctStab (octBlockEndC R) :=
  ⟨octBlockEndC_isBvIsomLin hR, octBlockEndC_fixes_mTimeUnit R, octBlockEndC_fixes_mSpaceUnit R⟩

/-! ## W8 — a concrete non-identity gauge element. -/

/-- W8: the concrete gauge element `octBlockEndC (houseHolder e2)` GENUINELY MOVES the octonion
    axis `e2 → −e2` (`houseHolder_neg_self`, `gFormC e2 e2 = 1 ≠ 0`) — non-vacuous. -/
theorem octStab_witness_moves :
    octBlockEndC (houseHolder (CD.e2 : O Cut)) ((0, 0, (CD.e2 : O Cut)) : STVC)
      = (0, 0, -(CD.e2 : O Cut)) := by
  rw [octBlockEndC_apply]
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show houseHolder (CD.e2 : O Cut) (CD.e2 : O Cut) = -(CD.e2 : O Cut)
  exact houseHolder_neg_self (by rw [e2_gFormC_self]; norm_num)

/-- W8 TEETH: the concrete gauge element is in the stabilizer (a real internal-symmetry element). -/
theorem octStab_witness_mem :
    IsOctStab (octBlockEndC (houseHolder (CD.e2 : O Cut))) :=
  octBlockEndC_mem_octStab (houseHolder_isom (by rw [e2_gFormC_self]; norm_num))

/-- W8 TEETH: the gauge element preserves the octonion-block self-overlap of `e2`, reading `1`
    (`gFormC e2 e2 = 1`) — the costume anchor. -/
theorem octStab_witness_self_overlap :
    gFormC (octBlockEndC (houseHolder (CD.e2 : O Cut)) ((0, 0, (CD.e2 : O Cut)) : STVC)).2.2
           (octBlockEndC (houseHolder (CD.e2 : O Cut)) ((0, 0, (CD.e2 : O Cut)) : STVC)).2.2 = 1 := by
  rw [octStab_witness_moves]
  show gFormC (-(CD.e2 : O Cut)) (-(CD.e2 : O Cut)) = 1
  rw [gFormC_neg_left, octRefl_gFormC_neg_right, e2_gFormC_self]; norm_num

end

end Phys.Algebra.N137ProbeB
