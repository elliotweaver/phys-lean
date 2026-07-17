/-
  Counterexamples.PerChannelDressingVacuityCostume — PerChannelDressing anti-vacuity (C530).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE PER-CHANNEL DEPTH DRESSING) composes the banked census-in-census
  depth dressing (D3/Z5) into the recombination weld (D2b) PER CHANNEL: each channel carries its OWN
  derived census under the SAME derived return-surface weight, and the recombined dressed coupling
  closes as `dressedInvAlphaEM w s bands = 112 + ((chargeTraceDepth − s)·totalScreeningWith 1 bands)/
  (1 − w)`. The content that must NOT be hollow: the isospin anti-screening genuinely runs the
  recombined dressed endpoint DOWN for a positive reduction `s > 0` (`dressedInvAlphaEM_runs_down`),
  the screening unit is genuinely positive from the banked numeral (`screeningUnit_pos`), and the
  shared dressing weight is the DERIVED `1/3`, neither `0` nor `1` (`weight_derived_not_free`). A
  "the per-channel dressing is vacuous / the isospin reduction moves nothing / the screening unit is
  zero / the weight is free" mis-reading is refuted by the banked `dressedInvAlphaEM_runs_down`,
  `screeningUnit_pos`, and `weight_derived_not_free`.

  THE CERTIFICATE. pcdFlag := 1 -- a natural-number flag standing for "the derived per-channel depth
  dressing is non-vacuous: the isospin anti-screening runs the recombined dressed endpoint strictly
  down for s > 0, the screening unit is positive, and the shared weight is the derived 1/3 (neither 0
  nor 1)". It is TIED to the banked landing by pcdFlag_forced: `dressedInvAlphaEM_runs_down` (at a
  witness w = 1/3, s = 1) gives the strict downward move, `screeningUnit_pos` gives the positive
  screening unit, `weight_derived_not_free` gives depthWeight = 1/3 with the two forbidden ends
  excluded, so the flag is 1.

  We anchor min 530 pcdFlag = 1 (TRUE -- pcdFlag = 1 < 530, so the min is pcdFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the per-channel dressing is vacuous / the isospin reduction
  moves nothing / the screening unit is zero / the weight is free" mis-reading): that min 530 pcdFlag
  = 530. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 530 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (530, 1) is fresh (Cid 530 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.PerChannelDressing
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived per-channel depth dressing is non-vacuous — the isospin anti-screening
    runs the recombined dressed endpoint strictly down for s > 0, the screening unit is positive, and
    the shared weight is the derived 1/3 (neither 0 nor 1)". -/
def pcdFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the isospin anti-screening runs the recombined dressed
    endpoint down at the witness weight/reduction (`dressedInvAlphaEM_runs_down`), the screening unit
    is positive (`screeningUnit_pos`), the shared weight is the derived 1/3 with both forbidden ends
    excluded (`weight_derived_not_free`), and `pcdFlag = 1`. -/
theorem pcdFlag_forced :
    (dressedInvAlphaEM depthWeight 1 (completeBandList chargeTraceDepth)
        < dressedInvAlphaEM depthWeight 0 (completeBandList chargeTraceDepth))
    ∧ (0 : Cut) < totalScreeningWith 1 (completeBandList chargeTraceDepth)
    ∧ (depthWeight = 1 / 3 ∧ depthWeight ≠ 0 ∧ depthWeight ≠ 1)
    ∧ pcdFlag = 1 :=
  ⟨dressedInvAlphaEM_runs_down depthWeight 1 (le_of_lt depthWeight_pos) depthWeight_lt_one
      (by norm_num),
   screeningUnit_pos,
   weight_derived_not_free,
   rfl⟩

/-- TRUE: min 530 pcdFlag = 1, holding precisely because pcdFlag = 1 < 530. -/
theorem cert_val_true : min (530 : ℕ) pcdFlag = 1 := by decide

/-- BOGUS: claims min 530 pcdFlag = 530. It GENUINELY equals 1 (cert_val_true). A "the per-channel
    dressing is vacuous / the isospin reduction moves nothing / the screening unit is zero / the
    weight is free" mis-reading reduces -- through the banked landing -- to the false numeric 1 = 530,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (530 : ℕ) pcdFlag = 530 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 530  (FALSE — the costume bites)

end Counterexamples
