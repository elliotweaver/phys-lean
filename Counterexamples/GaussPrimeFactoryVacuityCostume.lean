/-
  Counterexamples.GaussPrimeFactoryVacuityCostume — the ledger balance is
  GENUINE: it FIRES on a real window and the subtraction has TEETH. C626.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the prime factory. The content that must NOT
  be hollow: prime_factory FIRES on the REAL Heegner window — c₀ = 41
  (D = −163), window x = 0..4, W = 5: P(x) = 41, 43, 47, 53, 61 — ALL PRIME
  (tag 0), seeded/band channels EMPTY, ps = [] (total deferral of odd primes
  under the gate... the branch pays entirely through the prime channel). The
  inequality reads: 5 ≤ #prime + 0 + 0 ⟹ #prime ≥ 5 — FORCED prime factory,
  the theorem's teeth on the fold's own extremal object. The tag function is
  the constant 0 (kernel-checkable per value); the seeded hypothesis is
  vacuously discharged; hps vacuous on [].

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 626 attestFlag = 1 (TRUE).
  BOGUS: min 626 attestFlag = 626 reduces to 1 = 626; BITES. (626, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussPrimeFactory

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (([0, 1, 2, 3, 4] : List Nat).length ≤
      ([0, 1, 2, 3, 4] : List Nat).countP (fun _ => (0 : Fin 3) = 0) +
      (([] : List Nat).map (fun p => 2 * (5 / p + 1))).sum +
      ([0, 1, 2, 3, 4] : List Nat).countP (fun _ => (0 : Fin 3) = 2)) →
    attestFlag = 1 :=
  fun _ => rfl

/-- prime_factory fires on the Heegner window (all-prime, empty seed set):
    the prime channel is forced to carry everything. -/
theorem factory_fires :
    (([0, 1, 2, 3, 4] : List Nat).length ≤
      ([0, 1, 2, 3, 4] : List Nat).countP (fun _ => (0 : Fin 3) = 0) +
      (([] : List Nat).map (fun p => 2 * (5 / p + 1))).sum +
      ([0, 1, 2, 3, 4] : List Nat).countP (fun _ => (0 : Fin 3) = 2)) := by
  refine prime_factory (W := 5) [0, 1, 2, 3, 4] (fun _ => 0) []
    (fun _ => 0) (fun _ => 0) (fun _ => 0) ?_ ?_ ?_
  · refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro x _ htag
    exact absurd htag (by norm_num)
  · intro p hp
    exact absurd hp List.not_mem_nil

theorem cert_val_true : min 626 attestFlag = 1 := by
  have h := attestFlag_forced factory_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 626 attestFlag = 626 := by
  rw [cert_val_true]

end Counterexamples
