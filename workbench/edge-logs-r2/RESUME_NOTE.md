# Edge-logs R2 — endpoint-free extraction (PRESERVED for reuse, NOT banked)

OWNER STOP (2026-07-18 21:29, t_aac993bd archived): precision work on the falsified
[137.0984,137.1006] composition is forbidden until the band-varying depth assignment is
derived (t_374df70b). This instrument work is to be REUSED there, single-flight, AFTER the
recomposition — not committed now.

## What is here (built GREEN, foundations-only, but UNCOMMITTED per OWNER STOP)
- FreezeoutEdgeLogsR2.lean — the THREE DEEP freeze-out edge logs as COMPOSITION-INDEPENDENT
  two-sided rational brackets of Cut at width ~1e-12 (deepest exp-cert N=29/30):
    cutLog_b0_r2 : cutLog mass0        ∈ [1733728794954/1e12, 1733728794955/1e12]
    cutLog_b2_r2 : cutLog mass2        ∈ [−1088723725224/1e12, −1088723725223/1e12]
    cutLog_mb_r2 : cutLog mbRatioDerived ∈ [−4089306640008/1e12, −4089306640006/1e12]
  + bMass restatements, strict witnesses, edgeLogsR2_improve_rung1 (strict tightening over the
  D7NarrowingRung1 grade from both ends), and the endpoint-FREE capstone freezeoutEdgeLogsR2_landing.
  Imports only D7NarrowingRung1 + NarrowedBracket11 (NO D7DepthTwoComposed / NO endpoint object).
  `$LAKE build Phys.Algebra.FreezeoutEdgeLogsR2` → GREEN (18s), no new lint.
- FreezeoutEdgeLogsR2VacuityCostume.lean — endpoint-free W8 costume (attestFlag tied to
  cutLog_b0_r2_strict + edgeLogsR2_improve_rung1.1.2; C573 bites 1=573).

## Provenance
These are the sections A–D of the reverted commit 845cfb4 (D7DressedNarrowingRung1), decoupled
from the defective endpoint re-assembly (sections E–H, which the owner redirect forbids). The
underlying edge-log theorems are also preserved verbatim in git history at 845cfb4.

## Reuse instruction (for the post-recomposition worker)
When the band-varying depth assignment lands (t_374df70b) and precision rungs resume on the
CORRECT recomposed endpoint, these three edge logs are the sharpened DERIVED inputs to read.
Copy the two files back into Phys/Algebra + Counterexamples, re-wire Phys.lean / AxiomAudit.lean
/ costume_manifest.tsv (C573), and re-assemble against the recomposed (not the falsified) endpoint.
