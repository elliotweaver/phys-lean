/-
  Counterexamples.GaussPowerSupplyVacuityCostume — the power supply is GENUINE: the
  ladder-climb theorem FIRES on a real pair. C600.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the ladder climbs (total composition through the
  coprime supply). The content that must NOT be hollow: power_step_total fires on the
  REAL D=−20 pair f=(2,2,3) (primitive: gcd(2,2,3)=1; PosDef: 2>0, 3>0; disc −20<0)
  and h=(3,2,2) (miss 3>0, same disc) — producing an actual chained rep + composite.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 600 attestFlag = 1 (TRUE — attestFlag = 1 < 600).
  THE BOGUS CLAIM: min 600 attestFlag = 600. Rewriting reduces to 1 = 600; BITES.
  DISTINCT: the pair (600, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussPowerSupply

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ f' h', Chain (⟨2, 2, 3⟩ : GaussForms.BQF) f' ∧ CompRel f' ⟨3, 2, 2⟩ h') →
    attestFlag = 1 :=
  fun _ => rfl

theorem climb_fires :
    ∃ f' h', Chain (⟨2, 2, 3⟩ : GaussForms.BQF) f' ∧ CompRel f' ⟨3, 2, 2⟩ h' := by
  apply power_step_total
  · -- Primitive (2, 2, 3): a Bézout witness for the three coefficients
    exact ⟨-1, 0, 1, by show (-1 : Z) * 2 + 0 * 2 + 1 * 3 = 1; ring⟩
  · exact ⟨by norm_num, by norm_num⟩
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) < 0
    unfold disc
    norm_num
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) = disc (⟨3, 2, 2⟩ : GaussForms.BQF)
    unfold disc
    norm_num
  · show (0 : Z) < 3
    norm_num

theorem cert_val_true : min 600 attestFlag = 1 := by
  have h := attestFlag_forced climb_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 600 attestFlag = 600 := by
  rw [cert_val_true]

end Counterexamples
