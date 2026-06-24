import Mathlib.Data.ZMod.Basic

-- Probe: the tightness witness re-expressed over ZMod 3 (machinery, 2-torsion-free, char≠2).
theorem probe_fold_nonzero_not_fixed :
    ∃ x : ZMod 3, x ≠ 0 ∧ (fun y : ZMod 3 => -y) x ≠ x :=
  ⟨1, by decide, by decide⟩

-- Also confirm ZMod 3 is genuinely 2-torsion-free (so self-blindness would HOLD there,
-- unlike ZMod 2 — the witness lives in a carrier where the fold's no-fixed-point is real).
theorem probe_zmod3_2tf : ∀ y : ZMod 3, y + y = 0 → y = 0 := by decide
