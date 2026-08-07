/-
  Certificates.GaussSeedcount25451_5 — seedcount(-25451) ≥ 5:
  5 distinct deep touching primes with explicit witnesses, each
  4p² ≤ 25451 and p | P(x_p) kernel-checked. Feeds the banked floor
  machinery (seeds_force_h, N624): h(-25451) ≥ 6. AUTO-GENERATED.
-/
import Phys.Algebra.GaussCertificate

namespace Certificates.Seedcount25451_5
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- The witness list: 5 deep touching primes of D = -25451. -/
theorem seedcount_ge :
    ∃ ps : List Z, ps.length = 5 ∧ List.Pairwise (· ≠ ·) ps ∧
    (∀ p ∈ ps, (2 : Z) ≤ p ∧ 4 * (p * p) ≤ (25451 : Z) ∧
      ∃ x mm : Z, x * x + x + 6363 = p * mm) := by
  refine ⟨[3, 5, 7, 11, 13], rfl, ?_, ?_⟩
  · -- pairwise distinct (strictly increasing)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro p hp
    fin_cases hp
    · exact ⟨by norm_num, by norm_num, 0, 2121, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 1, 1273, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 0, 909, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 2, 579, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 4, 491, by norm_num⟩

#print axioms seedcount_ge

end Certificates.Seedcount25451_5
