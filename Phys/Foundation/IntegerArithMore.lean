/-
  # THE PRIME LAYER OF THE FOLD'S ARITHMETIC — primes, factorization, Euclid

  ## What this file proves (GQ campaign, production node — L0 completion)

  Extends `IntegerArith` with the multiplicative layer, still entirely on the
  DERIVED tower (Re = the fold's ℕ, Z = the fold's ℤ), no Mathlib number
  content:

  * `dvdRe`/`PrimeRe` — divisibility and primality on the derived ℕ.
  * `exists_prime_dvd` — ★ every count above 1 has a PRIME divisor
    (least-divisor argument through the banked well-ordering).
  * `prime_factorization` — ★ every positive count is a finite product of
    primes (list form; strong-induction peeling).
  * `euclid_lemma` — ★ Euclid's lemma in Bézout form on Z: Coprime p m and
    p ∣ m·n ⟹ p ∣ n.
  * `coprime_mul`/`coprime_of_coprime_all` — the coprime algebra: Bézout
    witnesses multiply; coprimality assembles across a list product.
  * `coprime_of_prime_not_dvd` — divisor classification + non-divisibility
    ⟹ coprimality (the prime-vs-value converter).

  ## Standard
  Foundations-only; no sorry; trunk imports only (extends IntegerArith).
-/
import Phys.Foundation.IntegerArith

namespace Phys.Foundation
namespace IntegerArith

open Re

/-! ### Divisibility and primality on the derived ℕ. -/

def dvdRe (d n : Re) : Prop := ∃ c : Re, n = d * c

theorem dvdRe_refl (n : Re) : dvdRe n n := ⟨1, (mul_one n).symm⟩

theorem dvdRe_trans {a b c : Re} (h1 : dvdRe a b) (h2 : dvdRe b c) : dvdRe a c := by
  obtain ⟨x, rfl⟩ := h1
  obtain ⟨y, rfl⟩ := h2
  exact ⟨x * y, mul_assoc a x y⟩

def oneR : Re := Re.step Re.void

/-- n is prime: 1 < n and every divisor is 1 or n. -/
def PrimeRe (p : Re) : Prop :=
  oneR < p ∧ ∀ d, dvdRe d p → d = oneR ∨ d = p

theorem dvd_le {d n : Re} (hn : n ≠ 0) (h : dvdRe d n) : d ≤ n := by
  obtain ⟨c, rfl⟩ := h
  match c with
  | .void =>
      exfalso
      apply hn
      show d * Re.void = 0
      exact Re.mul_void d
  | .step c =>
      rw [Re.mul_step]
      exact ⟨d * c, by rw [add_comm]⟩

theorem one_dvd (n : Re) : dvdRe oneR n := ⟨n, by
  show n = oneR * n
  exact (Re.one_mul n).symm⟩

