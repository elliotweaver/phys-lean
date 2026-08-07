/-
  # THE VALUE TRICHOTOMY — the E_m dichotomy formalized (GQ SG-b/c)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The per-x engine of the E_m theorem (seedcount < m ⟹ D ∈ E_m finite):

  * `value_trichotomy` — ★★★ any count above 1 is PrimeRe, has a DEEP
    prime factor (4r² ≤ A), or has a SHALLOW least factor pinning it to
    the band (A < 4r², r² ≤ n) — small_factor_of_composite welded to
    the band lemma; no fourth case exists.
  * `one_lt_re_of_Z` — the Z→Re bridge for the threshold.
  * `pvalue_trichotomy` — ★★★ THE INSTANTIATION: every principal value
    P(x) > 1 at odd disc (A = 4c₀ − 1 = |D|) is prime, deep-seeded, or
    band-pinched. The prime horn is the deferral/Rabinowitsch regime
    (banked N623/N624); the seed horn bills h(D) via seed_slot (N619);
    the band horn is the pinch (N625).
  * `pvalue_witness` — 4·P(x) = (2x+1)² + A, packaged.

  Aggregated over x with the burden arithmetic (E_m base data: |E_1|=32
  max 1,423 ... |E_6|=1,845 max 49,463 at 4×10⁷), this is the E_m
  theorem's skeleton; the remaining link is the burden lemma (joint
  inertness unsatisfiable past explicit threshold).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussBandLemma

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★★★ THE VALUE TRICHOTOMY: an integer n > 1 (realized as ofRe of a
    count) is prime, or has a deep prime factor (4r² ≤ A), or has a
    shallow least factor pinning it to the band (A < 4r², r² ≤ n). -/
theorem value_trichotomy {n : Re} {nz A : Z}
    (hnz : nz = Z.ofRe n) (h1 : oneR < n) (hA : 0 < A) :
    PrimeRe n ∨
    (∃ r : Re, PrimeRe r ∧ dvdRe r n ∧ 4 * (Z.ofRe r * Z.ofRe r) ≤ A) ∨
    (∃ r : Re, PrimeRe r ∧ dvdRe r n ∧
      A < 4 * (Z.ofRe r * Z.ofRe r) ∧ Z.ofRe r * Z.ofRe r ≤ nz) := by
  by_cases hp : PrimeRe n
  · exact Or.inl hp
  · obtain ⟨r, hrprime, hrdvd, hrsq⟩ := small_factor_of_composite h1 hp
    rcases lt_trichotomy A (4 * (Z.ofRe r * Z.ofRe r)) with hshallow | heq | hdeep'
    case _ =>
      exact Or.inr (Or.inr ⟨r, hrprime, hrdvd, hshallow, by
        rw [hnz]; exact hrsq⟩)
    case _ =>
      exact Or.inr (Or.inl ⟨r, hrprime, hrdvd, le_of_eq heq.symm⟩)
    case _ =>
      exact Or.inr (Or.inl ⟨r, hrprime, hrdvd, le_of_lt hdeep'⟩)

/-- ★★ THE BANDED HORN, welded: in the third case with n = u·v the
    cofactor v = n/r inherits the coband (via band machinery): packaged
    as — shallow least factor r with r² ≤ n gives A < 4n (the value is
    past the wall) — the depth ceiling recovered from the horn itself. -/
theorem shallow_horn_ceiling {r n : Re} {A : Z}
    (hrprime : PrimeRe r) (hrdvd : dvdRe r n)
    (hshallow : A < 4 * (Z.ofRe r * Z.ofRe r))
    (hrsq : Z.ofRe r * Z.ofRe r ≤ Z.ofRe n) :
    A < 4 * Z.ofRe n := by
  have h4 : (0:Z) ≤ 4 := by norm_num
  nlinarith [hshallow, hrsq]

/-- Bridge: 1 < ofRe n ⟹ oneR < n. -/
theorem one_lt_re_of_Z {n : Re} (h : (1 : Z) < Z.ofRe n) : oneR < n := by
  rcases lt_trichotomy oneR n with hlt | heq | hgt
  · exact hlt
  · exfalso
    rw [← heq] at h
    have : Z.ofRe oneR = (1 : Z) := rfl
    rw [this] at h
    exact lt_irrefl _ h
  · exfalso
    have hm := ofRe_mono (le_of_lt hgt)
    have h1 : Z.ofRe oneR = (1 : Z) := rfl
    rw [h1] at hm
    linarith

/-- ★★★ THE P-VALUE TRICHOTOMY: every principal value above 1 is prime,
    yields a deep seed, or is band-pinched composite. -/
theorem pvalue_trichotomy {c₀ x A nz : Z}
    (hA : A = 4 * c₀ - 1) (hApos : 0 < A)
    (hnz : nz = x * x + x + c₀) (hn1 : 1 < nz) :
    ∃ n : Re, nz = Z.ofRe n ∧
    (PrimeRe n ∨
     (∃ r : Re, PrimeRe r ∧ dvdRe r n ∧
       4 * (Z.ofRe r * Z.ofRe r) ≤ A) ∨
     (∃ r : Re, PrimeRe r ∧ dvdRe r n ∧
       A < 4 * (Z.ofRe r * Z.ofRe r) ∧ Z.ofRe r * Z.ofRe r ≤ nz)) := by
  have hpos : (0 : Z) < nz := by linarith
  obtain ⟨k, hk⟩ := pos_to_re hpos
  refine ⟨Re.step k, hk, ?_⟩
  have h1 : oneR < Re.step k := one_lt_re_of_Z (by rw [← hk]; exact hn1)
  exact value_trichotomy hk h1 hApos

/-- ★★ THE WITNESS IDENTITY packaged with the trichotomy: 4·P(x) =
    (2x+1)² + A — so the deep horn's seed is a genuine seed of D
    (touching via x, deep via the horn's inequality): the exact
    hypotheses of seed_slot. -/
theorem pvalue_witness {c₀ x A : Z} (hA : A = 4 * c₀ - 1) :
    4 * (x * x + x + c₀) = (2 * x + 1) * (2 * x + 1) + A := by
  rw [hA]; ring


#print axioms value_trichotomy
#print axioms pvalue_trichotomy
#print axioms pvalue_witness

end BQF
end GaussForms
end Phys.Foundation
