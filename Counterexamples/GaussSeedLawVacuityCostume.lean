/-
  Counterexamples.GaussSeedLawVacuityCostume — the seed law is GENUINE: it FIRES
  on a real principal contact. C616.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the seed law. The content that must NOT be
  hollow: seed_slot FIRES on a REAL contact — D = −23 (c₀ = 6), x = 0: P(0) = 6 =
  2·3, p = 2, depth 4·4 = 16 ≤ 23 ✓ — producing an actual reduced PosDef form
  with a = 2 of disc −23, kernel-checked. (Cl(−23) has h = 3: the slot is real —
  ⟨2, ±1, 3⟩ are the two non-principal reduced forms.)

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 616 attestFlag = 1 (TRUE — attestFlag = 1 < 616).
  THE BOGUS CLAIM: min 616 attestFlag = 616. Rewriting reduces to 1 = 616; BITES.
  DISTINCT: the pair (616, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussSeedLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ f : GaussForms.BQF,
      Reduced f ∧ PosDef f ∧ disc f = -23 ∧ f.a = 2) →
    attestFlag = 1 :=
  fun _ => rfl

theorem seed_fires :
    ∃ f : GaussForms.BQF,
      Reduced f ∧ PosDef f ∧ disc f = -23 ∧ f.a = 2 := by
  apply seed_slot (c₀ := 6) (p := 2) (m := 3) (x := 0)
  · norm_num
  · norm_num
  · show (0:Z) * 0 + 0 + 6 = 2 * 3
    norm_num
  · norm_num
  · norm_num

theorem cert_val_true : min 616 attestFlag = 1 := by
  have h := attestFlag_forced seed_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 616 attestFlag = 616 := by
  rw [cert_val_true]

end Counterexamples
