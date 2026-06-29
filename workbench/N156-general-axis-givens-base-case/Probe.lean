import Phys.Algebra.LorentzContinuumCompactPathConnected
import Phys.Algebra.LorentzContinuumGenerationExhaustionAssembly

/-! N156 PROBE — the general-axis Givens base case for JoinedIdC. -/

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE GENERAL-AXIS ROTATION PATH: `axisRotPath e m := axisRotLin e (cayleyC m) (cayleyS m)`. -/
def axisRotPath (e : O Cut) (m : Cut) : Module.End Cut STVC :=
  axisRotLin e (cayleyC m) (cayleyS m)

/-- The general-axis rotation path is continuous in `endOpC` (the `gFormC v e` functional is a
    fixed continuous-in-`m`-free constant; only `cayleyC`/`cayleyS` vary). -/
theorem axisRotPath_cont (e : O Cut) : Continuous (axisRotPath e) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (axisRotPath e m) v)
      = (fun m => (v.1, cayleyC m * v.2.1 - cayleyS m * gFormC v.2.2 e,
          v.2.2 + (cayleyS m * v.2.1 + (cayleyC m - 1) * gFormC v.2.2 e) • e)) := by
    funext m; rw [axisRotPath, axisRotLin_apply]
  rw [hrw]
  apply Continuous.prodMk continuous_const
  apply Continuous.prodMk
  · exact (cayleyC_continuous.mul continuous_const).sub (cayleyS_continuous.mul continuous_const)
  · apply Continuous.add continuous_const
    apply Continuous.smul _ continuous_const
    exact (cayleyS_continuous.mul continuous_const).add
      ((cayleyC_continuous.sub continuous_const).mul continuous_const)

/-- `axisRotPath e 0 = 1`. -/
theorem axisRotPath_zero (e : O Cut) : axisRotPath e 0 = 1 := by
  rw [axisRotPath, cayleyC_zero, cayleyS_zero, axisRotLin_one_zero]

/-- The path is a `QvC`-isometry at every point, for a unit axis. -/
theorem axisRotPath_isQvIsomC (e : O Cut) (he : gFormC e e = 1) (m : Cut) :
    IsQvIsomC (axisRotPath e m) := by
  rw [axisRotPath]
  exact axisRotLin_isQvIsomC e he (cayleyC m) (cayleyS m) (cayley_on_circle m)

/-- The path reaches an arbitrary general-axis rotation. -/
theorem axisRotPath_reaches (e : O Cut) (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    axisRotPath e (s/(1+c)) = axisRotLin e c s := by
  obtain ⟨hC, hS⟩ := cayley_surj c s h hc
  rw [axisRotPath, hC, hS]

/-- The image on a closed interval is preconnected. -/
theorem axisRotPath_image_preconnected (e : O Cut) (m : Cut) :
    IsPreconnected (axisRotPath e '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ (axisRotPath_cont e).continuousOn

/-- ★ THE GENERAL-AXIS BASE CASE — every unit-axis Givens rotation `axisRotLin e c s` (unit axis
    `gFormC e e = 1`, circle point `c²+s²=1`, off the antipode `1+c≠0`) is `JoinedIdC`. -/
theorem joinedIdC_axisRotLin (e : O Cut) (he : gFormC e e = 1) (c s : Cut)
    (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) : JoinedIdC (axisRotLin e c s) := by
  refine ⟨axisRotPath e '' (Set.uIcc 0 (s/(1+c))), axisRotPath_image_preconnected e _, ?_, ?_⟩
  · exact ⟨0, Set.left_mem_uIcc, axisRotPath_zero e⟩
  · exact ⟨s/(1+c), Set.right_mem_uIcc, axisRotPath_reaches e c s h hc⟩

/-- The general-axis quarter-turn is `JoinedIdC` (`c=0`, `1+0≠0`). -/
theorem joinedIdC_axisRotLin_quarterTurn (e : O Cut) (he : gFormC e e = 1) :
    JoinedIdC (axisRotLin e (0:Cut) 1) := by
  apply joinedIdC_axisRotLin e he
  · ring
  · norm_num

/-- ★ W8 — the GENERAL-AXIS antipode half-turn `axisRotLin e (-1) 0` (NOT the real axis, NOT
    reachable by the single Cayley chart, `1+(-1)=0`) IS `JoinedIdC` — the product of two
    general-axis quarter-turns via the same-axis angle-addition law `axisRotLin_comp_same_axis`. -/
theorem joinedIdC_axisRotLin_halfTurn (e : O Cut) (he : gFormC e e = 1) :
    JoinedIdC (axisRotLin e (-1:Cut) 0) := by
  have hmul : axisRotLin e (0:Cut) 1 * axisRotLin e (0:Cut) 1 = axisRotLin e (-1:Cut) 0 := by
    rw [axisRotLin_comp_same_axis e he]; congr 1 <;> ring
  rw [← hmul]
  exact joinedIdC_mul (joinedIdC_axisRotLin_quarterTurn e he) (joinedIdC_axisRotLin_quarterTurn e he)

#print axioms joinedIdC_axisRotLin
#print axioms joinedIdC_axisRotLin_halfTurn

end
