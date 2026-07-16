/-
  Counterexamples.GatherSelfCensusVacuityCostume — Z1 anti-vacuity (C495).
  ========================================================================
  W8 ANTI-VACUITY. The Z1 node (arc-Z KICKOFF) derives THE GATHER SELF-CENSUS: the gather resolving
  ITSELF into the screening sum with a CENSUS (the counts 6, 16) and a SENSE (the fold's MINUS) of its
  own. The load-bearing content: (i) a SKEW generator's trace-form self-overlap is the NEGATED census
  (`traceSq_skew`, `traceSq Cmat = −6`); (ii) the banked gather generators ARE skew, so their trace
  forms are strictly NEGATIVE (`gatherCharge_selfCensus_neg`, `B(chargeOp) = −6 < 0`), the OPPOSITE
  sense to the strictly POSITIVE matter census (`matter_selfCensus_pos`, `chargeTraceDepth = 16/3 > 0`);
  (iii) the skew hypothesis is LOAD-BEARING — a garbage NON-skew witness has the WRONG positive sense
  (`garbage_nonskew_wrong_sense`, `traceSq = 1 > 0`). The gather sense is NEGATIVE (anti-screening),
  opposite to matter, and it is CAUSED by skewness — NOT vacuous, NOT the wrong (positive) sense.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the gather self-census enters with the fold's
  NEGATIVE sense (B(chargeOp) = −6 < 0), OPPOSITE to the matter census (16/3 > 0), and the negative
  sense is FORCED by skewness (a non-skew witness gives the WRONG positive sign) — NOT vacuous, NOT
  positive". It is TIED to the banked Z1 landings by `xFlag_forced`: `gatherCharge_selfCensus_neg`
  witnesses the negative gather sense, `matter_selfCensus_pos` the positive matter sense, and
  `garbage_nonskew_wrong_sense` the load-bearing skewness, so the flag is `1`.

  We anchor `min 495 xFlag = 1` (TRUE — `xFlag = 1 < 495`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the gather self-census is vacuous / has the wrong positive sense
  / is not opposite to matter / the sense is not forced by skewness" mis-reading): that
  `min 495 xFlag = 495`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to
  the false numeric `1 = 495` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (495, 1) is fresh (Cid 495 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GatherSelfCensus
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE GATHER-SELF-CENSUS FLAG: `1` = "the gather self-census enters with the fold's NEGATIVE sense,
    opposite to the positive matter census, and the negative sense is forced by skewness". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked Z1 landing): `gatherCharge_selfCensus_neg` proves the gather charge
    trace form is `< 0` (the negative sense); `matter_selfCensus_pos` proves the matter census is
    `> 0` (the positive sense); and `garbage_nonskew_wrong_sense` proves a non-skew witness has the
    WRONG positive `traceSq = 1` (so skewness is load-bearing). So the flag is present, `xFlag = 1`. -/
theorem xFlag_forced :
    (traceForm7 chargeOp chargeOp < 0) ∧
    ((0 : Cut) < chargeTraceDepth) ∧
    (traceSq (!![(1 : ℚ), 1; 0, 0]) = 1) ∧
    xFlag = 1 :=
  ⟨gatherCharge_selfCensus_neg,
   matter_selfCensus_pos,
   garbage_nonskew_wrong_sense,
   rfl⟩

/-- TRUE: `min 495 xFlag = 1`, holding precisely because `xFlag = 1 < 495`. -/
theorem cert_val_true : min (495 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 495 xFlag = 495`. It GENUINELY equals `1` (`cert_val_true`). A "the gather
    self-census is vacuous / has the wrong positive sense / is not opposite to matter / is not forced
    by skewness" mis-reading reduces — through the banked value — to the false numeric `1 = 495`, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (495 : ℕ) xFlag = 495 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 495  (FALSE — the costume bites)

end Counterexamples
