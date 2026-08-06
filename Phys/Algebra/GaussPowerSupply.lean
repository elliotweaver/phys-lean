/-
  # THE POWER SUPPLY — prime data, dedup, the climbing ladder (GQ N602a-b)

  ## What this file proves (GQ campaign, production node)

  The supply chain that makes the power ladder TOTAL — every input banked:

  * `coprime_of_dvd_coprime` / `coprime_symm` — coprimality restricts to
    factors of a product.
  * `dedupZ` + `dedupZ_mem` / `dedupZ_subset` / `dedupZ_nodup` — the
    membership-preserving dedup that reconciles prime_factorization's
    repeated primes with PairwiseCop.
  * `distinct_primes_coprime` — ★ distinct primes are coprime (divisor
    classification both ways).
  * `pairwiseCop_of_nodup_primes` — a Nodup prime list is pairwise coprime.
  * `mem_dvd_zListProd` — members divide the list product.
  * `coprime_rep_to_target` — ★★ every primitive form has a chained
    representative coprime to ANY prime-presented target (dedup +
    coprime_rep_total + per-factor extraction + rebuild).
  * `ofRe_listProd` / `z_prime_data` — ★ every positive integer carries
    prime data (prime_factorization transported through ofRe).
  * `power_step_total` — ★★ THE LADDER CLIMBS: a primitive PosDef form of
    negative disc composes with ANY form of its disc with positive miss
    (PosDef rides the chain, so the representative's miss is positive and
    the composition is total).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSupply

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Coprimality to a product restricts to each factor. -/
theorem coprime_of_dvd_coprime {V P q : Z}
    (hcop : Coprime V P) (hdvd : ZDvd q P) : Coprime q V := by
  obtain ⟨al, be, hab⟩ := hcop
  obtain ⟨c, hc⟩ := hdvd
  exact ⟨be * c, al, by
    calc be * c * q + al * V = be * (q * c) + al * V := by ring
      _ = be * P + al * V := by rw [← hc]
      _ = 1 := by linarith [hab]⟩

/-- Coprime is symmetric. -/
theorem coprime_symm {a b : Z} (h : Coprime a b) : Coprime b a := by
  obtain ⟨u, v, huv⟩ := h
  exact ⟨v, u, by linarith [huv]⟩

/-- Membership-preserving dedup on Z-lists (classical membership test). -/
noncomputable def dedupZ : List Z → List Z
  | [] => []
  | q :: qs => if q ∈ qs then dedupZ qs else q :: dedupZ qs

theorem dedupZ_mem : ∀ {qs : List Z} {q : Z}, q ∈ qs → q ∈ dedupZ qs := by
  intro qs
  induction qs with
  | nil => intro q h; exact absurd h (List.not_mem_nil)
  | cons a rs ih =>
      intro q h
      unfold dedupZ
      by_cases haq : a ∈ rs
      · rw [if_pos haq]
        rcases List.mem_cons.mp h with rfl | h2
        · exact ih haq
        · exact ih h2
      · rw [if_neg haq]
        rcases List.mem_cons.mp h with rfl | h2
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem a (ih h2)

theorem dedupZ_subset : ∀ {qs : List Z} {q : Z}, q ∈ dedupZ qs → q ∈ qs := by
  intro qs
  induction qs with
  | nil => intro q h; exact absurd h (by unfold dedupZ; exact List.not_mem_nil)
  | cons a rs ih =>
      intro q h
      unfold dedupZ at h
      by_cases haq : a ∈ rs
      · rw [if_pos haq] at h
        exact List.mem_cons_of_mem a (ih h)
      · rw [if_neg haq] at h
        rcases List.mem_cons.mp h with rfl | h2
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem a (ih h2)

/-- Distinct primes are coprime (via divisor classification: gcd is 1 or q;
    if q then q ∣ r with both prime and distinct — the classification on r
    kills it). Supplied with the classification data explicit. -/
