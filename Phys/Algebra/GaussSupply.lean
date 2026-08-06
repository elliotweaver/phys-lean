/-
  # THE SUPPLY — total composition and the coprime representative (GQ R9a-c)

  ## What this file proves (GQ campaign, production node)

  The supply layer that makes composition TOTAL — every hypothesis
  discharged from the bank, no new inputs:

  * `z_pos_mul` / `zdvd_pos_to_dvdRe` — positive Z-divisibility descends to
    the fold's count divisibility.
  * `prime_divisor_classification` — ★★ a positive divisor of a prime-count
    integer is 1 or the prime: THE bridge from PrimeRe to Z-gcd data.
  * `form_branchRec` — the disc identity of any form IS a branch record.
  * `compRel_total` — ★★ TOTAL COMPOSITION: any two forms of one disc with
    Bézout-coprime nonzero misses compose (branch records from the forms
    themselves, parity discharged, the united record from branch_gather',
    the presentation chains from anchored_same_record_chain).
  * `prime_ge_two` / `prime_not_dvd_one` / `prime_ne_zero` — primes on Z.
  * `coprime_rep_total` — ★★ THE COPRIME SUPPLY: every primitive form has a
    chained representative coprime to any prime-list product — every
    hypothesis of concordant_representative discharged from the bank
    (landing ← list_landing; gcd ← gcd_bezout_exists; classification ←
    prime_divisor_classification; anchor ← anchor).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussRankLayer

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Positive product of positives (extraction, restated). -/
theorem z_pos_mul {a b : Z} (ha : 0 < a) (hab : 0 < a * b) : 0 < b := by
  rcases lt_trichotomy 0 b with h | h | h
  · exact h
  · exfalso
    rw [← h, mul_zero] at hab
    exact lt_irrefl _ hab
  · exfalso
    have : 0 < a * (-b) := mul_pos ha (by linarith)
    have h2 : a * (-b) = -(a * b) := by ring
    rw [h2] at this
    linarith

/-- ★ THE DESCENT: positive Z-divisibility gives count divisibility. -/
theorem zdvd_pos_to_dvdRe {g q : Z} {m n : Re}
    (hg : g = Z.ofRe m) (hq : q = Z.ofRe n)
    (hgpos : 0 < g) (hqpos : 0 < q) (hdvd : ZDvd g q) :
    dvdRe m n := by
  obtain ⟨c, hc⟩ := hdvd
  -- c > 0 since q = g·c with g, q > 0
  have hcpos : 0 < c := by
    apply z_pos_mul hgpos
    rw [← hc]
    exact hqpos
  obtain ⟨k, hk | hk⟩ := z_trichotomy c
  · -- c = ofRe k: ofRe n = ofRe m · ofRe k = ofRe (m * k); injectivity
    refine ⟨k, ?_⟩
    have hzeq : Z.ofRe n = Z.ofRe (m * k) := by
      rw [Z.ofRe_mul]
      calc Z.ofRe n = q := hq.symm
        _ = g * c := hc
        _ = Z.ofRe m * Z.ofRe k := by rw [hg, hk]
    exact Z.ofRe_injective hzeq
  · -- c = −ofRe k contradicts c > 0
    exfalso
    have hnn : (0 : Z) ≤ Z.ofRe k := ofRe_nonneg k
    rw [hk] at hcpos
    linarith

/-- ★★ PRIME DIVISOR CLASSIFICATION on Z: a positive divisor of a positive
    prime-count integer is 1 or the prime. -/
