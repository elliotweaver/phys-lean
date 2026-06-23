import Phys.Foundation.OrderedTower
import Mathlib.Tactic

namespace Phys.Foundation

/-! Bridge probe: lift Re.no_sq_two to Z then Q.
    Strategy: over Z, x*x = 2*(y*y), y ≠ 0 is impossible. Reduce to Re via |x|,|y|. -/

namespace Z

/-- Every Z is ± the image of a count (sign decomposition). -/
theorem eq_ofRe_or_neg (x : Z) : (∃ a : Re, x = ofRe a) ∨ (∃ a : Re, x = - ofRe a) := by
  refine Z.ind (fun a b => ?_) x
  rcases Re.add_comparable b a with ⟨s, hs⟩ | ⟨s, hs⟩
  · -- a = b + s ⟹ mk a b = ofRe s
    left; exact ⟨s, by rw [ofRe_def]; apply sound; rw [add_zero, hs]; ring⟩
  · -- b = a + s ⟹ mk a b = - ofRe s = mk 0 s
    right; refine ⟨s, ?_⟩
    rw [ofRe_def, neg_mk]; apply sound; rw [zero_add, hs]

/-- The key square fact: over Z, if x² = 2y² and y ≠ 0, contradiction (via Re descent). -/
theorem no_sq_two_Z {x y : Z} (hy : y ≠ 0) : x * x ≠ 2 * (y * y) := by
  intro heq
  -- reduce to counts: write x = ±ofRe a, y = ±ofRe b; squares kill the sign.
  -- ofRe is a ring hom; (ofRe a)² = ofRe (a*a), and 2 = ofRe 2.
  -- So ofRe(a*a) = ofRe(2*(b*b)) ⟹ a*a = 2*(b*b) over Re, with b ≠ 0.
  obtain ⟨a, ha⟩ : ∃ a : Re, x * x = ofRe (a * a) := by
    rcases eq_ofRe_or_neg x with ⟨a, ha⟩ | ⟨a, ha⟩
    · exact ⟨a, by rw [ha, ofRe_mul]⟩
    · exact ⟨a, by rw [ha, neg_mul_neg, ofRe_mul]⟩
  obtain ⟨b, hb, hbne⟩ : ∃ b : Re, y * y = ofRe (b * b) ∧ b ≠ 0 := by
    rcases eq_ofRe_or_neg y with ⟨b, hb⟩ | ⟨b, hb⟩
    · refine ⟨b, by rw [hb, ofRe_mul], ?_⟩
      rintro rfl; rw [ofRe_zero] at hb; exact hy hb
    · refine ⟨b, by rw [hb, neg_mul_neg, ofRe_mul], ?_⟩
      rintro rfl; rw [ofRe_zero, neg_zero] at hb; exact hy hb
  rw [ha, hb] at heq
  -- heq : ofRe (a*a) = 2 * ofRe (b*b);  2 = ofRe 2
  have h2 : (2 : Z) = ofRe 2 := by
    rw [show (2:Z) = 1 + 1 from by ring, show (2:Re) = 1 + 1 from by ring, ofRe_add, ofRe_one]
  rw [h2, ← ofRe_mul] at heq
  have hre : a * a = 2 * (b * b) := ofRe_injective heq
  exact Re.no_sq_two hbne hre

end Z
end Phys.Foundation
