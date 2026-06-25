/-
  Counterexamples.DerivationSimpleStructureWrongDecompCostume — N30 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N30 structure-theorem reduction. N30 banks the atom →
  two-commuting-ideals reduction: if the Lie-ideal lattice of `derivationLieQ` is NOT a simple
  order, an atom `I ≠ ⊤` has a Boolean complement `J = Iᶜ` giving two NONZERO COMMUTING ideals
  (`atom_compl_decomp` — `I ≠ ⊥`, `Iᶜ ≠ ⊥`, `I ⊔ Iᶜ = ⊤`, `I ⊓ Iᶜ = ⊥`, and crucially
  `⁅I, Iᶜ⁆ = ⊥`). The COMMUTING half (`⁅I, Iᶜ⁆ = ⊥`) is the structural fact the prime-7 /
  isotypic-Schur argument turns on (it lands the action of one factor in the commutant of the
  other, where Schur applies).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the two complementary ideals
  DO NOT commute — that `⁅I, Iᶜ⁆ = ⊤` (the WHOLE algebra), the degenerate reading in which the
  Boolean complement is not a genuine commuting factor. Rewriting through the banked COMMUTING
  fact `(atom_compl_decomp I hI hIne).2.2.2.2 : ⁅I, Iᶜ⁆ = ⊥` reduces the claim to `⊥ = ⊤`, which
  is genuinely FALSE — the ideal lattice is NONTRIVIAL (banked `lieIdeal_nontrivial`, `⊥ ≠ ⊤`) —
  so the residual goal cannot be discharged. If the complement did NOT commute (or the lattice
  were degenerate `⊥ = ⊤`), the structure theorem's direct-sum-of-commuting-ideals setup would
  be vacuous; W8 demands this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ ⊥ = ⊤`).
-/
import Phys.Algebra.DerivationSimpleStructure

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

/-- WRONG: claiming the two complementary commuting ideals `I` and `Iᶜ` bracket to the WHOLE
    algebra `⊤` (i.e. do NOT commute). Rewriting through the banked COMMUTING fact `⁅I, Iᶜ⁆ = ⊥`
    reduces the goal to `⊥ = ⊤`, which is false (the ideal lattice is nontrivial) and cannot be
    discharged. Must FAIL to compile. -/
theorem atom_compl_bracket_top_BOGUS (I : LieIdeal ℚ derivationLieQ)
    (hI : IsAtom I) (hIne : I ≠ ⊤) :
    (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) = ⊤ := by
  rw [(atom_compl_decomp I hI hIne).2.2.2.2]

end Counterexamples
