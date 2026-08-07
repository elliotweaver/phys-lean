/-
  # THE E_m SKELETON — deferral + bounded allotment cap the window
  (GQ SG-j)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The conditional E_m core — banked in the campaign's standard
  conditional-first pattern (THE_LAW was banked on ExchangeOracle,
  then discharged; same shape here):

  * `price_cap` — ★ Σ_{p ∈ ps} 2(W/p + 1) ≤ |ps| · 2(W/3 + 1) for odd
    touching sets (every p ≥ 3) — div-monotone list induction.
  * `em_skeleton` — ★★★ THE CONDITIONAL E_m CORE: with the prime
    allotment B as THE NAMED HYPOTHESIS (the Rabinowitsch-regime
    capacity; its finiteness is the honest open summit, fold-route =
    the return law) and deferral (|ps| ≤ m − 1, all p ≥ 3):
        xs.length ≤ B + (m − 1) · 2 · (W/3 + 1).
    CONTRAPOSITIVE = THE CERTIFICATE: any window longer than the cap
    forces ≥ m touching primes — seedcount(D) ≥ m, per-D kernel-
    checkable once B is certified; X_m explicit in (m, B).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussPrimeFactory

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- ★ Each price term at p ≥ 3 is ≤ the p = 3 term; the sum caps at
    count × top term. -/
theorem price_cap {W : Nat} : ∀ (ps : List Nat),
    (∀ p ∈ ps, 3 ≤ p) →
    (ps.map (fun p => 2 * (W / p + 1))).sum ≤
      ps.length * (2 * (W / 3 + 1)) := by
  intro ps
  induction ps with
  | nil => intro _; simp
  | cons p rest ih =>
      intro hall
      have hp3 : 3 ≤ p := hall p (List.mem_cons_self ..)
      have hdiv : W / p ≤ W / 3 := Nat.div_le_div_left hp3 (by norm_num)
      have hterm : 2 * (W / p + 1) ≤ 2 * (W / 3 + 1) := by omega
      have hrec := ih (fun q hq => hall q (List.mem_cons_of_mem p hq))
      simp only [List.map_cons, List.sum_cons, List.length_cons]
      have : (rest.length + 1) * (2 * (W / 3 + 1)) =
          rest.length * (2 * (W / 3 + 1)) + 2 * (W / 3 + 1) :=
        Nat.succ_mul ..
      omega

/-- ★★★ THE CONDITIONAL E_m CORE: bounded prime allotment + deferral
    cap the window length. Contrapositive: a longer window forces ≥ m
    touching primes. -/
theorem em_skeleton {W B m : Nat} (xs : List Nat) (tag : Nat → Fin 3)
    (ps : List Nat) (assign : Nat → Nat) (r1 r2 : Nat → Nat)
    (hpw : List.Pairwise (· ≠ ·) xs)
    (hseed : ∀ x ∈ xs, tag x = 1 → x < W ∧ assign x ∈ ps ∧
      (x % assign x = r1 (assign x) ∨ x % assign x = r2 (assign x)))
    (hps : ∀ p ∈ ps, 1 ≤ p ∧ r1 p < p ∧ r2 p < p)
    -- THE NAMED HYPOTHESIS: the non-seeded channels' allotment
    (hB : xs.countP (fun x => tag x = 0) +
          xs.countP (fun x => tag x = 2) ≤ B)
    -- DEFERRAL: fewer than m touching primes, all odd (≥ 3)
    (hm : ps.length ≤ m - 1) (hodd : ∀ p ∈ ps, 3 ≤ p) :
    xs.length ≤ B + (m - 1) * (2 * (W / 3 + 1)) := by
  have hfac := prime_factory (W := W) xs tag ps assign r1 r2 hpw hseed hps
  have hcap := price_cap (W := W) ps hodd
  have hmono : ps.length * (2 * (W / 3 + 1)) ≤
      (m - 1) * (2 * (W / 3 + 1)) :=
    Nat.mul_le_mul_right _ hm
  omega


#print axioms price_cap
#print axioms em_skeleton

end BQF
end GaussForms
end Phys.Foundation
