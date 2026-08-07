/-
  Certificates.GaussSeedcount5183_3 — seedcount(-5183) ≥ 3:
  3 distinct deep touching primes with explicit witnesses, each
  4p² ≤ 5183 and p | P(x_p) kernel-checked. Feeds the banked floor
  machinery (seeds_force_h, N624): h(-5183) ≥ 4. AUTO-GENERATED.
-/
import Phys.Algebra.GaussCertificate

namespace Certificates.Seedcount5183_3
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- The witness list: 3 deep touching primes of D = -5183. -/
theorem seedcount_ge :
    ∃ ps : List Z, ps.length = 3 ∧ List.Pairwise (· ≠ ·) ps ∧
    (∀ p ∈ ps, (2 : Z) ≤ p ∧ 4 * (p * p) ≤ (5183 : Z) ∧
      ∃ x mm : Z, x * x + x + 1296 = p * mm) := by
  refine ⟨[3, 7, 11], rfl, ?_, ?_⟩
  · -- pairwise distinct (strictly increasing)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro p hp
    fin_cases hp
    · exact ⟨by norm_num, by norm_num, 0, 432, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 2, 186, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 1, 118, by norm_num⟩

#print axioms seedcount_ge

end Certificates.Seedcount5183_3
