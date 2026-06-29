import Phys.Algebra.LorentzContinuumFullO19

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C205): A BOGUS DISCRETE-COSET / DETERMINANT / COMPONENT-GROUP / FULL-O(1,9) CLAIM —
-- "THE 10-dim DETERMINANT OF THE TOTAL SIGN-FLIP ptLin IS NOT +1 / THE TOTAL FLIP IS NOT PROPER".
-- N173 banks THE FULL O(1,9) FROM THE IDENTITY COMPONENT: every QvC-isometry p of the indefinite
-- Born form with LinearMap.det p = ±1 is moved into the NON-VACUOUS identity component JoinedIdQvC
-- (N172) by one of the four discrete sign-flip witnesses {1, parityLin, timeRevLin, ptLin}, which
-- generate a Klein four-group. The total sign-flip ptLin = (−id) ⊞ (−id) ⊞ (−id) on Cut × Cut × O Cut
-- has 10-dim determinant computed block-diagonally (LinearMap.det_prodMap + LinearMap.det_smul):
-- det(−id over Cut) = (−1)^1 = −1 twice and det(−id over O Cut) = (−1)^8 = 1 once, so
-- det ptLin = (−1)·(−1)·1 = +1 EXACTLY (det_ptLin) — the total flip is PROPER, which is precisely
-- what lets ptLin·p restore properness AND orthochronicity in the proper-non-orthochronous reduction
-- case. NO 10×10 expansion: the determinant is a product of (−1)^(block dimension).
--   THE BOGUS claim that LinearMap.det ptLin (a stand-in for ANY wrong discrete-coset / determinant /
-- component-group / full-O(1,9) value: the total flip is improper / the four components are mislabeled /
-- the reduction routes to the wrong determinant class) equals 173 forces, after evaluating the genuine
-- determinant (which is exactly 1), the false numeric `(1 : Cut) = 173` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine 10-dim determinant of the total flip
-- ptLin is +1 (the block-diagonal reduction gives (−1)²·1 = 1), so the claim of 173 is genuinely FALSE
-- (1 ≠ 173 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 173` is DISTINCT from the banked battery (… C202 1=170, C203 1=171, C204 1=172).
--   PHYSICS-WORDS-REMOVABLE: delete "parity/time-reversal/Lorentz/isometry/determinant/proper/coset/
-- component/Klein-four/O(1,9)": over the derived ordered field Cut and the terminal algebra O Cut, the
-- value LinearMap.det ptLin equals 1; claiming it equals 173 forces the false numeric. The bite is a
-- false NUMERIC, name-independent.

/-- BOGUS: the 10-dim determinant `LinearMap.det ptLin` of the total sign-flip endomorphism equals
    `173`. It GENUINELY equals `1` (the block-diagonal reduction `det_ptLin`: `(−1)·(−1)·1 = 1`, with
    `det(−id over O Cut) = (−1)^8 = 1` by `finrank_O_eq_eight_Cut`). The WRONG claim that it is `173`
    (the total flip is improper / the component group is mislabeled) reduces to the false numeric
    `(1 : Cut) = 173`, so this must NOT compile. -/
theorem fullO19_wrong_value_BOGUS : LinearMap.det ptLin = (173 : Cut) := by
  rw [det_ptLin]

end

end Counterexamples
