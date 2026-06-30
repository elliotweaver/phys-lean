/-
  Counterexamples.DerivationRep7IrreducibleBimoduleWrongValueCostume — N194 anti-vacuity (C226).
  ===========================================================================
  W8 ANTI-VACUITY. The N194 node banks that the `(2,2)` summand `kappaO(top)` of the joint so(4)
  bigrading `7 = (3,1) (+) (2,2)` is IRREDUCIBLE under su(2)_T (hence so(4)): no proper nonzero
  invariant subspace. The genuinely NEW content vs N189-N193 (which proved only INVARIANCE) is
  IRREDUCIBILITY, and the lever it stands on is the BORN ANISOTROPY of the four-square self-overlap
  form `quatNorm` over Q: `quatNorm w = 0 <-> w = 0`. Without that anisotropy (e.g. over C, where
  the form is isotropic) the (2,2) would SPLIT and the irreducibility would be FALSE.

  THE GENUINE VALUE. The four-square Born norm of the unit imaginary `hI` is `quatNorm hI = 1`
  (`hI` has coords `(0,1,0,0)`, so `0^2+1^2+0^2+0^2 = 1`) — a NONZERO value, witnessing the
  anisotropy is genuine (a nonzero imaginary unit has nonzero self-overlap, so `star hI * hI =
  1 * 1 = 1 != 0`, forcing `1` into any invariant subspace containing `hI`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the Born form is isotropic / the (2,2) splits
  / the irreducibility is vacuous / the anisotropy fails): that this norm equals `(194 : Q)`. The
  banked value is exactly `1` (`quatNorm_hI_true` below, from `starMulSelf_eq_quatNorm` read on
  `hI`), so the claim reduces to the false numeric `194 = 1` in Q. The kernel cannot close it; the
  costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / so(4) / bimodule / irreducible /
  bigrading / Born / gauge" and for the Cayley-Dickson double `H Q = CD (Dbl Q)` the four-square
  form `quatNorm` of the conjugation-antifixed generator `hI = iota J` (coords `(0,1,0,0)`) reads
  `1` — so claiming `194` is genuinely FALSE (`194 /= 1` in Q).

  DISTINCT from the banked battery (... C223 `2 = 191`, C224 `1 = 192`, C225 `193 = -1`): pair
  `(194, 1)` is fresh (LHS `194` distinct from every prior left-hand value).
-/
import Phys.Algebra.DerivationRep7IrreducibleBimodule

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the four-square Born norm of the unit imaginary `hI` is `1`. -/
theorem quatNorm_hI_true : quatNorm (hI : H ℚ) = 1 := by
  simp [quatNorm, hI, CD.iota, Dbl.J]

/-- BOGUS: claims the Born norm of `hI` is `(194 : ℚ)`. It GENUINELY equals `1`
    (`quatNorm_hI_true`). The WRONG claim (the Born form is isotropic / the (2,2) splits / the
    irreducibility is vacuous) reduces to the false numeric `(194 : ℚ) = 1`, so this must NOT
    compile. -/
theorem quatNorm_hI_wrong_BOGUS : (194 : ℚ) = quatNorm (hI : H ℚ) := by
  rw [quatNorm_hI_true]

end Counterexamples
