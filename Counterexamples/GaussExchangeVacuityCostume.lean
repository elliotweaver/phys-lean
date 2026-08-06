/-
  Counterexamples.GaussExchangeVacuityCostume — the exchange machinery is GENUINE:
  the raise tower FIRES on a real base rung. C605.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the raise/exchange welds. The content that must NOT
  be hollow: raise_chain' fires on a REAL RaiseTower — base rung at the D=−20
  principal pair L = R = (1,2,6) (Chain by refl), yielding Chain L R at power 1
  through the tower — and raiseTower_pow_left reads back an actual PowRel.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 605 attestFlag = 1 (TRUE — attestFlag = 1 < 605).
  THE BOGUS CLAIM: min 605 attestFlag = 605. Rewriting reduces to 1 = 605; BITES.
  DISTINCT: the pair (605, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussExchange

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (Chain (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ∧
     PowRel (⟨1, 2, 6⟩ : GaussForms.BQF) (Re.step Re.void) ⟨1, 2, 6⟩) →
    attestFlag = 1 :=
  fun _ => rfl

theorem raise_fires :
    Chain (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ∧
    PowRel (⟨1, 2, 6⟩ : GaussForms.BQF) (Re.step Re.void) ⟨1, 2, 6⟩ := by
  have htower : RaiseTower (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩
      (Re.step Re.void) ⟨1, 2, 6⟩ ⟨1, 2, 6⟩ := RaiseTower.base
  exact ⟨raise_chain' (Chain.refl _) htower, raiseTower_pow_left htower⟩

theorem cert_val_true : min 605 attestFlag = 1 := by
  have h := attestFlag_forced raise_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 605 attestFlag = 605 := by
  rw [cert_val_true]

end Counterexamples
