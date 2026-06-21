import Phys.Cascade.Quaternion
import Mathlib.Tactic

namespace Phys.Cascade

abbrev S16 := CD (CD (CD (Dbl ℚ)))

def xZD : S16 := ⟨⟨⟨⟨0, 1⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨1, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩
def yZD : S16 := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨1, 0⟩⟩⟩⟩

-- find correct accessor paths: xZD has a 1 at re.re.re.im (e1 component)
example : xZD.re.re.re.im = (1 : ℚ) := by rfl
-- yZD has a 1 at re.im.re.im (e5)? probe used z.re.im.re.im
example : yZD.re.im.re.im = (1 : ℚ) := by rfl

end Phys.Cascade
