/-
  # THE TWO-CLASS LAW — a prime's branch hits are class-or-mirror
  (GQ SG-g/h)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The weld legitimizing window_payment's two-class hypothesis at REAL
  principal branches — the quantifier-exact ingredient the external
  audit demanded:

  * `pvalue_diff_factor` — ★ P(x) − P(y) = (x − y)(x + y + 1).
  * `two_class_law` — ★★★ a Euclid prime dividing two principal values
    divides x − y or x + y + 1 (hits fall in the root class or its
    mirror — root_pair's two classes are ALL there is).
  * `prime_euclid` — ★★★ THE EUCLID BRIDGE: every PrimeRe prime has
    the Z-side Euclid property (gcd_bezout_exists +
    prime_divisor_classification + euclid_lemma composed).
  * `two_class_law_prime` — ★★ the hypothesis-free composite: at any
    PrimeRe prime, two branch hits force class-or-mirror.

  With this, window_payment (N627) applies to actual P-value windows
  with every hypothesis discharged by arithmetic: the prime-factory
  assembly (deferral ⟹ prime-density lower bound) is next.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussWindowPayment

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★ THE FACTORIZATION: difference of principal values. -/
theorem pvalue_diff_factor {c₀ x y : Z} :
    (x * x + x + c₀) - (y * y + y + c₀) = (x - y) * (x + y + 1) := by
  ring

/-- ★★★ THE TWO-CLASS LAW: a Euclid prime dividing two principal values
    divides the difference-of-arguments or the mirror-sum. -/
theorem two_class_law {p c₀ x y mx my : Z}
    (heuclid : ∀ m n : Z, ZDvd p (m * n) → ZDvd p m ∨ ZDvd p n)
    (hx : x * x + x + c₀ = p * mx) (hy : y * y + y + c₀ = p * my) :
    ZDvd p (x - y) ∨ ZDvd p (x + y + 1) := by
  have hdiff : ZDvd p ((x - y) * (x + y + 1)) := by
    refine ⟨mx - my, ?_⟩
    have := pvalue_diff_factor (c₀ := c₀) (x := x) (y := y)
    calc (x - y) * (x + y + 1)
        = (x * x + x + c₀) - (y * y + y + c₀) := this.symm
      _ = p * mx - p * my := by rw [hx, hy]
      _ = p * (mx - my) := by ring
  exact heuclid _ _ hdiff

/-- ★★★ THE EUCLID BRIDGE: PrimeRe primes are Euclid primes on Z. -/
theorem prime_euclid {q : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p) :
    ∀ m n : Z, ZDvd q (m * n) → ZDvd q m ∨ ZDvd q n := by
  intro m n hmn
  by_cases hm : ZDvd q m
  · exact Or.inl hm
  · right
    have hqne : q ≠ 0 := prime_ne_zero hq hprime
    obtain ⟨g, hgpos, hgq, hgm, a, b, hbez⟩ := gcd_bezout_exists q m hqne
    have hclass : g = 1 ∨ g = q :=
      prime_divisor_classification hq hprime hgpos hgq
    have hcop : Coprime q m := by
      rcases hclass with h1 | hgqq
      · exact ⟨a, b, by rw [← hbez, h1]⟩
      · exfalso
        apply hm
        rw [← hgqq]
        exact hgm
    exact euclid_lemma hcop hmn

/-- ★★ THE DISCHARGED TWO-CLASS LAW: at any PrimeRe prime, two branch
    hits force class-or-mirror — no hypothesis left. -/
theorem two_class_law_prime {q c₀ x y mx my : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (hx : x * x + x + c₀ = q * mx) (hy : y * y + y + c₀ = q * my) :
    ZDvd q (x - y) ∨ ZDvd q (x + y + 1) :=
  two_class_law (prime_euclid hq hprime) hx hy


#print axioms pvalue_diff_factor
#print axioms two_class_law
#print axioms prime_euclid
#print axioms two_class_law_prime

end BQF
end GaussForms
end Phys.Foundation