theorem distinct_primes_coprime {q r : Z} {pq pr : Re}
    (hq : q = Z.ofRe pq) (hpq : PrimeRe pq)
    (hr : r = Z.ofRe pr) (hpr : PrimeRe pr) (hne : q ≠ r) :
    Coprime q r := by
  obtain ⟨g, hgpos, ⟨c1, hc1⟩, ⟨c2, hc2⟩, a, b, hab⟩ :=
    gcd_bezout_exists q r (prime_ne_zero hq hpq)
  rcases prime_divisor_classification hq hpq hgpos ⟨c1, hc1⟩ with h1 | hgq
  · exact ⟨a, b, by rw [← hab, h1]⟩
  · -- g = q ⟹ q ∣ r ⟹ (classification on r) q = 1 ∨ q = r — both dead
    exfalso
    have hqdr : ZDvd q r := by
      rw [← hgq]
      exact ⟨c2, hc2⟩
    have hqpos : 0 < q := by
      have := prime_ge_two hq hpq
      linarith
    rcases prime_divisor_classification hr hpr hqpos hqdr with h1 | hqr
    · have := prime_ge_two hq hpq
      linarith
    · exact hne hqr

/-- ★ PairwiseCop for a NODUP list of primes. -/
theorem pairwiseCop_of_nodup_primes : ∀ {qs : List Z},
    (∀ q ∈ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p) → qs.Nodup →
    PairwiseCop qs := by
  intro qs
  induction qs with
  | nil => intro _ _; exact trivial
  | cons a rs ih =>
      intro hprimes hnd
      obtain ⟨hna, hndrs⟩ := List.nodup_cons.mp hnd
      refine ⟨?_, ih (fun q hq => hprimes q (List.mem_cons_of_mem a hq)) hndrs⟩
      intro r hr
      obtain ⟨pa, hqa, hpa⟩ := hprimes a (List.mem_cons_self ..)
      obtain ⟨pr, hqr, hpr⟩ := hprimes r (List.mem_cons_of_mem a hr)
      apply distinct_primes_coprime hqa hpa hqr hpr
      intro heq
      exact hna (heq ▸ hr)

/-- dedupZ preserves Nodup-ness (it CREATES it). -/
theorem dedupZ_nodup : ∀ (qs : List Z), (dedupZ qs).Nodup := by
  intro qs
  induction qs with
  | nil => exact List.nodup_nil
  | cons a rs ih =>
      unfold dedupZ
      by_cases haq : a ∈ rs
      · rw [if_pos haq]
        exact ih
      · rw [if_neg haq]
        refine List.nodup_cons.mpr ⟨?_, ih⟩
        intro hmem
        exact haq (dedupZ_subset hmem)

/-- A member divides the list product. -/
theorem mem_dvd_zListProd : ∀ {L : List Z} {q : Z}, q ∈ L → ZDvd q (zListProd L) := by
  intro L
  induction L with
  | nil => intro q h; exact absurd h (List.not_mem_nil)
  | cons a rs ih =>
      intro q h
      rcases List.mem_cons.mp h with rfl | h2
      · exact ⟨zListProd rs, rfl⟩
      · obtain ⟨c, hc⟩ := ih h2
        exact ⟨a * c, by
          show a * zListProd rs = q * (a * c)
          rw [hc]
          ring⟩

/-- ★★ THE COPRIME SUPPLY vs AN ARBITRARY POSITIVE TARGET: every primitive
    form has a chained representative coprime to any positive N (N's prime
    data supplied; dedup + extraction + rebuild). -/
