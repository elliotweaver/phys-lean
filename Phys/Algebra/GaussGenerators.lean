/-
  # THE GENERATORS — factor tree, prime-power regrouping (GQ N605)

  ## What this file proves (GQ campaign, production node — R6 core)

  Every class of every negative discriminant is an EXPLICIT iterated
  composition of prime-power-miss branch forms of its own reduced
  representative — THE LAW's generator theorem, materially:

  * `ProdRel` — the iterated CompRel product (nil = principal shape).
  * `zListProd_ne_zero` — nonzero lists have nonzero products.
  * `generator_factorization` — ★★ THE FACTOR TREE: a form whose miss is a
    pairwise-coprime product IS the iterated composition of its branch
    forms, every branch carrying the shared record and a miss from the
    list (iterated miss_split; the recursion threads the cofactor).
  * `zpow` + `coprime_zpow(_right)` — integer powers on the fold's ℕ;
    coprimality lifts over powers on both sides.
  * `eqPart` / `nePart` + partition algebra — the classical partition.
  * `grouped_presentation` — ★★ every prime list regroups into a
    pairwise-coprime PRIME-POWER list with the same product (strong
    induction on length; head group = q^(1+count); distinct prime powers
    coprime via the classification).
  * `grouped_prime_data` — ★★ every positive integer is a pairwise-coprime
    product of prime powers.

  Composition (at the capstone): reduced miss → grouped_prime_data →
  generator_factorization ⟹ every class = ProdRel product of prime-power
  branches. The generators of Cl(D), explicit, no Minkowski bound needed.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCycleTheorem

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- The iterated CompRel product: h is the composition of the list gs
    (right-fold; empty product = principal shape). -/
