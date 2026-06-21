import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {A : Type*}

/-- ★ THE BASE EMBEDDING IS MULTIPLICATIVE — `iota` is a ring homomorphism on the
    base image. `iota (a*b) = iota a * iota b` over any `[Ring A] [StarRing A]`. The
    new dimension stays empty, so products of base-image elements stay in the base
    image and the embedding carries the base product. -/
theorem iota_mul [Ring A] [StarRing A] (a b : A) :
    (iota (a * b) : CD A) = iota a * iota b := by
  ext
  · simp [iota, mul_re]
  · simp [iota, mul_im]

/-- ★ THE DOUBLE ASSOCIATES ON A BASE-IMAGE TRIPLE IFF THE BASE ASSOCIATES ON IT.
    `(iota a * iota b) * iota c = iota a * (iota b * iota c) ↔ (a*b)*c = a*(b*c)`,
    over any `[Ring A] [StarRing A]` (no commutativity needed). Because `iota` is an
    injective ring homomorphism, associativity of `CD A` on base images is EXACTLY
    associativity of the base. The structural half of the Hurwitz obstruction. -/
theorem iota_assoc_iff [Ring A] [StarRing A] (a b c : A) :
    (iota a * iota b) * iota c = iota a * (iota b * iota c)
      ↔ (a * b) * c = a * (b * c) := by
  rw [← iota_mul, ← iota_mul, ← iota_mul, ← iota_mul]
  constructor
  · intro h; exact iota_injective h
  · intro h; rw [h]

/-- ★ BASE-IMAGE ASSOCIATIVITY REFLECTS BASE ASSOCIATIVITY. If the double `CD A`
    associates on every base-image triple, the base `A` is associative — the contrapositive
    is: `A` non-associative ⟹ `CD A` non-associative on some base-image triple. -/
theorem base_assoc_of_image_assoc [Ring A] [StarRing A]
    (h : ∀ a b c : A, (iota a * iota b) * iota c = iota a * (iota b * iota c)) :
    ∀ a b c : A, (a * b) * c = a * (b * c) :=
  fun a b c => (iota_assoc_iff a b c).mp (h a b c)

end CD
end Phys.Cascade
