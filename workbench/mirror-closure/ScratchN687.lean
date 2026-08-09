/-
  # N687 — ConfRungRelationalSignature (LANE C2, referee item 7: rung identification)
  ================================================================================
  PREREG: workbench/PREREG-LANES-686-687.md (frozen at head cddf1802).

  THE ONTOLOGY RULE: "identifying" the n = 7 rung as the confinement threshold means
  proving the derived object EXHIBITS THE RELATIONAL SIGNATURE — it is pinned by its
  RELATIONS to the other banked objects (the SAME 84π numerator and the SAME 42 channel
  count that run the α landing; the census carrier's OWN dimension: the coherence census
  lives on `Fin 7`, the imaginary-octonion frame, with `210 = 7·6·5`), plus UNIQUENESS
  among the grammar's candidates. Every theorem below is a relation between banked
  objects or a uniqueness over n — never a naming.

  Consumed banked names:
    rungExponent / criticalPhaseNumerator / channelCount / rungExponent_at_imO /
    lock_imO / criticalPhaseNumerator_eq          [Phys.Algebra.ScaleTowerNumeratorLock]
    finrank_ImO / ImO                              [Phys.Algebra.DerivationRep7]
    assocTriples / antiTriples / census_length     [Phys.Algebra.GatherCoherenceCensus]
    confBandRatio / derivedBandList / derivedBandList_assembly / invAlphaConf /
    invAlphaConf_is_assembly / chargeTraceDepth    [Phys.Algebra.BandEdgeList]
    azimuthalTurn / cutPi_pos                      [Phys.Foundation]
-/

import Phys.Algebra.ScaleTowerNumeratorLock
import Phys.Algebra.BandEdgeList
import Phys.Algebra.GatherCoherenceCensus

namespace Phys.Algebra
namespace ConfRungRelationalSignature

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.BandEdgeList
open Phys.Algebra.GatherCoherence

noncomputable section

/-! ## (S1) THE RUNG DIMENSION IS THE DERIVED IMAGINARY-OCTONION DIMENSION.
    The exponent is stated THROUGH the banked finrank — a relation between the 84π
    grammar and the DERIVED dimension `finrank ℚ ImO`, not a chosen `n`. Consumes the
    banked `rungExponent_at_imO` (which itself consumes `finrank_ImO`). -/

/-- ★ S1: the confinement rung's exponent, at the DERIVED imaginary-octonion dimension,
    is `12·cutPi`. Pure consume of the banked `rungExponent_at_imO`. -/
theorem confRung_dim_is_imO :
    rungExponent (Module.finrank ℚ ImO) = 12 * cutPi :=
  rungExponent_at_imO

