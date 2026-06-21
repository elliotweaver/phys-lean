import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*} [Ring A] [StarRing A]

theorem star_add_self (z : CD A) : z + star z = iota (bilin z 1) := by
  ext
  · simp [bilin, iota, mul_re, star_re, star_im]
  · simp [iota]

theorem P2_polar
    (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z w : CD A) :
    bilin (z * x) (w * y) + bilin (w * x) (z * y) = bilin z w * bilin x y := by
  have key := P2 H x y (z + w)
  rw [add_mul', add_mul'] at key
  rw [bilin_add_left, bilin_add_right, bilin_add_right] at key
  rw [P2 H x y z, P2 H x y w] at key
  rw [Nrm_add, add_mul, add_mul] at key
  -- key : Nz·b + B1 + (B2 + Nw·b) = Nz·b + Nw·b + bzw·b ; rearrange in the additive group A.
  -- Everything is additive (products are atoms), so `abel`-normalize both sides.
  have h2 : bilin (z*x) (w*y) + bilin (w*x) (z*y) = bilin z w * bilin x y := by
    have e : (bilin (z*x) (w*y) + bilin (w*x) (z*y))
           = (Nrm z * bilin x y + bilin (z*x) (w*y) + (bilin (w*x) (z*y) + Nrm w * bilin x y))
             - (Nrm z * bilin x y + Nrm w * bilin x y) := by abel
    rw [e, key]; abel
  exact h2

#print axioms P2_polar
end Phys.Cascade.CD
