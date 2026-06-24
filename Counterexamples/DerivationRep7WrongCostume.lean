/-
  Counterexamples.DerivationRep7WrongCostume — N22 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N22 faithful 7-dimensional representation. N22 banks
  the G₂ FUNDAMENTAL representation: the derivation Lie algebra `derivationLieQ`
  (14-dim) acts on the imaginary subspace `Im(O ℚ)` of dimension exactly 7
  (`finrank_ImO`), and the action `imRep` is FAITHFUL (`imRep_injective`), so the
  banked NONZERO witness derivation has a NONZERO image (`imRep_witness_ne_zero`).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the banked
  NONZERO witness derivation acts as ZERO under `imRep` — i.e. the representation
  is NOT faithful. The proof tries to close it from `imRep_injective`
  (`imRep w = 0 → w = 0`, then contradict `witnessLieQ_ne_zero`); but the witness
  IS nonzero, so the only way to discharge the remaining `imRep witnessLieQ = 0`
  obligation is to assume the very falsehood claimed. The elaboration leaves the
  FALSE numeric/Prop core unsolved. A representation that silently killed a nonzero
  derivation would be a fake "faithful 7-rep" with no G₂ content — exactly the
  overclaim W8 demands a costume bite. (The companion wrong-dimension reading —
  `finrank Im(O ℚ) = 6` instead of the proved `7` — reduces to `7 = 6`; we keep the
  single sharpest faithfulness bite here.)

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationRep7

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the NONZERO witness derivation acts as ZERO under the
    7-representation — i.e. the action is NOT faithful. False: `imRep` is injective
    (`imRep_injective`) and the witness is nonzero (`witnessLieQ_ne_zero`), so
    `imRep witnessLieQ ≠ 0`. The proof reduces the goal, via injectivity, to the
    false `witnessLieQ = 0`; with `witnessLieQ_ne_zero` in hand the remaining core
    is `False`, which the kernel cannot close. Must FAIL. -/
theorem imRep_unfaithful_BOGUS : imRep witnessLieQ = 0 := by
  have h : witnessLieQ = 0 :=
    (injective_iff_map_eq_zero imRep).mp imRep_injective witnessLieQ (by rfl)
  exact absurd h witnessLieQ_ne_zero

end Counterexamples
