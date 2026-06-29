import Phys.Algebra.LorentzContinuumPositivePartReciprocal

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C199): A BOGUS RECIPROCAL / J-CONJUGATION / POSITIVE-PART-PATH CLAIM — "THE
-- POSITIVE-PART FACTOR p OF THE CONVERSE POLAR DECOMPOSITION OF A BvC-ISOMETRY HAS EIGENVALUES THAT
-- DO NOT COME IN RECIPROCAL PAIRS (λ, 1/λ), SO J p J ≠ p⁻¹ AND THE PURE-BOOST / RECIPROCAL
-- CHARACTERIZATION FAILS".
-- N167 banks THE RECIPROCAL CHARACTERIZATION: an EvC-self-adjoint QvC-isometry p satisfies the
-- operator equation p∘J∘p = J (evCSymm_isQvIsomC_recip) and the J-conjugation inversion
-- (J∘p∘J)∘p = id, i.e. J p J = p⁻¹ (evCSymm_isQvIsomC_Jconj_inv) — the reciprocal-eigenvalue-pair
-- structure of a pure boost on the indefinite form. The positive-part factor p of the converse
-- polar decomposition of a BvC-isometry satisfies both (bvIsomLin_polar_part_recip), distinguishing
-- it from a generic positive operator (for which J q J ≠ q⁻¹). The eigenvalues of a single boost
-- (a, b) on its eigenplane are the RECIPROCAL PAIR (a+b, a−b), whose product is (a+b)(a−b) = a²−b²,
-- which equals 1 EXACTLY on the unit hyperbola a²−b² = 1.
--   THE BOGUS claim that the eigenvalue-pair product (a+b)(a−b) = a²−b² of the boost parameter
-- (a,b) = (5/3, 4/3) (a stand-in for ANY wrong reciprocal / J-conjugation / positive-part-path
-- value: the eigenvalues do NOT reciprocate / J p J ≠ p⁻¹ / the characterization fails) equals 167
-- forces, after rewriting by the genuine reciprocal-product identity (which is exactly a²−b² = 1 on
-- the unit hyperbola, boostWitness_hab), the false numeric `(1 : Cut) = 167` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine eigenvalue-pair product at
-- (5/3, 4/3) is (5/3+4/3)(5/3−4/3) = (5/3)²−(4/3)² = 1 (boostWitness_hab), so the claim of 167 is
-- genuinely FALSE (1 ≠ 167 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 167` is DISTINCT from the banked battery (… C196 1=164, C197 1=165,
-- C198 1=166).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/reciprocal/pure-boost/eigenvalue/eigenplane/
-- J-conjugation/self-adjoint/isometry/positive-part/hyperbola": over the derived complete ordered
-- field Cut, the value (5/3 + 4/3)·(5/3 − 4/3) equals (5/3)² − (4/3)² = 1; claiming it equals 167
-- forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the reciprocal-eigenvalue-pair product `(a+b)·(a−b) = a²−b²` of the positive-part /
    boost factor at parameter `(a,b) = (5/3, 4/3)` equals `167`. It GENUINELY equals `1`
    (`boostWitness_hab`: `(5/3)² − (4/3)² = 1`). The WRONG claim that it is `167` (the eigenvalues
    do not reciprocate / `J p J ≠ p⁻¹` / the reciprocal characterization fails) reduces, after
    rewriting by the genuine reciprocal-product identity, to the false numeric `(1 : Cut) = 167`,
    so this must NOT compile. -/
theorem positivePart_reciprocal_wrong_value_BOGUS :
    ((5:Cut)/3 + (4:Cut)/3) * ((5:Cut)/3 - (4:Cut)/3) = (167 : Cut) := by
  rw [show ((5:Cut)/3 + (4:Cut)/3) * ((5:Cut)/3 - (4:Cut)/3)
        = ((5:Cut)/3)^2 - ((4:Cut)/3)^2 by ring, boostWitness_hab]

end

end Counterexamples
