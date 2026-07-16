import Phys.Algebra.LeptonMassTower
import Phys.Algebra.QuarkHadronTower
import Phys.Algebra.FineStructureMZReadings
import Mathlib.Tactic

namespace ProbeX10

open Phys.Algebra
open Phys.Algebra.LeptonMassTower
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.AbsMass
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section
attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

/-! CRUX 1: the shared-edge weld — ONE edge threads THREE observables. -/

-- coupling reads the edge:
example : invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  QuarkHadronTower.coupling_reading

-- lepton mass scale factors through the SAME edge:
example : massScale = ewClosureRatio * leptonBundle := massScale_eq_edge_bundle

-- confinement scale factors through the SAME edge:
example : confinementScaleRatio = ewClosureRatio * confBundle := confinement_eq_edge_bundle

-- the edge inverts topBandRatio (the ONE object):
example : ewClosureRatio * topBandRatio = 1 := by
  unfold topBandRatio; exact mul_inv_cancel₀ (ne_of_gt ewClosureRatio_pos)

-- the confinement weld is the exact closed derived ratio:
example : confBundle = cutExp (-(8 * cutPi / 3)) := confBundle_eq

/-! CRUX 2: the finite-enum GRADE ledger with decide-based accounting teeth. -/

inductive XValue
  | ceiling | topBandScreen | topBandCoupling | weinbergHigh | leptonWeld | confWeld
  | leptonAbsMasses | confScaleAbs
  | quarkYukawaTexture | physicalNumeral | leptonLabelling | measuredComparison
  deriving DecidableEq

inductive Grade | theoremExact | anchoredOnDerivedScale | routeNotYetFound
  deriving DecidableEq

inductive Disposition | discharged | namedOpenStructural | removableProse
  deriving DecidableEq

open XValue Grade Disposition

def xGradeLedger : List (XValue × Grade) :=
  [(ceiling, theoremExact), (topBandScreen, theoremExact), (topBandCoupling, theoremExact),
   (weinbergHigh, theoremExact), (leptonWeld, theoremExact), (confWeld, theoremExact),
   (leptonAbsMasses, anchoredOnDerivedScale), (confScaleAbs, anchoredOnDerivedScale)]

def xResidualLedger : List (XValue × Disposition) :=
  [(quarkYukawaTexture, namedOpenStructural), (physicalNumeral, removableProse),
   (leptonLabelling, removableProse), (measuredComparison, removableProse)]

def gradedValues : List XValue := xGradeLedger.map Prod.fst
def residualValues : List XValue := xResidualLedger.map Prod.fst

-- COVERAGE: every value is graded or dispositioned (total partition):
example : ∀ v : XValue, v ∈ gradedValues ∨ v ∈ residualValues := by
  intro v; cases v <;> decide

-- DISJOINTNESS: no value is both graded and a residual:
example : ∀ v : XValue, ¬ (v ∈ gradedValues ∧ v ∈ residualValues) := by
  intro v; cases v <;> decide

-- the ONE genuine open structural fact is named-open (not silently discharged):
example : (quarkYukawaTexture, namedOpenStructural) ∈ xResidualLedger := by decide
example : (quarkYukawaTexture, discharged) ∉ xResidualLedger := by decide

-- NO SILENT UPGRADE: the anchored values are NOT graded theorem-exact:
example : (leptonAbsMasses, theoremExact) ∉ xGradeLedger := by decide
example : (confScaleAbs, theoremExact) ∉ xGradeLedger := by decide

end

end ProbeX10
