import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C204): A BOGUS DET-OF-BOOST / DET-OF-DEFLATION / ANTIPODE / FINAL-ASSEMBLY /
-- UNCONDITIONAL-CLOSURE / JoinedIdQvC CLAIM — "THE 10-dim DETERMINANT OF A GENERAL-AXIS BOOST IS
-- NOT 1 / THE PROPER ORTHOCHRONOUS CLOSURE PROPAGATES THE WRONG DETERMINANT".
-- N172 banks THE FULLY UNCONDITIONAL SO⁺(1,9) CLOSURE: every proper (LinearMap.det p = 1)
-- orthochronous (0 ≤ (p e₀).1) QvC-isometry p is JoinedIdQvC. The structural lever is the
-- determinant of the general-axis boost genBoostLin wx wv a b for a UNIT axis (wx² + gFormC wv wv = 1)
-- and a²−b² = 1, which is EXACTLY 1 (det_genBoostLin) — computed via the Sylvester (Weinstein–Aronszajn)
-- flip on the rank-2 factorization genBoostLin = id − G∘F, reducing the 10-dim det to the 2×2
-- det !![a,b;b,a] = a²−b² = 1, NO 10×10 expansion. The concrete octonion-direction boost
-- B₀ = genBoostLin 0 1 (5/3) (4/3) (a genuine non-identity QvC-isometry that MOVES the octonion
-- coordinate, B₀ e₀ = (5/3, 0, (4/3)•1) ≠ e₀, unit axis 0² + gFormC 1 1 = 1, (5/3)² − (4/3)² = 1)
-- therefore has LinearMap.det B₀ = 1 EXACTLY, the properness the unconditional closure propagates.
--   THE BOGUS claim that LinearMap.det (genBoostLin 0 1 (5/3) (4/3)) (a stand-in for ANY wrong
-- det-of-boost / det-of-deflation / antipode / final-assembly / unconditional-closure / JoinedIdQvC
-- value: the boost determinant fails to be 1 / the Sylvester flip gives a wrong value / the proper
-- restriction propagates an improper determinant) equals 172 forces, after evaluating the genuine
-- determinant (which is exactly 1), the false numeric `(1 : Cut) = 172` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine 10-dim determinant of the moving
-- boost B₀ is 1 (the Sylvester flip reduces it to a²−b² = (5/3)²−(4/3)² = 1), so the claim of 172
-- is genuinely FALSE (1 ≠ 172 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 172` is DISTINCT from the banked battery (… C201 1=169, C202 1=170, C203 1=171).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/deflation/antipode/isometry/det/determinant/
-- proper/orthochronous/SO/JoinedIdQvC/Sylvester": over the derived ordered field Cut and the terminal
-- algebra O Cut, the value LinearMap.det (genBoostLin 0 1 (5/3) (4/3)) equals 1; claiming it equals 172
-- forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the 10-dim determinant `LinearMap.det (genBoostLin 0 1 (5/3) (4/3))` of the concrete
    non-identity octonion-direction boost equals `172`. It GENUINELY equals `1` (the Sylvester flip
    `det_genBoostLin` reduces the 10-dim det to the `2×2` `det !![a,b;b,a] = a²−b² = (5/3)²−(4/3)² = 1`).
    The WRONG claim that it is `172` (the boost determinant fails to be `1` / the proper restriction
    propagates an improper determinant) reduces to the false numeric `(1 : Cut) = 172`, so this must
    NOT compile. -/
theorem so9UnconditionalClosure_wrong_value_BOGUS :
    LinearMap.det (genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) ((4:Cut)/3)) = (172 : Cut) := by
  have hw : (0:Cut) ^ 2 + gFormC (1:O Cut) (1:O Cut) = 1 := by
    rw [gFormC_one_left, reQC_one]; ring
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by norm_num
  rw [det_genBoostLin 0 1 hw hab]

end

end Counterexamples
