import Phys.Algebra.ConfinementHadronicMass
import Phys.Algebra.FineStructureZeroMomentum

namespace Phys.Algebra.X9Probe2
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
noncomputable section
attribute [local instance] CD.narCD CD.srCD

def confBundle : Cut := confinementScaleRatio * topBandRatio
theorem confBundle_eq : confBundle = cutExp (-(8 * cutPi / 3)) := by
  unfold confBundle; rw [confinementScaleRatio_eq, topBandRatio_eq, cutExp_add]; congr 1; ring
theorem confBundle_pos : 0 < confBundle := by rw [confBundle_eq]; exact cutExp_pos _
theorem confBundle_lt_one : confBundle < 1 := by
  rw [confBundle_eq]; have hneg : -(8 * cutPi / 3) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg; rwa [cutExp_zero] at this

-- the shared-edge coupling reading (cite X6)
theorem coupling_reading :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

end
end Phys.Algebra.X9Probe2

#print axioms Phys.Algebra.X9Probe2.confBundle_eq
#print axioms Phys.Algebra.X9Probe2.confBundle_pos
#print axioms Phys.Algebra.X9Probe2.confBundle_lt_one
#print axioms Phys.Algebra.X9Probe2.coupling_reading