theorem prime_divisor_classification {g q : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (hgpos : 0 < g) (hdvd : ZDvd g q) :
    g = 1 ∨ g = q := by
  have hqpos : 0 < q := by
    rw [hq]
    obtain ⟨h1p, _⟩ := hprime
    obtain ⟨c, hc⟩ := lt_iff_step_le.mp h1p
    -- p = step oneR + c = step (oneR + c): a step ⟹ ofRe p ≥ 1 > 0
    have hpstep : p = Re.step (oneR + c) := by
      rw [hc]
      exact Re.step_add _ _
    have hp1 : (1 : Z) ≤ Z.ofRe p := by
      rw [hpstep]
      have hsm : Re.step (oneR + c) = (oneR + c) + Re.step Re.void := by
        rw [add_step_swap]
        show Re.step (oneR + c) = Re.step (oneR + c) + Re.void
        rw [Re.add_void]
      rw [hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
      linarith [ofRe_nonneg (oneR + c)]
    linarith
  -- g's count divides p; PrimeRe classifies
  obtain ⟨m, hm | hm⟩ := z_trichotomy g
  · have hdRe : dvdRe m p := zdvd_pos_to_dvdRe hm hq hgpos hqpos hdvd
    obtain ⟨_, hcls⟩ := hprime
    rcases hcls m hdRe with h1 | hp
    · left
      rw [hm, h1]
      exact Z.ofRe_one
    · right
      rw [hm, hp, hq]
  · exfalso
    have hnn : (0 : Z) ≤ Z.ofRe m := ofRe_nonneg m
    rw [hm] at hgpos
    linarith

/-- Forms carry branch records: B² − D = 4a·t with t = a-cofactor — the
    disc identity read as a BranchRec. -/
theorem form_branchRec (f : BQF) : BranchRec (disc f) f.a f.b := by
  refine ⟨f.c, ?_⟩
  unfold disc
  ring

/-- ★★ TOTAL COMPOSITION on coprime-miss pairs of one disc. -/
theorem compRel_total {f g : BQF} {al be : Z}
    (hbez : al * f.a + be * g.a = 1) (hne : f.a * g.a ≠ 0)
    (hdisc : disc f = disc g) :
    ∃ h : BQF, CompRel f g h := by
  set D := disc f with hD
  -- branch records from the disc identities
  have hr1 : BranchRec D f.a f.b := form_branchRec f
  have hr2 : BranchRec D g.a g.b := by
    have h := form_branchRec g
    rw [← hdisc] at h
    exact h
  -- parity discharge
  have hpar := records_parity_agree hr1 hr2
  -- the united record
  have hcop : Coprime f.a g.a := ⟨al, be, hbez⟩
  obtain ⟨B, ⟨k1, hk1⟩, ⟨k2, hk2⟩, ⟨t, ht⟩⟩ := branch_gather' hcop hr1 hr2 hpar
  -- the gather form
  refine ⟨gatherForm f.a g.a B t, f.a, g.a, B, t, al, be, hbez, hne, ?_, ?_, Chain.refl _⟩
  · -- Chain f (f.a, B, g.a·t): same miss, record B = f.b + 2·f.a·k1, discs equal
    have hd1 : disc (⟨f.a, B, g.a * t⟩ : BQF) = D := by
      unfold disc
      -- B² − 4·f.a·(g.a·t) = B² − 4·(f.a·g.a)·t = D by ht
      have : B * B - 4 * f.a * (g.a * t) = B * B - 4 * (f.a * g.a) * t := by ring
      rw [this]
      linarith [ht]
    have hfform : f = (⟨f.a, f.b, f.c⟩ : BQF) := rfl
    have hstep : Chain (⟨f.a, f.b, f.c⟩ : BQF) (⟨f.a, B, g.a * t⟩ : BQF) := by
      apply anchored_same_record_chain
      · intro h0
        apply hne
        rw [show f.a * g.a = f.a * g.a from rfl]
        exact mul_eq_zero_of_left h0 g.a
      · exact hk1
      · -- disc (f.a, f.b, f.c) = disc (f.a, B, g.a·t): LHS = D = RHS
        have hl : disc (⟨f.a, f.b, f.c⟩ : BQF) = D := by
          rw [← hfform]
        rw [hl, hd1]
    rw [← hfform] at hstep
    exact hstep
  · -- Chain g (g.a, B, f.a·t): symmetric
    have hd2 : disc (⟨g.a, B, f.a * t⟩ : BQF) = D := by
      unfold disc
      have : B * B - 4 * g.a * (f.a * t) = B * B - 4 * (f.a * g.a) * t := by ring
      rw [this]
      linarith [ht]
    have hgform : g = (⟨g.a, g.b, g.c⟩ : BQF) := rfl
    have hstep : Chain (⟨g.a, g.b, g.c⟩ : BQF) (⟨g.a, B, f.a * t⟩ : BQF) := by
      apply anchored_same_record_chain
      · intro h0
        apply hne
        exact mul_eq_zero_of_right f.a h0
      · exact hk2
      · have hl : disc (⟨g.a, g.b, g.c⟩ : BQF) = D := by
          rw [← hgform, ← hdisc]
        rw [hl, hd2]
    rw [← hgform] at hstep
    exact hstep

/-- Prime-count integers are at least 2. -/
theorem prime_ge_two {q : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p) : (2 : Z) ≤ q := by
  obtain ⟨h1p, _⟩ := hprime
  obtain ⟨d, hd⟩ := lt_iff_step_le.mp h1p
  have hpstep : p = Re.step (oneR + d) := by
    rw [hd]
    exact Re.step_add _ _
  rw [hq, hpstep]
  have hsm : Re.step (oneR + d) = (oneR + d) + Re.step Re.void := by
    rw [add_step_swap]
    show Re.step (oneR + d) = Re.step (oneR + d) + Re.void
    rw [Re.add_void]
  rw [hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
  have h1d : Z.ofRe (oneR + d) = 1 + Z.ofRe d := by
    show Z.ofRe (Re.step Re.void + d) = 1 + Z.ofRe d
    have hstep : Re.step Re.void + d = Re.step (Re.void + d) := Re.step_add _ _
    rw [hstep]
    have h2 : Re.step (Re.void + d) = (Re.void + d) + Re.step Re.void := by
      rw [add_step_swap]
      show Re.step (Re.void + d) = Re.step (Re.void + d) + Re.void
      rw [Re.add_void]
    rw [h2, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
    have hvd : Re.void + d = d := by rw [Re.void_add]
    rw [hvd]
    ring
  rw [h1d]
  linarith [ofRe_nonneg d]

/-- Prime-count integers don't divide 1. -/
theorem prime_not_dvd_one {q : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p) : ¬ ZDvd q 1 := by
  intro ⟨c, hc⟩
  have hq2 := prime_ge_two hq hprime
  rcases z_unit_class (hc.symm : q * c = 1) with h1 | h1 <;> linarith [h1]

/-- Primes are nonzero as integers. -/
theorem prime_ne_zero {q : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p) : q ≠ 0 := by
  intro h0
  have hq2 := prime_ge_two hq hprime
  rw [h0] at hq2
  linarith

/-- ★★ THE COPRIME SUPPLY: all hypotheses of concordant_representative
    discharged from the bank. -/
theorem coprime_rep_total {f : BQF} (hprim : Primitive f)
    (qs : List Z)
    (hprimes : ∀ q ∈ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p)
    (hpc : PairwiseCop qs) :
    ∃ h : BQF, Chain f h ∧ Coprime h.a (zListProd qs) := by
  -- 0. empty list: product is 1, trivially coprime
  match qs, hprimes, hpc with
  | [], _, _ =>
      exact ⟨f, Chain.refl f, ⟨0, 1, by
        show 0 * f.a + 1 * zListProd [] = 1
        show (0 : Z) * f.a + 1 * 1 = 1
        ring⟩⟩
  | q0 :: rs, hprimes, hpc =>
    -- 1. the landing
    have hnu : ∀ q ∈ q0 :: rs, ¬ ZDvd q 1 := by
      intro q hq
      obtain ⟨p, hqp, hp⟩ := hprimes q hq
      exact prime_not_dvd_one hqp hp
    obtain ⟨x, y, hesc⟩ := list_landing hprim (q0 :: rs) hpc hnu
    -- 2. not both zero (else eval = 0 divisible by q0)
    have hxyne : ¬ (x = 0 ∧ y = 0) := by
      intro ⟨hx0, hy0⟩
      have h0 : eval f x y = 0 := by
        rw [hx0, hy0]
        unfold eval
        ring
      have := hesc q0 (List.mem_cons_self ..)
      unfold EscapesAt at this
      rw [h0] at this
      exact this ⟨0, by ring⟩
    -- 3. gcd data on a nonzero coordinate (x-first; else y with roles swapped)
    have hgcd : ∃ g x' y' A B : Z, g ≠ 0 ∧ x = g * x' ∧ y = g * y' ∧
        g = A * x + B * y := by
      rcases eq_or_ne x 0 with hx0 | hxne
      · have hyne : y ≠ 0 := by
          intro hy0
          exact hxyne ⟨hx0, hy0⟩
        obtain ⟨g, hgpos, ⟨cy, hcy⟩, ⟨cx, hcx⟩, a0, b0, hb⟩ :=
          gcd_bezout_exists y x hyne
        exact ⟨g, cx, cy, b0, a0, ne_of_gt hgpos, hcx, hcy, by linarith [hb]⟩
      · obtain ⟨g, hgpos, ⟨cx, hcx⟩, ⟨cy, hcy⟩, a0, b0, hb⟩ :=
          gcd_bezout_exists x y hxne
        exact ⟨g, cx, cy, a0, b0, ne_of_gt hgpos, hcx, hcy, hb⟩
    obtain ⟨g, x', y', A, B, hg, hx, hy, hbez⟩ := hgcd
    -- 4. per-prime divisor classification vs the quotient value
    have hclass : ∀ q ∈ q0 :: rs, ∃ gq aq bq : Z,
        ZDvd gq (eval f x' y') ∧ gq = aq * q + bq * (eval f x' y') ∧
        (gq = 1 ∨ gq = q) := by
      intro q hqmem
      obtain ⟨p, hqp, hp⟩ := hprimes q hqmem
      have hqne : q ≠ 0 := prime_ne_zero hqp hp
      obtain ⟨gq, hgqpos, ⟨c1, hc1⟩, ⟨c2, hc2⟩, aq, bq, hbq⟩ :=
        gcd_bezout_exists q (eval f x' y') hqne
      refine ⟨gq, aq, bq, ⟨c2, hc2⟩, hbq, ?_⟩
      exact prime_divisor_classification hqp hp hgqpos ⟨c1, hc1⟩
    -- 5. the banked assembly
    exact concordant_representative hprim (zListProd (q0 :: rs)) (q0 :: rs)
      rfl x y hesc g x' y' A B hg hx hy hbez hclass
      (fun x0 y0 N0 hval hproper => anchor f x0 y0 N0 hval hproper)


#print axioms zdvd_pos_to_dvdRe
#print axioms prime_divisor_classification
#print axioms compRel_total
#print axioms prime_not_dvd_one
#print axioms coprime_rep_total

end BQF
end GaussForms
end Phys.Foundation
