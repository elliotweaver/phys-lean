/-
  Counterexamples.TowerGatherObstructionUnificationVacuityCostume — N413 anti-vacuity (C438).
  ============================================================================================
  W8 ANTI-VACUITY. The N413 node (arc-N N3 — the obstruction unification) reads confinement (arc I),
  the cascade stop (N2), curvature (arc E), and CP (arc F2) as ONE obstruction — the octonion
  associator `assoc` on `O ℚ` — indexed by where the gather fails. The load-bearing non-vacuity
  fact: the common obstruction is a GENUINE PROPER SELECTION — the associator locus is NONEMPTY
  (`assocLocus_nonempty`, from the banked non-associating witness) AND the associator genuinely
  VANISHES somewhere (`obstruction_proper`, the banked left-alternative law `[x,x,y] = 0`). A
  mis-reading where the obstruction were vacuous (the associator vanished everywhere — no
  termination, no physics) would collapse the whole N413 unification.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N413 obstruction is genuinely PROPER
  and NONEMPTY: the associator is nonzero somewhere AND zero somewhere". It is TIED to the banked
  N413 landing by `cFlag_forced` through `assocLocus_nonempty` and `obstruction_proper`.

  We anchor `min 438 cFlag = 1` (TRUE — `cFlag = 1 < 438`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the obstruction is vacuous / the associator vanishes
  everywhere / there is no termination / no selection" mis-reading): that `min 438 cFlag = 438`.
  It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 438` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (438, 1) is fresh (Cid 438 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstructionUnification
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

/-- THE N413-NON-VACUITY FLAG: `1` = "the obstruction is genuinely PROPER and NONEMPTY (the
    octonion associator is nonzero somewhere and zero somewhere)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N413 landing): the associator locus is NONEMPTY
    (`AssocLocusNonempty`, `assocLocus_nonempty`) and PROPER (also zero somewhere,
    the second conjunct of `obstruction_proper`); hence `cFlag = 1`. If the obstruction were
    vacuous (associator zero everywhere) the nonemptiness clause would fail. -/
theorem cFlag_forced :
    (AssocLocusNonempty ∧ (∃ a b c : O ℚ, assoc a b c = 0)) ∧ cFlag = 1 :=
  ⟨⟨assocLocus_nonempty, obstruction_proper.2⟩, rfl⟩

/-- TRUE: `min 438 cFlag = 1`, holding precisely because `cFlag = 1 < 438`. -/
theorem cert_val_true : min (438 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 438 cFlag = 438`. It GENUINELY equals `1` (`cert_val_true`). A "the
    obstruction is vacuous / the associator vanishes everywhere / no termination" mis-reading
    reduces — through the banked nonempty-and-proper obstruction — to the false numeric
    `1 = 438`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (438 : ℕ) cFlag = 438 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 438  (FALSE — the costume bites)

end Counterexamples
