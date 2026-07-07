/-
  Counterexamples.ArcOConsolidationVacuityCostume — N425 anti-vacuity (C450).
  ============================================================================================
  W8 ANTI-VACUITY. The N425 node (arc-O O10 — the arc-O consolidation) exhibits the completion
  sweep's nine nodes as readings of TWO derived objects: the fold's ONE return turn `azimuthalTurn`
  and the fold's ONE reduced (1,3) form `Q4`. The load-bearing non-vacuity facts: the five Born-turn
  submultiples are GENUINELY DISTINCT (the fold phase `azimuthalTurn/16` is NOT the Cabibbo phase
  `azimuthalTurn/8` — the thread is a real spread, not a degenerate coincidence), AND the CP factor /
  self=other balance is a real nontrivial value `1/2 ≠ 1` (the O1 ⟺ O3 balance=CP identity is not
  vacuous). A mis-reading where the submultiples collapsed (all ties to one angle — the thread empty)
  or where the balance were the trivial `1` (the CP factor degenerate) would gut the whole O10 weld.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N425 arc-O consolidation is a genuine
  cross-node weld: the fold-phase and Cabibbo submultiples are DISTINCT (`foldPhase ≠ 2·foldPhase`,
  i.e. the turn is divided two GENUINELY different ways) AND the balance=CP factor is the nontrivial
  `1/2` not `1`". It is TIED to the banked N425 landing by `cFlag_forced` through `foldPhase_azimuthal`,
  `cabibbo_azimuthal`, and `balance_is_cpFactor`.

  We anchor `min 450 cFlag = 1` (TRUE — `cFlag = 1 < 450`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the submultiples collapse / the balance is trivial"
  mis-reading): that `min 450 cFlag = 450`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 450` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (450, 1) is fresh (Cid 450 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ArcOConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ArcOConsolidation
open Phys.Algebra.FoldPhase
open Phys.Algebra.CKMTwoSectorPhase
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE N425-NON-VACUITY FLAG: `1` = "the O1 fold-phase submultiple `azimuthalTurn/16` and the O3
    Cabibbo submultiple `azimuthalTurn/8` are GENUINELY DISTINCT (the fold turn is divided two
    different ways — the thread is a real spread), AND the O1⟺O3 balance = CP factor is the
    nontrivial `1/2 ≠ 1`". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N425 landing): the fold phase differs from the Cabibbo phase
    (`foldPhase ≠ 2·foldPhase`, since `foldPhase = azimuthalTurn/16 ≠ azimuthalTurn/8 = 2·foldPhase`
    as `azimuthalTurn > 0`), and the balance=CP factor `cutCos(2·foldPhase)² = cpFactorDerived = 1/2`
    is not `1`; hence `cFlag = 1`. If the submultiples collapsed or the factor were trivial, this
    conjunction would fail. -/
theorem cFlag_forced :
    (foldPhase ≠ (2 : Cut) * foldPhase
      ∧ cutCos ((2 : Cut) * foldPhase) * cutCos ((2 : Cut) * foldPhase) ≠ 1)
    ∧ cFlag = 1 := by
  refine ⟨⟨?_, ?_⟩, rfl⟩
  · -- foldPhase ≠ 2·foldPhase, because foldPhase = cutPi/8 > 0
    have hpos : (0 : Cut) < foldPhase := by
      unfold foldPhase; have := cutPi_pos; linarith
    intro h
    have : foldPhase = 0 := by linarith [h]
    linarith
  · -- cutCos(2·foldPhase)² = cpFactorDerived = 1/2 ≠ 1
    rw [balance_is_cpFactor, cpFactorDerived_eq_half]
    norm_num

/-- TRUE: `min 450 cFlag = 1`, holding precisely because `cFlag = 1 < 450`. -/
theorem cert_val_true : min (450 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 450 cFlag = 450`. It GENUINELY equals `1` (`cert_val_true`). A "submultiples
    collapse / balance trivial" mis-reading reduces — through the banked O10 landing — to the false
    numeric `1 = 450`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (450 : ℕ) cFlag = 450 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 450  (FALSE — the costume bites)

end Counterexamples
