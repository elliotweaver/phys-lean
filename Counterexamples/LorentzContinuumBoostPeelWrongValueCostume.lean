import Phys.Algebra.LorentzContinuumBoostPeel

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C201): A BOGUS BOOST-PEEL / READ-OFF / INVERSE / FACTORIZATION CLAIM — "THE BOOST
-- PEEL OF AN ORTHOCHRONOUS QvC-ISOMETRY p MIS-READS THE BOOST DATA OFF p e₀, SO THE REVERSE BOOST
-- FAILS TO RETURN p e₀ TO e₀ AND THE FACTORIZATION p = B·k FAILS / THE TIME-FIXING REDUCTION IS
-- VACUOUS". N169 banks THE BOOST PEEL: signature (1,9) has exactly ONE timelike direction, so an
-- orthochronous QvC-isometry p mixes the timelike axis e₀ with AT MOST ONE spatial unit direction
-- ŵ, READ DIRECTLY OFF p e₀ = (a, sx, sv): QvC(p e₀) = QvC e₀ = 1 forces a² − (sx² + gFormC sv sv)
-- = 1, i.e. a² − b² = 1 with b² = nrm = sx² + gFormC sv sv — the FORWARD-HYPERBOLA condition the
-- reverse boost genBoostLin ŵ a (−b) consumes to send p e₀ back to e₀ (qvIsom_orthochronous_boost_peel),
-- giving p = B·k with k time-fixing (qvIsom_orthochronous_boost_factor). For the concrete
-- octonion-direction boost (5/3, 4/3) (boost_peel_octReal_nonvac, B₀ e₀ = (5/3, 0, (4/3)•1)), the
-- forward-hyperbola read-off is (5/3)² − (4/3)² = 1 EXACTLY — the boost data is correctly read.
--   THE BOGUS claim that the forward-hyperbola read-off (5/3)² − (4/3)² of the peeled boost data
-- (a stand-in for ANY wrong boost-peel / read-off / inverse / factorization / reduction value: the
-- reverse boost fails to return p e₀ to e₀ / the factorization fails) equals 169 forces, after
-- evaluating the genuine read-off (which is exactly (5/3)² − (4/3)² = 1), the false numeric
-- `(1 : Cut) = 169` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine forward-hyperbola read-off at the
-- octonion-direction boost (5/3, 4/3) is (5/3)² − (4/3)² = 1, so the claim of 169 is genuinely
-- FALSE (1 ≠ 169 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 169` is DISTINCT from the banked battery (… C198 1=166, C199 1=167,
-- C200 1=168).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/peel/eigenframe/isometry/hyperbola/timelike/
-- spatial/orthochronous/time-fixing/reciprocal/JoinedIdQvC": over the derived ordered field Cut,
-- the value (5/3)² − (4/3)² equals 1; claiming it equals 169 forces the false numeric. The bite is
-- a false NUMERIC, name-independent.

/-- BOGUS: the forward-hyperbola read-off `(5/3)² − (4/3)²` of the boost data peeled off the
    octonion-direction boost `(5/3, 4/3)` equals `169`. It GENUINELY equals `1` (the
    forward-hyperbola condition `a² − b² = 1` that the boost peel reads off `p e₀`). The WRONG
    claim that it is `169` (the boost peel mis-reads the data / the reverse boost fails to return
    `p e₀` to `e₀` / the factorization fails) reduces to the false numeric `(1 : Cut) = 169`, so
    this must NOT compile. -/
theorem boostPeel_wrong_value_BOGUS :
    ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = (169 : Cut) := by
  rw [show ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = (1 : Cut) by norm_num]

end

end Counterexamples
