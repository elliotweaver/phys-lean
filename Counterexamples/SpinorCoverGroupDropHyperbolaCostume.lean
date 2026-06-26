import Phys.Algebra.SpinorCoverGroup

namespace Counterexamples

open Phys.Cascade Phys.Algebra

-- WRONG: claiming that an ARBITRARY boost `boost a b` lies in the spinor cover group,
-- DROPPING the unit-hyperbola condition `a² − b² = 1`. This is FALSE: a boost lies in the
-- cover (and is a Born-form isometry) ONLY when `(a,b)` is on the unit hyperbola
-- (`boost_mem_cover` REQUIRES `a² − b² = 1`); a boost off the hyperbola does NOT preserve
-- `t² − x²` and is NOT a generator. The surjectivity/covering claim must be restricted to the
-- isometry condition — the rational generators alone, without the hyperbola constraint, do NOT
-- form the cover of the continuous component. Trying to discharge the unconditional membership
-- from the banked `boost_mem_cover` fails: the theorem demands the missing hypothesis
-- `a² − b² = 1`, so the term does NOT type-check. Must FAIL to compile.
theorem boost_in_cover_without_hyperbola_BOGUS (a b : ℚ) :
    boost a b ∈ spinorCoverMonoid := boost_mem_cover (a := a) (b := b)

end Counterexamples
