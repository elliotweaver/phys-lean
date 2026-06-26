import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cWhich
noncomputable section

-- Read off u1 * e_k for each k by checking all 8 coordinates against candidates.
-- u1*e2:
example : u1 * e2O = e3O := by ext <;> simp [u1, e2O, e3O]      -- guess
-- u1*e4:
example : u1 * e4O = e5O := by ext <;> simp [u1, e4O, e5O]
-- u1*e6 candidates:
example : u1 * e6O = -e7O := by ext <;> simp [u1, e6O, e7O]     -- try -e7
end
end N42cWhich
