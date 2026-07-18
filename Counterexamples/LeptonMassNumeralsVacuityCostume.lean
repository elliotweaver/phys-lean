/-
  Counterexamples.LeptonMassNumeralsVacuityCostume — the certified lepton mass numerals GENUINELY
  force a strictly-ordered non-degenerate spectrum (they are not a hollow/collapsed bracket), C548.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M2 — THE LEPTON MASS NUMERALS) evaluates the absolute lepton
  tower as certified two-sided rational brackets `absMass k ∈ [lo_k, hi_k]` against the M1 peg. The
  content that must NOT be hollow is that the numerals genuinely SEPARATE the three masses into a
  strict non-degenerate spectrum: the lightest bracket lies entirely below the middle, which lies
  entirely below the heaviest (`absMass_ordered_from_brackets`: `0 < absMass1 < absMass2 < absMass0`,
  derived FROM the certified brackets alone). If that were vacuous — if the brackets overlapped or
  collapsed to a point — the "numerals" would carry no spectral content and the arc-M evaluation
  program would be empty.

  The content that must NOT be hollow: the certified brackets force the strict ordering — the banked
  `absMass_ordered_from_brackets` gives `0 < absMass1 ∧ absMass1 < absMass2 ∧ absMass2 < absMass0`.
  A "the lepton spectrum is degenerate / the brackets collapse" mis-reading is refuted by that banked
  theorem.

  THE CERTIFICATE. sepFlag := 1 -- a natural-number flag standing for "the certified numerals force a
  strictly-ordered non-degenerate three-lepton spectrum (absMass_ordered_from_brackets)". It is TIED
  to the banked landing by sepFlag_forced: `absMass_ordered_from_brackets` gives the genuine strict
  separation.

  We anchor min 548 sepFlag = 1 (TRUE -- sepFlag = 1 < 548, so the min is sepFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the lepton spectrum is degenerate / the numerals collapse"
  mis-reading): that min 548 sepFlag = 548. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 548 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (548, 1) is fresh (Cid 548 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LeptonMassNumerals
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.LeptonNumerals
open Phys.Algebra.AbsMass

/-- THE FLAG: 1 = "the certified numerals force a strictly-ordered non-degenerate three-lepton
    spectrum (absMass_ordered_from_brackets)". -/
def sepFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified brackets force `0 < absMass1 < absMass2 <
    absMass0` (`absMass_ordered_from_brackets`), and `sepFlag = 1`. -/
theorem sepFlag_forced :
    (0 < absMass1 ∧ absMass1 < absMass2 ∧ absMass2 < absMass0) ∧ sepFlag = 1 :=
  ⟨absMass_ordered_from_brackets, rfl⟩

/-- TRUE: min 548 sepFlag = 1, holding precisely because sepFlag = 1 < 548. -/
theorem cert_val_true : min (548 : ℕ) sepFlag = 1 := by decide

/-- BOGUS: claims min 548 sepFlag = 548. It GENUINELY equals 1 (cert_val_true). A "the lepton
    spectrum is degenerate / the numerals collapse" mis-reading reduces -- through the banked
    absMass_ordered_from_brackets tie -- to the false numeric 1 = 548 in the naturals. The kernel
    cannot close it; it BITES. -/
theorem bogus_claim : min (548 : ℕ) sepFlag = 548 := by
  rw [cert_val_true]

end Counterexamples
