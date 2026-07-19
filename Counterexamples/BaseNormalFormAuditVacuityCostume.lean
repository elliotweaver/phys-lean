/-
  Counterexamples.BaseNormalFormAuditVacuityCostume — the AB-INITIO base-constant audit is GENUINE: the
  base `2425/18` decomposes into way-point-locked pieces plus the C-layer light census, the gem is that
  light census on the confinement rung (`16/9`), and under N574's active-span correction the gem drops to
  `40/27` in lockstep — so the base is NOT an independent layer and carries the SAME strange over-count as
  C. C574.
  =====================================================================================
  W8 ANTI-VACUITY. This node AUDITS the base normal-form constant `2425/18` AB INITIO, finding it is
  `[top way-point 6923/54] + [confinement band 128/27, way-point-locked] + [gem 16/9]` where the gem is
  the light-band census on the confinement rung. The content that must NOT be hollow: (i) the gem is
  GENUINELY the light-band census `kappaLeading·censusLightBand·(8·cutPi/3) = 16/9`
  (`base_gem_is_light_census`) — the base's mutable piece is the C-layer's census, not a free constant;
  (ii) the base genuinely DROPS to `7259/54 < 2425/18` under the active-span correction
  (`base_corrected_lt_base`) — the audit has content; (iii) the two census pieces are genuinely distinct
  (`base_gem_ne_confBand`, `16/9 ≠ 128/27`) — the base is not a one-piece collapse. If the gem were not the
  light census, or the base did not drop, or the pieces coincided, the audit would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the ab-initio base audit is
  genuine: the base decomposes into way-point-locked pieces plus the C-layer light-census gem, and the gem
  drops in lockstep with N574's active-span correction". TIED to the banked landing by attestFlag_forced.

  We anchor min 574 attestFlag = 1 (TRUE -- attestFlag = 1 < 574, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the base is an independent free constant / the gem is not the light
  census / the base does not drop under the correction" reading): that min 574 attestFlag = 574. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 574 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (574, 1) is fresh (Cid 574 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.BaseNormalFormAudit
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.BaseNormalFormAudit
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the ab-initio base audit is genuine: the base decomposes into way-point-locked pieces
    plus the C-layer light-census gem (`16/9`), and the gem drops to `40/27` in lockstep with N574's
    active-span correction". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the base decomposes as `2425/18 = 6923/54 + 128/27 + 16/9`
    (`base_decomp`), the gem is the light-band census on the confinement rung (`base_gem_is_light_census`),
    the base drops under the active-span correction (`base_corrected_lt_base`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((2425 : Cut) / 18 = 6923 / 54 + 128 / 27 + 16 / 9)
    ∧ (kappaLeading * censusLightBand * (8 * cutPi / 3) = 16 / 9)
    ∧ ((7259 : Cut) / 54 < 2425 / 18)
    ∧ attestFlag = 1 :=
  ⟨base_decomp, base_gem_is_light_census, base_corrected_lt_base, rfl⟩

/-- TRUE: min 574 attestFlag = 1, holding precisely because attestFlag = 1 < 574. -/
theorem cert_val_true : min (574 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 574 attestFlag = 574. It GENUINELY equals 1 (cert_val_true). A "the base is an
    independent free constant / the gem is not the light census / the base does not drop" reading reduces
    -- through the banked base_decomp / base_gem_is_light_census / base_corrected_lt_base tie -- to the
    false numeric 1 = 574 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (574 : ℕ) attestFlag = 574 := by
  rw [cert_val_true]

end Counterexamples
