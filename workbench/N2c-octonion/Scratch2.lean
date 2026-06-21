import Phys.Cascade.Quaternion
import Mathlib.Tactic

namespace Phys.Cascade

abbrev S16 := CD (CD (CD (Dbl ℚ)))

def xZD : S16 := ⟨⟨⟨⟨0, 1⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨1, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩
def yZD : S16 := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨1, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
theorem zero_divisor_prod : xZD * yZD = 0 := by
  ext <;> simp [xZD, yZD, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

theorem xZD_ne_zero : xZD ≠ 0 := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S16 => z.re.re.re.im) h; simpa [xZD] using this
  exact one_ne_zero h2

theorem yZD_ne_zero : yZD ≠ 0 := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S16 => z.re.im.re.im) h; simpa [yZD] using this
  exact one_ne_zero h2

end Phys.Cascade
