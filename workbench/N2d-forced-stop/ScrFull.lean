import Phys.Cascade.ForcedStop
import Mathlib.Tactic

/-! FULL PRODUCTION-CANDIDATE BLOCK for N2d-MIDDLE-core. Mirrors what goes into
    Phys/Cascade/ForcedStop.lean. Verify foundations-only end-to-end. -/

namespace Phys.Cascade.CD

@[reducible] def narCD {A : Type*} [NonAssocRing A] [StarRing A] : NonAssocRing (CD A) where
  add := (· + ·)
  add_assoc a b c := by ext <;> simp <;> abel
  zero := 0
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> abel
  neg := (- ·)
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec
  mul := (· * ·)
  left_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  right_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  one := 1
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp

@[reducible] def srCD {A : Type*} [NonAssocRing A] [StarRing A] :
    letI := narCD (A := A); StarRing (CD A) :=
  letI := narCD (A := A)
  { star := Star.star
    star_involutive := by intro z; ext <;> simp
    star_mul := by intro z w; ext <;> simp [star_add, star_star]
    star_add := by intro z w; ext <;> simp [add_comm] }

section NA
variable {A : Type*} [NonAssocRing A] [StarRing A]
theorem mul_add_na (x y z : CD A) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel
theorem Nrm_add_na (x y : CD A) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]; abel
theorem bilin_add_left_na (x x' y : CD A) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, star_neg, add_im, neg_add]; abel
theorem bilin_zero_left_na (y : CD A) : bilin (0 : CD A) y = 0 := by
  simp only [bilin, mul_re, zero_re, zero_im, star_re, star_im, star_zero,
    zero_mul, mul_zero, add_zero, zero_add, neg_zero, add_re]
theorem bilin_neg_left_na (x y : CD A) : bilin (-x) y = - bilin x y := by
  have hcancel : (-x) + x = 0 := by ext <;> simp
  have h := bilin_add_left_na (-x) x y
  rw [hcancel, bilin_zero_left_na] at h
  exact eq_neg_of_add_eq_zero_left h.symm
theorem P2_na (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (z * x) (z * y) = Nrm z * bilin x y := by
  have h1 : Nrm (z * (x + y)) = Nrm (z * x) + Nrm (z * y) + bilin (z * x) (z * y) := by
    rw [mul_add_na]; exact Nrm_add_na (z * x) (z * y)
  have h2 : Nrm (z * (x + y)) = Nrm z * Nrm x + Nrm z * Nrm y + Nrm z * bilin x y := by
    rw [H, Nrm_add_na, mul_add, mul_add]
  rw [h2] at h1; rw [H, H] at h1
  exact (add_left_cancel h1).symm
theorem bilin_diag_na (x : CD A) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]
end NA
end Phys.Cascade.CD

namespace Phys.Cascade
open CD

section Core
set_option maxHeartbeats 8000000
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] narCD srCD

/-- The ADJOINT identity over the doubled-double structure (H-free, ext+ring). -/
theorem adjoint3 (u v w : CD (CD (CD B))) :
    bilin (u * v) w = bilin v (star u * w) := by
  unfold bilin
  ext <;> simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add] <;> ring

/-- Star-invariance of the norm over the doubled-double structure. -/
theorem Nrm_star3 (z : CD (CD (CD B))) : Nrm (star z) = Nrm z := by
  unfold Nrm
  ext <;> simp only [star_star, mul_re, mul_im, star_re, star_im, add_re, add_im,
    neg_re, neg_im, star_add, star_neg, star_mul', neg_mul, mul_neg, neg_neg] <;> ring

/-- Left ι-scaling of the bilinear form by the norm. -/
theorem bilin_iotaNrm3 (x y w : CD (CD (CD B))) :
    bilin (iota (Nrm x) * y) w = Nrm x * bilin y w := by
  unfold bilin Nrm
  ext <;> simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    zero_re, zero_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
    add_mul, mul_add, zero_mul, mul_zero, zero_add, add_zero, star_zero, neg_zero, sub_zero] <;> ring

