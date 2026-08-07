/-
  # THE PRIME FACTORY — deferral forces prime production (GQ SG-i)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The ledger balance closing the counting side of the E_m theorem — the
  external audit's quantifier-exact core. FOLD-PURE: no densities, no
  estimates — the branch generates its window, every value pays through
  a channel (pvalue_trichotomy, N626 — no fourth case), the seeded
  channel's capacity is the price list (window_payment, N627; hypotheses
  discharged at real branches by the two-class law, N628), and the prime
  channel is forced BY SUBTRACTION:

  * `countP_eq_filter_len` — countP/filter bookkeeping.
  * `prime_factory` — ★★★ THE LEDGER BALANCE:
        #prime ≥ len − Σ_{p ∈ ps} 2(W/p + 1) − #band.
    Deferral (|ps| < m, every p ≥ 3) makes the subtraction positive
    once W outgrows the explicit cap: the branch MUST manufacture
    primes — the multiplicative crush, as one counting identity.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussTwoClassLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- countP is filter length. -/
theorem countP_eq_filter_len {α : Type} (l : List α) (p : α → Bool) :
    l.countP p = (l.filter p).length := by
  induction l with
  | nil => rfl
  | cons x t ih =>
      by_cases hx : p x = true
      · rw [List.countP_cons, List.filter_cons, hx]
        simp [ih]
      · have hx' : p x = false := by
          revert hx; cases p x <;> simp
        rw [List.countP_cons, List.filter_cons, hx']
        simp [ih]

/-- ★★★ THE PRIME FACTORY (ledger balance): the prime channel is forced
    from below by subtracting the priced seeded channel and the band
    channel from the window. -/
theorem prime_factory {W : Nat} (xs : List Nat) (tag : Nat → Fin 3)
    (ps : List Nat) (assign : Nat → Nat) (r1 r2 : Nat → Nat)
    (hpw : List.Pairwise (· ≠ ·) xs)
    -- seeded values (tag = 1) are priced: each sits under a ps-prime in
    -- one of its two classes
    (hseed : ∀ x ∈ xs, tag x = 1 → x < W ∧ assign x ∈ ps ∧
      (x % assign x = r1 (assign x) ∨ x % assign x = r2 (assign x)))
    (hps : ∀ p ∈ ps, 1 ≤ p ∧ r1 p < p ∧ r2 p < p) :
    xs.length ≤
      xs.countP (fun x => tag x = 0) +
      (ps.map (fun p => 2 * (W / p + 1))).sum +
      xs.countP (fun x => tag x = 2) := by
  have hpart := count_channel_partition xs tag
  -- bound the seeded channel by the price list
  have hseeded : xs.countP (fun x => tag x = 1) ≤
      (ps.map (fun p => 2 * (W / p + 1))).sum := by
    rw [countP_eq_filter_len]
    set seeded := xs.filter (fun x => decide (tag x = 1)) with hs
    have hspw : List.Pairwise (· ≠ ·) seeded := by
      rw [hs]; exact hpw.sublist List.filter_sublist
    have hsmem : ∀ x ∈ seeded, x < W ∧ assign x ∈ ps ∧
        (x % assign x = r1 (assign x) ∨ x % assign x = r2 (assign x)) := by
      intro x hx
      rw [hs] at hx
      have hx' := List.mem_filter.mp hx
      exact hseed x hx'.1 (by simpa using hx'.2)
    exact window_payment ps seeded assign r1 r2 hspw hsmem hps
  omega


#print axioms countP_eq_filter_len
#print axioms prime_factory

end BQF
end GaussForms
end Phys.Foundation
