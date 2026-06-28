import Phys.Algebra.LorentzContinuumCliffordPinCentralizer

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

#print axioms Phys.Algebra.master_contract
#print axioms Phys.Algebra.covers_id_comm
#print axioms Phys.Algebra.covers_id_contract_zero
#print axioms Phys.Algebra.mker_covers_id
#print axioms Phys.Algebra.mker_coverMapPinUnit_contract_zero
#print axioms Phys.Algebra.coverMapPinUnit_exactKernel_of_contractScalar
#print axioms Phys.Algebra.contract_iota_timelike
