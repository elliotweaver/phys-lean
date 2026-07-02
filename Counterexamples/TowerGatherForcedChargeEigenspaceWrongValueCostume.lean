/-
  Counterexamples.TowerGatherForcedChargeEigenspaceWrongValueCostume — N244 anti-vacuity (C275).
  ===========================================================================
  W8 ANTI-VACUITY. The N244 node banks THE FORCED EIGENSPACE DECOMPOSITION of the fundamental 7:
  the kernel of the forced charge operator `chargeOp = crossOp u1` on the ENTIRE `ImO` is EXACTLY
  the 1-dimensional branching singlet (`chargeOp_ker : LinearMap.ker chargeOp = span{sgl}`), so the
  charge-`0` (neutral) direction is EXHAUSTED by the singlet — there is NO other neutral direction.
  The load-bearing quantitative fact is that this kernel is EXACTLY 1-dimensional
  (`finrank_ker_chargeOp : finrank ℚ (LinearMap.ker chargeOp) = 1`), NOT `0` (which would say the
  charge operator is injective — the singlet is NOT killed, contradicting N240) and NOT `≥ 2`
  (which would say some other direction beyond the singlet is also neutral).

  The anchor is that genuine dimension, packaged as the clean equality
  `min 275 (finrank ℚ (LinearMap.ker chargeOp)) = 1` (which holds precisely BECAUSE
  `LinearMap.ker chargeOp = span{sgl}` with `sgl ≠ 0`, whose `finrank` is `1`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the charge-`0` eigenspace is more than
  1-dimensional / the singlet does not exhaust the neutral direction / there is a second neutral
  direction / the kernel is not the singlet line): that
  `min 275 (finrank ℚ (LinearMap.ker chargeOp))` equals `275`. It GENUINELY equals `1`
  (`charge_eigenspace_dim_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `1 = 275` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the kernel of
  `crossOp u1` on `ImO` is `span{⟨u1⟩}` (`finrank` `1`), so
  `min 275 (finrank ℚ (LinearMap.ker chargeOp)) = 1`, and claiming it equals `275` is genuinely
  FALSE (1 ≠ 275).

  DISTINCT from the banked battery (… C272 = 0=272, C273 = 2=273, C274 = 3=274): the pair (275, 1)
  is fresh (RHS 275 distinct from every prior right-hand value; the LHS anchor is the NEW N244
  charge-`0` eigenspace dimension — the 1-dimensional kernel that EXHAUSTS the neutral direction,
  the eigenspace realization of the `X` linear factor of the N243 spectral polynomial `X³+X`).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedChargeEigenspace

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 275 (finrank ℚ (LinearMap.ker chargeOp)) = 1`, holding precisely because the kernel
    of the forced charge operator on the WHOLE fundamental 7 is the 1-dimensional branching singlet
    `span{sgl}` (banked `finrank_ker_chargeOp`), the charge-`0` direction exhausted by the singlet. -/
theorem charge_eigenspace_dim_true :
    min 275 (Module.finrank ℚ (LinearMap.ker chargeOp)) = 1 := by
  rw [finrank_ker_chargeOp]; decide

/-- BOGUS: claims `min 275 (finrank ℚ (LinearMap.ker chargeOp)) = 275`. It GENUINELY equals `1`
    (`charge_eigenspace_dim_true`). The WRONG claim (the neutral eigenspace is more than
    1-dimensional / a second neutral direction exists / the kernel is not the singlet line) reduces
    — through the banked value — to the false numeric `1 = 275`, so this must NOT compile. -/
theorem charge_eigenspace_dim_wrong_BOGUS :
    min 275 (Module.finrank ℚ (LinearMap.ker chargeOp)) = 275 := by
  rw [charge_eigenspace_dim_true]
  -- ⊢ (1 : ℕ) = 275  (FALSE — the costume bites)

end Counterexamples
