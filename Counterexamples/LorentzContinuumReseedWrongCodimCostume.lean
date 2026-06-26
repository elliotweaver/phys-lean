import Phys.Algebra.LorentzContinuumReseed

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C110): A BOGUS CODIMENSION OF THE EvC-ORTHOGONAL COMPLEMENT. N79 banks THE
-- DEFLATION RE-SEEDING INDUCTION LEVER over the derived ℝ `Cut`: the EvC-orthogonal complement
-- `uPerp u := ker (EvCRight u)` of a UNIT `u` (`EvC u u = 1`) has finrank DROPPING BY EXACTLY ONE —
-- `finrank Cut (uPerp u) = finrank Cut STVC − 1` (`uPerp_finrank`, rank–nullity on the surjective
-- unit functional `EvCRight u`). The 10-dim spacetime-vector space `STVC = Cut × Cut × O Cut` has
-- `finrank Cut STVC = 10` (1 + 1 + 8, the terminal algebra `O Cut` contributing dimension 8), so the
-- TRUE codimension-one drop is `finrank Cut (uPerp u0) = 10 − 1 = 9` for the concrete unit vector
-- `u0 = (1,0,0)` (`EvC u0 u0 = 1`). A BOGUS claim that this complement's finrank is `14` reduces,
-- through the genuine `uPerp_finrank` / `finrank` arithmetic over the derived ℝ `Cut`, to the false
-- numeric `10 − 1 = 14`, and MUST FAIL to compile.
--   CORRECT: the EvC-orthogonal complement of a unit vector has codimension exactly one
--            (`finrank = 10 − 1 = 9`) — the finrank drops by one at each deflation peel, the
--            bookkeeping the re-seeding induction runs on; not a wrong value.
-- The bite is `10 - 1 = 14` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40, C104 25=11, C105 25=13, C106 8=27,
-- C107 6=13, C108 7=12, C109 9=13).
def u0 : STVC := ((1:Cut), (0:Cut), (0:O Cut))

theorem u0_unit : EvC u0 u0 = 1 := by
  show (1:Cut)*1 + (0:Cut)*0 + gFormC (0:O Cut) 0 = 1
  rw [gFormC_zero_left]; ring

theorem reseed_wrong_codim_BOGUS : Module.finrank Cut (uPerp u0) = 14 := by
  rw [uPerp_finrank u0_unit,
    show Module.finrank Cut STVC = 10 from by
      show Module.finrank Cut (Cut × Cut × O Cut) = 10
      rw [Module.finrank_prod, Module.finrank_prod, Module.finrank_self,
        oProdEquivCut.finrank_eq, Module.finrank_prod, hProdEquivCut.finrank_eq,
        Module.finrank_prod, dblProdEquivCut.finrank_eq, Module.finrank_prod, Module.finrank_self]]

end

end Counterexamples
