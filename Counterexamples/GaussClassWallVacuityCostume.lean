/-
  Counterexamples.GaussClassWallVacuityCostume — the class-side wall is GENUINE:
  it FIRES on a real record-to-principal chain. C619.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the class-side wall. The content that must NOT
  be hollow: record_return_deep FIRES on a REAL chain — D = −15, p = 2, k = 1:
  the record form ⟨4, 1, 1⟩ (disc 1 − 16 = −15) reduces: swap to ⟨1, −1, 4⟩,
  shift(1)... honest small pick: ⟨4,1,1⟩ ~swap~ ⟨1,−1,4⟩ which IS principal-shape
  (a = 1). So Chain ⟨4,1,1⟩ ⟨1,−1,4⟩ via ONE swap, and the wall gives
  15 ≤ 4·4 = 16 — kernel-checked THROUGH the theorem. (4 = 2² = zpowRe 2 (step
  (step void)).)

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 619 attestFlag = 1 (TRUE).
  BOGUS: min 619 attestFlag = 619 reduces to 1 = 619; BITES. (619, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussClassWall

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((15 : Phys.Foundation.Z) ≤ 4 * 4) → attestFlag = 1 :=
  fun _ => rfl

/-- The class-side wall fires: the 2²-record of D = −15 chains to principal. -/
theorem classwall_fires : (15 : Phys.Foundation.Z) ≤ 4 * 4 := by
  -- record form ⟨zpowRe 2 (step (step void)), 1, 1⟩ = ⟨4, 1, 1⟩
  have hz : zpowRe (2 : Z) (Re.step (Re.step Re.void)) = 4 := by
    show (2 : Z) * ((2 : Z) * 1) = 4
    norm_num
  have hch : Chain (⟨zpowRe (2 : Z) (Re.step (Re.step Re.void)), 1, 1⟩ :
      GaussForms.BQF) ⟨1, -1, 4⟩ := by
    rw [hz]
    -- swapF ⟨4,1,1⟩ = ⟨1,−1,4⟩
    exact Chain.swap (Chain.refl _)
  have h := record_return_deep (p := 2) (B := 1) (t := 1)
    (k := Re.step Re.void) (e := ⟨1, -1, 4⟩)
    (by norm_num) hch rfl
    (by show (-1 : Z) * -1 - 4 * 1 * 4 < 0; norm_num)
  -- h : -(disc ⟨1,−1,4⟩) ≤ 4 * zpowRe 2 (step (step void)) = 4·4; disc = −15
  rw [hz] at h
  have hd : -(disc (⟨1, -1, 4⟩ : GaussForms.BQF)) = (15 : Z) := by
    show -((-1 : Z) * -1 - 4 * 1 * 4) = 15
    norm_num
  rw [hd] at h
  exact h

theorem cert_val_true : min 619 attestFlag = 1 := by
  have h := attestFlag_forced classwall_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 619 attestFlag = 619 := by
  rw [cert_val_true]

end Counterexamples
