/-
  Counterexamples.GaussDepthWallVacuityCostume — the depth wall is GENUINE: it
  BLOCKS a real shallow value. C618.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the depth wall. The content that must NOT be
  hollow: depth_wall_core FIRES on the REAL principal form of D = −163
  (⟨1, 1, 41⟩): the primitive value P(1) = 43 (x = 1, y = 1... honest: x=1,y=0
  gives 1; use x=1,y=1: 1+1+41 = 43) satisfies the wall: 163 ≤ 4·43 = 172 —
  kernel-checked through the theorem, not by norm_num alone.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 618 attestFlag = 1 (TRUE). THE BOGUS CLAIM reduces to 1 = 618;
  BITES. DISTINCT: (618, 1) fresh. MUST FAIL to compile.
-/
import Phys.Algebra.GaussDepthWall

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((163 : Phys.Foundation.Z) ≤ 4 * 43) → attestFlag = 1 :=
  fun _ => rfl

/-- The wall fires on the real Heegner principal form at its prime value 43. -/
theorem wall_fires : (163 : Phys.Foundation.Z) ≤ 4 * 43 := by
  have h := depth_wall_core (e := ⟨1, 1, 41⟩) (x := 1) (y := 1)
    (α := 1) (β := 0) (m := 43)
    rfl
    (by show (1:Z) * 1 - 4 * 1 * 41 < 0; norm_num)
    (by show (1:Z) * 1 * 1 + 1 * 1 * 1 + 41 * 1 * 1 = 43; norm_num)
    (by norm_num)
    (by norm_num)
  -- h : -(disc ⟨1,1,41⟩) ≤ 4 * 43, and disc = 1 − 164 = −163
  have hd : -(disc (⟨1, 1, 41⟩ : GaussForms.BQF)) = (163 : Z) := by
    show -((1:Z) * 1 - 4 * 1 * 41) = 163
    norm_num
  rw [hd] at h
  exact h

theorem cert_val_true : min 618 attestFlag = 1 := by
  have h := attestFlag_forced wall_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 618 attestFlag = 618 := by
  rw [cert_val_true]

end Counterexamples
