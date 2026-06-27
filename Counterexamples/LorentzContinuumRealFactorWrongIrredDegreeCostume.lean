import Phys.Algebra.LorentzContinuumRealFactor

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C114): A BOGUS DEGREE FOR AN IRREDUCIBLE POLYNOMIAL OVER THE DERIVED ℝ Cut, AT THE
-- HEART OF THE REAL-CLOSED FACTORIZATION. N83 banks THE REAL-CLOSED IRREDUCIBLE-DEGREE BOUND
-- `cut_irreducible_natDegree_le_two`: EVERY irreducible `p ∈ Cut[X]` has `natDegree ≤ 2` — because
-- `p` SPLITS over the now-algebraically-closed `Cut[i]` (N82 `cuti_isAlgClosed`), so `p.natDegree`
-- DIVIDES `finrank Cut Cut[i] = 2` (N81), hence is `≤ 2`. This is exactly why no irreducible
-- Cut-polynomial of degree 3 (or higher) exists, and why the characteristic polynomial of a
-- self-adjoint operator factors into LINEAR × NEGATIVE-DISCRIMINANT-QUADRATIC factors. Apply the
-- bound to the genuine irreducible quadratic `cutQuad 0 1 = X² + 1` (negative discriminant
-- `0² < 4·1`, hence irreducible by N80 `cut_monic_quad_irreducible_of_negDisc`): the bound certifies
-- `natDegree ≤ 2`, and the genuine lower bound `2 ≤ natDegree` (`cutQuad_natDegree`) pins
-- `natDegree = 2` by antisymmetry — the new theorem is LOAD-BEARING in this pin. A BOGUS claim that
-- this irreducible polynomial has `natDegree = 5` reduces, through the genuine pinned value `2`, to
-- the false numeric `2 = 5`, and MUST FAIL to compile.
--   CORRECT: the irreducible `X² + 1` over the derived ℝ `Cut` has `natDegree = 2` (the bound
--            `cut_irreducible_natDegree_le_two` gives `≤ 2`, `cutQuad_natDegree` gives `= 2`), NOT
--            `5`; every irreducible Cut-polynomial has degree `≤ 2`, the spine of the real-closed
--            factorization.
-- The bite is `2 = 5` (distinct from … C110 10−1=14, C111 17=40, C112 169=200, C113 1=15, and the
-- rest of the equality battery).

theorem realfactor_wrong_irred_degree_BOGUS :
    (cutQuad (0:Cut) 1).natDegree = 5 := by
  have hb : (cutQuad (0:Cut) 1).natDegree ≤ 2 :=
    cut_irreducible_natDegree_le_two (cut_monic_quad_irreducible_of_negDisc (by norm_num))
  have hge : 2 ≤ (cutQuad (0:Cut) 1).natDegree := le_of_eq (cutQuad_natDegree 0 1).symm
  have heq : (cutQuad (0:Cut) 1).natDegree = 2 := le_antisymm hb hge
  rw [heq]

end

end Counterexamples
