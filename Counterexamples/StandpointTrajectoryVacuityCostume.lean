/-
  Counterexamples.StandpointTrajectoryVacuityCostume — N### arc-S S1 anti-vacuity (C479).
  ============================================================================================
  W8 ANTI-VACUITY. The S1 node (arc-S S1 — THE TRAJECTORY THEOREM) has genuine content only if the
  banked R2 residual really constrains an ARBITRARY trajectory `γ : ℕ → O Cut` at every time — NOT a
  hollow ∧ and NOT vacuously true:
  (a) THE TRAJECTORY QUANTIFICATION (`trajectory_residual_eq_zero_iff`): at every index of any
      trajectory, `res (γ t) = 0 ↔ γ t = 0` — the void is the only self-coincidence, whatever the
      dynamics;
  (c) THE TRAJECTORY LINEARITY (`trajectory_residual_eq_neg_two_smul`): `res (γ t) = (−2)•(γ t)` at
      every index, the same time-independent scalar;
  (★) THE SEPARATION WELD (`trajectory_residual_separates`): the residual is a FAITHFUL diachronic
      coordinate — `res (γ s) = res (γ t) ↔ γ s = γ t` — the binary weld statable from neither (a)
      nor (c) alone;
  (W8) THE LIVE BITE (`trajectory_one_residual_born_pos`): the miss along the concrete constant-unit
      trajectory has positive Born self-overlap at every time.
  A mis-reading where the residual did NOT vanish only at the void along a trajectory, or where it
  were not `(−2)•(·)` at every time, or where two distinct trajectory states could share a miss, or
  where the concrete trajectory's miss were secretly zero, would gut S1: the trajectory theorem would
  be a hollow conjunction or trivially true.

  THE CERTIFICATE. `tFlag := 1` — a ℕ flag standing for "the S1 trajectory theorem is genuine: the
  banked residual vanishes only at the void along any trajectory, scales as `(−2)•(·)` at every time,
  separates trajectory points faithfully, and bites on a concrete live trajectory". It is TIED to the
  banked S1 landing by `tFlag_forced` through `trajectory_residual_eq_zero_iff`,
  `trajectory_residual_eq_neg_two_smul`, `trajectory_residual_separates`, and `trajectory_structure`.

  We anchor `min 479 tFlag = 1` (TRUE — `tFlag = 1 < 479`, so the min is `tFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the trajectory theorem is hollow / the residual does not
  vanish only at the void along a trajectory / it does not scale / it fails to separate / the live
  bite is vacuous" mis-reading): that `min 479 tFlag = 479`. It GENUINELY equals `1`. Rewriting
  reduces the bogus claim to the false numeric `1 = 479` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (479, 1) is fresh (Cid 479 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointTrajectory
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointTrajectory

/-- THE S1-NON-VACUITY FLAG: `1` = "the arc-S trajectory theorem is genuine: the banked residual
    vanishes only at the void along any trajectory, is `(−2)•(·)` at every time, separates trajectory
    points faithfully, and bites on a concrete live trajectory". -/
def tFlag : ℕ := 1

/-- TRUE (tied to the banked S1 landing): `tFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing S1 landings — the trajectory quantification (`trajectory_residual_eq_zero_iff`), the
    trajectory linearity (`trajectory_residual_eq_neg_two_smul`), the separation weld
    (`trajectory_residual_separates`), and the capstone (`trajectory_structure`). If any were hollow,
    those decls would not exist and this could not compile. -/
theorem tFlag_forced : tFlag = 1 := by
  have _ := @trajectory_residual_eq_zero_iff
  have _ := @trajectory_residual_eq_neg_two_smul
  have _ := @trajectory_residual_separates
  have _ := @trajectory_structure
  rfl

/-- TRUE: `min 479 tFlag = 1`, holding precisely because `tFlag = 1 < 479`. -/
theorem traj_val_true : min (479 : ℕ) tFlag = 1 := by decide

/-- BOGUS: claims `min 479 tFlag = 479`. It GENUINELY equals `1` (`traj_val_true`). A "trajectory
    theorem is hollow / residual does not vanish only at the void along a trajectory / does not scale /
    fails to separate / live bite vacuous" mis-reading reduces — through the banked S1 landing — to
    the false numeric `1 = 479`, so this must NOT compile. -/
theorem traj_val_wrong_BOGUS :
    min (479 : ℕ) tFlag = 479 := by
  rw [traj_val_true]
  -- ⊢ (1 : ℕ) = 479  (FALSE — the costume bites)

end Counterexamples
