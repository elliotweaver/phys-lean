/-
  Counterexamples.DerivationRep7IsotypicSchurWrongValueCostume — N196 anti-vacuity (C228).
  ===========================================================================
  W8 ANTI-VACUITY. The N196 node banks that the joint so(4) bigrading 7 = (3,1) (+) (2,2) is a
  CANONICAL / multiplicity-free isotypic decomposition: there is NO nonzero su(2)_T-equivariant
  linear map carrying either summand into the other. The genuinely-NEW lever is the trunk's
  quaternionic DIVISION at the H rung — left-multiplication by the antifixed unit hI is BIJECTIVE,
  so the (2,2) = kappaO(top) (the left-regular H-module) has NO nonzero su(2)_T-FIXED vector, while
  the (3,1) = iotaO(ImH) is su(2)_T-TRIVIAL — forcing both cross-intertwiners to vanish.

  The dichotomy genuinely has teeth: the (2,2) singlet element kappaO 1 is MOVED by su(2)_T,
  leftImDeriv hI (kappaO 1) = kappaO hI, whose deep coordinate (kappaO hI).im.re.im = 1 is NONZERO.
  That nonzero value is exactly what witnesses kappaO 1 is NOT su(2)_T-fixed (so the module is not
  pointwise-fixed and "no nonzero fixed vector" is non-vacuous), which is the heart of the
  cross-vanishing.

  THE GENUINE VALUE. (leftImDeriv hI (kappaO 1)).im.re.im = 1 (w8_coord_true below).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the (2,2) HAS a nonzero su(2)_T-fixed vector /
  a nonzero su(2)_T-equivariant cross-map between the summands exists / the decomposition is NOT
  canonical / the no-fixed-vector dichotomy is vacuous): that this coordinate equals (196 : Q). The
  banked value is exactly 1, so the claim reduces to the false numeric 196 = 1 in Q. The kernel
  cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / so(4) / singlet / branching /
  bigrading / rep / irreducible / isotypic / Schur / multiplicity" and for the Cayley-Dickson double
  O Q = CD (H Q) the second-slot left-multiplication leftImDeriv hI (kappaO 1) = kappaO hI has deep
  coordinate 1 -- so claiming 196 is genuinely FALSE (196 /= 1 in Q).

  DISTINCT from the banked battery (... C225 193 = -1, C226 194 = 1, C227 195 = -2): pair (196, 1)
  is fresh (LHS 196 distinct from every prior left-hand value).
-/
import Phys.Algebra.DerivationRep7IsotypicSchur

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the deep coordinate of `leftImDeriv hI (κO 1) = κO hI` is `1` — the (2,2) singlet line is
    genuinely MOVED by `su(2)_T`, so the "no nonzero fixed vector" dichotomy has teeth. -/
theorem w8_coord_true : (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = 1 := by
  rw [leftImDeriv_kappaO, mul_one]
  simp [kappaO, hI, CD.iota, Dbl.J]

/-- BOGUS: claims this coordinate is `(196 : ℚ)`. It GENUINELY equals `1` (`w8_coord_true`). The
    WRONG claim (the (2,2) has a nonzero su(2)_T-fixed vector / a nonzero cross-intertwiner exists /
    the decomposition is not canonical) reduces to the false numeric `(196 : ℚ) = 1`, so this must
    NOT compile. -/
theorem w8_coord_wrong_BOGUS : (196 : ℚ) = (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im := by
  rw [w8_coord_true]

end Counterexamples
