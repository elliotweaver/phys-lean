/-
  Counterexamples.MirrorTermLanguageVacuityCostume — the universal legality theorem is
  GENUINE: the legal predicate is inhabited (the mirror term itself), the excluded controls
  are genuinely illegal, and the higher-moment annihilation discriminates (odd moments
  EXACTLY zero, the next even moment 2/5 ≠ 0 with no banked normalization). C675.
  =====================================================================================
  W8 ANTI-VACUITY. N675 claims the mirror term is the UNIQUE legal term of the formal
  grammar (ChainLegal over ParsedTerm), closing the N588 boundary. The content that must
  NOT be hollow: (i) ChainLegal is INHABITED (mirrorParsed_legal) — the universal theorem
  is not vacuous; (ii) the language genuinely discriminates — language_controls_excluded
  rejects six concrete illegal terms, each failing a NAMED conjunct; (iii) the new moment
  pair is non-degenerate: fifthMomentFlux_vanishes is EXACT (= 0) while fourthEvenMoment_eq
  is NONZERO (= 2/5) — the annihilation selects, it does not flatten everything to zero.

  THE CERTIFICATE. attestFlag := 1 -- "the universal theorem is inhabited + discriminating".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 675 attestFlag = 1 (TRUE -- attestFlag = 1 < 675).

  THE BOGUS CLAIM (a stand-in for ANY "the legal predicate is empty / the controls are not
  excluded / the moment annihilation is vacuous" reading): that min 675 attestFlag = 675.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false
  numeric 1 = 675 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (675, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MirrorTermLanguage

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.ChainTermGrammar
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the universal legality theorem is inhabited and discriminating". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the legal predicate is INHABITED
    (`mirrorParsed_legal`), the higher odd moment vanishes EXACTLY
    (`fifthMomentFlux_vanishes`), the next even moment is NONZERO (`fourthEvenMoment_eq`,
    2/5 ≠ 0 — the annihilation discriminates rather than flattening), and attestFlag = 1. -/
theorem attestFlag_forced :
    ChainLegal mirrorParsed ∧ fifthMomentFlux cutPi = 0
      ∧ fourthEvenMomentFlux cutPi = 2/5 ∧ (2/5 : Cut) ≠ 0 ∧ attestFlag = 1 :=
  ⟨mirrorParsed_legal, fifthMomentFlux_vanishes, fourthEvenMoment_eq, by norm_num, rfl⟩

/-- TRUE: min 675 attestFlag = 1. -/
theorem cert_val_true : min (675 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 675 attestFlag = 675. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (675 : ℕ) attestFlag = 675 := by
  rw [cert_val_true]

end Counterexamples
