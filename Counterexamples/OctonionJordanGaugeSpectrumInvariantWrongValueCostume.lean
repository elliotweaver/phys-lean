/-
  Counterexamples.OctonionJordanGaugeSpectrumInvariantWrongValueCostume — N269 anti-vacuity (C300).
  ===========================================================================
  W8 ANTI-VACUITY. The N269 node banks THE DERIVED GAUGE PRESERVES THE ARENA'S OBSERVABLE SPECTRUM:
  over the derived octonion rung `O ℚ = CD (H ℚ)`, the derived gauge — both the Lie algebra
  `Der(O ℚ) = g₂` (infinitesimally) and the group `Aut(O ℚ) = g₂` (finitely) — leaves the cubic norm
  `jN` (the Freudenthal reduced determinant), the quadratic spur `jS`, and the whole characteristic
  polynomial invariant. The invariance is NON-VACUOUS: the preserved cubic norm takes a genuine
  NONZERO value on a genuine off-diagonal element.

  The load-bearing QUANTITATIVE W8 fact anchored here is the NONZERO PRESERVED SPECTRAL VALUE: the
  pure off-diagonal Hermitian element `Hm 0 0 0 1 1 1` has cubic norm `jN 0 0 0 1 1 1 = 2` (N215
  `jN_witness_cross`) — a genuine nonzero determinant/spectrum the derived gauge preserves. If `jN`
  were identically `0`, "the gauge preserves it" would be vacuous; it is not — the trilinear
  cross-term `2·reQ ((1·1)·star 1)` reads a genuine `2`.

  We anchor `jN 0 0 0 1 1 1 = 2` (TRUE via `jN_witness_cross`), packaged as `min 300 (…) = 2`,
  TIED to the node via `spectral_value_true`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the preserved cubic norm is trivial / the gauge
  preserves only `0` / there is no genuine nonzero spectrum / the invariance is vacuous): that
  `min 300 (jN 0 0 0 1 1 1) = 300`. It GENUINELY equals `2` (`spectral_value_scale_true`). Rewriting
  the banked value reduces the bogus claim to the false numeric `2 = 300` in ℚ. The kernel cannot
  close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the cubic norm of `Hm 0 0 0 1 1 1` is genuinely
  `2` (`jN_witness_cross`), so the preserved spectral value is genuinely nonzero, and claiming
  `min 300 2 = 300` is genuinely FALSE (2 ≠ 300).

  DISTINCT from the banked battery: the pair (300, 2) is fresh (RHS 300 distinct from every prior
  right-hand value: …, 296, 297, 298, 299). The LHS anchor is the N269 nonzero-preserved-spectral-
  value witness `2` — the genuine nonzero cubic norm the derived gauge preserves — tied to the node
  via `jN_witness_cross`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGaugeSpectrumInvariant

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's non-vacuity): the preserved cubic norm takes a genuine NONZERO value —
    the pure off-diagonal element `Hm 0 0 0 1 1 1` has `jN 0 0 0 1 1 1 = 2` (N215 `jN_witness_cross`).
    The derived gauge preserves a genuine nonzero spectrum, not merely `0`. -/
theorem spectral_value_true : jN 0 0 0 1 1 1 = 2 := jN_witness_cross

/-- TRUE: `min 300 (jN 0 0 0 1 1 1) = 2`, holding precisely because the preserved cubic norm is a
    genuine nonzero value (the spectral invariance is non-vacuous). -/
theorem spectral_value_scale_true : min (300 : ℚ) (jN 0 0 0 1 1 1) = 2 := by
  rw [spectral_value_true]; norm_num

/-- BOGUS: claims `min 300 (jN 0 0 0 1 1 1) = 300`. It GENUINELY equals `2`
    (`spectral_value_scale_true`). The WRONG reading (the preserved cubic norm is trivial / the gauge
    preserves only `0` / no genuine nonzero spectrum / the invariance is vacuous) reduces — through
    the banked value — to the false numeric `2 = 300`, so this must NOT compile. -/
theorem spectral_value_scale_wrong_BOGUS : min (300 : ℚ) (jN 0 0 0 1 1 1) = 300 := by
  rw [spectral_value_scale_true]
  -- ⊢ (2 : ℚ) = 300  (FALSE — the costume bites)

end

end Counterexamples
