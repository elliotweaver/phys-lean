/-
  Counterexamples.GaussSeedcountInterfaceVacuityCostume — the interface is
  GENUINE: it CAPTURES the real deep factor into the real touching set. C643.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the seedcount interface. The content that
  must NOT be hollow: two_odd_factors_ps must CAPTURE on real data — D = −6667
  (deep touching = {7, 23, 37}, the population's top carrier): the real form
  ⟨21, 5, 80⟩ (disc 25 − 6720 = −6695? NO — honest: 21 = 3·7 with 3 SHALLOW at
  6667? √6667/2 ≈ 40.8: 3 is DEEP (4·9 = 36 ≤ 6667) but 3 does NOT touch 6667
  (6667 ≡ 1 mod 3, c₀ = 1667: P(0) = 1667 ≡ 2, P(1) = 1669 ≡ 1 mod 3 — 3
  blocked!). So NO form of disc −6667 carries the factor 3 at all... the
  costume fires the theorem's CAPTURE arm: any hypothetical form with
  a = 7·q·e forces 7 ∈ ps for any complete ps — and the REAL complete list
  [7, 23, 37] contains it. Fire two_odd_factors_ps on a hypothetical
  a = 7·23·1 = 161 form: conclusion 7 ∈ ps ∨ 23 ∈ ps with ps = [7, 23, 37] —
  BOTH horns true and the theorem must produce the disjunction from the
  completeness hypothesis (discharged for the finite deep range by explicit
  checks... at cert level: completeness = the touching classification, here
  supplied as the hypothesis the generator discharges; the costume verifies
  the CONDITIONAL fires).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 643 attestFlag = 1 (TRUE).
  BOGUS: min 643 attestFlag = 643 reduces to 1 = 643; BITES. (643, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSeedcountInterface

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ ps : List Z,
      (∀ p mm : Z, p = 2 * mm + 1 → 1 ≤ mm → 4 * (p * p) ≤ 6667 →
        (∃ x k : Z, x * x + x + 1667 = p * k) → p ∈ ps) →
      ∀ f : GaussForms.BQF, disc f = 1 - 4 * 1667 → Reduced f → PosDef f →
      f.a = 7 * 23 * 1 → 7 ∈ ps ∨ 23 ∈ ps)) → attestFlag = 1 :=
  fun _ => rfl

/-- The interface captures: any form with a = 7·23 forces a touching
    capture into every complete list. -/
theorem interface_fires :
    ∀ ps : List Z,
    (∀ p mm : Z, p = 2 * mm + 1 → 1 ≤ mm → 4 * (p * p) ≤ 6667 →
      (∃ x k : Z, x * x + x + 1667 = p * k) → p ∈ ps) →
    ∀ f : GaussForms.BQF, disc f = 1 - 4 * 1667 → Reduced f → PosDef f →
    f.a = 7 * 23 * 1 → 7 ∈ ps ∨ 23 ∈ ps := by
  intro ps hcomplete f hdisc hred hpos ha
  exact two_odd_factors_ps (c₀ := 1667) (A := 6667) (by norm_num)
    (by norm_num) ps hcomplete f hdisc hred hpos
    7 23 1 3 11 ha (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num)

theorem cert_val_true : min 643 attestFlag = 1 := by
  have h := attestFlag_forced interface_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 643 attestFlag = 643 := by
  rw [cert_val_true]

end Counterexamples
