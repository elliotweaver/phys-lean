/-
  Counterexamples.GaussOccupationVacuityCostume — the occupation is GENUINE:
  the lift PRODUCES the real tower forms of the real split disc. C646.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the ∀D occupation. The content that must
  NOT be hollow: two_tower_realized must PRODUCE forms at a real split
  disc — D = −1687 (1687 = 4·422 − 1, c₀ = 422 = 2·211: SPLIT ✓). The deep
  2-powers: 4·(2^j)² ≤ 1687 ⟹ 2^j ≤ 10 ⟹ j ≤ 3 — exactly the four-member
  tower slice {1, 2, 4, 8} certified in C638/C642. The theorem must yield a
  reduced PosDef form with a = 8 = 2^3 (the deepest) — kernel-recomputed
  from the Hensel recursion, matching the certified ⟨8, 3, 53⟩ family
  (b odd in (−8, 8], b² ≡ −1687 mod 32: b = ±3... the theorem produces ONE;
  existence is the claim).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 646 attestFlag = 1 (TRUE).
  BOGUS: min 646 attestFlag = 646 reduces to 1 = 646; BITES. (646, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussOccupation

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * 422 ∧ f.a = pow2' 3)) → attestFlag = 1 :=
  fun _ => rfl

/-- The occupation produces the deepest tower form of D = −1687. -/
theorem occupation_fires :
    ∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * 422 ∧ f.a = pow2' 3 := by
  refine two_tower_realized (c₀ := 422) (c₁ := 211) (A := 1687)
    (by norm_num) (by norm_num) 3 ?_
  -- 4·(2^3)² = 256 ≤ 1687
  norm_num [pow2']

theorem cert_val_true : min 646 attestFlag = 1 := by
  have h := attestFlag_forced occupation_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 646 attestFlag = 646 := by
  rw [cert_val_true]

end Counterexamples
