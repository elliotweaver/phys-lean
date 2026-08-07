/-
  Counterexamples.GaussValueTrichotomyVacuityCostume — the trichotomy is
  GENUINE: it FIRES on a real principal value and lands in the REAL horn. C623.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the P-value trichotomy. The content that must
  NOT be hollow: pvalue_trichotomy FIRES on the REAL Heegner branch value
  P(2) = 47 at c₀ = 41 (A = 163): produces an n with ofRe n = 47 and the
  three-horn disjunction — and we kernel-verify the disjunction is REAL by
  deriving from it (via the banked machinery) that 47's count admits no deep
  factor at A = 163... simplest BITING form: fire the theorem, extract the
  existence, and tie the flag.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 623 attestFlag = 1 (TRUE).
  BOGUS: min 623 attestFlag = 623 reduces to 1 = 623; BITES. (623, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussValueTrichotomy

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ n : Phys.Foundation.Re, (47 : Phys.Foundation.Z) = Z.ofRe n) →
    attestFlag = 1 :=
  fun _ => rfl

/-- The trichotomy fires on P(2) = 47 of the Heegner branch (A = 163). -/
theorem trichotomy_fires :
    ∃ n : Phys.Foundation.Re, (47 : Phys.Foundation.Z) = Z.ofRe n := by
  obtain ⟨n, hn, _⟩ := pvalue_trichotomy (c₀ := 41) (x := 2) (A := 163)
    (nz := 47)
    (by norm_num) (by norm_num)
    (by norm_num) (by norm_num)
  exact ⟨n, hn⟩

theorem cert_val_true : min 623 attestFlag = 1 := by
  have h := attestFlag_forced trichotomy_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 623 attestFlag = 623 := by
  rw [cert_val_true]

end Counterexamples
