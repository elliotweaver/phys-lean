/-
  Certificates.GaussSeedcount15095_4 — seedcount(-15095) ≥ 4:
  4 distinct deep touching primes with explicit witnesses, each
  4p² ≤ 15095 and p | P(x_p) kernel-checked. Feeds the banked floor
  machinery (seeds_force_h, N624): h(-15095) ≥ 5. AUTO-GENERATED.
-/
import Phys.Algebra.GaussCertificate

namespace Certificates.Seedcount15095_4
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- The witness list: 4 deep touching primes of D = -15095. -/
theorem seedcount_ge :
    ∃ ps : List Z, ps.length = 4 ∧ List.Pairwise (· ≠ ·) ps ∧
    (∀ p ∈ ps, (2 : Z) ≤ p ∧ 4 * (p * p) ≤ (15095 : Z) ∧
      ∃ x mm : Z, x * x + x + 3774 = p * mm) := by
  refine ⟨[3, 5, 7, 17], rfl, ?_, ?_⟩
  · -- pairwise distinct (strictly increasing)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro p hp
    fin_cases hp
    · exact ⟨by norm_num, by norm_num, 0, 1258, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 2, 756, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 2, 540, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 0, 222, by norm_num⟩

#print axioms seedcount_ge

end Certificates.Seedcount15095_4
