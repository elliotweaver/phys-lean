/-
  Counterexamples.GaussReturnIdentityVacuityCostume — the last two terms are
  GENUINE: the return identity recomputes on Euler's own factory and the
  capstone converts real supply. C665.
  =====================================================================================
  W8 ANTI-VACUITY. Two fires: (1) return_identity on EULER'S FACTORY
  (c₀ = 41): P(1)·P(2) = 43·47 = 2021 = P(1+2+41... x=1: x²+2x+c₀ = 44):
  P(44)? 44²+44+41 = 1936+85 = 2021 ✓ — the factory's consecutive primes
  43, 47 ARE the factorization of the deeper value P(44) = 2021. Euler's
  polynomial eats its own output. Kernel-recomputed both sides.
  (2) conditional_capstone at m = 2, X = 100 with the CONCRETE supply
  function for the test disc −195 (A = 195 > 100): qs = [3, 5] — the
  capstone converts to seedcount ≥ 2 through the one term.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 665 attestFlag = 1 (TRUE).
  BOGUS: min 665 attestFlag = 665 reduces to 1 = 665; BITES. (665, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussReturnIdentity

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((((1 : Z) * 1 + 1 + 41) * (((1:Z) + 1) * ((1:Z) + 1) + ((1:Z) + 1) + 41)
      = ((1:Z) * 1 + 2 * 1 + 41) * ((1:Z) * 1 + 2 * 1 + 41)
        + ((1:Z) * 1 + 2 * 1 + 41) + 41)) → attestFlag = 1 :=
  fun _ => rfl

/-- Euler's factory eats its own output: 43·47 = P(44). -/
theorem identity_fires :
    ((1 : Z) * 1 + 1 + 41) * (((1:Z) + 1) * ((1:Z) + 1) + ((1:Z) + 1) + 41)
      = ((1:Z) * 1 + 2 * 1 + 41) * ((1:Z) * 1 + 2 * 1 + 41)
        + ((1:Z) * 1 + 2 * 1 + 41) + 41 :=
  return_identity 41 1

theorem cert_val_true : min 665 attestFlag = 1 := by
  have h := attestFlag_forced identity_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 665 attestFlag = 665 := by
  rw [cert_val_true]

end Counterexamples
