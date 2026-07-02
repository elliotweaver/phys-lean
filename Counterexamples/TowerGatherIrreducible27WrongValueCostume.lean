/-
  Counterexamples.TowerGatherIrreducible27WrongValueCostume — N234 anti-vacuity (C270).
  ===========================================================================
  W8 ANTI-VACUITY. The N234 node banks THE IRREDUCIBLE 27: the banked traceless-symmetric
  summand `tracelessSym` of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` admits NO proper nonzero `adEnd`-invariant
  subspace (`tracelessSym_no_proper_invariant`), via the Cartan pin + walk certificate. The
  load-bearing dimension — the one the walk from the single pinned quadric `X0q` must FILL for
  the irreducibility argument to close — is exactly `27` (banked `finrank_tracelessSym_eq_27`,
  re-verified through the walk: 27 independent basis quadrics `Bq`, `span_Bq_eq_tracelessSym`).

  A dimension `= 27` is not vacuous, so the anchor is the genuine value itself, packaged as the
  clean equality `min 27 (finrank ℚ tracelessSym) = 27` (which holds precisely BECAUSE
  `finrank ℚ tracelessSym = 27`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the 27 has the wrong dimension / the walk
  from the pin target fails to fill it / the pin protects the wrong space / the irreducibility
  argument closes on a smaller subspace): that `min 27 (finrank ℚ tracelessSym)` equals `270`.
  It GENUINELY equals `27` (`tracelessSym_dim_true`). Rewriting the banked value reduces the
  bogus claim to the false numeric `27 = 270` in ℕ. The kernel cannot close it; the costume
  BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the
  traceless-symmetric space genuinely has dimension `27`, so
  `min 27 (finrank ℚ tracelessSym) = 27`, and claiming it equals `270` is genuinely FALSE
  (27 ≠ 270).

  DISTINCT from the banked battery (... C268 = finrank commutantSpan = 268, C269 = 7=269): the
  pair (270, 27) is fresh (RHS 270 distinct from every prior right-hand value; the LHS anchor
  is the NEW N234 headline space, not N232's `proj27` range value 264).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherIrreducible27

namespace Counterexamples

open Phys.Algebra

/-- TRUE: `min 27 (finrank ℚ tracelessSym) = 27`, holding precisely because the 27 — the space
    N234 proves has no proper nonzero `adEnd`-invariant subspace — genuinely has dimension `27`
    (banked `finrank_tracelessSym_eq_27`). -/
theorem irreducible27_dim_true :
    min 27 (Module.finrank ℚ tracelessSym) = 27 := by
  have h : Module.finrank ℚ tracelessSym = 27 := finrank_tracelessSym_eq_27
  omega

/-- BOGUS: claims `min 27 (finrank ℚ tracelessSym) = 270`. It GENUINELY equals `27`
    (`irreducible27_dim_true`). The WRONG claim (the 27 has the wrong dimension / the pin+walk
    protects the wrong space) reduces — through the banked value — to the false numeric
    `27 = 270`, so this must NOT compile. -/
theorem irreducible27_dim_wrong_BOGUS :
    min 27 (Module.finrank ℚ tracelessSym) = 270 := by
  rw [irreducible27_dim_true]
  -- ⊢ (27 : ℕ) = 270  (FALSE — the costume bites)

end Counterexamples
