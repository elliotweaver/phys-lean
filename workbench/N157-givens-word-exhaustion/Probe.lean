import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## MEASURE-FIRST PROBE A — is `JoinedIdC` VACUOUS (true for every operator)?
    The linear segment `seg g t := (1-t)•1 + t•g` from 1 (t=0) to g (t=1), continuous in `endOpC`,
    with preconnected image. If this typechecks, `JoinedIdC g` holds for ARBITRARY g — the whole
    "path-connectedness" predicate is the connectedness of the AMBIENT vector space, with no
    isometry constraint, i.e. VACUOUS as a statement about the isometry group. -/

def segLin (g : Module.End Cut STVC) (t : Cut) : Module.End Cut STVC :=
  (1 - t) • (1 : Module.End Cut STVC) + t • g

theorem segLin_cont (g : Module.End Cut STVC) : Continuous (segLin g) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun t => (segLin g t) v) = (fun t => (1 - t) • v + t • (g v)) := by
    funext t
    rw [segLin]
    simp [LinearMap.add_apply, LinearMap.smul_apply]
  rw [hrw]
  exact (continuous_const.sub continuous_id).smul continuous_const
    |>.add (continuous_id.smul continuous_const)

theorem segLin_zero (g : Module.End Cut STVC) : segLin g 0 = 1 := by
  rw [segLin]; simp

theorem segLin_one (g : Module.End Cut STVC) : segLin g 1 = g := by
  rw [segLin]; simp

/-- ★ THE VACUITY WITNESS — EVERY operator is `JoinedIdC`. -/
theorem joinedIdC_everything (g : Module.End Cut STVC) : JoinedIdC g := by
  refine ⟨segLin g '' (Set.uIcc 0 1), (isPreconnected_uIcc).image _ (segLin_cont g).continuousOn,
    ?_, ?_⟩
  · exact ⟨0, Set.left_mem_uIcc, segLin_zero g⟩
  · exact ⟨1, Set.right_mem_uIcc, segLin_one g⟩

end

end Phys.Algebra

-- axiom check
#print axioms Phys.Algebra.joinedIdC_everything
