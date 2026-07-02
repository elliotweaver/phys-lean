/- N234 probe 1 — the q-calculus (GO1).
   q M = the coordinate-shuffle endomorphism of O ℚ with 7×7 matrix M on c1..c7, killing c0.
   Test: (1) q compiles, (2) q M ∘ q N = q (M ⬝ N), (3) D0E = q d0. -/
import Phys.Algebra.DerivationLowerBound

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- The coordinate-shuffle endomorphism: kills `c0`, acts on the imaginary
    coordinates `c1..c7` by the matrix `M` (row = output coordinate). -/
def q (M : Fin 7 → Fin 7 → ℚ) : Module.End ℚ (O ℚ) where
  toFun z :=
    ⟨⟨⟨0, M 0 0 * c1 z + M 0 1 * c2 z + M 0 2 * c3 z + M 0 3 * c4 z + M 0 4 * c5 z + M 0 5 * c6 z + M 0 6 * c7 z⟩,
      ⟨M 1 0 * c1 z + M 1 1 * c2 z + M 1 2 * c3 z + M 1 3 * c4 z + M 1 4 * c5 z + M 1 5 * c6 z + M 1 6 * c7 z,
       M 2 0 * c1 z + M 2 1 * c2 z + M 2 2 * c3 z + M 2 3 * c4 z + M 2 4 * c5 z + M 2 5 * c6 z + M 2 6 * c7 z⟩⟩,
     ⟨⟨M 3 0 * c1 z + M 3 1 * c2 z + M 3 2 * c3 z + M 3 3 * c4 z + M 3 4 * c5 z + M 3 5 * c6 z + M 3 6 * c7 z,
       M 4 0 * c1 z + M 4 1 * c2 z + M 4 2 * c3 z + M 4 3 * c4 z + M 4 4 * c5 z + M 4 5 * c6 z + M 4 6 * c7 z⟩,
      ⟨M 5 0 * c1 z + M 5 1 * c2 z + M 5 2 * c3 z + M 5 3 * c4 z + M 5 4 * c5 z + M 5 5 * c6 z + M 5 6 * c7 z,
       M 6 0 * c1 z + M 6 1 * c2 z + M 6 2 * c3 z + M 6 3 * c4 z + M 6 4 * c5 z + M 6 5 * c6 z + M 6 6 * c7 z⟩⟩⟩
  map_add' a b := by
    ext <;>
      simp [c1, c2, c3, c4, c5, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' r z := by
    ext <;>
      simp [c1, c2, c3, c4, c5, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;>
      ring

/-- 7×7 matrix product (functions-as-matrices, explicit 7-term dot). -/
def mul7 (A B : Fin 7 → Fin 7 → ℚ) : Fin 7 → Fin 7 → ℚ := fun i k =>
  A i 0 * B 0 k + A i 1 * B 1 k + A i 2 * B 2 k + A i 3 * B 3 k +
  A i 4 * B 4 k + A i 5 * B 5 k + A i 6 * B 6 k

/-- ★ THE COMPOSITION LAW of the q-calculus. -/
theorem q_comp (M N : Fin 7 → Fin 7 → ℚ) : q M * q N = q (mul7 M N) := by
  apply LinearMap.ext; intro z
  show (q M) ((q N) z) = (q (mul7 M N)) z
  ext <;> simp [q, mul7, c1, c2, c3, c4, c5, c6, c7] <;> ring

/-- The matrix of `D0E`. -/
def d0mat : Fin 7 → Fin 7 → ℚ :=
  ![![0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, -1, 0, 0],
    ![0, 0, 0, 1, 0, 0, 0],
    ![0, 0, -1, 0, 0, 0, 0],
    ![0, 1, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0]]

/-- ★ D0E in the q-calculus. -/
theorem D0E_eq_q : D0E = q d0mat := by
  apply LinearMap.ext; intro z
  ext <;> simp [D0E, q, d0mat, c1, c2, c3, c4, c5, c6, c7] <;> ring

end Phys.Algebra
