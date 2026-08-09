/-
  ScratchN686 — LANE B2: EwRungRelationalSignature (electroweak threshold n = 9).

  THE RELATIONAL SIGNATURE of the n = 9 rung: the derived object `rungExponent
  (Module.finrank ℚ spaceSub)` is pinned by its RELATIONS to the other banked
  objects — the same 84π numerator (`criticalPhaseNumerator`), the same 2π
  (`azimuthalTurn`, κ's denominator) and the same 42 (`channelCount = 1/α*`)
  that run the α landing, the same κ generator (`kappaLeading`) screening the
  band it bounds, and the DERIVED spatial dimension (`finrank ℚ spaceSub = 9`,
  banked `finrank_spaceSub`) — plus UNIQUENESS among the grammar's candidate
  counts n. Every theorem below is a relation between banked objects or a
  uniqueness over n; none is a naming.

  Consumes (all banked, head cddf1802):
    rungExponent / criticalPhaseNumerator / channelCount / channelCount_eq /
    criticalPhaseNumerator_eq / lock_spaceSub / rungExponent_at_spaceSub
                                        [Phys.Algebra.ScaleTowerNumeratorLock]
    finrank_spaceSub                    [Phys.Algebra.SpacetimeSignature]
    azimuthalTurn                       [Phys.Foundation.ContinuumSphereFlux]
    cutPi_pos                           [Phys.Foundation.ContinuumTrigPi]
    ewClosureRatio / ewClosureRatio_lt_one  [Phys.Algebra.ScaleTowerLadder]
    topBandRatio / bandScreen           [Phys.Algebra.FineStructureZeroMomentum]
    kappaLeading                        [Phys.Algebra.FineStructureLoopNormalization]
    chargeTraceDepth                    [Phys.Algebra.FineStructureRunningCoupling]
    derivedBandList                     [Phys.Algebra.BandEdgeList]
-/
import Phys.Algebra.ScaleTowerLadder
import Phys.Algebra.FineStructureZeroMomentum
import Phys.Algebra.BandEdgeList
import Mathlib.Tactic

namespace Phys.Algebra
namespace EwRungRelationalSignature

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.BandEdgeList

/-- (R1) THE RUNG DIMENSION IS THE DERIVED SPATIAL DIMENSION: the electroweak
    rung exponent is stated THROUGH `Module.finrank ℚ spaceSub` — the DERIVED
    spatial dimension (banked `finrank_spaceSub : … = 9`), not a chosen `n` —
    and equals `28·cutPi/3` as a relation between the 84π grammar numerator
    and that derived count. -/
theorem ewRung_dim_is_space :
    rungExponent (Module.finrank ℚ spaceSub) = 28 * cutPi / 3 := by
  rw [rungExponent, finrank_spaceSub, criticalPhaseNumerator_eq]
  push_cast
  ring

/-- (R2) THE RUNG SHARES α's NUMERATOR: the rung exponent times the derived
    spatial dimension returns EXACTLY `azimuthalTurn * channelCount` — the
    SAME `2π` (κ's denominator, the derived full turn) and the SAME `42 = 1/α*`
    channel count that run the α landing. The threshold is tied to the coupling
    by construction, over the OBJECTS (no numeral unfolding on the right). -/
theorem ewRung_shares_alpha_numerator :
    rungExponent (Module.finrank ℚ spaceSub) * (Module.finrank ℚ spaceSub : Cut)
      = azimuthalTurn * channelCount := by
  rw [lock_spaceSub]
  rfl

/-- (R3) THE BAND THE RUNG BOUNDS CARRIES THE MIRROR'S CENSUS: the top band
    `(chargeTraceDepth, topBandRatio)` — whose ratio is `ewClosureRatio⁻¹`, the
    rung's own suppression inverted — is an entry of the banked
    `derivedBandList`, AND its screening unfolds definitionally through the
    SAME κ generator (`kappaLeading`) and the SAME `16/3` census object
    (`chargeTraceDepth`) the mirror term inserts. -/
theorem ewBand_screens_mirror_census :
    (chargeTraceDepth, topBandRatio) ∈ derivedBandList ∧
    bandScreen chargeTraceDepth topBandRatio
      = kappaLeading * chargeTraceDepth * cutLog topBandRatio := by
  constructor
  · simp [derivedBandList]
  · rfl

/-- (R4) THE RELATIONAL PIN — UNIQUENESS IN THE GRAMMAR: among all nonzero
    candidate counts `n`, the rung exponent equals `28·cutPi/3` IFF `n = 9`,
    the derived spatial dimension. The n = 9 rung is not one choice among
    many: it is the UNIQUE count at which the 84π numerator produces the
    electroweak exponent. -/
theorem ewRung_unique_in_grammar (n : ℕ) (hn : n ≠ 0) :
    rungExponent n = 28 * cutPi / 3 ↔ n = 9 := by
  have hπ : cutPi ≠ 0 := ne_of_gt cutPi_pos
  have hnC : (n : Cut) ≠ 0 := Nat.cast_ne_zero.mpr hn
  have h3 : (3 : Cut) ≠ 0 := by norm_num
  constructor
  · intro h
    rw [rungExponent, criticalPhaseNumerator_eq] at h
    have hmul : 84 * cutPi * 3 = 28 * cutPi * (n : Cut) :=
      (div_eq_div_iff hnC h3).mp h
    have hfac : (28 * cutPi) * ((n : Cut) - 9) = 0 := by
      linear_combination -hmul
    have h28 : (28 : Cut) * cutPi ≠ 0 := mul_ne_zero (by norm_num) hπ
    rcases mul_eq_zero.mp hfac with hc | hc
    · exact absurd hc h28
    · have hn9 : (n : Cut) = 9 := by linarith
      exact_mod_cast hn9
  · intro h
    subst h
    rw [rungExponent, criticalPhaseNumerator_eq]
    push_cast
    ring

/-- (R5 bonus, this lane's imports only) THE RUNG SUPPRESSES: the closure
    ratio the rung produces — `ewClosureRatio = cutExp (−rungExponent (finrank
    ℚ spaceSub))`, definitionally through the derived dimension — sits strictly
    below 1 (consumed banked `ewClosureRatio_lt_one`). -/
theorem ewRung_suppresses :
    ewClosureRatio = cutExp (-(rungExponent (Module.finrank ℚ spaceSub))) ∧
    ewClosureRatio < 1 :=
  ⟨rfl, ewClosureRatio_lt_one⟩

end EwRungRelationalSignature
end Phys.Algebra
