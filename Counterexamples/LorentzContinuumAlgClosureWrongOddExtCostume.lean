import Phys.Algebra.LorentzContinuumAlgClosure

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C113): A BOGUS DEGREE FOR AN ODD-DEGREE EXTENSION OF THE DERIVED ℝ Cut, AT THE
-- HEART OF THE ARTIN–SCHREIER ALGEBRAIC-CLOSURE ARGUMENT. N82 banks the odd-degree extension
-- OBSTRUCTION `cut_no_odd_ext`: EVERY finite ODD-degree field extension of the derived ℝ `Cut`
-- is TRIVIAL — its degree is `1` (the primitive element's minimal polynomial is monic of odd
-- degree, hence has a root in `Cut` by N77 `cut_odd_degree_has_root`, and being irreducible with
-- a root it has degree `1`). This is exactly why every finite Galois extension of `Cut` has
-- 2-power degree (`cut_galois_finrank_two_power`: the 2-Sylow fixed field has odd degree, hence
-- degree 1). Apply the obstruction to the trivial self-extension `Cut / Cut`: its degree
-- `Module.finrank Cut Cut` is `1` (odd), so `cut_no_odd_ext` forces it to `1`. A BOGUS claim that
-- this odd-degree extension has degree `15` (a nontrivial ODD number — precisely the kind of
-- nontrivial odd extension the obstruction rules out, and NOT a power of 2) reduces, through the
-- genuine `cut_no_odd_ext`, on the left to the genuine `1`, hence to the false numeric `1 = 15`,
-- and MUST FAIL to compile.
--   CORRECT: every finite odd-degree extension of `Cut` is trivial (`cut_no_odd_ext` forces
--            degree `1`); there is NO nontrivial odd-degree extension, so the trivial self-
--            extension has degree `1`, NOT `15`.
-- The bite is `1 = 15` (distinct from … C108 7=12, C109 9=13, C110 10−1=14, C111 17=40,
-- C112 169=200, and the rest of the equality battery).

theorem algclosure_wrong_odd_ext_degree_BOGUS :
    Module.finrank Cut Cut = (15 : ℕ) := by
  rw [cut_no_odd_ext Cut (by rw [Module.finrank_self]; exact odd_one)]

end

end Counterexamples
