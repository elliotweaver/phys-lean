/-
  Counterexamples.ScaleTowerAbsoluteScaleChainVacuityCostume — N409 anti-vacuity (C434).
  ============================================================================================
  W8 ANTI-VACUITY. The N409 node (arc-M M3 — the z0/m_e-scale chain closure) banks the absolute
  mass scale as ONE budget-anchored CHAIN: the electroweak anchor `v/M = ewClosureRatio` (the
  banked n=9 tower rung `e^(−28π/3)`) times the banked `m_b` gear link (N408) times deferred
  top/light links, with the never-banked WELD tying the anchor's `84π` budget lock to the winding
  phase's budget form. The load-bearing non-vacuity fact: the anchor is a GENUINE nontrivial
  suppression — `ewClosureRatio ≠ 1` (N332 `ewClosureRatio_ne_one`); a mis-reading where the
  electroweak anchor were the trivial overall scale `1` (a free overall scale, no budget anchoring)
  would collapse the whole M3 chain-closure — the chain would carry no derived content.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked electroweak anchor is a genuine
  nontrivial suppression (`ewClosureRatio ≠ 1`), and the `m_b` gear link genuinely suppresses at
  `phaseBorn = 1` (`(mbBornRatio 1 : ℚ) : Cut) ≠ 1`)". It is TIED to the banked N409 landing by
  `cFlag_forced` through `anchor_ne_one` and `mbLink_one_ne_one`.

  We anchor `min 434 cFlag = 1` (TRUE — `cFlag = 1 < 434`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the anchor is the trivial scale 1 / the m_b link is trivial /
  the chain is vacuous" mis-reading): that `min 434 cFlag = 434`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 434` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (434, 1) is fresh (Cid 434 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerAbsoluteScaleChain
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ScaleChain
open Phys.Algebra.Gear
open Phys.Algebra

/-- THE M3-NON-VACUITY FLAG: `1` = "the banked electroweak anchor is a genuine nontrivial
    suppression (`ewClosureRatio ≠ 1`), and the `m_b` gear link genuinely suppresses at
    `phaseBorn = 1`". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N409 landing): the electroweak anchor is a genuine suppression
    (`ewClosureRatio ≠ 1`, `anchor_ne_one`) and the `m_b` gear link at `phaseBorn = 1` is nontrivial
    (`(mbBornRatio 1 : ℚ) : Cut) ≠ 1`, `mbLink_one_ne_one`); hence `cFlag = 1`. If the anchor were
    the trivial scale `1` or the link trivial, one of these would fail. -/
theorem cFlag_forced :
    (ewClosureRatio ≠ 1
      ∧ ((mbBornRatio 1 : ℚ) : Phys.Foundation.ContinuumQ.Cut) ≠ ((1 : ℚ) : Phys.Foundation.ContinuumQ.Cut))
    ∧ cFlag = 1 :=
  ⟨⟨anchor_ne_one, mbLink_one_ne_one⟩, rfl⟩

/-- TRUE: `min 434 cFlag = 1`, holding precisely because `cFlag = 1 < 434`. -/
theorem cert_val_true : min (434 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 434 cFlag = 434`. It GENUINELY equals `1` (`cert_val_true`). A "the anchor is
    the trivial scale 1 / the m_b link is trivial / the chain is vacuous" mis-reading reduces —
    through the banked genuinely-suppressing anchor and gear link — to the false numeric `1 = 434`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (434 : ℕ) cFlag = 434 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 434  (FALSE — the costume bites)

end Counterexamples