/-- ★ THE POLARIZATION CORE — the scaling defect is bilin-orthogonal to everything. -/
theorem bilin_L_zero (H : ∀ u v : CD (CD (CD B)), Nrm (u * v) = Nrm u * Nrm v)
    (x y w : CD (CD (CD B))) :
    bilin (x * (star x * y) + -(iota (Nrm x) * y)) w = 0 := by
  rw [CD.bilin_add_left_na, CD.bilin_neg_left_na,
    adjoint3 x (star x * y) w, CD.P2_na H y w (star x), Nrm_star3, bilin_iotaNrm3]
  exact add_neg_cancel _

/-- ★ Hcore — MULTIPLICATIVITY FORCES THE LEFT SCALING LAW. -/
theorem scaling_of_H
    (H : ∀ u v : CD (CD (CD B)), Nrm (u * v) = Nrm u * Nrm v)
    (aniso2 : ∀ z : CD (CD (CD B)), Nrm z + Nrm z = 0 → z = 0)
    (x y : CD (CD (CD B))) :
    x * (star x * y) = iota (Nrm x) * y := by
  have hbz : bilin (x * (star x * y) + -(iota (Nrm x) * y))
      (x * (star x * y) + -(iota (Nrm x) * y)) = 0 := bilin_L_zero H x y _
  rw [CD.bilin_diag_na] at hbz
  exact add_neg_eq_zero.mp (aniso2 _ hbz)

/-- ★ THE BACKWARD DIRECTION — multiplicativity forces base associativity. -/
theorem base_assoc_of_H
    (H : ∀ u v : CD (CD (CD B)), Nrm (u * v) = Nrm u * Nrm v)
    (aniso2 : ∀ z : CD (CD (CD B)), Nrm z + Nrm z = 0 → z = 0) :
    ∀ a b c : CD (CD B), (a * b) * c = a * (b * c) :=
  CD.assoc_of_scaling (fun x y => scaling_of_H H aniso2 x y)

/-- The forward helper: associativity of the doubled base ⟹ commutativity of `CD B`. -/
theorem comm_of_base_assoc
    (hassoc : ∀ x y z : CD (CD B), (x * y) * z = x * (y * z)) :
    ∀ a b : CD B, a * b = b * a := by
  intro a b
  exact (CD.iota_iota_e2_assoc_iff a b).mp (hassoc (iota a) (iota b) (e2 : CD (CD B)))

end Core

/-- ★★ THE FORCED IFF (the cascade's doubled-base home). Over a base `A = CD (CD B)`
    (the structure two doublings produce, carrying the trunk's central self-overlap),
    the self-overlap norm is MULTIPLICATIVE on `CD A` ⟺ `A` is ASSOCIATIVE — given the
    trunk's Born positivity (anisotropy `Nrm z + Nrm z = 0 → z = 0`). Forward (⟸): base
    associativity forces `CD B` commutative, and the doubled-base law gives multiplicativity.
    Backward (⟹): the polarization core forces the left scaling law, whose reflection forces
    base associativity. The single forced equivalence behind the cascade's stop. -/
theorem Nrm_mul_iff_base_assoc {B : Type*} [CommRing B] [StarRing B]
    (aniso2 : ∀ z : CD (CD (CD B)), Nrm z + Nrm z = 0 → z = 0) :
    (∀ x y : CD (CD (CD B)), Nrm (x * y) = Nrm x * Nrm y)
      ↔ (∀ a b c : CD (CD B), (a * b) * c = a * (b * c)) := by
  constructor
  · intro H; exact base_assoc_of_H H aniso2
  · intro hassoc
    have hc : ∀ a b : CD B, a * b = b * a := comm_of_base_assoc hassoc
    letI : CommRing (CD B) :=
      { (inferInstance : Ring (CD B)) with mul_comm := hc }
    intro x y
    exact CD.Nrm_mul_of_doubled_base (B := CD B) x y

end Phys.Cascade
