import Phys.Algebra.LorentzContinuumFactor

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C111): A BOGUS EVALUATION OF THE MONIC QUADRATIC AT THE HEART OF THE REAL-CLOSED
-- QUADRATIC-IRREDUCIBILITY CLASSIFICATION. N80 banks THE CLASSIFICATION over the derived ℝ `Cut`: a
-- monic quadratic `cutQuad b c = X² + C b·X + C c` is IRREDUCIBLE iff it has NEGATIVE DISCRIMINANT
-- `b² < 4c` (`cut_monic_quad_irreducible_iff_negDisc`) — decided by whether the quadratic has a ROOT,
-- i.e. by the evaluation `(cutQuad b c).eval x = x·x + b·x + c` (`cutQuad_eval`). The evaluation is
-- honest: for the concrete pair `b = 5`, `c = 3` and the concrete point `x = 2`, the genuine value is
-- `2·2 + 5·2 + 3 = 4 + 10 + 3 = 17`. A BOGUS claim that `(cutQuad 5 3).eval 2 = 40` reduces, through
-- the genuine `cutQuad_eval` + `Cut` arithmetic, on the left to the genuine `17`, hence to the false
-- numeric `17 = 40`, and MUST FAIL to compile.
--   CORRECT: `(cutQuad 5 3).eval 2 = 2·2 + 5·2 + 3 = 17`, NOT `40` — the quadratic's evaluation (the
--            root criterion the classification is built on) is computed correctly over the derived ℝ
--            `Cut`; the classification (irreducible ⟺ `b² < 4c`) rests on this honest evaluation.
-- The bite is `17 = 40` (distinct from … C107 6=13, C108 7=12, C109 9=13, C110 10−1=14, and the rest
-- of the equality battery).

theorem factor_wrong_eval_BOGUS :
    (cutQuad (5:Cut) 3).eval 2 = (40:Cut) := by
  rw [show (cutQuad (5:Cut) 3).eval 2 = (17:Cut) from by rw [cutQuad_eval]; norm_num]

end

end Counterexamples
