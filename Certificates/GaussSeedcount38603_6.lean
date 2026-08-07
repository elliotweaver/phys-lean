/-
  Certificates.GaussSeedcount38603_6 — seedcount(-38603) ≥ 6:
  6 distinct deep touching primes with explicit witnesses, each
  4p² ≤ 38603 and p | P(x_p) kernel-checked. Feeds the banked floor
  machinery (seeds_force_h, N624): h(-38603) ≥ 7. AUTO-GENERATED.
-/
import Phys.Algebra.GaussCertificate

namespace Certificates.Seedcount38603_6
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- The witness list: 6 deep touching primes of D = -38603. -/
theorem seedcount_ge :
    ∃ ps : List Z, ps.length = 6 ∧ List.Pairwise (· ≠ ·) ps ∧
    (∀ p ∈ ps, (2 : Z) ≤ p ∧ 4 * (p * p) ≤ (38603 : Z) ∧
      ∃ x mm : Z, x * x + x + 9651 = p * mm) := by
  refine ⟨[3, 7, 17, 19, 29, 37], rfl, ?_, ?_⟩
  · -- pairwise distinct (strictly increasing)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
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
    · exact ⟨by norm_num, by norm_num, 0, 3217, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 1, 1379, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 7, 571, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 4, 509, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 2, 333, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 2, 261, by norm_num⟩

#print axioms seedcount_ge

end Certificates.Seedcount38603_6
