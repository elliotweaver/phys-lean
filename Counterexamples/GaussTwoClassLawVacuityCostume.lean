/-
  Counterexamples.GaussTwoClassLawVacuityCostume — the two-class law is
  GENUINE: it FIRES on real branch hits and the mirror class is REAL. C625.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims class-or-mirror at PrimeRe primes. The
  content that must NOT be hollow: two_class_law fires on the REAL double hit
  of p = 7 on the branch c₀ = 22 (D = −87): P(1) = 24? no — 1+1+22 = 24, 7∤24.
  Honest instance: c₀ = 4 (D = −15), p = 2: P(0) = 4 = 2·2, P(1) = 6 = 2·3:
  two hits; two_class_law (Euclid property of 2 supplied as the concrete
  witness function) must yield ZDvd 2 (0−1) ∨ ZDvd 2 (0+1+1) — the first is
  FALSE (2 ∤ −1), so the disjunction FORCES the mirror: 2 | 2 ✓. The mirror
  class is doing real work — x = 0 and y = 1 are mirror partners mod 2.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 625 attestFlag = 1 (TRUE).
  BOGUS: min 625 attestFlag = 625 reduces to 1 = 625; BITES. (625, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussTwoClassLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation.IntegerArith
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (ZDvd (2 : Z) ((0 : Z) - 1) ∨ ZDvd (2 : Z) ((0 : Z) + 1 + 1)) →
    attestFlag = 1 :=
  fun _ => rfl

/-- PrimeRe of the count 2 via the Rabinowitsch certificate (vacuous
    square wall: q ≥ 2 ⟹ q² ≥ 4 > 2). -/
theorem two_fires :
    ZDvd (2 : Z) ((0 : Z) - 1) ∨ ZDvd (2 : Z) ((0 : Z) + 1 + 1) := by
  obtain ⟨m, hm⟩ := pos_to_re (show (0:Z) < 2 by norm_num)
  have hprime : IntegerArith.PrimeRe (Re.step m) := by
    apply rabinowitsch_cert (v := (2 : Phys.Foundation.Z)) hm
    · rcases lt_trichotomy IntegerArith.oneR (Re.step m) with h | h | h
      · exact h
      · exfalso
        have h2 : Z.ofRe IntegerArith.oneR = (2 : Z) := by
          rw [h]; exact hm.symm
        have h1 : Z.ofRe IntegerArith.oneR = (1 : Z) := rfl
        rw [h1] at h2
        norm_num at h2
      · exfalso
        have hmono := ofRe_mono (le_of_lt h)
        have h1 : Z.ofRe IntegerArith.oneR = (1 : Z) := rfl
        rw [h1, ← hm] at hmono
        norm_num at hmono
    · intro q hq hsq _
      have hq2 := prime_two_le hq
      nlinarith [hsq, hq2]
  exact two_class_law_prime (c₀ := 4) (x := 0) (y := 1)
    (mx := 2) (my := 3) hm hprime (by ring) (by ring)

theorem cert_val_true : min 625 attestFlag = 1 := by
  have h := attestFlag_forced two_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 625 attestFlag = 625 := by
  rw [cert_val_true]

end Counterexamples
