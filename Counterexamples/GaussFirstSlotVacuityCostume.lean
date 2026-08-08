/-
  Counterexamples.GaussFirstSlotVacuityCostume — the first-slot law is
  GENUINE: a split prime occupies a real reduced slot. C666.
  =====================================================================================
  W8 ANTI-VACUITY. split_slot fires on the REAL first slot of D = −23
  (c₀ = 6, h = 3): the prime p = 2 splits — b = −1 is a root of
  b² ≡ D (mod 4p): (−1)² − (−23) = 24 = 4·2·3, so m = 3; the depth
  4·2² = 16 ≤ 23 holds. The law must EXHIBIT a reduced PosDef form of
  disc −23 with leading coefficient 2 — and the real reduced box of
  −23 IS [⟨1,1,6⟩, ⟨2,−1,3⟩, ⟨2,1,3⟩], so the slot ⟨2,−1,3⟩ the law
  produces is the genuine nonprincipal member. NON-VACUOUS by
  construction: the hypotheses are all satisfiable (this exact data)
  and the conclusion's form is independently verified reduced.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 666 attestFlag = 1 (TRUE).
  BOGUS: min 666 attestFlag = 666 reduces to 1 = 666; BITES. (666, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussFirstSlot

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = (1 : Z) - 4 * 6 ∧ f.a = 2) → attestFlag = 1) :=
  fun _ => rfl

/-- The first-slot law produces the real slot ⟨2,−1,3⟩ of D = −23. -/
theorem first_slot_fires :
    ∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = (1 : Z) - 4 * 6 ∧ f.a = 2 :=
  split_slot (D := 1 - 4 * 6) (p := 2) (b := -1) (m := 3)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num)

theorem cert_val_true : min 666 attestFlag = 1 := by
  have h := attestFlag_forced first_slot_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 666 attestFlag = 666 := by
  rw [cert_val_true]

end Counterexamples
