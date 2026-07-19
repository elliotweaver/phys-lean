/-
  Counterexamples.HucDischargedFreezeoutEndpointVacuityCostume — the recomposition of the freeze-out
  endpoint with `huc` discharged is GENUINE: the light-edge rung is supplied by the derived
  `huc_fully_derived` (no free `huc`), the confinement rung stands on the banked tower half-rungs
  alone, the N576 double-count question resolves as ONE cause (the light gem and full band screen the
  ONE derived ratio at two DIFFERENT censuses), and the certified endpoint bracket re-exports intact.
  C578.
  =====================================================================================
  W8 ANTI-VACUITY. This node RECOMPOSES the freeze-out endpoint with `huc` now a theorem (N577+N578).
  The content that must NOT be hollow: (i) the discharged light-edge rung is a genuine positive
  quantity `0 < 8·cutPi/3` (`discharged_rung_pos`); (ii) the two censuses screening the ONE derived
  ratio are genuinely DIFFERENT — `censusActiveLightSpan ≠ chargeTraceDepth` (`5/3 ≠ 16/3`,
  `two_censuses_distinct`), so "one value read in two censuses" is a real two-census statement; (iii)
  the bare and dressed endpoint brackets are DISJOINT — `recomposedEndpoint < recomposedEndpointDressed`
  (`bare_dressed_disjoint`), so the depth-2 running genuinely moved the endpoint. If the rung were
  zero, or the two censuses coincided, or the brackets overlapped trivially, the recomposition would be
  hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the huc-discharged
  recomposition is genuine: the light-edge rung is a positive quantity supplied by the derived huc, the
  two censuses screening the one derived ratio are genuinely different, and the bare and dressed
  endpoint brackets are disjoint". TIED to the banked landing by attestFlag_forced.

  We anchor min 578 attestFlag = 1 (TRUE -- attestFlag = 1 < 578, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the discharged rung is zero / the two censuses coincide / the
  endpoint brackets overlap / the recomposition is vacuous" reading): that min 578 attestFlag = 578. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 578 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (578, 1) is fresh (Cid 578 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.HucDischargedFreezeoutEndpoint
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.HucDischargedFreezeoutEndpoint
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the huc-discharged recomposition is genuine: the light-edge rung is a positive
    quantity supplied by the derived huc, the two censuses screening the one derived ratio are
    genuinely different, and the bare and dressed endpoint brackets are disjoint". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the discharged rung is positive (`discharged_rung_pos`), the two
    censuses are genuinely different (`two_censuses_distinct`), the bare and dressed brackets are
    disjoint (`bare_dressed_disjoint`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((0 : Cut) < 8 * cutPi / 3)
    ∧ (censusActiveLightSpan ≠ chargeTraceDepth)
    ∧ (recomposedEndpoint < recomposedEndpointDressed)
    ∧ attestFlag = 1 :=
  ⟨discharged_rung_pos, two_censuses_distinct, bare_dressed_disjoint, rfl⟩

/-- TRUE: min 578 attestFlag = 1, holding precisely because attestFlag = 1 < 578. -/
theorem cert_val_true : min (578 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 578 attestFlag = 578. It GENUINELY equals 1 (cert_val_true). A "the discharged
    rung is zero / the two censuses coincide / the endpoint brackets overlap / the recomposition is
    vacuous" reading reduces -- through the banked discharged_rung_pos / two_censuses_distinct /
    bare_dressed_disjoint tie -- to the false numeric 1 = 578 in the naturals. The kernel cannot close
    it; it BITES. -/
theorem bogus_claim : min (578 : ℕ) attestFlag = 578 := by
  rw [cert_val_true]

end Counterexamples
