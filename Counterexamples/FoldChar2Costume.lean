/-
  Counterexamples.FoldChar2Costume — the N1 costume (must be REJECTED by the kernel).
  ===========================================================================
  THE GARBAGE WITNESS: claiming SELF-BLINDNESS on a char-2 carrier.

  `fold_self_blind` (Phys/Foundation/Fold.lean) proves the fold has no nonzero
  fixed point ONLY on a 2-torsion-free carrier. This costume DROPS that
  hypothesis and asserts self-blindness on `ZMod 2`:

        ∀ x : ZMod 2, look x = x → x = 0      with look = (-·).

  That is FALSE: `look 1 = -1 = 1` in `ZMod 2`, so `1` is a nonzero fixed point.
  The kernel must REJECT this. If it ever COMPILES, the N1 self-blindness claim
  was vacuous (the torsion-free hypothesis was doing no work) — exactly the
  failure the costume battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Mathlib.Data.ZMod.Basic

/-- WRONG: self-blindness on the char-2 carrier `ZMod 2`. Has a nonzero fixed
    point at `1`, so this must FAIL to elaborate. -/
theorem fold_self_blind_char2_BOGUS :
    ∀ x : ZMod 2, (fun y : ZMod 2 => -y) x = x → x = 0 := by
  decide