theorem coprime_rep_to_target {f : BQF} (hprim : Primitive f)
    {N : Z} (qs : List Z)
    (hN : N = zListProd qs)
    (hprimes : ∀ q ∈ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p) :
    ∃ h : BQF, Chain f h ∧ Coprime h.a N := by
  -- 1. dedup, with primes data transported
  have hprimes' : ∀ q ∈ dedupZ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p :=
    fun q hq => hprimes q (dedupZ_subset hq)
  have hpc : PairwiseCop (dedupZ qs) :=
    pairwiseCop_of_nodup_primes hprimes' (dedupZ_nodup qs)
  -- 2. the deduped supply
  obtain ⟨h, hch, hcop⟩ := coprime_rep_total hprim (dedupZ qs) hprimes' hpc
  -- 3. per-prime extraction + rebuild vs the FULL product
  refine ⟨h, hch, ?_⟩
  rw [hN]
  apply coprime_of_coprime_all
  intro q hq
  -- q ∈ qs ⟹ q ∈ dedup ⟹ q divides the dedup product ⟹ Coprime q h.a
  have hqd : q ∈ dedupZ qs := dedupZ_mem hq
  exact coprime_of_dvd_coprime hcop (mem_dvd_zListProd hqd)

/-- ofRe carries list products. -/
theorem ofRe_listProd : ∀ L : List Re,
    Z.ofRe (listProd L) = zListProd (L.map Z.ofRe) := by
  intro L
  induction L with
  | nil =>
      show Z.ofRe oneR = zListProd []
      show Z.ofRe oneR = 1
      exact Z.ofRe_one
  | cons p ps ih =>
      show Z.ofRe (p * listProd ps) = zListProd (Z.ofRe p :: ps.map Z.ofRe)
      rw [Z.ofRe_mul, ih]
      rfl

/-- ★ PRIME DATA for every positive integer. -/
theorem z_prime_data {z : Z} (hz : 0 < z) :
    ∃ qs : List Z, z = zListProd qs ∧
      ∀ q ∈ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p := by
  obtain ⟨n, hn | hn⟩ := z_trichotomy z
  · -- z = ofRe n, n > 0 on the count side
    have hnpos : Re.void < n := by
      by_contra hc
      push_neg at hc
      have h0 : n = Re.void := le_antisymm hc (Re.zero_le n)
      rw [hn, h0, show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero] at hz
      exact lt_irrefl _ hz
    obtain ⟨L, hLp, hLprod⟩ := prime_factorization n hnpos
    refine ⟨L.map Z.ofRe, ?_, ?_⟩
    · rw [hn, hLprod]
      exact ofRe_listProd L
    · intro q hq
      obtain ⟨p, hpL, hpq⟩ := List.mem_map.mp hq
      exact ⟨p, hpq.symm, hLp p hpL⟩
  · exfalso
    have hnn : (0 : Z) ≤ Z.ofRe n := ofRe_nonneg n
    rw [hn] at hz
    linarith

/-- ★★ THE LADDER CLIMBS: a primitive PosDef form of negative disc composes
    (through a chained representative) with ANY form of its disc having
    positive miss. PosDef transports along the chain (banked chain_posdef),
    so the representative's miss is POSITIVE — nonzero for free. -/
theorem power_step_total {f h : BQF} (hprim : Primitive f)
    (hpos : PosDef f) (hDneg : disc f < 0)
    (hdisc : disc f = disc h) (hha : 0 < h.a) :
    ∃ f' h' : BQF, Chain f f' ∧ CompRel f' h h' := by
  -- prime data for h.a
  obtain ⟨qs, hqs, hprimes⟩ := z_prime_data hha
  -- the coprime representative
  obtain ⟨f', hch, hcop⟩ := coprime_rep_to_target hprim qs hqs hprimes
  -- PosDef rides the chain: f'.a > 0
  have hpos' : PosDef f' := chain_posdef hch hpos hDneg
  have hne : f'.a * h.a ≠ 0 := by
    have := mul_pos hpos'.1 hha
    linarith
  obtain ⟨al, be, hab⟩ := hcop
  have hdisc' : disc f' = disc h := by
    rw [← disc_eq hch]
    exact hdisc
  obtain ⟨h', hcomp⟩ := compRel_total hab hne hdisc'
  exact ⟨f', h', hch, hcomp⟩


#print axioms coprime_rep_to_target
#print axioms z_prime_data
#print axioms power_step_total

end BQF
end GaussForms
end Phys.Foundation
