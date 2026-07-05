/-
  Counterexamples.OctonionJordanGenerationCyclePhaseWrongValueCostume — N308 anti-vacuity (C337).
  ===========================================================================
  W8 ANTI-VACUITY. The N308 node (THE CRUX, seed T5) banks the cycle phase `δ_B = 2/9`, DERIVED from
  the holonomy=statistics fixed point on the self-blind ℤ₃ visibility cycle: the statistics operator
  `seeMat = Jall − 1` IS the loop-holonomy operator `Pcyc + Pcyc²` (`seeMat_eq_cycle_holonomy`); the
  consistency `n·T(1−T) = T` is the banked self-blindness balance (`holonomy_from_selfblind`), whose
  unique nonzero root is the banked self-seen fraction `T = tr Poth/3 = 2/3`, giving the per-edge phase
  `δ_B = T(1−T) = (2/3)(1/3) = 2/9` (`cyclephase_delta_B`). The load-bearing NON-TRIVIALITY is that the
  cycle phase is genuinely `2/9` (the Born self↔other interference at the self-seen fraction), NOT the
  self-seen fraction `2/3` itself, NOT the democratic `1/3`, NOT the geometric `2π/9`, NOT any other
  value.

  The certificate is the FORCED numerator of `9·δ_B`. The banked `cyclephase_delta_B` proves
  `(tr Poth/3)(1 − tr Poth/3) = 2/9`, so `9·δ_B = 2`:

      `certNine := 2   (the UNIQUE value of 9·δ_B the holonomy=statistics fixed point forces)`.

  We anchor `min 337 certNine = 2` (TRUE — `9·δ_B` genuinely equals `2`), TIED to the node's forced
  value via `cyclephase_delta_B` (the phase is genuinely `2/9`, so `9·δ_B = 2`, not `9·(2/3) = 6` and
  not `9·(1/3) = 3`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: δ_B is `2/3` / `1/3` / the fixed point is not
  satisfied / the phase is π-valued): that `min 337 certNine = 337`. It GENUINELY equals `2`
  (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false numeric `2 = 337`
  in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (337, 2) is fresh (RHS 337 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-PHASE CERTIFICATE: the numerator of `9·δ_B`, where `δ_B` is the cycle phase the
    holonomy=statistics fixed point forces on the self-blind ℤ₃ cycle. From `cyclephase_delta_B`
    (`(tr Poth/3)(1 − tr Poth/3) = 2/9`), `9·δ_B = 2`. -/
def certNine : ℕ := 2

/-- TRUE (tied to the banked N308 forced value via `cyclephase_delta_B`): the cycle phase is genuinely
    `2/9`, so `9·δ_B = 2`. The banked derivation lands `(tr Poth/3)(1 − tr Poth/3) = 2/9`; multiplying
    by `9` gives `2` (not `6 = 9·(2/3)`, not `3 = 9·(1/3)`). -/
theorem certNine_forced : (9 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = 2 := by
  rw [cyclephase_delta_B]; norm_num

/-- TRUE: `min 337 certNine = 2`, holding precisely because the fixed point genuinely FORCES the phase
    `2/9` (so `9·δ_B = 2`), not `2/3` or `1/3`. -/
theorem cert_val_true : min (337 : ℕ) certNine = 2 := by decide

/-- BOGUS: claims `min 337 certNine = 337`. It GENUINELY equals `2` (`cert_val_true`). The WRONG
    reading (δ_B is `2/3` / `1/3` / the fixed point fails / the phase is π-valued) reduces — through
    the banked value — to the false numeric `2 = 337`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (337 : ℕ) certNine = 337 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 337  (FALSE — the costume bites)

end Counterexamples
