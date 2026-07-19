import Phys.Algebra.D7DepthTwoComposed
import Phys.Algebra.DressingSeamResolved
import Mathlib.Tactic

namespace Phys.Algebra.D7DressingAdjudicateProbe

open Phys.Algebra
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.DressingSeamResolved
open Phys.Algebra.DepthWeight
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) arithmetic: base = way-point + rung
example : (2425 / 18 : Cut) = 7179 / 54 + 16 / 9 := by norm_num

-- (B) the gem is reachable: κ·2·(8π/3) = 16/9
example : kappaLeading * 2 * (8 * cutPi / 3) = 16 / 9 := confinement_rung_rational

-- (C) cutLog confBundle reachable
example : cutLog confBundle = -(8 * cutPi / 3) := cutLog_confBundle

-- (D) confBundle transmutation scale reachable
example : confBundle = cutExp (-(8 * cutPi / 3)) := confBundle_eq

-- (E) 16/9 = -κ·2·cutLog confBundle  (κ·log-content of transmutation scale)
example : (16 / 9 : Cut) = - (kappaLeading * 2 * cutLog confBundle) := by
  rw [cutLog_confBundle]
  have := confinement_rung_rational
  linarith [this]

-- (F) dressed_offsets_base reachable (base untouched)
example : recomposedEndpointDressed - (3 / 2) * kappaLeading * cInner = 2425 / 18 :=
  dressed_offsets_base

-- (G) forbidden band-selective dressing MOVES the way-point (DressingSeamResolved)
example : dressedInvAlphaZero depthWeight derivedBandList = 74 ∧ (74 : Cut) ≠ 190 / 3 :=
  dressed_conf_moves

-- (H) teeth: dressing the transmutation rung would move 16/9 -> 8/3
example : (3 / 2) * (16 / 9 : Cut) = 8 / 3 := by norm_num
example : (16 / 9 : Cut) ≠ 8 / 3 := by norm_num

-- (I) restated bracket reachable
example : (1370984 / 10000 : Cut) ≤ recomposedEndpointDressed
    ∧ recomposedEndpointDressed ≤ 1371006 / 10000 :=
  recomposedEndpointDressed_restated

end

end Phys.Algebra.D7DressingAdjudicateProbe