/-! ## (S2) THE RUNG SHARES THE α LANDING'S NUMERATOR.
    The SAME `azimuthalTurn = 2π` (κ's denominator) and the SAME `channelCount = 1/α*`
    that run the α landing constitute the rung's numerator: threshold tied to coupling
    BY CONSTRUCTION. Right side kept at the OBJECTS (no numeral unfold). -/

/-- ★★ S2: `rungExponent (finrank ℚ ImO) · (finrank ℚ ImO) = azimuthalTurn · channelCount`.
    Consumes the banked lock `lock_imO`; the right side is DEFINITIONALLY
    `criticalPhaseNumerator` — the objects, not the numerals. -/
theorem confRung_shares_alpha_numerator :
    rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
      = azimuthalTurn * channelCount :=
  lock_imO

/-! ## (S3) THE RUNG DIMENSION IS THE CENSUS CARRIER'S DIMENSION.
    The coherence census (N585) enumerates its triples on `Fin 7` — the SAME
    imaginary-octonion frame whose dimension the rung counts. The tie is arithmetic:
    `210 = 7·6·5` stated THROUGH the banked finrank, consuming `census_length`. -/

/-- ★★ S3: `finrank ℚ ImO = 7` AND the census length is the falling factorial of the
    rung dimension: `(assocTriples ++ antiTriples).length
      = (finrank ℚ ImO) · (finrank ℚ ImO − 1) · (finrank ℚ ImO − 2)` — i.e. `210 = 7·6·5`.
    Consumes the banked `finrank_ImO` and `census_length`. -/
theorem confRung_counts_census_carrier :
    Module.finrank ℚ ImO = 7 ∧
    (assocTriples ++ antiTriples).length =
      Module.finrank ℚ ImO * (Module.finrank ℚ ImO - 1) * (Module.finrank ℚ ImO - 2) := by
  refine ⟨finrank_ImO, ?_⟩
  rw [census_length, finrank_ImO]

/-! ## (S4) UNIQUENESS IN THE GRAMMAR — THE RELATIONAL PIN.
    Among all nonzero structural counts `n`, the rung exponent equals `12·cutPi` iff
    `n = 7`: the confinement rung is the ONLY grammar candidate with this exponent.
    Route: `rungExponent n = 84π/n`; equality iff `84 = 12·n` (using `cutPi ≠ 0` from
    the banked `cutPi_pos`) iff `n = 7`. -/

/-- ★★ S4: `rungExponent n = 12·cutPi ↔ n = 7` for every `n ≠ 0`. The reverse direction
    routes THROUGH the banked object (`7` rewritten as `finrank ℚ ImO` via `finrank_ImO`,
    then `rungExponent_at_imO`), not a numeral recomputation. -/
theorem confRung_unique_in_grammar (n : ℕ) (hn : n ≠ 0) :
    rungExponent n = 12 * cutPi ↔ n = 7 := by
  have hp : (0 : Cut) < cutPi := cutPi_pos
  have hnC : (n : Cut) ≠ 0 := Nat.cast_ne_zero.mpr hn
  constructor
  · intro h
    rw [rungExponent, criticalPhaseNumerator_eq, div_eq_iff hnC] at h
    have h12 : (12 : Cut) * cutPi ≠ 0 := mul_ne_zero (by norm_num) (ne_of_gt hp)
    have h7 : (12 : Cut) * cutPi * (7 : Cut) = 12 * cutPi * (n : Cut) := by
      linear_combination h
    have hcast : (7 : Cut) = (n : Cut) := mul_left_cancel₀ h12 h7
    exact_mod_cast hcast.symm
  · intro h
    subst h
    rw [show (7 : ℕ) = Module.finrank ℚ ImO from finrank_ImO.symm]
    exact rungExponent_at_imO

/-! ## (S5) THE WAYPOINT RELATION.
    The waypoint the two rungs jointly produce: the derived two-band assembly equals
    `invAlphaConf`, restating the banked `derivedBandList_assembly = 190/3` THROUGH
    the banked waypoint object. The confinement band `(chargeTraceDepth, confBandRatio)`
    is an entry of the assembled list — the rung's band sits in the assembly. -/

/-- S5a: the confinement band is an entry of the derived band list (`List.mem`). -/
theorem confBand_mem_derivedBandList :
    (chargeTraceDepth, confBandRatio) ∈ derivedBandList := by
  simp [derivedBandList]

/-- ★ S5b: the derived assembly equals the banked waypoint `invAlphaConf` — pure consume
    of `invAlphaConf_is_assembly` (itself `derivedBandList_assembly = 190/3`). -/
theorem conf_waypoint_relation :
    invAlphaZero derivedBandList = invAlphaConf :=
  invAlphaConf_is_assembly

/-- S5c: the waypoint's value, THROUGH the assembly: `invAlphaZero derivedBandList = 190/3`.
    Consumes `derivedBandList_assembly`. -/
theorem conf_waypoint_value :
    invAlphaZero derivedBandList = 190 / 3 :=
  derivedBandList_assembly

end
end ConfRungRelationalSignature
end Phys.Algebra
