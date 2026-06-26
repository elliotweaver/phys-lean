import Phys.Algebra.DerivationStabilizerDim

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cProbe

-- MEASURE (A): u1 · e_k stays in V (c0 = c1 = 0) for k = 2..7.
-- If true, J = L_{u1} maps V → V.
example : c0 (u1 * e2O) = 0 ∧ c1 (u1 * e2O) = 0 := by
  constructor <;> simp [u1, e2O, c0, c1, c2, c3, c4, c5, c6, c7]
example : c0 (u1 * e3O) = 0 ∧ c1 (u1 * e3O) = 0 := by
  constructor <;> simp [u1, e3O, c0, c1, c2, c3, c4, c5, c6, c7]
example : c0 (u1 * e4O) = 0 ∧ c1 (u1 * e4O) = 0 := by
  constructor <;> simp [u1, e4O, c0, c1, c2, c3, c4, c5, c6, c7]
example : c0 (u1 * e5O) = 0 ∧ c1 (u1 * e5O) = 0 := by
  constructor <;> simp [u1, e5O, c0, c1, c2, c3, c4, c5, c6, c7]
example : c0 (u1 * e6O) = 0 ∧ c1 (u1 * e6O) = 0 := by
  constructor <;> simp [u1, e6O, c0, c1, c2, c3, c4, c5, c6, c7]
example : c0 (u1 * e7O) = 0 ∧ c1 (u1 * e7O) = 0 := by
  constructor <;> simp [u1, e7O, c0, c1, c2, c3, c4, c5, c6, c7]

-- MEASURE (B): J² = -id on V, i.e. u1·(u1·e_k) = -e_k for k = 2..7.
example : u1 * (u1 * e2O) = -e2O := by ext <;> simp [u1, e2O]
example : u1 * (u1 * e3O) = -e3O := by ext <;> simp [u1, e3O]
example : u1 * (u1 * e4O) = -e4O := by ext <;> simp [u1, e4O]
example : u1 * (u1 * e5O) = -e5O := by ext <;> simp [u1, e5O]
example : u1 * (u1 * e6O) = -e6O := by ext <;> simp [u1, e6O]
example : u1 * (u1 * e7O) = -e7O := by ext <;> simp [u1, e7O]

-- MEASURE: what IS u1 · e_k? Read off the pairing (the Fano structure).
-- Print the coordinates so we know the pairing for the rank-3 basis choice.
example : u1 * e2O = e3O := by ext <;> simp [u1, e2O, e3O]
example : u1 * e4O = e5O := by ext <;> simp [u1, e4O, e5O]
example : u1 * e6O = e7O := by ext <;> simp [u1, e6O, e7O]

end N42cProbe
