import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE 1: the trace identity over Cut.  z + star z = (2 * reQC z) • 1
-- reQC z := z.re.re.re ;  gFormC v w := reQC (v * star w)
-- Try the direct ext route first.
theorem trace_id_cut (z : O Cut) : z + star z = (2 * reQC z) • (1 : O Cut) := by
  ext <;> simp [reQC] <;> ring

end

end Phys.Algebra