inductive ProdRel : List BQF → BQF → Prop
  | nil {e : BQF} (he : e.a = 1) : ProdRel [] e
  | cons {g : BQF} {gs : List BQF} {h' h : BQF}
      (hp : ProdRel gs h') (hc : CompRel g h' h) : ProdRel (g :: gs) h

/-- Nonzero lists have nonzero products. -/
theorem zListProd_ne_zero : ∀ {L : List Z}, (∀ q ∈ L, q ≠ 0) →
    zListProd L ≠ 0 := by
  intro L
  induction L with
  | nil =>
      intro _ h0
      exact one_ne_zero h0
  | cons q rs ih =>
      intro hne h0
      have : q * zListProd rs = 0 := h0
      rcases mul_eq_zero.mp this with h1 | h1
      · exact hne q (List.mem_cons_self ..) h1
      · exact ih (fun r hr => hne r (List.mem_cons_of_mem q hr)) h1

/-- ★★ THE FACTOR TREE: a form whose miss is a pairwise-coprime product IS
    the iterated composition of its branch forms — every branch carries
    the shared record and a miss from the list. -/
theorem generator_factorization :
    ∀ (L : List Z), PairwiseCop L → (∀ q ∈ L, q ≠ 0) →
    ∀ (b c : Z),
    ∃ gs : List BQF, ProdRel gs (⟨zListProd L, b, c⟩ : BQF) ∧
      (∀ g ∈ gs, g.b = b ∧ g.a ∈ L) := by
  intro L
  induction L with
  | nil =>
      intro _ _ b c
      refine ⟨[], ProdRel.nil rfl, ?_⟩
      intro g hg
      exact absurd hg (List.not_mem_nil)
  | cons q rs ih =>
      intro hpc hne b c
      obtain ⟨hqr, hpcrs⟩ := hpc
      have hcopP : Coprime q (zListProd rs) :=
        coprime_of_coprime_all rs (fun r hr => coprime_symm (hqr r hr))
      obtain ⟨al, be, hbez⟩ := hcopP
      have hqne : q ≠ 0 := hne q (List.mem_cons_self ..)
      have hPne : zListProd rs ≠ 0 :=
        zListProd_ne_zero (fun r hr => hne r (List.mem_cons_of_mem q hr))
      have hprodne : q * zListProd rs ≠ 0 := by
        intro h0
        rcases mul_eq_zero.mp h0 with h1 | h1
        · exact hqne h1
        · exact hPne h1
      have hsplit := miss_split (b := b) (c := c) hbez hprodne
      obtain ⟨gs, hprod, hmem⟩ := ih hpcrs
        (fun r hr => hne r (List.mem_cons_of_mem q hr)) b (q * c)
      refine ⟨(⟨q, b, zListProd rs * c⟩ : BQF) :: gs,
        ProdRel.cons hprod ?_, ?_⟩
      · -- CompRel head tail-product target; target miss is definitional
        exact hsplit
      · intro g hg
        rcases List.mem_cons.mp hg with rfl | h2
        · exact ⟨rfl, List.mem_cons_self ..⟩
        · obtain ⟨hb, ha⟩ := hmem g h2
          exact ⟨hb, List.mem_cons_of_mem q ha⟩


/-! ### The zpow kit. -/

def zpow (q : Z) : Re → Z
  | .void => 1
  | .step n => q * zpow q n

theorem zpow_step (q : Z) (n : Re) : zpow q (Re.step n) = q * zpow q n := rfl

theorem coprime_zpow_right {a q : Z} (h : Coprime a q) :
    ∀ e : Re, Coprime a (zpow q e) := by
  intro e
  induction e with
  | void =>
      exact ⟨0, 1, by
        show 0 * a + 1 * zpow q Re.void = 1
        show (0 : Z) * a + 1 * 1 = 1
        ring⟩
  | step n ih =>
      rw [zpow_step]
      exact coprime_mul h ih

theorem coprime_zpow {a q : Z} (h : Coprime a q) (e f : Re) :
    Coprime (zpow a f) (zpow q e) := by
  induction f with
  | void =>
      exact ⟨1, 0, by
        show 1 * zpow a Re.void + 0 * zpow q e = 1
        show (1 : Z) * 1 + 0 * zpow q e = 1
        ring⟩
  | step n ih =>
      rw [zpow_step]
      apply coprime_symm
      apply coprime_mul
      · exact coprime_symm (coprime_zpow_right h e)
      · exact coprime_symm ih

/-! ### The classical partition. -/

open Classical in
noncomputable def eqPart (q : Z) : List Z → List Z
  | [] => []
  | x :: xs => if x = q then x :: eqPart q xs else eqPart q xs

open Classical in
noncomputable def nePart (q : Z) : List Z → List Z
  | [] => []
  | x :: xs => if x = q then nePart q xs else x :: nePart q xs

theorem prod_split (q : Z) : ∀ l : List Z,
    zListProd l = zListProd (eqPart q l) * zListProd (nePart q l) := by
  intro l
  induction l with
  | nil =>
      show (1 : Z) = zListProd [] * zListProd []
      show (1 : Z) = 1 * 1
      ring
  | cons x xs ih =>
      by_cases h : x = q
      · rw [eqPart, nePart, if_pos h, if_pos h]
        show x * zListProd xs = (x * zListProd (eqPart q xs)) * zListProd (nePart q xs)
        rw [ih]
        ring
      · rw [eqPart, nePart, if_neg h, if_neg h]
        show x * zListProd xs = zListProd (eqPart q xs) * (x * zListProd (nePart q xs))
        rw [ih]
        ring

theorem eqPart_prod (q : Z) : ∀ l : List Z,
    zListProd (eqPart q l) = zpow q (reOfNat (eqPart q l).length) := by
  intro l
  induction l with
  | nil => rfl
  | cons x xs ih =>
      by_cases h : x = q
      · rw [eqPart, if_pos h]
        show x * zListProd (eqPart q xs) = zpow q (reOfNat ((eqPart q xs).length + 1))
        rw [ih, h]
        rfl
      · rw [eqPart, if_neg h]
        exact ih

theorem nePart_mem {q x : Z} : ∀ {l : List Z}, x ∈ nePart q l → x ≠ q ∧ x ∈ l := by
  intro l
  induction l with
  | nil =>
      intro h
      rw [nePart] at h
      exact absurd h (List.not_mem_nil)
  | cons y ys ih =>
      intro h
      rw [nePart] at h
      by_cases hy : y = q
      · rw [if_pos hy] at h
        obtain ⟨hne, hmem⟩ := ih h
        exact ⟨hne, List.mem_cons_of_mem y hmem⟩
      · rw [if_neg hy] at h
        rcases List.mem_cons.mp h with rfl | h2
        · exact ⟨hy, List.mem_cons_self ..⟩
        · obtain ⟨hne, hmem⟩ := ih h2
          exact ⟨hne, List.mem_cons_of_mem y hmem⟩

theorem nePart_len (q : Z) : ∀ l : List Z, (nePart q l).length ≤ l.length := by
  intro l
  induction l with
  | nil =>
      exact Nat.le_refl _
  | cons y ys ih =>
      by_cases hy : y = q
      · rw [nePart, if_pos hy]
        exact Nat.le_succ_of_le ih
      · rw [nePart, if_neg hy]
        exact Nat.succ_le_succ ih

/-! ### ★★ The grouped presentation. -/

theorem grouped_presentation :
    ∀ N : Nat, ∀ qs : List Z, qs.length ≤ N →
    (∀ q ∈ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p) →
    ∃ gs : List Z, PairwiseCop gs ∧ zListProd gs = zListProd qs ∧
      ∀ x ∈ gs, ∃ (p e : Re), PrimeRe p ∧ x = zpow (Z.ofRe p) (Re.step e) ∧
        Z.ofRe p ∈ qs := by
  intro N
  induction N with
  | zero =>
      intro qs hlen hprimes
      cases qs with
      | nil => exact ⟨[], trivial, rfl, fun x hx => absurd hx (List.not_mem_nil)⟩
      | cons q rest => exact absurd hlen (Nat.not_succ_le_zero _)
  | succ N ih =>
      intro qs hlen hprimes
      cases qs with
      | nil => exact ⟨[], trivial, rfl, fun x hx => absurd hx (List.not_mem_nil)⟩
      | cons q rest =>
          obtain ⟨pq, hqp, hpq⟩ := hprimes q (List.mem_cons_self ..)
          have hlenr : rest.length ≤ N := Nat.le_of_succ_le_succ hlen
          have hlen' : (nePart q rest).length ≤ N :=
            le_trans (nePart_len q rest) hlenr
          have hprimes' : ∀ r ∈ nePart q rest, ∃ p, r = Z.ofRe p ∧ PrimeRe p :=
            fun r hr =>
              hprimes r (List.mem_cons_of_mem q (nePart_mem hr).2)
          obtain ⟨gs, hpc, hprod, hspec⟩ := ih (nePart q rest) hlen' hprimes'
          refine ⟨zpow q (Re.step (reOfNat (eqPart q rest).length)) :: gs,
            ⟨?_, hpc⟩, ?_, ?_⟩
          · -- head coprime to every tail group
            intro r hr
            obtain ⟨pr, er, hprr, hreq, hbase⟩ := hspec r hr
            have hbne : Z.ofRe pr ≠ q := (nePart_mem hbase).1
            have hcqr : Coprime q (Z.ofRe pr) :=
              distinct_primes_coprime hqp hpq rfl hprr (Ne.symm hbne)
            rw [hreq]
            exact coprime_zpow hcqr (Re.step er) (Re.step (reOfNat (eqPart q rest).length))
          · -- the product
            show zpow q (Re.step (reOfNat (eqPart q rest).length)) * zListProd gs
              = zListProd (q :: rest)
            calc zpow q (Re.step (reOfNat (eqPart q rest).length)) * zListProd gs
                = (q * zpow q (reOfNat (eqPart q rest).length)) * zListProd gs := by
                  rw [zpow_step]
              _ = (q * zListProd (eqPart q rest)) * zListProd (nePart q rest) := by
                  rw [eqPart_prod, hprod]
              _ = q * (zListProd (eqPart q rest) * zListProd (nePart q rest)) := by
                  ring
              _ = q * zListProd rest := by
                  rw [← prod_split]
              _ = zListProd (q :: rest) := rfl
          · -- the spec
            intro x hx
            rcases List.mem_cons.mp hx with rfl | h2
            · refine ⟨pq, reOfNat (eqPart q rest).length, hpq, ?_, ?_⟩
              · rw [← hqp]
              · rw [← hqp]
                exact List.mem_cons_self ..

            · obtain ⟨pr, er, hprr, hreq, hbase⟩ := hspec x h2
              exact ⟨pr, er, hprr, hreq,
                List.mem_cons_of_mem q (nePart_mem hbase).2⟩

/-- ★★ Every positive integer is a pairwise-coprime product of prime
    powers. -/
theorem grouped_prime_data {z : Z} (hz : 0 < z) :
    ∃ gs : List Z, PairwiseCop gs ∧ z = zListProd gs ∧
      ∀ x ∈ gs, ∃ (p e : Re), PrimeRe p ∧ x = zpow (Z.ofRe p) (Re.step e) := by
  obtain ⟨qs, hqs, hprimes⟩ := z_prime_data hz
  obtain ⟨gs, hpc, hprod, hspec⟩ :=
    grouped_presentation qs.length qs (Nat.le_refl _) hprimes
  refine ⟨gs, hpc, by rw [hqs, ← hprod], ?_⟩
  intro x hx
  obtain ⟨p, e, hp, hx', _⟩ := hspec x hx
  exact ⟨p, e, hp, hx'⟩


#print axioms generator_factorization
#print axioms coprime_zpow
#print axioms grouped_presentation
#print axioms grouped_prime_data

end BQF
end GaussForms
end Phys.Foundation
