import Phys.Cascade.Octonion
import Mathlib.Tactic

namespace Phys.Cascade

abbrev S (R : Type*) [CommRing R] := CD (O R)   -- dim 8 → 16

-- the zero-divisor witnesses on the PINNED dim-16 type
def zdX : S ℚ := ⟨⟨⟨⟨0, 1⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨1, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩
def zdY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨1, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
theorem zd_prod : zdX * zdY = 0 := by
  ext <;> simp [zdX, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

theorem zdX_ne_zero : zdX ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.re.re.re.im) h; simpa [zdX] using this
  exact one_ne_zero h2

theorem zdY_ne_zero : zdY ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.re.im.re.im) h; simpa [zdY] using this
  exact one_ne_zero h2

-- the Born = self-overlap norm: N z = (z * star z).re.re.re.re  (the base scalar of z·z*)
-- On a composition algebra N(zw) = N(z)N(w). Show it FAILS at the stop.
noncomputable def N (z : S ℚ) : ℚ := (z * star z).re.re.re.re

set_option maxHeartbeats 1000000 in
theorem born_law_fails : N (zdX * zdY) ≠ N zdX * N zdY := by
  rw [zd_prod]
  simp only [N]
  -- N 0 = 0 ; N zdX, N zdY are positive, product nonzero
  have hxy : ((0 : S ℚ) * star 0).re.re.re.re = 0 := by simp
  rw [hxy]
  -- compute N zdX and N zdY
  have hx : ((zdX * star zdX).re.re.re.re) = 2 := by
    simp [zdX, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
    norm_num
  have hy : ((zdY * star zdY).re.re.re.re) = 2 := by
    simp [zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
    norm_num
  rw [hx, hy]; norm_num

end Phys.Cascade