/-- ★ EVERY COUNT ABOVE 1 HAS A PRIME DIVISOR. -/
theorem exists_prime_dvd : ∀ n : Re, oneR < n → ∃ p, PrimeRe p ∧ dvdRe p n := by
  refine strong_induction (P := fun n => oneR < n → ∃ p, PrimeRe p ∧ dvdRe p n) ?_
  intro n ih hn
  have hex : ∃ d, (oneR < d ∧ dvdRe d n) := ⟨n, hn, dvdRe_refl n⟩
  obtain ⟨p, ⟨hp1, hpd⟩, hleast⟩ := least_element (P := fun d => oneR < d ∧ dvdRe d n) hex
  refine ⟨p, ⟨hp1, ?_⟩, hpd⟩
  intro e hep
  have hpne : p ≠ 0 := by
    intro h0
    subst h0
    obtain ⟨c, hc⟩ := lt_iff_step_le.mp hp1
    have : Re.step (oneR + c) = Re.void := by
      rw [← Re.step_add]
      exact hc.symm
    exact Re.step_ne_void _ this
  have hele : e ≤ p := dvd_le hpne hep
  rcases eq_or_ne e oneR with h1 | hne1
  · exact Or.inl h1
  · have hene0 : e ≠ 0 := by
      intro h0
      subst h0
      obtain ⟨c, rfl⟩ := hep
      apply hpne
      show (0 : Re) * c = 0
      exact Re.void_mul c
    have h1e : oneR < e := by
      match e, hene0, hne1 with
      | .step m, _, hne1' =>
          match m with
          | .void => exact absurd rfl hne1'
          | .step m' =>
              rw [lt_iff_step_le]
              exact ⟨m', by
                show Re.step (Re.step m') = Re.step oneR + m'
                calc Re.step (Re.step m')
                    = Re.step (Re.step Re.void + m') := by
                      congr 1
                      calc Re.step m' = Re.step (Re.void + m') := by rw [Re.void_add]
                        _ = Re.step Re.void + m' := (Re.step_add _ _).symm
                  _ = Re.step (Re.step Re.void) + m' := (Re.step_add _ _).symm
                  _ = Re.step oneR + m' := rfl⟩
    have hedvdn : dvdRe e n := dvdRe_trans hep hpd
    have hple : p ≤ e := hleast e ⟨h1e, hedvdn⟩
    exact Or.inr (le_antisymm hele hple)

/-- The product of a list of counts. -/
def listProd : List Re → Re
  | [] => oneR
  | p :: ps => p * listProd ps

/-- ★ PRIME FACTORIZATION EXISTENCE. -/
theorem prime_factorization : ∀ n : Re, Re.void < n →
    ∃ L : List Re, (∀ p ∈ L, PrimeRe p) ∧ n = listProd L := by
  refine strong_induction
    (P := fun n => Re.void < n → ∃ L : List Re, (∀ p ∈ L, PrimeRe p) ∧ n = listProd L) ?_
  intro n ih hn
  rcases eq_or_ne n oneR with h1 | hne1
  · refine ⟨[], ?_, ?_⟩
    · intro p hp
      cases hp
    · rw [h1]
      rfl
  · have h1n : oneR < n := by
      obtain ⟨c, hc⟩ := lt_iff_step_le.mp hn
      have hnc : n = Re.step c := by
        rw [hc]
        calc Re.step Re.void + c = Re.step (Re.void + c) := Re.step_add _ _
          _ = Re.step c := by rw [Re.void_add]
      match c, hnc with
      | .void, hnc => exact absurd hnc hne1
      | .step c', hnc =>
          rw [hnc, lt_iff_step_le]
          exact ⟨c', by
            show Re.step (Re.step c') = Re.step oneR + c'
            calc Re.step (Re.step c')
                = Re.step (Re.step Re.void + c') := by
                  congr 1
                  calc Re.step c' = Re.step (Re.void + c') := by rw [Re.void_add]
                    _ = Re.step Re.void + c' := (Re.step_add _ _).symm
              _ = Re.step (Re.step Re.void) + c' := (Re.step_add _ _).symm
              _ = Re.step oneR + c' := rfl⟩
    obtain ⟨p, hp, ⟨m, hm⟩⟩ := exists_prime_dvd n h1n
    have hpne0 : p ≠ 0 := by
      intro h0
      subst h0
      have hv : (0 : Re) * m = 0 := Re.void_mul m
      rw [hv] at hm
      subst hm
      exact lt_irrefl _ hn
    have hmne0 : m ≠ 0 := by
      intro h0
      subst h0
      have hv : p * (0 : Re) = 0 := Re.mul_void p
      rw [hv] at hm
      subst hm
      exact lt_irrefl _ hn
    have hmpos : Re.void < m :=
      lt_of_le_of_ne (Re.zero_le m) (fun h => hmne0 h.symm)
    have hmn : m < n := by
      obtain ⟨q, hq⟩ := lt_iff_step_le.mp hp.1
      have hpsq : p = Re.step (oneR + q) := by
        rw [hq]
        exact (Re.step_add _ _)
      have hexp : n = (oneR + q) * m + m := by
        rw [hm, hpsq, Re.step_mul]
      rw [hexp, lt_iff_step_le]
      have hposprod : Re.void < (oneR + q) * m := by
        have h1q : Re.void < oneR + q := by
          rw [lt_iff_step_le]
          exact ⟨q, by
            show oneR + q = Re.step Re.void + q
            rfl⟩
        obtain ⟨s, hs⟩ := lt_iff_step_le.mp h1q
        have h1qs : oneR + q = Re.step s := by
          rw [hs]
          calc Re.step Re.void + s = Re.step (Re.void + s) := Re.step_add _ _
            _ = Re.step s := by rw [Re.void_add]
        rw [h1qs, Re.step_mul]
        obtain ⟨t, ht⟩ := lt_iff_step_le.mp hmpos
        have hmt : m = Re.step t := by
          rw [ht]
          calc Re.step Re.void + t = Re.step (Re.void + t) := Re.step_add _ _
            _ = Re.step t := by rw [Re.void_add]
        rw [hmt, lt_iff_step_le]
        refine ⟨s * Re.step t + t, ?_⟩
        calc s * Re.step t + Re.step t
            = Re.step t + s * Re.step t := add_comm _ _
          _ = Re.step (t + s * Re.step t) := Re.step_add _ _
          _ = Re.step (s * Re.step t + t) := by rw [add_comm t _]
          _ = Re.step Re.void + (s * Re.step t + t) := by
              rw [Re.step_add, Re.void_add]
      obtain ⟨w, hw⟩ := lt_iff_step_le.mp hposprod
      have hprodw : (oneR + q) * m = Re.step w := by
        rw [hw]
        calc Re.step Re.void + w = Re.step (Re.void + w) := Re.step_add _ _
          _ = Re.step w := by rw [Re.void_add]
      refine ⟨w, ?_⟩
      rw [hprodw]
      calc Re.step w + m = Re.step (w + m) := Re.step_add _ _
        _ = Re.step (m + w) := by rw [add_comm w m]
        _ = Re.step m + w := (Re.step_add _ _).symm
    obtain ⟨L, hL, hLprod⟩ := ih m hmn hmpos
    refine ⟨p :: L, ?_, ?_⟩
    · intro r hr
      rcases List.mem_cons.mp hr with h | h
      · rw [h]; exact hp
      · exact hL r h
    · rw [hm, hLprod]
      rfl

/-! ### The coprime algebra on Z (Euclid's lemma, Bézout form). -/

def Coprime (x y : Z) : Prop := ∃ u v : Z, u * x + v * y = 1

def ZDvd (d x : Z) : Prop := ∃ c : Z, x = d * c

theorem zdvd_trans {d m z : Z} (h1 : ZDvd d m) (h2 : ZDvd m z) : ZDvd d z := by
  obtain ⟨c1, rfl⟩ := h1
  obtain ⟨c2, rfl⟩ := h2
  exact ⟨c1 * c2, mul_assoc d c1 c2⟩

/-- ★ EUCLID'S LEMMA (Bézout form). -/
theorem euclid_lemma {p m n : Z} (hcop : Coprime p m) (hdvd : ZDvd p (m * n)) :
    ZDvd p n := by
  obtain ⟨u, v, huv⟩ := hcop
  obtain ⟨c, hc⟩ := hdvd
  refine ⟨u * n + v * c, ?_⟩
  calc n = n * (u * p + v * m) := by rw [huv, mul_one]
    _ = p * (u * n) + v * (m * n) := by ring
    _ = p * (u * n) + v * (p * c) := by rw [← hc]
    _ = p * (u * n + v * c) := by ring

theorem coprime_symm {x y : Z} (h : Coprime x y) : Coprime y x := by
  obtain ⟨u, v, huv⟩ := h
  exact ⟨v, u, by linarith [huv]⟩

/-- ★ Bézout witnesses multiply. -/
theorem coprime_mul {q a b : Z} (ha : Coprime q a) (hb : Coprime q b) :
    Coprime q (a * b) := by
  obtain ⟨ua, va, hua⟩ := ha
  obtain ⟨ub, vb, hub⟩ := hb
  refine ⟨ua * ub * q + ua * vb * b + va * a * ub, va * vb, ?_⟩
  have hexp : (ua * q + va * a) * (ub * q + vb * b) = 1 := by
    rw [hua, hub, one_mul]
  calc (ua * ub * q + ua * vb * b + va * a * ub) * q + va * vb * (a * b)
      = (ua * q + va * a) * (ub * q + vb * b) := by ring
    _ = 1 := hexp

def zListProd : List Z → Z
  | [] => 1
  | q :: qs => q * zListProd qs

/-- ★ Coprimality assembles across a list product. -/
theorem coprime_of_coprime_all {V : Z} :
    ∀ qs : List Z, (∀ q ∈ qs, Coprime q V) → Coprime V (zListProd qs) := by
  intro qs
  induction qs with
  | nil => exact fun _ => ⟨0, 1, by show 0 * V + 1 * 1 = 1; ring⟩
  | cons q rs ih =>
      intro hall
      have hq : Coprime V q := coprime_symm (hall q (List.mem_cons_self ..))
      have hrs : Coprime V (zListProd rs) :=
        ih (fun r hr => hall r (List.mem_cons_of_mem q hr))
      exact coprime_mul hq hrs

/-- Every member divides the list product. -/
theorem mem_dvd_zListProd {q : Z} {qs : List Z} (h : q ∈ qs) :
    ZDvd q (zListProd qs) := by
  induction qs with
  | nil => cases h
  | cons r rs ih =>
      rcases List.mem_cons.mp h with heq | hmem
      · subst heq
        exact ⟨zListProd rs, rfl⟩
      · obtain ⟨c, hc⟩ := ih hmem
        refine ⟨r * c, ?_⟩
        show r * zListProd rs = q * (r * c)
        rw [hc]
        ring

/-- ★ Divisor classification + non-divisibility ⟹ coprimality. -/
theorem coprime_of_prime_not_dvd {q x g a b : Z}
    (hgx : ZDvd g x) (hbez : g = a * q + b * x)
    (hclass : g = 1 ∨ g = q) (hnd : ¬ ZDvd q x) : Coprime q x := by
  rcases hclass with h1 | hq
  · exact ⟨a, b, by rw [← hbez, h1]⟩
  · exfalso
    apply hnd
    rw [← hq]
    exact hgx

end IntegerArith
end Phys.Foundation
