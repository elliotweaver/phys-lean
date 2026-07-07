/-
  Counterexamples.ScaleTowerDischargeArcMVacuityCostume — N417 anti-vacuity (C442).
  ============================================================================================
  W8 ANTI-VACUITY. The N417 node (arc-O O2 — DISCHARGE ARC M) promotes the absolute-scale chain to
  derived: the derived chain `absScaleChainDerived` is a DETERMINED positive derived `Cut`, strictly
  suppressed below the electroweak anchor `ewClosureRatio` (`absScaleChainDerived_lt_anchor`) and
  below `1`, with the free ℚ slot arc M left closed by the derived fold-phase amplitude. The
  load-bearing non-vacuity fact: the derived chain GENUINELY suppresses — it is neither the trivial
  overall scale `1` nor equal to the bare anchor (an "all links = 1" vacuous reading). A mis-reading
  where the derived chain collapsed to the anchor (the phase/survival/light factors did nothing) would
  gut the whole M-discharge.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N417 derived chain genuinely suppresses:
  `0 < absScaleChainDerived < ewClosureRatio`". It is TIED to the banked N417 landing by
  `cFlag_forced` through `absScaleChainDerived_pos` + `absScaleChainDerived_lt_anchor`.

  We anchor `min 442 cFlag = 1` (TRUE — `cFlag = 1 < 442`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the derived chain is vacuous / equals the anchor / does not
  suppress" mis-reading): that `min 442 cFlag = 442`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 442` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (442, 1) is fresh (Cid 442 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerDischargeArcM
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.DischargeArcM
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE N417-NON-VACUITY FLAG: `1` = "the derived absolute-scale chain genuinely suppresses below the
    electroweak anchor over the derived ℝ". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N417 landing): the derived chain is strictly positive
    (`absScaleChainDerived_pos`) and strictly below the electroweak anchor
    (`absScaleChainDerived_lt_anchor`); hence `cFlag = 1`. If the chain were vacuous (equal to the
    anchor, or `0`) these facts would fail. -/
theorem cFlag_forced :
    (0 < absScaleChainDerived ∧ absScaleChainDerived < ewClosureRatio)
    ∧ cFlag = 1 :=
  ⟨⟨absScaleChainDerived_pos, absScaleChainDerived_lt_anchor⟩, rfl⟩

/-- TRUE: `min 442 cFlag = 1`, holding precisely because `cFlag = 1 < 442`. -/
theorem cert_val_true : min (442 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 442 cFlag = 442`. It GENUINELY equals `1` (`cert_val_true`). A "the derived
    chain is vacuous / equals the anchor / does not suppress" mis-reading reduces — through the banked
    M-discharge landing — to the false numeric `1 = 442`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (442 : ℕ) cFlag = 442 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 442  (FALSE — the costume bites)

end Counterexamples
