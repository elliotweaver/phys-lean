import Phys.Algebra.LorentzContinuumOctBlockSO8DetParity

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C194): A BOGUS DET-PARITY / EVEN-WORD / CLOSURE-BIREFLECTION / JoinedIdQvC
-- READ-OFF — "THE GENERAL (NON-ORTHONORMAL) det +1 PRODUCT houseHolder e₂ · houseHolder (e₂+je2)
-- DOES NOT HAVE LinearMap.det = 1, ITS REFLECTION WORD IS NOT EVEN, AND IT DOES NOT LIFT TO THE
-- NON-VACUOUS JoinedIdQvC BY THE DET-PARITY BRIDGE".
-- N162 banks THE DET-PARITY CLOSURE BRIDGE: each Householder reflection has LinearMap.det = −1
-- (det_houseHolder, by the Sylvester / Weinstein–Aronszajn flip through the toMatrix translation,
-- the rank-one factorization houseHolder a = id − g∘f with f∘g = 2·id on the 1-dim Cut, so
-- det = 1 − 2 = −1); the multiplicative LinearMap.det makes the reflection word's determinant
-- (−1)^length (det_houseHolderWord); det = 1 forces an EVEN word (neg_one_pow_eq_one_iff_even,
-- cut_neg_one_ne_one), which the even-pairing core (joinedIdQvC_octBlockEndC_evenReflWord, pairing
-- two-at-a-time into N161's general bireflection core) lifts to the NON-VACUOUS JoinedIdQvC
-- (joinedIdQvC_octBlockEndC_of_det_one). The W8 NON-VACUITY anchor: the GENUINELY NON-orthonormal
-- pair e₂, e₂+je2 (gFormC e₂ (e₂+je2) = 1 ≠ 0) product houseHolder e₂ · houseHolder (e₂+je2) has
-- LinearMap.det = (−1)·(−1) = 1 computed THROUGH the new determinant homomorphism
-- (det_e2je2_product: LinearMap.det_comp + det_houseHolder on each factor), and is JoinedIdQvC by
-- THE BRIDGE (joinedIdQvC_octBlockEndC_e2je2_via_det), via the det-parity route, NOT the direct
-- N161 lift.
--   THE BOGUS claim that this determinant reads 162 (a stand-in for ANY wrong det-parity /
-- even-word / closure-bireflection / JoinedIdQvC value: the product's det is not 1 / its reflection
-- word is not even / it does not lift by the det-parity bridge) forces, after rewriting by the
-- genuine value, the false numeric `(1 : Cut) = 162` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the product genuinely has LinearMap.det = 1
-- (each Householder factor has det −1 over the derived field Cut, det_e2je2_product), so the claim
-- of 162 is genuinely FALSE (1 ≠ 162 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 162` is DISTINCT from the banked battery (… C191 1=159, C192 1=160,
-- C193 1=161).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/Householder/bireflection/isometry/
-- SO(8)/determinant/parity/even/word/closure/JoinedIdQvC/octonion/block/Gram-Schmidt": over the
-- derived complete ordered field Cut, the explicit linear operator
-- houseHolder e₂ · houseHolder (e₂+je2) has LinearMap.det = 1; claiming it equals 162 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the genuinely non-orthonormal product `houseHolder e₂ · houseHolder (e₂+je2)` has
    `LinearMap.det = 162`. It GENUINELY equals `1` (each Householder factor has `det −1` over the
    derived field `Cut`, so the product's `det` is `(−1)·(−1) = 1` — `det_e2je2_product`). The
    WRONG claim that it is `162` (the product's det is not 1 / its reflection word is not even / it
    does not lift by the det-parity bridge) reduces, after rewriting by the genuine value, to the
    false numeric `(1 : Cut) = 162`, so this must NOT compile. -/
theorem octBlockSO8DetParity_wrong_value_BOGUS :
    LinearMap.det
      (houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut))) = (162 : Cut) := by
  rw [det_e2je2_product]

end

end Counterexamples
