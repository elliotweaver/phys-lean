import Phys.Algebra.Alternative
namespace CostumeProbe
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD
theorem self_obstr_coord_true :
    (Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (ιJ ℚ) : O ℚ) (CD.e2 : O ℚ)).im.im.im
      = (0 : ℚ) := by
  rw [Phys.Algebra.alt_left]
  simp only [CD.zero_im, Dbl.zero_im]
#print axioms self_obstr_coord_true
end CostumeProbe
