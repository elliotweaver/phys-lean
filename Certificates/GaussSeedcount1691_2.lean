/-
  Certificates.GaussSeedcount1691_2 — seedcount(-1691) ≥ 2:
  2 distinct deep touching primes with explicit witnesses, each
  4p² ≤ 1691 and p | P(x_p) kernel-checked. Feeds the banked floor
  machinery (seeds_force_h, N624): h(-1691) ≥ 3. AUTO-GENERATED.
-/
import Phys.Algebra.GaussCertificate

namespace Certificates.Seedcount1691_2
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- The witness list: 2 deep touching primes of D = -1691. -/
theorem seedcount_ge :
    ∃ ps : List Z, ps.length = 2 ∧ List.Pairwise (· ≠ ·) ps ∧
    (∀ p ∈ ps, (2 : Z) ≤ p ∧ 4 * (p * p) ≤ (1691 : Z) ∧
      ∃ x mm : Z, x * x + x + 423 = p * mm) := by
  refine ⟨[3, 5], rfl, ?_, ?_⟩
  · -- pairwise distinct (strictly increasing)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro p hp
    fin_cases hp
    · exact ⟨by norm_num, by norm_num, 0, 141, by norm_num⟩
    · exact ⟨by norm_num, by norm_num, 1, 85, by norm_num⟩

#print axioms seedcount_ge

end Certificates.Seedcount1691_2
