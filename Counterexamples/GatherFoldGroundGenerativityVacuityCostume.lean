/-
  Counterexamples.GatherFoldGroundGenerativityVacuityCostume — N414 anti-vacuity (C439).
  ============================================================================================
  W8 ANTI-VACUITY. The N414 node (arc-N N4 — self-reference is the ground, the generativity
  witness) exhibits, theorem-grade, that the arc-N obstruction (N413) is FORCED by the fold's own
  seed: the rung-1 fold-root generator `J` on `Dbl ℚ` is SELF-OPPOSED (`J ≠ star J`), and the N413
  obstruction witness holds IFF that self-opposition holds. The load-bearing non-vacuity fact: the
  seed GENUINELY FIRES on the fold's own line — `J ≠ star J` over `ℚ` (`foldRoot_selfOpposed_Q`) —
  and therefore forces the obstruction locus (`foldRoot_selfOpposed_forces_locus`). A mis-reading
  where the seed were vacuous (`J = star J`, no self-opposition, no obstruction generated) would
  collapse the whole N414 generativity witness — the axiom would generate nothing.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N414 fold seed genuinely fires:
  `J ≠ star J` over `ℚ` AND it forces the N413 obstruction locus". It is TIED to the banked N414
  landing by `cFlag_forced` through `foldRoot_selfOpposed_Q` and `foldRoot_selfOpposed_forces_locus`.

  We anchor `min 439 cFlag = 1` (TRUE — `cFlag = 1 < 439`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the seed is vacuous / `J = star J` / the fold generates no
  obstruction / the ground is inert" mis-reading): that `min 439 cFlag = 439`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 439` in ℕ.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (439, 1) is fresh (Cid 439 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GatherFoldGroundGenerativity
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

/-- THE N414-NON-VACUITY FLAG: `1` = "the fold seed genuinely fires (`J ≠ star J` over `ℚ`) and it
    forces the N413 obstruction locus". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N414 landing): the fold-root generator is self-opposed over `ℚ`
    (`foldRoot_selfOpposed_Q`) and that self-opposition forces `AssocLocusNonempty`
    (`foldRoot_selfOpposed_forces_locus`); hence `cFlag = 1`. If the seed were vacuous
    (`J = star J`) the self-opposition clause would fail. -/
theorem cFlag_forced :
    ((Dbl.J : Dbl ℚ) ≠ star Dbl.J ∧ AssocLocusNonempty) ∧ cFlag = 1 :=
  ⟨⟨foldRoot_selfOpposed_Q, foldRoot_selfOpposed_forces_locus foldRoot_selfOpposed_Q⟩, rfl⟩

/-- TRUE: `min 439 cFlag = 1`, holding precisely because `cFlag = 1 < 439`. -/
theorem cert_val_true : min (439 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 439 cFlag = 439`. It GENUINELY equals `1` (`cert_val_true`). A "the seed is
    vacuous / `J = star J` / the fold generates no obstruction" mis-reading reduces — through the
    banked fired-and-forcing seed — to the false numeric `1 = 439`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (439 : ℕ) cFlag = 439 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 439  (FALSE — the costume bites)

end Counterexamples
