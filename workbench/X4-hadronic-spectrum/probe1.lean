import Phys.Algebra.ConfinementMassGap
import Mathlib.NumberTheory.SumFourSquares

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- PROBE A: build a lattice octonion from 8 integers; check coordinates resolve by rfl.
def latPt (a b c d e f g h : ℤ) : O ℚ :=
  ⟨⟨⟨(a:ℚ),(b:ℚ)⟩,⟨(c:ℚ),(d:ℚ)⟩⟩, ⟨⟨(e:ℚ),(f:ℚ)⟩,⟨(g:ℚ),(h:ℚ)⟩⟩⟩

example (a b c d e f g h : ℤ) : c0 (latPt a b c d e f g h) = (a:ℚ) := rfl
example (a b c d e f g h : ℤ) : c7 (latPt a b c d e f g h) = (h:ℚ) := rfl

-- PROBE B: IntLat of a latPt is immediate.
example (a b c d e f g h : ℤ) : IntLat (latPt a b c d e f g h) := by
  refine ⟨⟨a, rfl⟩, ⟨b, rfl⟩, ⟨c, rfl⟩, ⟨d, rfl⟩, ⟨e, rfl⟩, ⟨f, rfl⟩, ⟨g, rfl⟩, ⟨h, rfl⟩⟩

-- PROBE C: gForm of a latPt is the sum of the 8 integer squares (cast to ℚ).
example (a b c d e f g h : ℤ) :
    gForm (latPt a b c d e f g h) (latPt a b c d e f g h)
      = ((a^2+b^2+c^2+d^2+e^2+f^2+g^2+h^2 : ℤ) : ℚ) := by
  rw [gForm_self_sum_sq]
  simp only [latPt, c0, c1, c2, c3, c4, c5, c6, c7]
  push_cast; ring

-- PROBE D: Lagrange four-square gives surjectivity onto ℕ.
example (n : ℕ) : ∃ w : O ℚ, IntLat w ∧ gForm w w = (n : ℚ) := by
  obtain ⟨a, b, c, d, habcd⟩ := Nat.sum_four_squares n
  refine ⟨latPt a b c d 0 0 0 0, ?_, ?_⟩
  · exact ⟨⟨a, rfl⟩, ⟨b, rfl⟩, ⟨c, rfl⟩, ⟨d, rfl⟩, ⟨0, by norm_num⟩, ⟨0, by norm_num⟩, ⟨0, by norm_num⟩, ⟨0, by norm_num⟩⟩
  · rw [gForm_self_sum_sq]
    simp only [latPt, c0, c1, c2, c3, c4, c5, c6, c7]
    push_cast
    rw [← habcd]; push_cast; ring

-- PROBE E: integrality — any lattice value is a natural (∃ k:ℕ, v = k).
example (w : O ℚ) (hlat : IntLat w) : ∃ k : ℕ, gForm w w = (k : ℚ) := by
  obtain ⟨⟨k0,h0⟩,⟨k1,h1⟩,⟨k2,h2⟩,⟨k3,h3⟩,⟨k4,h4⟩,⟨k5,h5⟩,⟨k6,h6⟩,⟨k7,h7⟩⟩ := hlat
  refine ⟨(k0^2+k1^2+k2^2+k3^2+k4^2+k5^2+k6^2+k7^2).toNat, ?_⟩
  have hnn : (0:ℤ) ≤ k0^2+k1^2+k2^2+k3^2+k4^2+k5^2+k6^2+k7^2 := by positivity
  rw [gForm_self_sum_sq, h0,h1,h2,h3,h4,h5,h6,h7]
  rw [Int.toNat_of_nonneg hnn]; push_cast; ring

end
end Phys.Algebra
