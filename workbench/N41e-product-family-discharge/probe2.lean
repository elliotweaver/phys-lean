import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- What does Su look like? ∑ i, |coordOCut u i|
example (u : O Cut) : (∑ i, |coordOCut u i|) =
    |u.re.re.re| + |u.re.re.im| + |u.re.im.re| + |u.re.im.im|
    + |u.im.re.re| + |u.im.re.im| + |u.im.im.re| + |u.im.im.im| := by
  rw [Fin.sum_univ_eight]
  simp [coordOCut, e0, e1, e2, e3, e4, e5, e6, e7]
  ring

end
end Phys.Algebra
