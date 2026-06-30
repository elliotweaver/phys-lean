/-
  Counterexamples.DerivationRep7IsospinBranchingWrongValueCostume — N189 anti-vacuity (C221).
  ===========================================================================
  W8 ANTI-VACUITY. The N189 node banks THE ISOSPIN BRANCHING OF THE `7`: the singlet drops out
  when `g₂ = Der(O ℚ)` is restricted to the embedded weak-isospin `su(2)` (N187). The inner
  derivations act componentwise on `O ℚ = CD (H ℚ) = ⟨H, H⟩`, so the upper-doubling unit
  `e₄ := κO 1 = ⟨0,1⟩` is a NONZERO vector of the `7` (`kappaO_one_mem_ImO`,
  `kappaO_one_ne_zero`) that is ANNIHILATED by every inner derivation
  (`innerDeriv_kappaO_one`), hence fixed by the whole embedded `su(2)` — THE SINGLET. Yet the
  full `g₂` moves the singlet line off itself (`g2_moves_singletLine`, via the banked N25
  `no_one_dim_invariant_ImO`): the `7` is `g₂`-irreducible but `su(2)`-reducible.

  THE WITNESSING COORDINATE. The singlet vector `e₄ = κO 1` reads, at its `im.re.re`
  coordinate, the genuine value `1` (`kappaO_one_coord`) — the nonzero coordinate pinning
  `e₄` as a real, nonzero vector of the `7` (not the trivial/zero summand).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading of the branching — the singlet is the zero
  vector / not a genuine vector of the 7 / has a trivial coordinate): that this witnessing
  coordinate equals `(189 : ℚ)`. The banked value is exactly `1` (`kappaO_one_coord`), so the
  claim reduces to the false numeric `(1 : ℚ) = 189` over the characteristic-0 derived ℚ. The
  kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / 7 / g₂ / su(2) / singlet / branching
  / rep / gauge" and the second-coordinate unit `⟨0,1⟩` of the Cayley–Dickson double
  `CD (H ℚ)` GENUINELY has `im.re.re`-coordinate `1`, so claiming `189` is genuinely FALSE
  (`1 ≠ 189` in ℚ).

  DISTINCT from the banked battery (… C218 `1 = 186`, C219 `4 = 187`, C220 `2 = 188`):
  value `1 = 189` (the pair (1,189) differs from C218's (1,186) by the RHS).
-/
import Phys.Algebra.DerivationRep7IsospinBranching

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the witnessing coordinate of the singlet vector. The upper-doubling unit
    `e₄ = κO 1 = ⟨0,1⟩` reads, at `im.re.re`, the genuine nonzero value `1`. -/
theorem rep7Branching_singlet_coord_true :
    (kappaO (1 : H ℚ)).im.re.re = 1 := kappaO_one_coord

/-- BOGUS: claims the witnessing coordinate of the singlet is `(189 : ℚ)`. It GENUINELY
    equals `1` (`rep7Branching_singlet_coord_true`). The WRONG claim (the singlet is the zero
    vector / not a genuine vector of the 7 / a trivial coordinate) reduces to the false
    numeric `(1 : ℚ) = 189`, so this must NOT compile. -/
theorem rep7Branching_wrong_singlet_BOGUS :
    (kappaO (1 : H ℚ)).im.re.re = (189 : ℚ) := by
  rw [rep7Branching_singlet_coord_true]

end Counterexamples
